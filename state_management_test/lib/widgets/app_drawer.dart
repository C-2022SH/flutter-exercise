import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text("hello!!"),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.shop_rounded),
            title: Text("shop"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          ListTile(
            leading: Icon(Icons.payment_rounded),
            title: Text("pay"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/orders");
            },
          ),
        ],
      ),
    );
  }
}
