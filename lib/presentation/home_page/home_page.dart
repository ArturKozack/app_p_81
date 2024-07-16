import 'package:app_p_81/core/models/subscription_type/subscription_type.dart';
import 'package:app_p_81/core/repositories/main_repository.dart';
import 'package:app_p_81/core/utils/extensions.dart';
import 'package:app_p_81/core/utils/subscription_utils.dart';
import 'package:app_p_81/widgets/user_avatar_widget.dart';
import 'package:app_p_81/widgets/add_subscription_button.dart';
import 'package:app_p_81/presentation/subscriptions_page/widgets/subscription_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app_p_81/core/app_export.dart';
import 'package:app_p_81/widgets/app_bar/custom_app_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWelcomeSection(context),
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 16.v,
            ),
            child: Text(
              AppLocalizations.of(context)!.activeSubscriptions,
              style: CustomTextStyles.titleLargeOnPrimary,
            ),
          ),
          Expanded(
            child: MainRepository.subscriptions.isEmpty
                ? _buildEmptySubscriptions(context)
                : SubscriptionListView(
                    subscriptions: MainRepository.subscriptions,
                  ),
          ),
        ],
      ),
      floatingActionButton: AddSubscriptionButton(),
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 20.v),
      decoration: AppDecoration.fillLightBlueA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderBL20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserInfo(context),
          SizedBox(height: 10.v),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.h),
            padding: EdgeInsets.all(6.h),
            decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder20,
            ),
            width: double.maxFinite,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: _buildFeeSection(
                    context,
                    SubscriptionType.monthly,
                  ),
                ),
                SizedBox(width: 10.h),
                Expanded(
                  child: _buildFeeSection(
                    context,
                    SubscriptionType.yearly,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return ValueListenableBuilder(
      valueListenable: MainRepository.userBox.listenable(),
      builder: (_, box, child) {
        return CustomAppBar(
          height: 66.v,
          leadingWidth: 86.h,
          leading: Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: UserAvatarWidget(),
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  localizations.welcomeHome,
                  style: CustomTextStyles.headlineLargeGray50.copyWith(
                    color: appTheme.gray50,
                  ),
                ),
                Text(
                  MainRepository.user?.name ?? localizations.username,
                  style: CustomTextStyles.titleLargeGray50.copyWith(
                    color: appTheme.gray50,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptySubscriptions(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            localizations.emptySubscriptionsTitle,
            style: CustomTextStyles.bodyLargeOnPrimary,
          ),
          SizedBox(height: 8.v),
          Text(
            localizations.emptySubscriptionsInfo,
            style: CustomTextStyles.bodySmallSecondaryContainer,
          ),
        ],
      ),
    );
  }

  Widget _buildFeeSection(
    BuildContext context,
    SubscriptionType type,
  ) {
    final fee = MainRepository.subscriptions
        .where((e) => e.type == type)
        .fold(0, (previousValue, element) => previousValue + element.amount)
        .format;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 36.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          Text(
            type.title,
            style: CustomTextStyles.bodyLargePrimary.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
          Text(
            '\$' + fee,
            style: theme.textTheme.headlineLarge!.copyWith(
              color: appTheme.blueGray900,
            ),
          )
        ],
      ),
    );
  }
}
