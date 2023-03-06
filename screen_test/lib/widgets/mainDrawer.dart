import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, IconData iconData, Function() tabCallback) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.brown),
      ),
      onTap: tabCallback,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: const Text(
              "Cooking Up!",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile("meals", Icons.restaurant_rounded, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildListTile("filter", Icons.find_in_page_rounded, () {
            Navigator.of(context).pushReplacementNamed("/filters");
          }),
        ],
      ),
    );
  }
}
