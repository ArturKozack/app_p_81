import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../custom_icon_button.dart';
class AppbarLeadingIconbutton extends StatelessWidget {
  AppbarLeadingIconbutton({Key? key, this.imagePath, this.margin, this.onTap})
      : super(
          key: key,
        );

final  String? imagePath;

 final EdgeInsetsGeometry? margin;

final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 66.adaptSize,
          width: 66.adaptSize,
          padding: EdgeInsets.all(20.h),
          decoration: IconButtonStyleHelper.fillOnPrimaryContainer,
          child: CustomImageView(
            imagePath: ImageConstant.imgLock,
          ),
        ),
      ),
    );
  }
}
