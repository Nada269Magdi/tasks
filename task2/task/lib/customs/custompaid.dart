import 'package:flutter/material.dart';
import 'package:task2/customs/customlisttile.dart';
import 'package:task2/main.dart';

class Custompaid extends StatelessWidget {
  final String title;
  final double price;
  final int dueday;
  final bool ismonthly;
  final int index;

  const Custompaid({
    super.key, 
    required this.title, 
    required this.price, 
    required this.dueday, 
    required this.ismonthly, 
    required this.index
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color:Colors.blueAccent,
        borderRadius:BorderRadius.circular(16) ,
      ),
      child: Column(
        children: [
          Customlisttile(
            title: title, 
            price: price, 
            dueday: dueday, 
            ismonthly: ismonthly, 
            index: index, 
            boxname: ViewType.paids
          ),
        ],
      ),
    );
  }
}