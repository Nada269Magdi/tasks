import 'package:flutter/material.dart';
import 'package:task2/customs/customlistview.dart';
import 'package:task2/main.dart';

class Dreamslistview extends StatelessWidget {
  const Dreamslistview({super.key});
  @override
  Widget build(BuildContext context) {
    return Itemlistview(hivebox: ViewType.dreams) ;
  }
}