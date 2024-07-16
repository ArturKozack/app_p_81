import 'dart:developer';

import 'package:app_p_81/core/models/category_type/category_type.dart';
import 'package:app_p_81/core/models/payment_status/payment_status.dart';
import 'package:app_p_81/core/models/payments/payments.dart';
import 'package:app_p_81/core/models/subscription/subscription.dart';
import 'package:app_p_81/core/models/subscription_type/subscription_type.dart';
import 'package:app_p_81/core/models/user/user.dart';
import 'package:app_p_81/core/utils/extensions.dart';
import 'package:app_p_81/presentation/delete_dialog/delete_dialog.dart';
import 'package:app_p_81/presentation/onboarding_page/onboarding_page.dart';
import 'package:app_p_81/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';

class MainRepository {
  static final snackbarKey = GlobalKey<ScaffoldMessengerState>();

  static final userBox = Hive.box<UserModel>('user');
  static final paymentBox = Hive.box<PaymentModel>('payments');
  static final subscriptionBox = Hive.box<SubscriptionModel>('subscriptions');

  static UserModel? get user => userBox.get('user');

  static List<SubscriptionModel> get subscriptions =>
      subscriptionBox.values.toList()
        ..sort(
          (a, b) => a.startDate.dateOnly.compareTo(b.startDate.dateOnly),
        );

  static List<PaymentModel> get payments => paymentBox.values.toList();

  static List<PaymentModel> filteredPayments(
    DateTime? date,
    CategoryType category,
  ) {
    final List<PaymentModel> filteredPayments = [];

    final paymentsByDate = payments
        .where(
            (payment) => payment.date.dateOnly.isAtSameMomentAs(date.dateOnly))
        .toList();

    paymentsByDate.forEach(
      (payment) {
        final subscription =
            MainRepository.subscriptionBox.get(payment.subscriptionId)!;
        if (category == CategoryType.all || subscription.category == category) {
          filteredPayments.add(payment);
        }
      },
    );
    return filteredPayments;
  }

  static void setDefaultUser() {
    userBox.put(
      'user',
      UserModel(),
    );
  }

  static void updateUserName(String name) {
    final updatedUser =
        user != null ? user!.copyWith(name: name) : UserModel(name: name);
    userBox.put('user', updatedUser);
  }

  static Future<void> updateUserAvatar() async {
    try {
      final picker = ImagePicker();
      final file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null && user != null) {
        final avatar = await file.readAsBytes();
        final updatedUser = user!.copyWith(avatar: avatar);
        userBox.put('user', updatedUser);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static void savePayments(SubscriptionModel subscription) {
    DateTime now = DateTime.now().dateOnly;
    DateTime currentDate = subscription.startDate;
    DateTime endDate = DateTime(now.year + 5, now.month, now.day);

    while (currentDate.isBefore(endDate)) {
      final payment = PaymentModel(
        id: uuid,
        subscriptionId: subscription.id,
        date: currentDate.dateOnly,
        status: currentDate.isBefore(DateTime.now().dateOnly)
            ? PaymentStatus.terminated
            : PaymentStatus.active,
      );

      paymentBox.put(payment.id, payment);
      currentDate = DateTime(
        currentDate.year +
            (subscription.type == SubscriptionType.yearly ? 1 : 0),
        currentDate.month +
            (subscription.type == SubscriptionType.monthly ? 1 : 0),
        currentDate.day,
      );
    }
  }

  static void deletePayments(String subscriptionId) {
    final paymentKeys = payments
        .where((payment) => payment.subscriptionId == subscriptionId)
        .map((payment) => payment.id);
    paymentBox.deleteAll(paymentKeys);
  }

  static void saveSubscription(SubscriptionModel subscription) {
    final currentSubscription = subscriptionBox.get(subscription.id);
    if (currentSubscription != null) {
      if (!currentSubscription.startDate
          .isAtSameMomentAs(subscription.startDate)) {
        deletePayments(subscription.id);
        savePayments(subscription);
      }
    } else {
      savePayments(subscription);
    }
    subscriptionBox.put(
      subscription.id,
      subscription,
    );
    snackbarKey.currentState!.showSnackBar(CustomSnackBar.success());
  }

  static void deleteSubscription(BuildContext context, String id) {
    showDialog<String>(
      context: context,
      builder: (_) => DeleteDialog(
        title: AppLocalizations.of(context)!.deleteSubscription,
      ),
    ).then(
      (value) async {
        if (value != null && value == 'delete') {
          deletePayments(id);
          subscriptionBox.delete(id);
          Navigator.pop(context);
        }
      },
    );
  }

  static void updatePayment(PaymentModel payment) =>
      paymentBox.put(payment.id, payment);

  static String get uuid {
    const uuid = Uuid();
    return uuid.v4();
  }

  static void clearCache(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (_) => DeleteDialog(
        title: AppLocalizations.of(context)!.deleteAllAppCache,
      ),
    ).then(
      (value) async {
        if (value != null && value == 'delete') {
          Navigator.of(
            context,
            rootNavigator: true,
          ).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => OnboardingPage(),
            ),
            (route) => false,
          );
          userBox.clear();
          subscriptionBox.clear();
          paymentBox.clear();
        }
      },
    );
  }

  static Future<void> shareApp() async {
    try {
      Share.share(
        "https://appdynamiclink.page.link/76UZ",
        subject: 'Look what I found!',
      );
    } catch (e) {
      log(e.toString());
    }
  }

  static bool checkForPaymentReminder() {
    if (payments.isNotEmpty) {
      return payments.any((payment) =>
          payment.date.isAtSameMomentAs(DateTime.now().dateOnly) &&
          payment.status == PaymentStatus.active);
    }
    return false;
  }

  static void showErrorSnackbar() =>
      snackbarKey.currentState!.showSnackBar(CustomSnackBar.error());
}
