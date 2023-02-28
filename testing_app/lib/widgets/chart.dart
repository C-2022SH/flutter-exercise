import 'package:flutter/material.dart';
import 'package:testing_app/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:testing_app/widgets/chartBar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;

      // 위에서 7개 만든다고 했으니까 여기서는 끝까지 돌려도 괜찮나보네!
      for (int i = 0; i < recentTransactions.length; ++i) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {"day": DateFormat.E().format(weekDay), "amount": totalSum};
    });
  }

  double get totalSpending {
    return groupedTransactions.fold(0.0, (sum, element) {
      return sum + (element["amount"] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data["day"] as String,
                  data["amount"] as double,
                  totalSpending == 0
                      ? 0.0
                      : (data["amount"] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
