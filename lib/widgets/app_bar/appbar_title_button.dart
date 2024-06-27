import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../custom_elevated_button.dart'; 
class AppbarTitleButton extends StatelessWidget {
  AppbarTitleButton({Key? key, this.margin, this.onTap})
      : super(
          key: key,
        );

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
        child: CustomElevatedButton(
          height: 64.v,
          text: "Calendar",
          buttonTextStyle: theme.textTheme.titleLarge!,
        ),
      ),
    );
  }
}
