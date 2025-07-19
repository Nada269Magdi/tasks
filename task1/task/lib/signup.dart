import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    double screenwidth =MediaQuery.of(context).size.width;
    return Padding(padding: EdgeInsets.all(screenwidth*0.1),
          child: Column(
              children: [
               TextField(
                  keyboardType:TextInputType.emailAddress ,
                  obscureText: false,
                  decoration:InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(20) ,
                    ),
                    hintText: 'email'
                  )
                ),
                
                TextField(
                  keyboardType:TextInputType.visiblePassword ,
                  obscureText: true,
                  decoration:InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(20) ,
                    ),
                    hintText: 'password'
                  )
                ),
                SizedBox( 
                  width: screenwidth*0.5 ,
                  child: ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor:Colors.blueGrey ,
                      shape:RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(20) ,
                      ) ,
                    ),
                    onPressed: (){
                    },
                   child:Text("sign up") ,
                  ),
                ) ,
                
              ]
            )
    );
  }
}