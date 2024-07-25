import 'package:app_p_81/core/repositories/main_repository.dart';
import 'package:app_p_81/presentation/settings_screen/info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';

enum SettingsItemType {
  notification,
  privacyPolicy,
  shareApp,

  clearCache,
}

extension SettingsItemTypeExtension on SettingsItemType {
  String get title {
    final context = MainRepository.snackbarKey.currentContext!;
    final localizations = AppLocalizations.of(context)!;

    switch (this) {
      case SettingsItemType.notification:
        return localizations.notification;
      case SettingsItemType.privacyPolicy:
        return localizations.privacyPolicy;
      case SettingsItemType.shareApp:
        return localizations.shareApp;

      case SettingsItemType.clearCache:
        return localizations.clearData;
    }
  }

  String get description {
    final context = MainRepository.snackbarKey.currentContext!;
    final localizations = AppLocalizations.of(context)!;

    switch (this) {
      case SettingsItemType.privacyPolicy:
        return localizations.loremIpsum;

      default:
        return '';
    }
  }

  void onTap(BuildContext context) {
    switch (this) {
      case SettingsItemType.notification:
        openAppSettings();
        break;
      case SettingsItemType.shareApp:
        MainRepository.shareApp();
        break;
      case SettingsItemType.clearCache:
        MainRepository.clearCache(context);
        break;
      default:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => InfoPage(this),
          ),
        );
    }
  }
}
