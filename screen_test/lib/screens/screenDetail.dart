import 'package:flutter/material.dart';
import 'package:screen_test/dummyData.dart';
import 'package:screen_test/models/meal.dart';
import 'package:screen_test/widgets/mealItem.dart';

class ScreenDetail extends StatelessWidget {
  // final String _categoryID;
  // final String _categoryTitle;
  // final Color _color;

  // ScreenDetail(this._categoryID, this._categoryTitle, this._color);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    final id = routeArgs["id"];
    final title = routeArgs["title"] as String;
    final color = routeArgs["color"];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
