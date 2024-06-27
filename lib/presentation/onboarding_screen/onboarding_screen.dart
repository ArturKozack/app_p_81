import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImage,
                height: 514.v,
                width: double.maxFinite,
              ),
              SizedBox(height: 8.v),
              _buildWelcomeSection(context),
              SizedBox(height: 4.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNextButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Next",
      buttonStyle: CustomButtonStyles.fillLightBlueA,
    );
  }

  /// Section Widget
  Widget _buildWelcomeSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        children: [
          Text(
            "Welcome!",
            style: theme.textTheme.headlineLarge,
          ),
          SizedBox(height: 8.v),
          SizedBox(
            width: 252.h,
            child: Text(
              "Follow yours subscriptions and control yours payments and expenses",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
          ),
          SizedBox(height: 48.v),
          _buildNextButton(context)
        ],
      ),
    );
  }
}
