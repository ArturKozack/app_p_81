import 'package:app_p_81/core/models/category_type/category_type.dart';
import 'package:app_p_81/core/models/payment_status/payment_status.dart';
import 'package:app_p_81/core/models/payments/payments.dart';
import 'package:app_p_81/core/models/subscription/subscription.dart';
import 'package:app_p_81/core/models/subscription_type/subscription_type.dart';
import 'package:app_p_81/core/models/user/user.dart';
import 'package:app_p_81/core/repositories/main_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'core/app_export.dart';

final globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  ThemeHelper().changeTheme('primary');

  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(SubscriptionModelAdapter());
  Hive.registerAdapter(SubscriptionTypeAdapter());
  Hive.registerAdapter(CategoryTypeAdapter());
  Hive.registerAdapter(PaymentModelAdapter());
  Hive.registerAdapter(PaymentStatusAdapter());

  await Hive.openBox<UserModel>('user');
  await Hive.openBox<PaymentModel>('payments');
  await Hive.openBox<SubscriptionModel>('subscriptions');

  await NotificationPermissions.requestNotificationPermissions();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  FlutterNativeSplash.remove();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool isFirstLogin = MainRepository.userBox.isEmpty;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'app_p_81',
          debugShowCheckedModeBanner: false,
          initialRoute:
              isFirstLogin ? AppRoutes.onboardingPage : AppRoutes.rootPage,
          routes: AppRoutes.routes,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'),
          ],
          scaffoldMessengerKey: MainRepository.snackbarKey,
        );
      },
    );
  }
}
