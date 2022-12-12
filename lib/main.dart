import 'package:flutter/material.dart';
import 'package:jaya_office/forgotPass.dart';
import 'package:jaya_office/login.dart';
import 'package:jaya_office/register.dart';
import 'package:jaya_office/screen/splash_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Project',
      home: SplashScreen(), 
      routes: <String,WidgetBuilder>{
        '/login':(BuildContext context) => login(),
        '/register':(BuildContext context) => Dashboard(),
        '/forgot':(BuildContext context) => forgotPass(),
      },
      
    );
  }
}