import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_switch.dart';
import '../../widgets/custom_text_form_field.dart';
import 'widgets/category_item_widget.dart'; 
class AddScreen extends StatelessWidget {
  AddScreen({Key? key})
      : super(
          key: key,
        );

 final TextEditingController nameController = TextEditingController();

 final TextEditingController dateController = TextEditingController();

  bool isSelectedSwitch = false;

 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 10.v),
            child: Column(
              children: [
                SizedBox(height: 20.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: _buildAddInformation(context),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildSaveButton(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
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
        text: "New subscription",
      ),
    );
  }

  /// Section Widget
  Widget _buildAddInformation(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(bottom: 4.v),
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Category",
            style: CustomTextStyles.titleMediumPrimary_1,
          ),
          SizedBox(height: 10.v),
          SizedBox(
            width: double.maxFinite,
            child: Wrap(
              runSpacing: 8.v,
              spacing: 8.h,
              children:
                  List<Widget>.generate(9, (index) => CategoryItemWidget()),
            ),
          ),
          SizedBox(height: 10.v),
          Text(
            "Subscription name",
            style: CustomTextStyles.titleMediumPrimary_1,
          ),
          SizedBox(height: 10.v),
          CustomTextFormField(
            controller: nameController,
            hintText: "Subscription name",
          ),
          SizedBox(height: 10.v),
          Text(
            "Regular payment",
            style: CustomTextStyles.titleMediumPrimary_1,
          ),
          SizedBox(height: 10.v),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgRadioButtons,
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12.v),
                    child: Text(
                      "once a year",
                      style: CustomTextStyles.titleMediumPrimary_1,
                    ),
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgRadioButtonsGreenA700,
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 34.h),
                  child: Text(
                    "once a months",
                    style: CustomTextStyles.titleMediumPrimary_1,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10.v),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.h,
              vertical: 20.v,
            ),
            decoration: AppDecoration.fillGray200.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder20,
            ),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "\$0",
                  style: CustomTextStyles.bodyLargePrimary,
                ),
                Text(
                  "monthly",
                  style: CustomTextStyles.titleMediumPrimary,
                )
              ],
            ),
          ),
          SizedBox(height: 10.v),
          Text(
            "Date of payment",
            style: CustomTextStyles.titleMediumPrimary_1,
          ),
          SizedBox(height: 10.v),
          CustomTextFormField(
            controller: dateController,
            hintText: "25.05.2023",
            textInputAction: TextInputAction.done,
            suffix: Container(
              padding: EdgeInsets.all(6.h),
              margin: EdgeInsets.fromLTRB(30.h, 14.v, 10.h, 14.v),
              decoration: BoxDecoration(
                color: appTheme.gray200,
                borderRadius: BorderRadius.circular(
                  18.h,
                ),
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgIconsToday24px,
                height: 22.adaptSize,
                width: 22.adaptSize,
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 66.v,
            ),
            contentPadding: EdgeInsets.only(
              left: 30.h,
              top: 22.v,
              bottom: 22.v,
            ),
          ),
          SizedBox(height: 10.v),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Remind me to pay in 2 days",
                  style: CustomTextStyles.titleMediumPrimary_1,
                ),
                CustomSwitch(
                  value: isSelectedSwitch,
                  onChange: (value) {
                    isSelectedSwitch = value;
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSaveButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Save",
      margin: EdgeInsets.only(
        left: 20.h,
        right: 20.h,
        bottom: 56.v,
      ),
      buttonStyle: CustomButtonStyles.fillOnPrimaryContainer,
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
