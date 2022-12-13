import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class background extends StatelessWidget {
  final Widget child;
  const background({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          
          Positioned(
            child: Image.asset(
              "assets/images/profile.png",
            ),
          ),
          
          Container(
            margin: EdgeInsets.only(left: 20,top: 20),
            child: Text(
              "PROFILE",
              style: GoogleFonts.montserrat(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.w800
              ),
            ),
          ),
          
          child,
        ],
      ),
    );
  }
}
