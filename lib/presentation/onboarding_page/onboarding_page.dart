import 'package:app_p_81/core/repositories/main_repository.dart';
import 'package:flutter/material.dart';
import 'package:app_p_81/core/app_export.dart';
import 'package:app_p_81/theme/custom_button_style.dart';
import 'package:app_p_81/widgets/custom_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              child: CustomImageView(
                imagePath: ImageConstant.imgImage,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.v),
            _buildWelcomeSection(context),
            SizedBox(height: 64.v),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return CustomElevatedButton(
      text: AppLocalizations.of(context)!.next,
      buttonStyle: CustomButtonStyles.fillLightBlueA,
      onPressed: () {
        MainRepository.setDefaultUser();
        Navigator.popAndPushNamed(
          context,
          AppRoutes.rootPage,
        );
      },
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        children: [
          Text(
            localizations.welcome,
            style: theme.textTheme.headlineLarge,
          ),
          SizedBox(height: 8.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.h),
            child: SizedBox(
              child: Text(
                localizations.welcomeInfo,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ),
          SizedBox(height: 48.v),
          _buildNextButton(context),
        ],
      ),
    );
  }
}
