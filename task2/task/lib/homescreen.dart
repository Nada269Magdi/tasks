import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task2/addbill.dart';
// import 'package:task2/Bill.dart';
import 'package:task2/bill_listview.dart';
import 'package:task2/customappbar.dart';
import 'package:task2/salarydialog.dart';

class VeiwScreen extends StatefulWidget {
  const VeiwScreen({super.key});

  @override
  State<VeiwScreen> createState() => _VeiwScreenState();
}

class _VeiwScreenState extends State<VeiwScreen> {
  @override
  void initState() {
  super.initState();
  final settingsBox = Hive.box('settings_box');
  if (!settingsBox.containsKey('salary')) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Salarydialog(),
      );
    });
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Customappbar(),
          Expanded(
            child: BillListview()
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context, builder: (context){
          return AddBill();
        });
      },
      child: Icon(Icons.add),),
    );
  }
}