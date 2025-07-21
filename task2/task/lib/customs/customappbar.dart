import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task2/main.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('settings_box');
    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (context, value, child) {
        double monthlyIncome = box.get('salary',defaultValue: 1);
        double remaining = box.get('remaining',defaultValue: 0);
        double used = monthlyIncome - remaining;
        double percentUsed = (monthlyIncome == 0) ? 0 : used / monthlyIncome;
        return Container(
          decoration: BoxDecoration(
            color: Colors.blue[700],
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child:IconButton(onPressed:(){
                  themeNotifier.value =
                  themeNotifier.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
                } , 
                icon: Icon(
                  themeNotifier.value == ThemeMode.dark? 
                  Icons.sunny: Icons.nightlight_round,
                  )
                ) ,
              ),
              SizedBox(height: 10),
              Text(
                'Smart Bills & Budget',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Monthly Income', style: TextStyle(color: Colors.black)),
                      Text('$monthlyIncome',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Remaining', style: TextStyle(color: Colors.black)),
                      Text('$remaining',
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  minHeight: 12,
                  value: percentUsed,
                  backgroundColor: Colors.blue[100],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    percentUsed < 0.5 ? Colors.green : Colors.orange,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                  child: TextButton(
                    onPressed: (){
                      selectedViewNotifier.value=ViewType.bills;
                    },
                    child: Text('bills',style:TextStyle(color: Colors.black)),
                    )
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: (){
                        selectedViewNotifier.value=ViewType.dreams;
                      }, 
                      child: Text('dreams',style:TextStyle(color: Colors.black))
                    )
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: (){
                        selectedViewNotifier.value=ViewType.paids;
                      }, 
                      child: Text('paids',style:TextStyle(color: Colors.black))
                    )
                  )
                ],
              )
            ],
          ),
        );
      }
    );
  }
}