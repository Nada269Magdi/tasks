import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task2/customs/customlisttile.dart';
import 'package:task2/main.dart';
import 'package:task2/models/billmodel.dart';

class CustomBillItem extends StatelessWidget {
  const CustomBillItem({
    super.key, 
    required this.title, 
    required this.price, 
    required this.dueday, 
    required this.ismonthly, 
    required this.index
  });
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
          Customlisttile(
            title: title, 
            price: price, 
            dueday: dueday, 
            ismonthly: ismonthly, 
            index: index, 
            boxname: ViewType.bills
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: (){
                final box1 =Hive.box('paid_bills_box');
                final box2 =Hive.box('bills_box');
                final bill = box2.getAt(index) as Billmodel; 
                box1.add(
                  Billmodel(
                    title: bill.title,
                    price: bill.price,
                    dueday: bill.dueday,
                    ispaid: true,
                    isimportant: bill.isimportant,
                    ismonthly: bill.ismonthly,
                  )
                );
                print('paid add ${bill.title}');
                box2.deleteAt(index);
                final settingsBox = Hive.box('settings_box');
                double remaining = settingsBox.get('remaining', defaultValue: 0);
                settingsBox.put('remaining', remaining - bill.price);                
              }, 
              child: Text('make as paid',
                style: TextStyle(color: Colors.black, fontSize: 26),
              )
            ),
          )
        ],
      ),
    );
  }
}