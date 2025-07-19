import 'package:flutter/material.dart';
import 'package:flutter_application/login.dart';
import 'package:flutter_application/signup.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool islogin=true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: islogin? Text("login"):Text("sign up"),
          centerTitle: true,
          actions: [
            // ToggleButtons(
            //   onPressed: (int x){
            //     setState(() {
            //       islogin=!islogin;
            //     });
            //   },
            //   isSelected:[islogin, !islogin ],
            //   children:[
            //     Text('sign up'),
            //     Text('login'),
            //   ], )
            Text(
              islogin ? "signup" : "login",
              style: TextStyle(fontSize: 24),
            ),
            Switch(
              value: islogin,
              onChanged: (value) {
              setState(() {
              islogin = value;
              });
              }
            )
          ],
        ),
        body: LayoutBuilder(
          builder: (context,Constraints){
          double screenwidth = Constraints.maxWidth;
          if (screenwidth>900) { //pc
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset('asset/bg-top.png')
                ),
                Expanded(
                  flex: 1,
                  child: islogin? Login():Signup()
                ),
              ],
            );
          }
          else{ // tablet or phone
            return SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('asset/bg-top.png'),
                  islogin? Login():Signup()
                ]
              )
            );
          }
        }),
      );
  }
}