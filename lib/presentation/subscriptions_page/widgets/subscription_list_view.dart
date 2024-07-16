import 'package:app_p_81/core/models/subscription/subscription.dart';
import 'package:app_p_81/core/utils/size_utils.dart';
import 'package:app_p_81/presentation/subscriptions_page/widgets/subscription_item.dart';
import 'package:flutter/material.dart';

class SubscriptionListView extends StatelessWidget {
  final List<SubscriptionModel> subscriptions;

  const SubscriptionListView({
    super.key,
    required this.subscriptions,
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
      itemCount: subscriptions.length,
      itemBuilder: (context, index) {
        return SubscriptionItem(
          subscription: subscriptions[index],
        );
      },
    );
  }
}
