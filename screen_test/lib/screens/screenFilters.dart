import 'package:flutter/material.dart';
import 'package:screen_test/widgets/MainDrawer.dart';

class ScreenFilters extends StatefulWidget {
  final Map<String, bool> currentFilters;
  final Function(Map<String, bool>) saveFilters;

  ScreenFilters(this.currentFilters, this.saveFilters);

  @override
  State<ScreenFilters> createState() => _ScreenFiltersState();
}

class _ScreenFiltersState extends State<ScreenFilters> {
  bool _isGlutenFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;

  @override
  void initState() {
    super.initState();

    _isGlutenFree = widget.currentFilters["gluten"] as bool;
    _isVegetarian = widget.currentFilters["vegetarian"] as bool;
    _isVegan = widget.currentFilters["vegan"] as bool;
    _isLactoseFree = widget.currentFilters["lactose"] as bool;
  }

  Widget _buildSwitchListTile(
      String title, bool value, Function onChangedCallback) {
    return SwitchListTile(
        title: Text(title),
        value: value,
        onChanged: (newValue) => onChangedCallback(newValue));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        actions: [
          IconButton(
            onPressed: () {
              Map<String, bool> filters = {
                "gluten": _isGlutenFree,
                "vegan": _isVegan,
                "vegetarian": _isVegetarian,
                "lactose": _isLactoseFree,
              };
              widget.saveFilters(filters);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            "adjust your meal selection",
            style: TextStyle(color: Colors.brown),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildSwitchListTile("gluten free", _isGlutenFree, (newValue) {
                setState(() {
                  _isGlutenFree = newValue;
                });
              }),
              _buildSwitchListTile("vegetarian", _isVegetarian, (newValue) {
                setState(() {
                  _isVegetarian = newValue;
                });
              }),
              _buildSwitchListTile("vegan", _isVegan, (newValue) {
                setState(() {
                  _isVegan = newValue;
                });
              }),
              _buildSwitchListTile("lactose free", _isLactoseFree, (newValue) {
                setState(() {
                  _isLactoseFree = newValue;
                });
              }),
            ],
          ),
        ),
      ]),
    );
  }
}
