import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jaya_office/pages/home/ItemPageDetail.dart';
import 'package:jaya_office/pages/home/Order.dart';
import 'package:jaya_office/pages/home/testo.dart';


import 'package:jaya_office/forgotPass.dart';

import 'package:jaya_office/home.dart';

import 'package:jaya_office/pages/home/main_dashboard.dart';
import 'package:jaya_office/login.dart';

import 'package:jaya_office/profile/profile.dart';
// import 'package:jaya_office/profile.dart';
import 'package:jaya_office/register.dart';
import 'package:jaya_office/screen/splash_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  // await dep.init;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Project',
      home: isLoggedIn ? const Homes() : login(),
      //SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => login(),
        '/register': (BuildContext context) => regis(),
        '/forgot': (BuildContext context) => forgotPass(),
        '/home': (BuildContext context) => const Homes(),
        '/profile': (BuildContext context) => profiles(),
        '/order': (BuildContext context) => orders(),
        '/detail': (BuildContext context) => itemPageDetail(),
        '/dashboard': (BuildContext context) => dashboard(),
        '/homie': (BuildContext context) => const Homes(nav: '1'),
      },
    );
  }
}


// routes: <String, WidgetBuilder>{
//         '/login': (BuildContext context) => login(),
//         '/register': (BuildContext context) => regis(),
//         '/forgot': (BuildContext context) => forgotPass(),
//         '/home': (BuildContext context) => Homes(),
//         '/profile': (BuildContext context) => profiles(),
//         '/order': (BuildContext context) => orders(),
//         '/detail': (BuildContext context) => itemPageDetail(),
//         '/dashboard': (BuildContext context) => dashboard(),
//         '/homie': (BuildContext context) => Homes(nav: '1'),
//       },