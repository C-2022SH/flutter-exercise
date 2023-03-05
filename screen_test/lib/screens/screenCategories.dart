import 'package:flutter/material.dart';
import 'package:screen_test/dummyData.dart';
import 'package:screen_test/widgets/categoryItem.dart';

class ScreenCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map((categoryData) => CategoryItem(
                categoryData.id,
                categoryData.title,
                categoryData.color,
              ))
          .toList(),
    );
  }
}
