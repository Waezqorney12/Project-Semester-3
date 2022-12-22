import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaya_office/palet/dimension.dart';
import 'package:jaya_office/widgets/app_icon.dart';

class BestItemDetail extends StatelessWidget {
  const BestItemDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.bestItemImgSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/pulpen1.jpg"))),
            ),
          ),
          Positioned(
            top: Dimensions.height40,
            right: Dimensions.widht20,
            left: Dimensions.widht20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconApp(icon: Icons.arrow_back_ios),
                IconApp(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.bestItemImgSize,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.widht20,
                  right: Dimensions.widht20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Cars World Building",
                    style: GoogleFonts.roboto(
                        fontSize: Dimensions.font12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
