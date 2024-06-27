import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class SubscriptionlistItemWidget extends StatelessWidget {
  const SubscriptionlistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return _buildSubscriptionRow(context);
  }

  /// Section Widget
  Widget _buildSubscriptionRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: AppDecoration.fillGray200.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Row(
        children: [
          Container(
            height: 66.adaptSize,
            width: 66.adaptSize,
            decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder20,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage46x46,
                  height: 46.adaptSize,
                  width: 46.adaptSize,
                )
              ],
            ),
          ),
          SizedBox(width: 10.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Subscription name",
                  style: theme.textTheme.bodyLarge,
                ),
                Text(
                  "start date 26.10.2023",
                  style: theme.textTheme.bodySmall,
                )
              ],
            ),
          ),
          SizedBox(width: 10.h),
          Container(
            height: 46.adaptSize,
            width: 46.adaptSize,
            decoration: BoxDecoration(
              color: appTheme.gray50,
              borderRadius: BorderRadius.circular(
                10.h,
              ),
              border: Border.all(
                color: appTheme.lightBlueA700,
                width: 3.h,
              ),
            ),
          )
        ],
      ),
    );
  }
}
