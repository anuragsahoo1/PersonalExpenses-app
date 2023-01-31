import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text('\$${spendingAmount.toStringAsFixed(0)}')
          ),
        ),
        SizedBox(height: 4,),
        Container(
          height: 63,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 1.0),
                color: Color.fromRGBO(221, 221, 221, 2),
                borderRadius: BorderRadius.circular(11),
              ),
            ),
            FractionallySizedBox(heightFactor: spendingPctOfTotal,child: Container(decoration: BoxDecoration(
              color: Color.fromARGB(252, 39, 144, 196),
              borderRadius: BorderRadius.circular(11),
            ),),),
          ],),
        ),
        SizedBox(height: 4,),
        Text(label),
      ],
    );
  }
}
