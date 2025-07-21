import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task2/customs/custombill.dart';
import 'package:task2/customs/customdreem.dart';
import 'package:task2/customs/custompaid.dart';
import 'package:task2/main.dart';
import 'package:task2/models/billmodel.dart';

class Itemlistview extends StatelessWidget {
  
  const Itemlistview({super.key, required this.hivebox});
  final ViewType hivebox;

  @override
  Widget build(BuildContext context) {
    final box = Hive.box(hivebox.displayName);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context , index ){
            final bill = box.getAt(index) as Billmodel;
            switch (hivebox) {
              case ViewType.bills:
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: 
                  CustomBillItem(
                    title: bill.title,
                    price: bill.price,
                    dueday: bill.dueday,
                    ismonthly: bill.ismonthly,
                    index: index,
                  ),
                );
              case ViewType.paids:
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: 
                  Custompaid(
                    title: bill.title,
                    price: bill.price,
                    dueday: bill.dueday,
                    ismonthly: bill.ismonthly,
                    index: index,
                  ),
                );
              default:
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: 
                  Customdreem(
                    title: bill.title,
                    price: bill.price,
                    dueday: bill.dueday,
                    ismonthly: bill.ismonthly,
                    index: index,
                  ),
                );
            } 
          });
        }
      ),
    );
  }
}