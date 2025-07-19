import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task2/billmodel.dart';
import 'package:task2/homescreen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("bills_box");
  await Hive.openBox('settings_box');
  await Hive.openBox("paid_bills_box");
  await Hive.openBox("dreams_box");
  Hive.registerAdapter(BillmodelAdapter());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: VeiwScreen(),
    );
  }
}
