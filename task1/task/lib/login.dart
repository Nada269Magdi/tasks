import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double screenwidth =MediaQuery.of(context).size.width;
    return Padding(padding: EdgeInsets.all(screenwidth*0.1) 
                    ,child: Column(
                        children: [
                          TextField(
                            keyboardType:TextInputType.text ,
                            obscureText: false,
                            decoration:InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(  
                                borderRadius:BorderRadius.circular(20) ,
                              ),
                              hintText: 'user name'
                            )
                          ),
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
                          Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: TextField(
                                keyboardType:TextInputType.visiblePassword ,
                                obscureText: true,
                                decoration:InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(20) ,
                                  ),
                                  hintText: 'password'
                                )
                                )
                              ),
                              Expanded(
                                flex:1,
                                child: TextField(
                                keyboardType:TextInputType.visiblePassword ,
                                obscureText: true,
                                decoration:InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(20) ,
                                  ),
                                  hintText: 'confirm password'
                                )
                              ),)
                            ]
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
                             child:Text("login") ,
                            ),
                          ) ,
                          
                        ],
                      ),
    );
  }
}