import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_test/provider/provider_products.dart';

class UserProdcutItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageURL;

  UserProdcutItem(
    this.id,
    this.title,
    this.imageURL,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(backgroundImage: NetworkImage(imageURL)),
      trailing: Container(
        width: 100,
        child: Row(children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/editProduct", arguments: id);
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              Provider.of<ProviderProducts>(context, listen: false)
                  .deleteProduct(id);
            },
            icon: Icon(Icons.delete),
          ),
        ]),
      ),
    );
  }
}
