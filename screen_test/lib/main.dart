import 'package:flutter/material.dart';
import 'package:screen_test/dummyData.dart';
import 'package:screen_test/screens/ScreenCategories.dart';
import 'package:screen_test/screens/screenDetail.dart';
import 'package:screen_test/screens/screenFilters.dart';
import 'package:screen_test/screens/screenGNB.dart';
import 'package:screen_test/screens/screenRecipe.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "vegan": false,
    "vegetarian": false,
    "lactose": false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters["gluten"] == true && !meal.isGlutenFree) {
          return false;
        }

        if (_filters["vegan"] == true && !meal.isVegan) {
          return false;
        }

        if (_filters["vegetarian"] == true && !meal.isVegetarian) {
          return false;
        }

        if (_filters["lactose"] == true && !meal.isLactoseFree) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String id) {
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == id);

    if (existingIndex >= 0) {
      // remove
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      // -1,, add
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        canvasColor: Color.fromARGB(255, 249, 255, 255),
        colorScheme: ThemeData.light().colorScheme.copyWith(
              secondary: const Color.fromARGB(255, 241, 234, 94),
            ),
        fontFamily: "Comfortaa",
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                color: Colors.white,
                fontFamily: "Jungledise",
                fontSize: 24,
              ),
              bodyMedium: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
              ),
              bodyLarge: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // entry point
      home: ScreenGNB(_favoriteMeals),
      routes: {
        "/categories": (context) => ScreenCategories(),
        "/detail": (context) => ScreenDetail(_availableMeals),
        "/recipe": (context) => ScreenRecipe(_toggleFavorite, _isMealFavorite),
        "/filters": (context) => ScreenFilters(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => ScreenCategories(),
        );
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => ScreenCategories(),
        );
      },
    );
  }
}
