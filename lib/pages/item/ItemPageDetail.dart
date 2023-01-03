import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaya_office/palet%20ukuran/dimension.dart';
import 'package:jaya_office/widgets/IconApp.dart';
import 'package:jaya_office/widgets/expandebleText.dart';
import 'package:jaya_office/widgets/food_detail_judul.dart';
import 'package:jaya_office/widgets/food_detail_text.dart';
import 'package:http/http.dart' as http;

class itemPageDetail extends StatefulWidget {
  final int? idproduk;
  final String? nama_produk;
  final int? harga_modal;
  final String? stock;
  final String? harga_jual;
  final String? foto;
  final String? tgl_input;
  final int? userid;

  itemPageDetail(
      {this.idproduk,
      this.nama_produk,
      this.harga_modal,
      this.stock,
      this.harga_jual,
      this.foto,
      this.tgl_input,
      this.userid});

  @override
  State<itemPageDetail> createState() => _itemPageDetailState();
}

class _itemPageDetailState extends State<itemPageDetail> {
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
  bool instock = false;
  @override
  void initState() {
    imageformdb();
    // TODO: implement initState
    super.initState();
    if (widget.stock == true) {
      instock = widget.stock as bool;
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  bottom: Dimensions.height15,
                  left: Dimensions.height50,
                  right: Dimensions.height50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.orange,
              ),
              child: Text(
                "Check Out",
                style: GoogleFonts.roboto(
                  fontSize: Dimensions.font14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _body(){
    return Stack(
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
                      fit: BoxFit.fill,
                      image: NetworkImage("http://192.168.1.6/login/upload${widget.foto}"))),
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
                GestureDetector(
                  child: IconApp(icon: Icons.arrow_back_ios),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/dashboard');
                  },
                ),
                
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
                  DetailJudulText(text: widget.nama_produk.toString()),
                  SizedBox(height: Dimensions.height20),
                  Row(
                    children: [
                      DetailDescriptionText(text: "Harga: "),
                      DetailDescriptionText(text: widget.harga_jual.toString()),
                    ],
                  ),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    children: [
                      DetailDescriptionText(text: "Stock: "),
                      DetailDescriptionText(text: widget.stock.toString()),
                    ],
                  ),
                  SizedBox(height: Dimensions.height50),
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
      );
  }
}
