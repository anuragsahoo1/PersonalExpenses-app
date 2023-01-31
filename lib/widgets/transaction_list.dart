import 'package:flutter/material.dart';
import 'package:personalexpense/models/tansaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteFnc;
  TransactionList(this.transactions,this.deleteFnc);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 289,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text('No trasaction Yet'),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/image/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(vertical: 9.0, horizontal: 5.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.blueGrey,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Color.fromARGB(255, 3, 133, 133),
                      onPressed: () => deleteFnc(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
