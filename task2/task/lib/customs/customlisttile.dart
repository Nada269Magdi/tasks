import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task2/main.dart';
import 'package:task2/states/editbill.dart';

class Customlisttile extends StatelessWidget {
  const Customlisttile({
    super.key, 
    required this.title, 
    required this.price, 
    required this.dueday, 
    required this.ismonthly, 
    required this.index, 
    required this.boxname
  });
  final String title;
  final double price;
  final int dueday;
  final bool ismonthly;
  final int index;
  final ViewType boxname;
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
                        builder: (_) => Editbill(index: index,boxname: boxname,),
                      );
                    }, 
                    icon: Icon(Icons.edit,color: Colors.black,size: 26,) 
                    ),
                    IconButton(onPressed: (){
                      final box = Hive.box(boxname.displayName);
                      box.deleteAt(index);
                    }, 
                    icon: Icon(Icons.delete,color: Colors.black,size: 26,))
                  ],
                ),
              ],
            ),
          );
  }
}