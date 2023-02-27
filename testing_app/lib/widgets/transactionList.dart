import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:testing_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: [
                Container(
                  height: 400,
                  margin: EdgeInsets.only(top: 12),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/zelda_is_legend.jpg",
                    fit: BoxFit.cover,
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
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).colorScheme.outline,
                          width: 1.5,
                        )),
                        child: Text(
                          "\$${transactions[index].amount.toStringAsFixed(2)}",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY)
                                .format(transactions[index].date),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
    );
  }
}
