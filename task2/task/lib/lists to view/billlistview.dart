import 'package:flutter/material.dart';
import 'package:task2/customs/customlistview.dart';
import 'package:task2/main.dart';

class BillListview extends StatelessWidget {
  const BillListview({super.key});
  @override
  Widget build(BuildContext context) {
    return Itemlistview(hivebox: ViewType.bills) ;
  }
}