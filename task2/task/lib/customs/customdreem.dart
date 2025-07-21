import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task2/customs/customlisttile.dart';
import 'package:task2/main.dart';
import 'package:task2/models/billmodel.dart';

class Customdreem extends StatefulWidget {
  final String title;
  final double price;
  final int dueday;
  final bool ismonthly;
  final int index;

  const Customdreem({
    super.key, 
    required this.title, 
    required this.price, 
    required this.dueday, 
    required this.ismonthly, 
    required this.index
  });
  
  @override
  State<Customdreem> createState() => _CustomdreemState();
}

class _CustomdreemState extends State<Customdreem> {
  double savingPercent = 0.0;
  double previousSavedAmount = 0.0;
  @override
  Widget build(BuildContext context) {
    double savedAmount = (savingPercent / 100) * widget.price;
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color:Colors.blueAccent,
        borderRadius:BorderRadius.circular(16) ,
      ),
      child: Column(
        children: [
          Customlisttile(
            title: widget.title, 
            price: widget. price, 
            dueday: widget.dueday, 
            ismonthly: widget.ismonthly, 
            index: widget.index, 
            boxname: ViewType.dreams
          ),
          SizedBox(height: 16),
          Text(
            "Saved: ${savedAmount.toStringAsFixed(2)} / ${widget.price} L.E",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Slider(
            value: savingPercent,
            min: 0,
            max: 100,
            divisions: 100,
            label: "${savingPercent.toInt()}%",
            onChanged: (value) {
              setState(() {
                savingPercent = value;
                double newSaved = (value / 100) * widget.price;
                double diff = newSaved - previousSavedAmount;
                final settingsBox = Hive.box('settings_box');
                double currentRemaining = settingsBox.get('remaining', defaultValue: 0.0);
                settingsBox.put('remaining', currentRemaining - diff);
                previousSavedAmount = newSaved;
              });
            },
          ),
          if (savingPercent == 100.0)
            ElevatedButton(
              onPressed: () {
                final box1 =Hive.box('paid_bills_box');
                final box2 =Hive.box('dreams_box');
                final bill = box2.getAt(widget.index) as Billmodel; 
                box1.add(
                  Billmodel(
                    title: bill.title,
                    price: bill.price,
                    dueday: bill.dueday,
                    ispaid: true,
                    isimportant: bill.isimportant,
                    ismonthly: bill.ismonthly,
                  )
                );
                print('paid add ${bill.title}');
                box2.deleteAt(widget.index);
                final settingsBox = Hive.box('settings_box');
                double remaining = settingsBox.get('remaining', defaultValue: 0);
                settingsBox.put('remaining', remaining - bill.price);   
              },
              child: Text("you can buy it now"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
        ],
      ),
    );
  }
}