import 'package:flutter/material.dart';
import '../../core/app_export.dart'; // ignore_for_file: must_be_immutable

class Subscriptions1Page extends StatefulWidget {
  const Subscriptions1Page({Key? key})
      : super(
          key: key,
        );

  @override
  Subscriptions1PageState createState() => Subscriptions1PageState();
}

class Subscriptions1PageState extends State<Subscriptions1Page>
    with AutomaticKeepAliveClientMixin<Subscriptions1Page> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(16.h),
          decoration: AppDecoration.fillGray,
          child: Column(
            children: [
              SizedBox(height: 560.v),
              Container(
                height: 56.v,
                width: 56.h,
                margin: EdgeInsets.only(left: 326.h),
                decoration: AppDecoration.outlineBlackC.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "+",
                      style: CustomTextStyles.headlineLargeGray50Medium,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
