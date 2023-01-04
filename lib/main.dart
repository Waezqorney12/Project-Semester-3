import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jaya_office/pages/home/testo.dart';

import 'package:jaya_office/accountEdit.dart';
import 'package:jaya_office/data/controller/BestItemController.dart';
import 'package:jaya_office/forgotPass.dart';

import 'package:jaya_office/home.dart';

import 'package:jaya_office/pages/home/main_dashboard.dart';
import 'package:jaya_office/login.dart';

import 'package:jaya_office/pages/item/ItemPageDetail.dart';
import 'package:jaya_office/pages/item/bestItem.dart';
import 'package:jaya_office/profile.dart';
// import 'package:jaya_office/profile.dart';
import 'package:jaya_office/register.dart';
import 'package:jaya_office/screen/splash_screen.dart';
import 'Order.dart';
import 'data/helper/dependecies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Project',
      home: login(),
      //SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => login(),
        '/register': (BuildContext context) => regis(),
        '/forgot': (BuildContext context) => forgotPass(),
        '/home': (BuildContext context) => Homes(),
        '/profile': (BuildContext context) => profiles(),
        '/order': (BuildContext context) => orders(),
        '/detail' : (BuildContext context) => itemPageDetail(),
        '/dashboard' : (BuildContext context) => dashboard(), 
      },
    );
  }
}
