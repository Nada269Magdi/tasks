
import 'package:flutter/material.dart';
// import 'package:flutter_application/mytest.dart';
// import 'package:flutter_application/loginscreen.dart';
import 'package:flutter_application/logo.dart';
// import 'package:flutter_application/second.dart';

void main(){
    runApp(const loginpage());
}

// ignore: camel_case_types
class loginpage extends StatelessWidget 
{
  const loginpage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        
        home:MainPage(),  
    );
  }


}