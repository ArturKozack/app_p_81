import 'package:app_p_81/core/app_export.dart';
import 'package:app_p_81/core/models/category_type/category_type.dart';
import 'package:app_p_81/core/models/subscription_type/subscription_type.dart';
import 'package:app_p_81/core/repositories/main_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension SubscriptionTypeExtension on SubscriptionType {
  String get title {
    final context = MainRepository.snackbarKey.currentContext!;
    final localizations = AppLocalizations.of(context)!;

    switch (this) {
      case SubscriptionType.monthly:
        return localizations.monthlyFee;
      case SubscriptionType.yearly:
        return localizations.annualFee;
      default:
        return '';
    }
  }

  String get description {
    final context = MainRepository.snackbarKey.currentContext!;
    final localizations = AppLocalizations.of(context)!;

    switch (this) {
      case SubscriptionType.monthly:
        return localizations.onceAMonth;
      case SubscriptionType.yearly:
        return localizations.onceAYear;
      default:
        return '';
    }
  }

  String get suffix {
    final context = MainRepository.snackbarKey.currentContext!;
    final localizations = AppLocalizations.of(context)!;

    switch (this) {
      case SubscriptionType.monthly:
        return localizations.month;
      case SubscriptionType.yearly:
        return localizations.year;
      default:
        return '';
    }
  }
}

extension CategoryTypeExtension on CategoryType {
  String get title {
    final context = MainRepository.snackbarKey.currentContext!;
    final localizations = AppLocalizations.of(context)!;

    switch (this) {
      case CategoryType.all:
        return localizations.all;
      case CategoryType.other:
        return localizations.other;
      case CategoryType.work:
        return localizations.work;
      case CategoryType.sport:
        return localizations.sport;
      case CategoryType.music:
        return localizations.music;
      case CategoryType.education:
        return localizations.education;
      case CategoryType.messengers:
        return localizations.messengers;
      case CategoryType.movies:
        return localizations.movies;
      case CategoryType.books:
        return localizations.books;
      case CategoryType.games:
        return localizations.games;
      default:
        return '';
    }
  }

  String get icon => ImageConstant.imagePath + '/$name.png';
}
