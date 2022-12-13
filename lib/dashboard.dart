import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class dashboard extends StatefulWidget {
  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 20, 22),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                    child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      child: Image.asset("assets/images/close.png"),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Dashboard",
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "text",
                      style: TextStyle(
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Hello",
                        style: GoogleFonts.montserrat(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Need something just order it",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Top Seller",
                      style: GoogleFonts.montserrat(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              


              
            ],
          ),
        ),
      ),
    );
  }
}
