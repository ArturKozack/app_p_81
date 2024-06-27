import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_outlined_button.dart'; // ignore_for_file: must_be_immutable

class DeleteSubscriptionDialog extends StatelessWidget {
  const DeleteSubscriptionDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12.v),
            Text(
              "Make changes",
              style: CustomTextStyles.bodySmallBluegray900,
            ),
            Text(
              "You can delete or edit the selected transaction",
              style: CustomTextStyles.bodySmallBluegray900,
            ),
            SizedBox(height: 10.v),
            CustomOutlinedButton(
              text: "Edit",
            ),
            CustomOutlinedButton(
              text: "Delete",
              buttonTextStyle: CustomTextStyles.bodyLargeMontserratRed500,
            ),
            CustomOutlinedButton(
              text: "Cancel",
            )
          ],
        )
      ],
    );
  }
}
