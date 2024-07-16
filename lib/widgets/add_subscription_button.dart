import 'package:app_p_81/core/repositories/main_repository.dart';
import 'package:app_p_81/presentation/subscription_details_page/subscription_details_page.dart';
import 'package:app_p_81/core/app_export.dart';
import 'package:flutter/material.dart';

class AddSubscriptionButton extends StatelessWidget {
  const AddSubscriptionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: MainRepository.uuid,
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SubscriptionDetailsPage(),
        ),
      ),
      backgroundColor: appTheme.greenA700,
      child: Center(
        child: Text(
          "+",
          style: CustomTextStyles.headlineLargeGray50Medium,
        ),
      ),
    );
  }
}
