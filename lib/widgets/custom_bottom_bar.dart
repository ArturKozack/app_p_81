import 'package:app_p_81/core/app_export.dart';

enum BottomBarEnum { home, subscriptions, calendar, settings }

List<BottomMenuModel> bottomMenuList = [
  BottomMenuModel(
    icon: ImageConstant.home,
    activeIcon: ImageConstant.homeActive,
    type: BottomBarEnum.home,
  ),
  BottomMenuModel(
    icon: ImageConstant.subscriptions,
    activeIcon: ImageConstant.subscriptionsActive,
    type: BottomBarEnum.subscriptions,
  ),
  BottomMenuModel(
    icon: ImageConstant.calendar,
    activeIcon: ImageConstant.calendarActive,
    type: BottomBarEnum.calendar,
  ),
  BottomMenuModel(
    icon: ImageConstant.settings,
    activeIcon: ImageConstant.settingsActive,
    type: BottomBarEnum.settings,
  )
];

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  final String icon;

  final String activeIcon;

  final BottomBarEnum type;
}
