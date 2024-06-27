import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray5001,
        appBar: _buildTopAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 18.v,
          ),
          child: Column(
            children: [_buildDescriptionColumn(context), SizedBox(height: 4.v)],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildTopAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 20.v,
          bottom: 20.v,
        ),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "Privacy Policy",
      ),
    );
  }

  /// Section Widget
  Widget _buildDescriptionText(BuildContext context) {
    return Text(
      "Lorem ipsum dolor sit amet consectetur.\nSit arcu nulla cursus enim consectetur sit rutrum. Id tincidunt tincidunt tortor vulputate pretium viverra. Turpis mi commodo pellentesque interdum consectetur sollicitudin sed at vel. Odio ullamcorper aliquam urna magna lacus in magna felis odio.  Lorem ipsum dolor sit amet consectetur.\nSit arcu nulla cursus enim consectetur sit rutrum. Id tincidunt tincidunt tortor vulputate pretium viverra. Turpis mi commodo pellentesque interdum consectetur sollicitudin sed at vel. Odio ullamcorper aliquam urna magna lacus in magna felis odio.",
      maxLines: 15,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.titleMedium!.copyWith(
        height: 1.25,
      ),
    );
  }

  /// Section Widget
  Widget _buildDescriptionColumn(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [_buildDescriptionText(context)],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
