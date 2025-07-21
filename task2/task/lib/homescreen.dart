import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task2/customs/customappbar.dart';
import 'package:task2/lists%20to%20view/billlistview.dart';
import 'package:task2/lists%20to%20view/dreamslistview.dart';
import 'package:task2/lists%20to%20view/paidlistview.dart';
import 'package:task2/main.dart';
import 'package:task2/salarydialog.dart';
import 'package:task2/states/addbill.dart';

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
            child: ValueListenableBuilder(
              valueListenable: selectedViewNotifier,
              builder: (context, viewType,child) {
                switch (viewType) {
                  case ViewType.bills:
                    return BillListview();
                  case ViewType.dreams:
                    return Dreamslistview();
                  case ViewType.paids:
                    return Paidlistview(); 
                }
              },
            ),
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