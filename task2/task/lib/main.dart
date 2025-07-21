import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task2/homescreen.dart';
import 'package:task2/models/billmodel.dart';


enum ViewType { 
  bills('bills_box'), 
  dreams('dreams_box'), 
  paids('paid_bills_box');
  final String displayName;
  const ViewType(this.displayName);
}
ValueNotifier<ViewType> selectedViewNotifier = ValueNotifier(ViewType.dreams);
ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
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
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context,ThemeMode currentMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Smart Bills',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,
          home: VeiwScreen(),
        );
      }
    );
  }
}
