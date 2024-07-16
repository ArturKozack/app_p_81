import 'package:app_p_81/core/models/payments/payments.dart';
import 'package:app_p_81/core/repositories/main_repository.dart';
import 'package:app_p_81/core/utils/size_utils.dart';
import 'package:app_p_81/presentation/subscriptions_page/widgets/subscription_item.dart';
import 'package:flutter/material.dart';

class PaymentListView extends StatelessWidget {
  final List<PaymentModel> payments;

  const PaymentListView({
    super.key,
    required this.payments,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
      ),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 16.v,
        );
      },
      itemCount: payments.length,
      itemBuilder: (context, index) {
        final payment = payments[index];
        final subscription =
            MainRepository.subscriptionBox.get(payment.subscriptionId);
        return SubscriptionItem(
          subscription: subscription!,
          payment: payment,
        );
      },
    );
  }
}
