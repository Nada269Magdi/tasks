import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task2/billmodel.dart';
import 'package:task2/customtextfield.dart';

class AddBill extends StatefulWidget {
  const AddBill({super.key});

  @override
  State<AddBill> createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> {
  bool isimportant = true;
  bool ismonthly=true;
  final GlobalKey<FormState> formkey=GlobalKey();
  AutovalidateMode autovalidateMode =AutovalidateMode.disabled;
  String? title;
  double? price;
  int? dueday;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextField(
                hinttext: 'title',
                keyboardType: TextInputType.text,
                onsaved: (value){
                  title=value;
                },  
              ),
              CustomTextField(
                hinttext: 'price', 
                keyboardType: TextInputType.number,
                onsaved: (value){
                  price = double.tryParse(value!);
                },
              ),
              CustomTextField(
                hinttext: 'due day', 
                keyboardType: TextInputType.number,
                onsaved: (value){
                  dueday = int.tryParse(value!);
                },
              ),
              DropdownButton(
                value: isimportant,
                items: [
                  DropdownMenuItem(
                    value: true,
                    child: Text('Life requirements')
                  ),
                  DropdownMenuItem(
                    value: false,
                    child: Text('Dream')
                  )
                ],
                onChanged: (value){
                  setState(() {
                    isimportant=value!;
                  });
                }
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title:Text('monthly') ,
                      value: true, 
                      groupValue: ismonthly, 
                      onChanged: (val) {
                        setState(() {
                          ismonthly = val!;
                        });
                      }
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text('just this month'),
                      value: false, 
                      groupValue: ismonthly, 
                      onChanged: (val) {
                        setState(() {
                          ismonthly = val!;
                        });
                      }
                    ),
                  )
                ],
              ),
              SizedBox(
                child: ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    backgroundColor:Colors.blueGrey ,
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(20) ,
                    ) ,
                  ),
                  onPressed: ()async{
                    if(formkey.currentState!.validate()){
                      formkey.currentState!.save();
                      final bill = Billmodel(
                        title: title!,
                        price: price!,
                        dueday: dueday!,
                        ispaid: false,
                        isimportant: isimportant,
                        ismonthly: ismonthly,
                      );
                      final String keybox;
                      if (isimportant) {
                        keybox='bills_box';
                      }else{
                        keybox='dreams_box';
                      }
                      final box = Hive.box(keybox);
                      await box.add(bill);
                      Navigator.pop(context);
                      setState(() {}); 
                    }
                    else{
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  child:Text("add") ,
                ),
              ) ,
            ],
          ),
        ),
      ),
    );
  }
}