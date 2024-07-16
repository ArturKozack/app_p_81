import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension NumberFormatExtension on int {
  String get format {
    final formatter = NumberFormat('#,###');
    return formatter.format(this).replaceAll(',', ' ');
  }
}

extension StringFormatExtension on String {
  int get numberFormat {
    final replace = replaceAll(' ', '');
    return int.tryParse(replace) ?? 0;
  }
}

extension DoubleFormatExtention on double {
  String get format {
    final intPart = truncate();
    final index = toString().indexOf('.') + 1;
    String decimalPart = toString().substring(index);
    decimalPart = decimalPart.length > 2
        ? '.${decimalPart.substring(0, 2)}'
        : decimalPart == '0' || decimalPart == '00'
            ? ''
            : '.$decimalPart';

    return '${intPart.format}$decimalPart';
  }
}

extension DateTimeFormatExtention on DateTime? {
  String get format {
    final formatter = DateFormat('dd.MM.yyyy');
    return this != null ? formatter.format(this!) : '';
  }

  DateTime get dateOnly => DateUtils.dateOnly(this!);
}
