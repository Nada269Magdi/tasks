import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task2/billmodel.dart';
import 'package:task2/customtextfield.dart';

class Editbill extends StatefulWidget {
  final int index;
  const Editbill({super.key, required this.index});

  @override
  State<Editbill> createState() => _EditbillState();
}

class _EditbillState extends State<Editbill> {
  String? title;
  double? price;
  int? dueday;
  bool? ismonthly;
  bool? isimportant;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    final box = Hive.box("bills_box");
    final bill = box.getAt(widget.index) as Billmodel;
    title = bill.title;
    price = bill.price;
    dueday = bill.dueday;
    ismonthly = bill.ismonthly;
    isimportant = bill.isimportant;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                hinttext: 'title',
                keyboardType: TextInputType.text,
                onsaved: (value) => title = value!,
              ),
              CustomTextField(
                hinttext: 'price',
                keyboardType: TextInputType.number,
                onsaved: (value) => price = double.parse(value!),
              ),
              CustomTextField(
                hinttext: 'due day',
                keyboardType: TextInputType.number,
                onsaved: (value) => dueday = int.parse(value!),
              ),
              DropdownButton<bool>(
                value: isimportant,
                items: const [
                  DropdownMenuItem(value: true, child: Text("Life requirements")),
                  DropdownMenuItem(value: false, child: Text("Dream")),
                ],
                onChanged: (val) => setState(() => isimportant = val!),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("monthly"),
                      value: true,
                      groupValue: ismonthly,
                      onChanged: (val) => setState(() => ismonthly = val!),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text("just this month"),
                      value: false,
                      groupValue: ismonthly,
                      onChanged: (val) => setState(() => ismonthly = val!),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    final updated = Billmodel(
                      title: title!,
                      price: price!,
                      dueday: dueday!,
                      ispaid: false,
                      isimportant: isimportant!,
                      ismonthly: ismonthly!,
                    );
                    Hive.box("bills_box").putAt(widget.index, updated);
                    Navigator.pop(context);
                  }
                },
                child: const Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}