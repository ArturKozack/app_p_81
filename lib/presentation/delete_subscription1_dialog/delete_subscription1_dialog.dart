import 'package:flutter/material.dart';
import '../../core/app_export.dart'; // ignore_for_file: must_be_immutable

class DeleteSubscription1Dialog extends StatelessWidget {
  const DeleteSubscription1Dialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 30.h),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(24.h),
                decoration: AppDecoration.fillGray.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delete subscription?",
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(height: 12.v),
                    Text(
                      "All your data will be lost,\nbeyond recovery",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall,
                    ),
                    SizedBox(height: 32.v),
                    SizedBox(
                      width: double.maxFinite,
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Cancel",
                                style:
                                    CustomTextStyles.titleMediumLightblueA700,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 32.h),
                                child: Text(
                                  "Delete",
                                  style:
                                      CustomTextStyles.titleMediumLightblueA700,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.v)
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
