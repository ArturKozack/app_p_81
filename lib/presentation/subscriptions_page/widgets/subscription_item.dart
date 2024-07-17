import 'package:app_p_81/core/app_export.dart';
import 'package:app_p_81/core/models/payment_status/payment_status.dart';
import 'package:app_p_81/core/models/payments/payments.dart';
import 'package:app_p_81/core/models/subscription/subscription.dart';
import 'package:app_p_81/core/repositories/main_repository.dart';
import 'package:app_p_81/core/utils/extensions.dart';
import 'package:app_p_81/core/utils/subscription_utils.dart';
import 'package:app_p_81/presentation/subscriptions_page/widgets/subscription_actions_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubscriptionItem extends StatelessWidget {
  final SubscriptionModel subscription;
  final PaymentModel? payment;

  const SubscriptionItem({
    Key? key,
    required this.subscription,
    this.payment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return GestureDetector(
      onLongPress: payment == null ? () => _showActionSheet(context) : null,
      child: Container(
        padding: EdgeInsets.all(10.h),
        decoration: AppDecoration.fillGray200.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Row(
          children: [
            Container(
              height: 66.adaptSize,
              width: 66.adaptSize,
              padding: EdgeInsets.all(4.adaptSize),
              decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: CustomImageView(
                imagePath: subscription.category.icon,
              ),
            ),
            SizedBox(width: 10.h),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          subscription.name,
                          style: theme.textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          localizations.startDate +
                              ' ' +
                              subscription.startDate.format,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8.h,
                  ),
                  Expanded(
                    child: payment == null
                        ? _buildPriceWidget()
                        : _PaymentStatusCheckbox(
                            payment: payment!,
                          ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPriceWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$" + subscription.amount.format,
          style: theme.textTheme.bodyLarge,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Text(
          subscription.type.suffix,
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }

  void _showActionSheet(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (_) => SubscriptionActionsDialog(
        subscription: subscription,
      ),
    );
  }
}

class _PaymentStatusCheckbox extends StatelessWidget {
  final PaymentModel payment;

  _PaymentStatusCheckbox({
    required this.payment,
  });

  @override
  Widget build(BuildContext context) {
    final status = payment.status;
    final isActive = status != PaymentStatus.terminated;
    final isChecked = status == PaymentStatus.paid;

    return GestureDetector(
      onTap: onChanged,
      child: Container(
        width: 46.adaptSize,
        height: 46.adaptSize,
        decoration: BoxDecoration(
          color: isChecked ? appTheme.lightBlueA700 : appTheme.gray200,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isActive ? appTheme.lightBlueA700 : appTheme.red500,
            width: 2.0,
          ),
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                size: 28.adaptSize,
                color: Colors.white,
              )
            : null,
      ),
    );
  }

  void onChanged() {
    final updatedStatus = payment.status == PaymentStatus.paid
        ? payment.date.dateOnly.isBefore(DateTime.now().dateOnly)
            ? PaymentStatus.terminated
            : PaymentStatus.active
        : PaymentStatus.paid;
    MainRepository.updatePayment(
      payment.copyWith(status: updatedStatus),
    );
  }
}
