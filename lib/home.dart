import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:jaya_office/testUploadImage.dart';
import 'package:jaya_office/pages/home/main_dashboard.dart';
import 'package:jaya_office/profile.dart';

class Homes extends StatefulWidget {
  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  int index = 0;

  final screen = [
    dashboard(),
    orders(),
    profiles(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[index],
      backgroundColor: Color.fromARGB(255, 18, 20, 22),
      bottomNavigationBar: NavigationBarTheme(
        data:  NavigationBarThemeData(
          indicatorColor: Colors.white,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white)
          )
        ),
        child: NavigationBar(
          backgroundColor: Color.fromARGB(255, 33, 32, 32),
          selectedIndex: index,
          onDestinationSelected: (index) {
            setState(() {
              this.index = index;
            });
          } ,
          destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.shopify), label: "Order"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Profile"),
        ]),
      ));
    
  }
}
