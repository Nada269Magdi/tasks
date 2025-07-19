import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hinttext, required this.keyboardType, this.onsaved});
  final String hinttext ;
  final TextInputType keyboardType;
  final void Function (String?)? onsaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onsaved,
      validator: (value) {
        if(value==null||value.isEmpty){
          return 'field is required';
        }
        return null;
      },
      keyboardType: keyboardType,
      obscureText: false,
      decoration:InputDecoration(
        border: OutlineInputBorder(  
          borderRadius:BorderRadius.circular(20) ,
        ),
        hintText: hinttext
      )
    );
  }
}