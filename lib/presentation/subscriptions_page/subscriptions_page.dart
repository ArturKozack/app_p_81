import 'package:flutter/material.dart';
import '../../core/app_export.dart'; // ignore_for_file: must_be_immutable

class SubscriptionsPage extends StatefulWidget {
  const SubscriptionsPage({Key? key})
      : super(
          key: key,
        );

  @override
  SubscriptionsPageState createState() => SubscriptionsPageState();
}

class SubscriptionsPageState extends State<SubscriptionsPage>
    with AutomaticKeepAliveClientMixin<SubscriptionsPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(16.h),
          decoration: AppDecoration.fillGray,
          child: Column(
            children: [
              SizedBox(height: 242.v),
              _buildSubscriptionInfo(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSubscriptionInfo(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Text(
            "You have no current subscriptions",
            style: CustomTextStyles.bodyLargeOnPrimary,
          ),
          SizedBox(height: 6.v),
          Text(
            "You can add one now",
            style: CustomTextStyles.bodySmallSecondaryContainer,
          ),
          SizedBox(height: 272.v),
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
}
