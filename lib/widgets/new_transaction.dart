import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addListNew;

  NewTransaction(this._addListNew);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amountInput = TextEditingController();

  final titleinput = TextEditingController();
  DateTime _setDate;
  void onSubmit() {
    if (amountInput.text.isEmpty) {
      return;
    }
    final titleToInput = titleinput.text;
    final amountToInput = double.parse(amountInput.text);
    if (titleToInput.isEmpty || amountToInput <= 0 || _setDate==null) {
      return;
    }
    widget._addListNew(titleToInput, amountToInput,_setDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _setDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleinput,
              onSubmitted: (value) => onSubmit(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountInput,
              onSubmitted: (value) => onSubmit(),
              keyboardType: TextInputType.number,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    _setDate == null
                        ? 'no date selected'
                        : DateFormat.yMEd().format(_setDate),
                  )),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text('Choose Date'),
                  )
                ],
              ),
            ),
            ElevatedButton(
              child: const Text('Add Transaction'),
              
              onPressed: onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
