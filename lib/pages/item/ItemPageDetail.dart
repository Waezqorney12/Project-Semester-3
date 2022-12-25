import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaya_office/palet%20ukuran/dimension.dart';
import 'package:jaya_office/widgets/IconApp.dart';
import 'package:jaya_office/widgets/expandebleText.dart';
import 'package:jaya_office/widgets/food_detail_judul.dart';
import 'package:jaya_office/widgets/food_detail_text.dart';

class itemPageDetail extends StatelessWidget {
  const itemPageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    //print("current height is " + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Stack(
        children: [
          //Image
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
          // Icon Widget
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
          //Text
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.bestItemImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.widht20,
                  right: Dimensions.widht20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20),
                ),
                color: Color.fromARGB(255, 18, 20, 22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailJudulText(text: "Cars World Building"),
                  SizedBox(height: Dimensions.height20),
                  DetailDescriptionText(text: "Description"),
                  SizedBox(height: Dimensions.height20,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandebeleText(
                          text:
                              "Pretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp Pretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp Pretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp Pretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp"
                              ,
                              ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //Expandeble
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.BottomBar120,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.height20,
            right: Dimensions.height20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 18, 20, 22),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  bottom: Dimensions.height15,
                  left: Dimensions.widht15,
                  right: Dimensions.widht15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: Colors.black),
                  SizedBox(
                    width: Dimensions.widht20,
                  ),
                  Text(
                    "0",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.widht20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.add, color: Colors.black),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  bottom: Dimensions.height15,
                  left: Dimensions.height10,
                  right: Dimensions.height10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.orange,
              ),
              child: Text(
                "Rp.15000 | add",
                style: GoogleFonts.roboto(
                  fontSize: Dimensions.font14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
