import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jaya_office/login.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => login(),
        ),
      );
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 20, 22),
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Bubble Kanan
            Positioned(
              top: 70,
              right: 0,
              child: Image.asset(
                "assets/images/Ellipse7.png",
              ),
            ),
            Positioned(
              top: 0,
              right: 50,
              child: Image.asset(
                "assets/images/Ellipse8.png",
              ),
            ),
            Positioned(
              top: 75,
              right: 100,
              child: Image.asset(
                "assets/images/Ellipse9.png",
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                "assets/images/Ellipse10.png",
              ),
            ),
            Positioned(
              top: 0,
              bottom: 45,
              child: Image.asset("assets/images/IconRumah.png"),
            ),
            
            // Bubble Kiri
            Positioned(
              top: 650,
              left: 0,
              child: Image.asset("assets/images/Ellipse5.png"),
            ),
            Positioned(
              top: 600,
              left: 40,
              child: Image.asset("assets/images/Ellipse6.png"),
            ),
            Positioned(
              top: 570,
              left: 0,
              child: Image.asset("assets/images/Ellipse12.png"),
            ),
            Positioned(
              top: 640,
              left: 30,
              child: Image.asset("assets/images/Ellipse13.png"),
            ),
            
          ],
        ),
      ),
    );
  }
}

// Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Image.asset("assets/images/IconRumah.png"),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Text(
//                   "JAYA OFFICE",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30.0,
//                   ),
//                 ),
//               ],
//             ),
            