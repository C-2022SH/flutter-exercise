import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:testing_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
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
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                    )),
                    child: Text(
                      "\$${transactions[index].amount.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactions[index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
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
