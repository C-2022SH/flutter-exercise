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
            leading: const Icon(Icons.shop_rounded),
            title: const Text("shop"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment_rounded),
            title: const Text("pay"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/orders");
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit_rounded),
            title: const Text("manage products"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/userProducts");
            },
          ),
        ],
      ),
    );
  }
}
