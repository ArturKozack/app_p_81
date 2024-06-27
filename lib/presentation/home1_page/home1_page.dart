import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'widgets/subscriptioncar_item_widget.dart'; // ignore_for_file: must_be_immutable

class Home1Page extends StatelessWidget {
  const Home1Page({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
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
                    _buildHeadlineSection(context)
                  ],
                ),
              )
            ],
          ),
        ),
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
                    monthlyFee: "Annual fee",
                    price: "\$1000",
                  ),
                ),
                SizedBox(width: 10.h),
                Expanded(
                  child: _buildMonthlyFeeSection(
                    context,
                    monthlyFee: "Monthly fee",
                    price: "\$100",
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
  Widget _buildHomeSection(BuildContext context) {
    return SizedBox(
      width: 374.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Active subscriptions",
            style: CustomTextStyles.titleLargeOnPrimary,
          ),
          SizedBox(height: 14.v),
          SizedBox(
            height: 486.v,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: 4.h,
                    bottom: 8.v,
                  ),
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 12.v,
                      );
                    },
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return SubscriptioncarItemWidget();
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
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
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHeadlineSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [_buildHomeSection(context)],
      ),
    );
  }

  /// Common widget
  Widget _buildMonthlyFeeSection(
    BuildContext context, {
    required String monthlyFee,
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
            monthlyFee,
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
}
