import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Salarydialog extends StatelessWidget {
  const Salarydialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return AlertDialog(
      title: Text("Enter Monthly Salary"),
      content: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
      ),
      actions: [
        TextButton(
          onPressed: (){
            double salary = double.tryParse(controller.text) ?? 0;
            final settingsBox = Hive.box('settings_box');
            settingsBox.put('salary', salary);
            settingsBox.put('remaining', salary);
            Navigator.pop(context);
          }, 
          child: Text("save")
        )
      ],
    );
  }
}