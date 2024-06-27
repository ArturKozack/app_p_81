import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import '../../core/app_export.dart'; // ignore_for_file: must_be_immutable

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key})
      : super(
          key: key,
        );

  @override
  CalendarPageState createState() => CalendarPageState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CalendarPageState extends State<CalendarPage>
    with AutomaticKeepAliveClientMixin<CalendarPage> {
  List<DateTime?> selectedDatesFromCalendar = [];

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 22.v),
                SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      _buildCalendarColumn(context),
                      SizedBox(height: 20.v),
                      _buildMainColumn(context),
                      SizedBox(height: 8.v),
                      _buildNavigationBar(context)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCalendarWidget(BuildContext context) {
    return SizedBox(
      height: 404.v,
      width: 360.h,
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
          calendarType: CalendarDatePicker2Type.single,
          firstDate: DateTime(DateTime.now().year - 5),
          lastDate: DateTime(DateTime.now().year + 5),
          selectedDayHighlightColor: Color(0XFF1ABA5E),
          centerAlignModePicker: true,
          firstDayOfWeek: 0,
          controlsHeight: 24,
          weekdayLabelTextStyle: TextStyle(
            color: theme.colorScheme.primary,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
          selectedDayTextStyle: TextStyle(
            color: Color(0XFFF8F8F8),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
          controlsTextStyle: TextStyle(
            color: theme.colorScheme.primary,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
          dayTextStyle: TextStyle(
            color: appTheme.blueGray900,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
          disabledDayTextStyle: TextStyle(
            color: appTheme.blueGray900,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
          weekdayLabels: ["S", "M", "T", "W", "T", "F", "S"],
          dayBorderRadius: BorderRadius.circular(
            20.h,
          ),
        ),
        value: selectedDatesFromCalendar,
        onValueChanged: (dates) {},
      ),
    );
  }

  /// Section Widget
  Widget _buildCalendarColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Column(
        children: [_buildCalendarWidget(context)],
      ),
    );
  }

  /// Section Widget
  Widget _buildHeadlineColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Active subscriptions",
            style: CustomTextStyles.titleLargeGray50,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTitleColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 14.h),
      child: Column(
        children: [
          Text(
            "There is no payment scheduled for this day",
            style: CustomTextStyles.bodyLargeOnPrimary,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildMainColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.fillLightBlueA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderBL20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16.v),
          _buildHeadlineColumn(context),
          SizedBox(height: 14.v),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 54.v,
            ),
            decoration: AppDecoration.fillGray200.copyWith(
              borderRadius: BorderRadiusStyle.customBorderBL20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [_buildTitleColumn(context), SizedBox(height: 82.v)],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNavigationBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 12.v,
      ),
      decoration: AppDecoration.accentprimary1,
      width: double.maxFinite,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: _buildSubscriptionsSegment(
              context,
              dynamicImage: ImageConstant.imgHome,
              dynamicText: "Home",
            ),
          ),
          Expanded(
            child: _buildSubscriptionsSegment(
              context,
              dynamicImage: ImageConstant.imgSubscriptions,
              dynamicText: "Subscriptions",
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 4.v),
              child: _buildSettingsSegment(
                context,
                searchImage: ImageConstant.imgCalendar,
                settingsText: "Calendar",
              ),
            ),
          ),
          Expanded(
            child: _buildSettingsSegment(
              context,
              searchImage: ImageConstant.imgSearch,
              settingsText: "Settings",
            ),
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildSubscriptionsSegment(
    BuildContext context, {
    required String dynamicImage,
    required String dynamicText,
  }) {
    return Opacity(
      opacity: 0.3,
      child: Column(
        children: [
          CustomImageView(
            imagePath: dynamicImage,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
          SizedBox(height: 8.v),
          Text(
            dynamicText,
            textAlign: TextAlign.center,
            style: CustomTextStyles.bodySmallGray50.copyWith(
              color: appTheme.gray50,
            ),
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildSettingsSegment(
    BuildContext context, {
    required String searchImage,
    required String settingsText,
  }) {
    return Opacity(
      opacity: 0.3,
      child: Column(
        children: [
          CustomImageView(
            imagePath: searchImage,
            height: 32.adaptSize,
            width: 32.adaptSize,
          ),
          SizedBox(height: 4.v),
          Text(
            settingsText,
            textAlign: TextAlign.center,
            style: CustomTextStyles.bodySmallGray50.copyWith(
              color: appTheme.gray50,
            ),
          )
        ],
      ),
    );
  }
}
