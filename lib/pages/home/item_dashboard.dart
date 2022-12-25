import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaya_office/palet%20ukuran/dimension.dart';

class ItemPageBody extends StatefulWidget {
  const ItemPageBody({super.key});

  @override
  State<ItemPageBody> createState() => _ItemPageBodyState();
}

class _ItemPageBodyState extends State<ItemPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currentPage = 0.0;
  double scaleFactor = 0.8;
  final double _height = 220;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print("current height is " + MediaQuery.of(context).size.height.toString());
    return Column(
      children: [
        // Item slider
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        // Dots slider point
        new DotsIndicator(
          dotsCount: 5,
          position: currentPage,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius5)),
            activeColor: Colors.orange,
            color: Colors.white,
          ),
        ),

        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.widht30),
          child: Row(
            children: [
              Text("Popular Items",
                  style: GoogleFonts.montserrat(
                    fontSize: Dimensions.font14,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height30,
        ),
        ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.widht25,
                    right: Dimensions.widht25,
                    bottom: Dimensions.widht10,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: Dimensions.ListImage,
                        width: Dimensions.ListImage,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          image: DecorationImage(
                              image: AssetImage("assets/images/pulpen1.jpg"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight:
                                    Radius.circular(Dimensions.radius20),
                                    ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.widht10,
                                right: Dimensions.widht10,
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
                      ),
                    ],
                  ),
                );
              }),
        
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == currentPage.floor()) {
      var currentScale = 1 - (currentPage - index) * (1 - scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == currentPage.floor() + 1) {
      var currentScale =
          scaleFactor + (currentPage - index + 1) * (1 - scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == currentPage.floor() - 1) {
      var currentScale = 1 - (currentPage - index) * (1 - scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                right: Dimensions.widht5, left: Dimensions.widht5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              // color: index.isEven ? Colors.white : Colors.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/pulpen1.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
