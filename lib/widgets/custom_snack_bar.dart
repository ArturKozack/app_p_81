import 'package:app_p_81/core/app_export.dart';
import 'package:app_p_81/core/repositories/main_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSnackBar extends SnackBar {
  final String text;
  final Color color;
  final Color? textColor;

  CustomSnackBar({
    super.key,
    required this.text,
    required this.color,
    this.textColor,
  }) : super(
          content: Builder(
            builder: (context) => Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: textColor ?? appTheme.whiteA700),
            ),
          ),
          backgroundColor: color,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 8.v, horizontal: 16.h),
          duration: const Duration(seconds: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          animation: CurvedAnimation(
            parent: AnimationController(
              vsync: TestVSync(),
              duration: const Duration(milliseconds: 3),
            ),
            curve: Curves.easeOutCirc,
          ),
        );

  factory CustomSnackBar.success() {
    final context = MainRepository.snackbarKey.currentContext!;
    final localizations = AppLocalizations.of(context)!;

    return CustomSnackBar(
      text: localizations.savedSuccessful,
      color: appTheme.gray50,
      textColor: appTheme.black900,
    );
  }

  factory CustomSnackBar.error() {
    final context = MainRepository.snackbarKey.currentContext!;
    final localizations = AppLocalizations.of(context)!;

    return CustomSnackBar(
      text: localizations.errorOccured,
      color: appTheme.red500,
    );
  }
}

class TestVSync extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
