import 'package:app_p_81/core/models/category_type/category_type.dart';
import 'package:app_p_81/core/repositories/main_repository.dart';
import 'package:app_p_81/presentation/subscriptions_page/widgets/category_filter_panel.dart';
import 'package:app_p_81/widgets/add_subscription_button.dart';
import 'package:app_p_81/presentation/subscriptions_page/widgets/subscription_list_view.dart';
import 'package:app_p_81/widgets/app_bar/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app_p_81/core/app_export.dart';

class SubscriptionsPage extends StatefulWidget {
  const SubscriptionsPage({Key? key}) : super(key: key);

  @override
  SubscriptionsPageState createState() => SubscriptionsPageState();
}

class SubscriptionsPageState extends State<SubscriptionsPage> {
  late AppLocalizations _localizations;

  CategoryType _selectedCategory = CategoryType.all;

  @override
  void didChangeDependencies() {
    _localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final subscriptions = MainRepository.subscriptions
        .where((e) =>
            (_selectedCategory == CategoryType.all) ||
            (e.category == _selectedCategory))
        .toList();

    return SafeArea(
      child: Scaffold(
        appBar: AppbarTitle(
          text: _localizations.subscriptions,
        ),
        body: Column(
          children: [
            CategoryFilterPanel(
              selectedCategory: _selectedCategory,
              onSelected: (category) =>
                  setState(() => _selectedCategory = category),
            ),
            Expanded(
              child: subscriptions.isEmpty
                  ? _buildEmptySubscriptions(context)
                  : SubscriptionListView(
                      subscriptions: subscriptions,
                    ),
            ),
          ],
        ),
        floatingActionButton: AddSubscriptionButton(),
      ),
    );
  }

  Widget _buildEmptySubscriptions(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _localizations.youHaveNoCurrentSubscriptions,
            style: CustomTextStyles.bodyLargeOnPrimary,
          ),
          SizedBox(height: 8.v),
          Text(
            _localizations.youCanAddOneNow,
            style: CustomTextStyles.bodySmallSecondaryContainer,
          ),
        ],
      ),
    );
  }
}
