import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:app_p_81/core/app_export.dart';

class CalendarWidget extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onSelectDate;

  const CalendarWidget({
    super.key,
    required this.selectedDate,
    required this.onSelectDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.fillGray200.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
          calendarType: CalendarDatePicker2Type.single,
          firstDate: DateTime(DateTime.now().year - 5),
          lastDate: DateTime(DateTime.now().year + 5),
          selectedDayHighlightColor: appTheme.greenA700,
          centerAlignModePicker: true,
          firstDayOfWeek: 0,
          controlsHeight: 50,
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
        value: [selectedDate],
        onValueChanged: (dates) => onSelectDate(dates.first!),
      ),
    );
  }
}
