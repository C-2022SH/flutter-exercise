import 'package:flutter/material.dart';
import 'package:screen_test/models/meal.dart';
import 'package:screen_test/widgets/mealItem.dart';

class ScreenDetail extends StatefulWidget {
  final List<Meal> availableMeals;

  ScreenDetail(this.availableMeals);

  @override
  State<ScreenDetail> createState() => _ScreenDetailState();
}

class _ScreenDetailState extends State<ScreenDetail> {
  String title = "";
  List<Meal>? displayedMeals;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    final id = routeArgs["id"];
    title = routeArgs["title"] as String;

    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();
  }

  void _removeMeal(String mealID) {
    setState(() {
      displayedMeals?.removeWhere((element) => element.id == mealID);
    });
  }

  // final String _categoryID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals![index].id,
            title: displayedMeals![index].title,
            imageUrl: displayedMeals![index].imageUrl,
            duration: displayedMeals![index].duration,
            complexity: displayedMeals![index].complexity,
            affordability: displayedMeals![index].affordability,
          );
        },
        itemCount: displayedMeals!.length,
      ),
    );
  }
}
