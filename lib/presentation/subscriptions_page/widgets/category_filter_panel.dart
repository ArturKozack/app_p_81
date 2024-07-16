import 'package:app_p_81/core/app_export.dart';
import 'package:app_p_81/core/models/category_type/category_type.dart';
import 'package:app_p_81/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';

class CategoryFilterPanel extends StatelessWidget {
  final CategoryType selectedCategory;
  final Function(CategoryType) onSelected;

  const CategoryFilterPanel({
    super.key,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final categories = CategoryType.values;
    return Container(
      height: 50.h,
      margin: EdgeInsets.symmetric(
        vertical: 16.v,
        horizontal: 16.h,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 8.h,
          );
        },
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItemWidget(
            category: category,
            isSelected: selectedCategory == category,
            onSelected: () {
              if (selectedCategory != category) onSelected(category);
            },
          );
        },
      ),
    );
  }
}
