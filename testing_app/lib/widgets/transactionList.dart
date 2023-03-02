import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:testing_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) _deleteCallback;

  TransactionList(this.transactions, this._deleteCallback);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: transactions.isEmpty
          ? Column(
              children: [
                Container(
                  height: 400,
                  margin: EdgeInsets.only(top: 12),
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 10,
                    child: Image.asset(
                      "assets/images/zelda_is_legend.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "nothing there yet... enjoy Zelda",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "\$${transactions[index].amount}",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteCallback(transactions[index].id),
                    ),
                  ),
                );
              }),
    );
  }
}
