import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:jaya_office/pages/home/testo.dart';


class dashboard extends StatefulWidget {
  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {


  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 20, 22),
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Jember",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Lokasi",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    child: Icon(
                      Icons.search,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: 
            SingleChildScrollView(
              child: test(),
            ),
          )
        ],
      ),

      //  SingleChildScrollView(
      //   child: Container(
      //     child: Column(
      //       children: <Widget>[
      //         SizedBox(
      //           height: 40,
      //         ),
      //         Container(
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(10),
      //           ),
      //           child: GestureDetector(
      //               child: Row(
      //             children: <Widget>[
      //               SizedBox(
      //                 width: 20,
      //               ),
      //               GestureDetector(
      //                 child: Image.asset("assets/images/close.png"),
      //                 onTap: () {
      //                   Navigator.pushReplacementNamed(context, '/login');
      //                 },
      //               ),
      //               SizedBox(
      //                 width: 20,
      //               ),
      //               Text("Dashboard",
      //                   style: GoogleFonts.montserrat(
      //                       fontSize: 20,
      //                       color: Colors.white,
      //                       fontWeight: FontWeight.bold)),
      //               Text(
      //                 "text",
      //                 style: TextStyle(
      //                   fontSize: 11.0,
      //                 ),
      //               ),
      //             ],
      //           )),
      //         ),
      //         SizedBox(
      //           height: 30,
      //         ),
      //         Container(
      //             margin: EdgeInsets.only(left: 25),
      //             child: Row(
      //               children: <Widget>[
      //                 Text(
      //                   "Hello",
      //                   style: GoogleFonts.montserrat(
      //                       fontSize: 20.0,
      //                       color: Colors.white,
      //                       fontWeight: FontWeight.bold),
      //                 ),
      //               ],
      //             )),
      //         Container(
      //           margin: EdgeInsets.only(left: 25),
      //           child: Row(
      //             children: <Widget>[
      //               Text(
      //                 "Need something just order it",
      //                 style: TextStyle(
      //                   fontSize: 12.0,
      //                   color: Colors.grey,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         const Divider(),
      //         SizedBox(
      //           height: 40,
      //         ),
      //         Container(
      //           margin: EdgeInsets.only(left: 25),
      //           child: Row(
      //             children: <Widget>[
      //               Text(
      //                 "Top Seller",
      //                 style: GoogleFonts.montserrat(
      //                   fontSize: 12.0,
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),

      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
