import 'package:flutter/material.dart';
import 'package:jaya_office/Order.dart';
import 'package:jaya_office/forgotPass.dart';
import 'package:jaya_office/forgotPass_part2.dart';
import 'package:jaya_office/home.dart';
import 'package:jaya_office/login.dart';
import 'package:jaya_office/profile.dart';
// import 'package:jaya_office/profile.dart';
import 'package:jaya_office/register.dart';
import 'package:jaya_office/screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Project',
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => login(),
        '/register': (BuildContext context) => regis(),
        '/forgot': (BuildContext context) => forgotPass(),
        '/forgot2': (BuildContext context) => forgotPass2(),
        '/home': (BuildContext context) => Homes(),
        '/profile':(BuildContext context) => profiles(),
        '/order':(BuildContext context) => orders(),
      },
    );
  }
}
