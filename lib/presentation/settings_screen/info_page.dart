import 'package:app_p_81/core/utils/settings_utils.dart';
import 'package:app_p_81/core/utils/size_utils.dart';
import 'package:app_p_81/theme/theme_helper.dart';
import 'package:app_p_81/widgets/app_bar/appbar_title.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final SettingsItemType type;

  const InfoPage(
    this.type, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppbarTitle(
          text: type.title,
          implyLeading: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 18.v,
          ),
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Text(
          type.description,
          maxLines: 21,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium!.copyWith(
            height: 1.25,
          ),
        ),
      ),
    );
  }
}
