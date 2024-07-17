import 'package:app_p_81/core/app_export.dart';
import 'package:app_p_81/core/models/subscription/subscription.dart';
import 'package:app_p_81/core/repositories/main_repository.dart';
import 'package:app_p_81/presentation/subscription_details_page/subscription_details_page.dart';
import 'package:app_p_81/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubscriptionActionsDialog extends StatelessWidget {
  final SubscriptionModel subscription;

  const SubscriptionActionsDialog({
    Key? key,
    required this.subscription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12.v),
              Text(
                localizations.makeChanges,
                style: CustomTextStyles.bodySmallBluegray900,
              ),
              Text(
                localizations.makeChangesDescription,
                style: CustomTextStyles.bodySmallBluegray900,
              ),
              SizedBox(
                height: 12.v,
              ),
              _buildDivider(),
              CustomTextButton(
                text: localizations.edit,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubscriptionDetailsPage(
                        subscription: subscription,
                      ),
                    ),
                  );
                },
              ),
              _buildDivider(),
              CustomTextButton(
                text: localizations.delete,
                buttonTextStyle: CustomTextStyles.bodyLargeMontserratRed500,
                onPressed: () =>
                    MainRepository.deleteSubscription(context, subscription.id),
              ),
              _buildDivider(),
              CustomTextButton(
                text: localizations.cancel,
                onPressed: () => Navigator.pop(context),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 0,
      thickness: 0.2,
    );
  }
}
