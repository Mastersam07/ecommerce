import '../../core/models/category_model.dart';
import '../../utils/colors.dart';
import '../../utils/size_config.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final Category category;
  const CategoryChip({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width(8),
          vertical: SizeConfig.height(4),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          border: Border.all(
            color: AppColors.kSecondaryColor.withOpacity(0.4),
            width: 1,
          ),
        ),
        child: Text(
          category.name,
          style: TextStyle(
              color: AppColors.kSecondaryColor.withOpacity(0.9),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
