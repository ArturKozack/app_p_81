import 'package:app_p_81/core/repositories/main_repository.dart';
import 'package:app_p_81/core/utils/size_utils.dart';
import 'package:app_p_81/presentation/payment_notification/payment_notification_dialog.dart';
import 'package:app_p_81/routes/app_routes.dart';
import 'package:app_p_81/theme/theme_helper.dart';
import 'package:app_p_81/widgets/custom_bottom_bar.dart';
import 'package:app_p_81/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RootPage extends StatefulWidget {
  final int initialIndex;

  const RootPage({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;
  final GlobalKey<NavigatorState> _homePageKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _subscriptionsPageKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _calendarPageKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _settingsPageKey =
      GlobalKey<NavigatorState>();

  @override
  void initState() {
    _currentIndex = widget.initialIndex;

    bool isReminderShown = MainRepository.checkForPaymentReminder();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (isReminderShown)
          showDialog<String>(
            context: context,
            builder: (_) => const PaymentNotificationDialog(),
          ).then(
            (value) {
              if (value == 'check') _onTap(2);
            },
          );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: MainRepository.subscriptionBox.listenable(),
        builder: (context, box, child) => _buildIndexedStack(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildIndexedStack() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        _navigator(
          AppRoutes.homePage,
          _homePageKey,
        ),
        _navigator(
          AppRoutes.subscriptionsPage,
          _subscriptionsPageKey,
        ),
        _navigator(
          AppRoutes.calendarPage,
          _calendarPageKey,
        ),
        _navigator(
          AppRoutes.settingsPage,
          _settingsPageKey,
        ),
      ],
    );
  }

  Navigator _navigator(String routeName, GlobalKey<NavigatorState> key) {
    return Navigator(
      key: key,
      onGenerateRoute: (route) => MaterialPageRoute(
        settings: route,
        builder: AppRoutes.routes[routeName]!,
      ),
    );
  }

  _buildBottomNavigationBar() {
    return Container(
      height: 100.v,
      decoration: BoxDecoration(
        color: appTheme.lightBlueA700,
      ),
      child: BottomNavigationBar(
        selectedFontSize: 0,
        currentIndex: _currentIndex,
        items: List.generate(
          bottomMenuList.length,
          (index) {
            return BottomNavigationBarItem(
              icon: CustomImageView(
                imagePath: bottomMenuList[index].icon,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
              activeIcon: CustomImageView(
                imagePath: bottomMenuList[index].activeIcon,
                height: 48.adaptSize,
                width: 48.adaptSize,
              ),
              label: '',
            );
          },
        ),
        onTap: _onTap,
      ),
    );
  }

  void _onTap(int val) {
    if (mounted) {
      setState(() => _currentIndex = val);
    }
    route(Route<dynamic> route) => route.isFirst;

    switch (val) {
      case 0:
        if (_homePageKey.currentState != null) {
          _homePageKey.currentState!.popUntil(route);
        }
        break;
      case 1:
        if (_subscriptionsPageKey.currentState != null) {
          _subscriptionsPageKey.currentState!.popUntil(route);
        }
        break;
      case 2:
        if (_calendarPageKey.currentState != null) {
          _calendarPageKey.currentState!.popUntil(route);
        }
        break;
      case 3:
        if (_settingsPageKey.currentState != null) {
          _settingsPageKey.currentState?.popUntil(route);
        }
        break;
      default:
        break;
    }
  }
}
