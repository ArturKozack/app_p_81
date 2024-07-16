import 'package:app_p_81/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:app_p_81/core/app_export.dart';

class AppbarTitle extends CustomAppBar {
  final String text;
  final bool implyLeading;

  AppbarTitle({
    Key? key,
    required this.text,
    this.implyLeading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 40.h,
      leading: implyLeading
          ? InkWell(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 20.v,
                  bottom: 20.v,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgArrowLeft,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  fit: BoxFit.contain,
                ),
              ),
            )
          : null,
      centerTitle: true,
      title: Text(
        text,
        style: theme.textTheme.titleLarge!,
      ),
    );
  }
}
