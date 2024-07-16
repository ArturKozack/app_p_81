import 'package:app_p_81/core/utils/settings_utils.dart';
import 'package:flutter/material.dart';
import 'package:app_p_81/core/app_export.dart';

class SettingsButton extends StatelessWidget {
  final SettingsItemType settingsItem;

  const SettingsButton({
    Key? key,
    required this.settingsItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => settingsItem.onTap(context),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 8.v,
        ),
        margin: EdgeInsets.only(
          bottom: 12.v,
        ),
        decoration: AppDecoration.fillGreenA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              settingsItem.title,
              style: CustomTextStyles.titleMediumGray50.copyWith(
                color: appTheme.gray50,
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 40.adaptSize,
              width: 40.adaptSize,
            )
          ],
        ),
      ),
    );
  }
}
