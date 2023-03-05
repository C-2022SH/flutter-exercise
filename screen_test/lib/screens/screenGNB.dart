import 'package:flutter/material.dart';
import 'package:screen_test/screens/screenCategories.dart';
import 'package:screen_test/screens/screenFavorites.dart';

class ScreenGNB extends StatefulWidget {
  @override
  _GNBScreenState createState() => _GNBScreenState();
}

class _GNBScreenState extends State<ScreenGNB> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("meals"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category_rounded),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star_rounded),
                text: "Favorites",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ScreenCategories(),
            ScreenFavorites(),
          ],
        ),
      ),
      length: 2,
    );
  }
}
