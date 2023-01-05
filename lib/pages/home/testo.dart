import 'dart:convert';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaya_office/data/api/api.dart';
import 'package:jaya_office/data/controller/BestItemController.dart';
import 'package:jaya_office/model/ItemProduct.dart';
import 'package:jaya_office/pages/home/ItemPageDetail.dart';
import 'package:jaya_office/pages/item/bestItem.dart';

import 'package:jaya_office/palet ukuran/dimension.dart';
import 'package:http/http.dart' as http;

class test extends StatefulWidget {
  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currentPage = 0.0;
  double scaleFactor = 0.8;
  final double _height = 220;

  List limito = [];
  Future<void> limitimage() async {
    try {
      String uri = "http://192.168.1.6/login/lihatProdukLimit.php";
      var response = await http.get(Uri.parse(uri));
      setState(() {
        limito = json.decode(response.body);
      });
    } catch (e) {}
  }

  
  List recod = [];
  Future<void> imageformdb() async {
    try {
      String uri = "http://192.168.1.6/login/lihatProduk.php";
      var response = await http.get(Uri.parse(uri));
      setState(() {
        recod = json.decode(response.body);
      });
    } catch (e) {}
  }

  @override
  void initState() {
    limitimage();
    imageformdb();
    super.initState();
    // _lihatData();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
    });
  }

  // @override
  // void dispose() {
  //   pageController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Item slider
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: recod.length,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),

        // GetBuilder<BestItemController>(builder: (bestItemProduct){
        //   return Container(
        //   height: Dimensions.pageView,
        //   child: PageView.builder(
        //       controller: pageController,
        //       itemCount: bestItemProduct.bestItemList.length,
        //       itemBuilder: (context, position) {
        //         return _buildPageItem(position);
        //       }),
        // );
        // },),

        // Dots slider point
        DotsIndicator(
          dotsCount: limito.isNotEmpty?limito.length:3,
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
          height: Dimensions.height40,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.widht30),
          child: Row(
            children: [
              Text("List Item",
                  style: GoogleFonts.montserrat(
                    fontSize: Dimensions.font14,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recod.length,
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
                            image: NetworkImage(
                              "http://192.168.1.6/login/upload" +
                                  recod[index]['foto'],
                            ),
                            fit: BoxFit.fill),
                      ),
                      // child: Image.network(
                      //   "http://192.168.1.6/login/upload" +
                      //       recod[index]['foto'],
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return itemPageDetail(
                              idproduk: int.parse(recod[index]['idproduk']),
                              nama_produk: recod[index]['nama_produk'],
                              foto: recod[index]['foto'],
                              harga_modal: int.parse(recod[index]['harga_modal']),
                              harga_jual: int.parse(recod[index]['harga_jual']),
                              stock: int.parse(recod[index]['stock']),
                              userid: int.parse(recod[index]['userid']),
                              
                            );
                          },
                          ),
                          );
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
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
                                Row(children: [
                                  Text(
                                    recod[index]['nama_produk'],
                                    style: GoogleFonts.roboto(
                                        fontSize: Dimensions.font12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ]),

                                // SizedBox(
                                //   height: Dimensions.height10,
                                // ),
                                // Row(children: [
                                //   Text(
                                //     "Jumlah: ",
                                //     style: GoogleFonts.roboto(
                                //         fontSize: Dimensions.font12,
                                //         fontWeight: FontWeight.w400),
                                //   ),
                                //   Text(
                                //     recod[index]['stock'],
                                //     style: GoogleFonts.roboto(
                                //         fontSize: Dimensions.font12,
                                //         fontWeight: FontWeight.w400),
                                //   ),
                                // ]),
                                // Row(children: [
                                //   Text(
                                //     "Harga: ",
                                //     style: GoogleFonts.roboto(
                                //         fontSize: Dimensions.font12,
                                //         fontWeight: FontWeight.w400),
                                //   ),
                                //   Text(
                                //     recod[index]['harga_jual'],
                                //     style: GoogleFonts.roboto(
                                //         fontSize: Dimensions.font12,
                                //         fontWeight: FontWeight.w400),
                                //   ),
                                // ]),
                              ],
                            ),
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
                fit: BoxFit.fill,
                image: NetworkImage(
                  "http://192.168.1.6/login/upload${limito[index]['foto']}" ,
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
