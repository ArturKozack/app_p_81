import 'package:app_p_81/presentation/calendar_page/calendar_page.dart';
import 'package:app_p_81/presentation/subscriptions_page/subscriptions_page.dart';
import 'package:flutter/material.dart';
import 'package:app_p_81/presentation/subscription_details_page/subscription_details_page.dart';
import 'package:app_p_81/presentation/home_page/home_page.dart';
import 'package:app_p_81/presentation/onboarding_page/onboarding_page.dart';
import 'package:app_p_81/presentation/root_page/root_page.dart';
import 'package:app_p_81/presentation/settings_screen/settings_page.dart';

class AppRoutes {
  static const String onboardingPage = '/onboarding_page';

  static const String rootPage = '/root_page';

  static const String homePage = '/home_page';

  static const String subscriptionsPage = '/subscriptions_page';

  static const String calendarPage = '/calendar_page';

  static const String settingsPage = '/settings_page';

  static const String subscriptionDetailsPage = '/subscription_details_page';

  static Map<String, WidgetBuilder> routes = {
    onboardingPage: (context) => OnboardingPage(),
    homePage: (context) => HomePage(),
    rootPage: (context) => RootPage(),
    subscriptionsPage: (context) => SubscriptionsPage(),
    calendarPage: (context) => CalendarPage(),
    settingsPage: (context) => SettingsPage(),
    subscriptionDetailsPage: (context) => SubscriptionDetailsPage(),
  };
}
