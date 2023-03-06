import 'package:flutter/material.dart';
import 'package:screen_test/screens/screenCategories.dart';
import 'package:screen_test/screens/screenFavorites.dart';
import 'package:screen_test/widgets/MainDrawer.dart';
import '../models/meal.dart';

class ScreenGNB extends StatefulWidget {
  final List<Meal> favoriteMeals;

  ScreenGNB(this.favoriteMeals);

  @override
  _GNBScreenState createState() => _GNBScreenState();
}

class _GNBScreenState extends State<ScreenGNB> {
  List<Map<String, Object>> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        "page": ScreenCategories(),
        "title": "Categories",
      },
      {
        "page": ScreenFavorites(widget.favoriteMeals),
        "title": "Favorites",
      },
    ];
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category_rounded),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star_rounded),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
