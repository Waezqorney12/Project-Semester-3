import 'package:flutter/material.dart';

class login extends StatefulWidget{
  @override
  _Login createState()=>_Login();
}

class _Login extends State<login>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 20, 22),
      body: Center(
        child: Container(
          child: Text(
            "data",
          style: TextStyle(color: Colors.white),
          ),
        ),
      )
    );
  }
}