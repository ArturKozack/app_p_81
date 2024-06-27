import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class PreloaderScreen extends StatelessWidget {
  const PreloaderScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImage696x414,
                height: 696.v,
                width: double.maxFinite,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgContrast,
                height: 50.adaptSize,
                width: 50.adaptSize,
                margin: EdgeInsets.only(bottom: 52.v),
              )
            ],
          ),
        ),
      ),
    );
  }
}
