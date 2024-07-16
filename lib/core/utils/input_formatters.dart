import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ThousandsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final intValue = int.tryParse(newValue.text.replaceAll(' ', ''));
    if (intValue == null) {
      return oldValue;
    }

    final formatter = NumberFormat('#,###');
    final newText = formatter.format(intValue).replaceAll(',', ' ');

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
