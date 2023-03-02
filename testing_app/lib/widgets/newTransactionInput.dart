import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactionInput extends StatefulWidget {
  final Function addTransaction;

  NewTransactionInput(this.addTransaction);

  @override
  State<NewTransactionInput> createState() => _NewTransactionInputState();
}

class _NewTransactionInputState extends State<NewTransactionInput> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitTransaction() {
    final title = _titleController.text;
    final amount = double.parse(_amountController.text);
    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTransaction(
      title,
      amount,
      _selectedDate,
    );

    // 가장 위에 있는 내비게이터 팝
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      // future 기능
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
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
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? "No date chosen"
                            : DateFormat.yMd()
                                .format(_selectedDate!)
                                .toString(),
                      ),
                    ),
                    TextButton(
                      onPressed: _presentDatePicker,
                      child: const Text(
                        "choose date",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _submitTransaction();
                },
                child: const Text(
                  "add transaction",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
