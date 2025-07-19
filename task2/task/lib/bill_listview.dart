import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task2/Bill.dart';
import 'package:task2/billmodel.dart';

class BillListview extends StatelessWidget {
  const BillListview({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box("bills_box");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context , index ){
            final bill = box.getAt(index) as Billmodel;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: CustomBillItem(
                title: bill.title,
                price: bill.price,
                dueday: bill.dueday,
                ismonthly: bill.ismonthly,
                index: index,
              ),
            );
          });
        }
      ),
    );
  }
}