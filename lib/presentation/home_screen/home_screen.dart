import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../home1_page/home1_page.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildWelcomeSection(context),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 16.v,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 4.v),
                    _buildSubscriptionsInfoSection(context)
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildWelcomeSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 20.v),
      decoration: AppDecoration.fillLightBlueA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderBL20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.v),
          CustomAppBar(
            height: 66.v,
            leadingWidth: 86.h,
            leading: AppbarLeadingIconbutton(
              imagePath: ImageConstant.imgLock,
              margin: EdgeInsets.only(left: 20.h),
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 17.h),
              child: Column(
                children: [
                  AppbarTitle(
                    text: "Welcome",
                  ),
                  SizedBox(height: 1.v),
                  AppbarSubtitle(
                    text: "Username",
                    margin: EdgeInsets.only(right: 24.h),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 6.v),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.h),
            padding: EdgeInsets.all(6.h),
            decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder20,
            ),
            width: double.maxFinite,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: _buildMonthlyFeeSection(
                    context,
                    headlineTwo: "Annual fee",
                    price: "\$0",
                  ),
                ),
                SizedBox(width: 10.h),
                Expanded(
                  child: _buildMonthlyFeeSection(
                    context,
                    headlineTwo: "Monthly fee",
                    price: "\$0",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildActiveSubscriptionsSection(BuildContext context) {
    return SizedBox(
      width: 374.h,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Active subscriptions",
              style: CustomTextStyles.titleLargeOnPrimary,
            ),
          ),
          SizedBox(height: 126.v),
          Text(
            "Your subscriptions will be displayed here",
            style: CustomTextStyles.bodyLargeOnPrimary,
          ),
          SizedBox(height: 8.v),
          Text(
            "To add the first entry, tap the + at the bottom of the screen",
            style: CustomTextStyles.bodySmallSecondaryContainer,
          ),
          SizedBox(height: 270.v),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 56.v,
              width: 56.h,
              decoration: AppDecoration.outlineBlackC.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "+",
                    style: CustomTextStyles.headlineLargeGray50Medium,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSubscriptionsInfoSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [_buildActiveSubscriptionsSection(context)],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomNavigationBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  /// Common widget
  Widget _buildMonthlyFeeSection(
    BuildContext context, {
    required String headlineTwo,
    required String price,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 36.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.fillGray200.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          Text(
            headlineTwo,
            style: CustomTextStyles.bodyLargePrimary.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
          Text(
            price,
            style: theme.textTheme.headlineLarge!.copyWith(
              color: appTheme.blueGray900,
            ),
          )
        ],
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Subscriptions:
        return AppRoutes.home1Page;
      case BottomBarEnum.Calendar:
        return "/";
      case BottomBarEnum.Settings:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.home1Page:
        return Home1Page();
      default:
        return DefaultWidget();
    }
  }
}
