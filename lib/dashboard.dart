import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaya_office/login.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 18, 20, 22),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Register",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 2),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Column(
                      children: const [
                        Text(
                          "Please fill to continue",
                          style: TextStyle(
                              color: Color.fromARGB(100, 255, 255, 255),
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //Button Register
            Container(
              margin: EdgeInsets.only(left: 30,right: 30),
              width: 300,
              height: 40,
              child: GestureDetector(
                
                child: RawMaterialButton(
                  fillColor: Color.fromARGB(255, 255, 101, 67),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Register",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
