import 'package:flutter/material.dart';
import '../presentation/add_screen/add_screen.dart';
import '../presentation/calendar_tab_container_screen/calendar_tab_container_screen.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/onboarding_screen/onboarding_screen.dart';
import '../presentation/preloader_screen/preloader_screen.dart';
import '../presentation/privacy_policy_screen/privacy_policy_screen.dart';
import '../presentation/root_screen/root_screen.dart';
import '../presentation/settings_screen/settings_screen.dart';
import '../presentation/subscriptions_tab_container_screen/subscriptions_tab_container_screen.dart'; // ignore_for_file: must_be_immutable

class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';

  static const String preloaderScreen = '/preloader_screen';

  static const String addScreen = '/add_screen';

  static const String homeScreen = '/home_screen';

  static const String rootScreen = '/root_screen';

  static const String home1Page = '/home1_page';

  static const String subscriptionsPage = '/subscriptions_page';

  static const String subscriptionsTabContainerScreen =
      '/subscriptions_tab_container_screen';

  static const String subscriptions1Page = '/subscriptions1_page';

  static const String calendarPage = '/calendar_page';

  static const String calendarTabContainerScreen =
      '/calendar_tab_container_screen';

  static const String calendar1Page = '/calendar1_page';

  static const String settingsScreen = '/settings_screen';

  static const String privacyPolicyScreen = '/privacy_policy_screen';


  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    onboardingScreen: (context) => OnboardingScreen(),
    preloaderScreen: (context) => PreloaderScreen(),
    addScreen: (context) => AddScreen(),
    homeScreen: (context) => HomeScreen(),
    rootScreen: (context) => RootScreen(),
    subscriptionsTabContainerScreen: (context) =>
        SubscriptionsTabContainerScreen(),
    calendarTabContainerScreen: (context) => CalendarTabContainerScreen(),
    settingsScreen: (context) => SettingsScreen(),
    privacyPolicyScreen: (context) => PrivacyPolicyScreen(),
    initialRoute: (context) => PreloaderScreen()
  };
}
