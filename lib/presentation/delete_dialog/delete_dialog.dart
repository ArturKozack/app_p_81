import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app_p_81/core/app_export.dart';

class DeleteDialog extends StatelessWidget {
  final String title;

  const DeleteDialog({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return AlertDialog(
      backgroundColor: appTheme.gray5001,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      title: SizedBox(
        width: double.maxFinite,
        child: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleLarge,
        ),
      ),
      content: Text(
        localizations.deleteDataWarning,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.bodySmall,
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        InkWell(
          onTap: () => Navigator.pop(context, 'cancel'),
          child: Text(
            localizations.cancel,
            style: CustomTextStyles.titleMediumLightblueA700,
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(context, 'delete'),
          child: Padding(
            padding: EdgeInsets.only(left: 32.h),
            child: Text(
              localizations.delete,
              style: CustomTextStyles.titleMediumLightblueA700,
            ),
          ),
        ),
      ],
    );
  }
}
