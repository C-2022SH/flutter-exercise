import 'package:flutter/material.dart';
import 'package:testing_app/widgets/chart.dart';
import 'package:testing_app/widgets/transactionList.dart';
import 'package:testing_app/widgets/newTransactionInput.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
      brightness: Brightness.light,
      colorScheme: ThemeData.light().colorScheme.copyWith(
            brightness: Brightness.light,
            primary: Colors.blueGrey,
            onPrimary: Colors.grey,
            secondary: Colors.lime,
            outline: Colors.indigo,
          ),
      fontFamily: "Comfortaa",
      appBarTheme: ThemeData.light().appBarTheme.copyWith(
            titleTextStyle: const TextStyle(
              fontFamily: "SweetsSmile",
              fontSize: 22,
            ),
          ),
      textTheme: ThemeData.light().textTheme.copyWith(
            labelLarge: const TextStyle(
              color: Colors.indigo,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            bodyMedium: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 12,
            ),
            bodyLarge: const TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
    );

    return MaterialApp(
      title: "Personal Expenses",
      themeMode: ThemeMode.light,
      theme: themeData,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction("t1", "test item one", 10.5, DateTime.now()),
    // Transaction("t2", "test item two", 1.9, DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTransaction = Transaction(
      DateTime.now().toString(),
      txTitle,
      txAmount,
      DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransactionInput(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Expenses"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(_recentTransactions),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
