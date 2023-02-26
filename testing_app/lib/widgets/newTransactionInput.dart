import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransactionInput extends StatefulWidget {
  final Function addTransaction;

  NewTransactionInput(this.addTransaction);

  @override
  State<NewTransactionInput> createState() => _NewTransactionInputState();
}

class _NewTransactionInputState extends State<NewTransactionInput> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void _submitTransaction() {
    final title = _titleController.text;
    final amount = double.parse(_amountController.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }

    widget.addTransaction(
      title,
      amount,
    );

    // 가장 위에 있는 내비게이터 팝
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "title"),
              controller: _titleController,
              onSubmitted: (_) =>
                  _submitTransaction(), // _ means i have to pass some arguments but don't use it
            ),
            TextField(
              decoration: const InputDecoration(labelText: "amount"),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitTransaction(),
            ),
            TextButton(
              onPressed: () {
                _submitTransaction();
              },
              child: const Text(
                "add transaction",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
