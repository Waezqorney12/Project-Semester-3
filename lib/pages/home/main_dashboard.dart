import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:jaya_office/pages/home/testo.dart';
import 'package:jaya_office/palet%20ukuran/dimension.dart';


class dashboard extends StatefulWidget {
  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  Position? _currentPosition;
  String? _currentAddres;
  bool isLoading = false;
  
  Future<Position> _getPosition() async{
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.deniedForever){
        return Future.error("Location not available");
      }
    }else{
      print("Location not available");
    }
    return await Geolocator.getCurrentPosition();
  }

  void _getAdress(latitude,longitude) async {
  try {
    List<Placemark> placeMark = await GeocodingPlatform.instance.placemarkFromCoordinates(latitude, longitude);
  
    Placemark place = placeMark[0];
    
      setState(() {
      _currentAddres = '${place.subAdministrativeArea},${place.subLocality},${place.street}';
    });
    
    
  } catch (e) {
    print(e);
  }
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 20, 22),
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    
                    children: [
                      isLoading? CircularProgressIndicator():
                      Container(
                        child: Text(
                          _currentAddres.toString(),
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          _currentPosition = await _getPosition();
                          _getAdress(_currentPosition!.latitude, _currentPosition!.longitude);
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: Container(
                          child: Text(
                            "Get Location",
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height30,
          ),
          
          SizedBox(
            height: Dimensions.height25,
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
