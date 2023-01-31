// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:personalexpense/widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/tansaction.dart';
import './widgets/chart.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme:ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount,DateTime chooseDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chooseDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
  void _deleteTransaction(String id){
    setState(() {
      return _userTransactions.removeWhere((element) => element.id==id);
    });
  }
List<Transaction> get _recentTransactions{
  return _userTransactions.where((element) {
    return element.date.isAfter(
      DateTime.now().subtract(Duration(days: 7),),
    );
  }).toList();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('PersonelExpenses',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 18),),
        backgroundColor: Color.fromRGBO(32, 221, 79, 1),
        elevation: 10,
        centerTitle: true,
        
        actions: [
          IconButton(onPressed:()=> _startAddNewTransaction(context), icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // ignore: sized_box_for_whitespace
            Chart(_recentTransactions),
            TransactionList(_userTransactions,_deleteTransaction),
          ],
        ),
      ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
     floatingActionButton: FloatingActionButton(onPressed: ()=> _startAddNewTransaction(context),child: Icon(Icons.add),backgroundColor: Color.fromARGB(255, 76, 210, 9),),
    );
  }
}
