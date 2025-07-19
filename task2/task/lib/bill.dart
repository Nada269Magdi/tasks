import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task2/editbill.dart';

class CustomBillItem extends StatelessWidget {
  const CustomBillItem({super.key, required this.title, required this.price, required this.dueday, required this.ismonthly, required this.index});
  final String title;
  final double price;
  final int dueday;
  final bool ismonthly;
  final int index;
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
          ListTile(
            title: Text(title,style: TextStyle(color: Colors.black, fontSize: 30),),
            subtitle: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$price L.E',style: TextStyle(color: Colors.black, fontSize: 26),),
                  Text('$dueday ${ismonthly?"monthly":"this month"}',style: TextStyle(color: Colors.black, fontSize: 26),)
                ],
              ),
            ),
            trailing: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: (){
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => Editbill(index: index),
                      );
                    }, 
                    icon: Icon(Icons.edit,color: Colors.black,size: 26,) 
                    ),
                    IconButton(onPressed: (){
                      final box = Hive.box("bills_box");
                      box.deleteAt(index);
                    }, 
                    icon: Icon(Icons.delete,color: Colors.black,size: 26,))
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: (){}, child: Text('make as paid',style: TextStyle(color: Colors.black, fontSize: 26),)
            ),
          )
        ],
      ),
    );
  }
}