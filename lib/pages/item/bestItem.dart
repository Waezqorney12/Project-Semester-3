import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaya_office/palet%20ukuran/dimension.dart';
import 'package:jaya_office/widgets/IconApp.dart';
import 'package:jaya_office/widgets/expandebleText.dart';
import 'package:jaya_office/widgets/fontText12.dart';

import 'package:jaya_office/widgets/food_detail_judul.dart';

class bestItem extends StatelessWidget {
  const bestItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 20, 22),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconApp(icon: Icons.arrow_back_ios),
                IconApp(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 18, 20, 22),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20))),
                child:
                    Center(child: DetailJudulText(text: "Cars World Builder")),
                width: double.maxFinite,
                padding: EdgeInsets.only(
                    top: Dimensions.height10, bottom: Dimensions.height10),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.white,
            expandedHeight: Dimensions.bestItemImgSize300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/pulpen1.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                left: Dimensions.widht20,
                right: Dimensions.widht20,
                top: Dimensions.height20,
                bottom: Dimensions.height20,
              ),
              child: ExpandebeleText(
                  text:
                      "Pretty exwomen wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp Pretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp Pretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp Pretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell themppppppppppppppppppppppppppppppppppppppppppppppppppppppPretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp Pretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp Pretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp Pretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell themppppppppppppppppppppppppppppppppppppppppppppppppppppppPretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp Pretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp Pretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp Pretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: Dimensions.height10*2,
              left: Dimensions.widht20,
              right: Dimensions.widht20
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconApp(iconSize: Dimensions.icon20, icon: Icons.remove),
                DetailJudulText(judulSize: Dimensions.font16,text: "Check Out"),
                IconApp(iconSize: Dimensions.icon20, icon: Icons.add),
              ],
            ),
          ),
          Container(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Container(
              
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  bottom: Dimensions.height15,
                  left: Dimensions.widht100,
                  right: Dimensions.widht100),
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
        ],
      ),
    );
  }
}
