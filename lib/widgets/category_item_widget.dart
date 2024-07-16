import 'package:app_p_81/core/models/category_type/category_type.dart';
import 'package:app_p_81/core/utils/subscription_utils.dart';
import 'package:flutter/material.dart';
import 'package:app_p_81/core/app_export.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryType category;
  final bool isSelected;
  final Function() onSelected;

  const CategoryItemWidget({
    Key? key,
    required this.category,
    this.isSelected = false,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 12.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        category.title,
        style: TextStyle(
          color: isSelected ? appTheme.whiteA700 : appTheme.blueGray900,
          fontSize: 16.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      ),
      selected: isSelected,
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      selectedColor: appTheme.lightBlueA700,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isSelected
              ? appTheme.lightBlueA700
              : theme.colorScheme.onPrimaryContainer,
          width: 0,
        ),
        borderRadius: BorderRadius.circular(
          20.h,
        ),
      ),
      onSelected: (value) => onSelected(),
    );
  }
}
