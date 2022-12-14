import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaya_office/data/helper/dbhelper.dart';
import 'package:jaya_office/model/keranjang.dart';
import 'package:jaya_office/palet%20ukuran/dimension.dart';
import 'package:jaya_office/widgets/IconApp.dart';
import 'package:jaya_office/widgets/expandebleText.dart';
import 'package:jaya_office/widgets/food_detail_judul.dart';
import 'package:jaya_office/widgets/food_detail_text.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:jaya_office/data/api/api.dart';

class itemPageDetail extends StatefulWidget {
  final int? idproduk;
  final String? nama_produk;
  final int? harga_modal;
  final int? stock;
  final int? harga_jual;
  final String? foto;
  final String? tgl_input;
  final int? userid;
  final bool? valstok;

  itemPageDetail(
      {this.idproduk,
      this.nama_produk,
      this.harga_modal,
      this.stock,
      this.harga_jual,
      this.foto,
      this.tgl_input,
      this.userid,
      this.valstok});

  @override
  State<itemPageDetail> createState() => _itemPageDetailState();
}

class _itemPageDetailState extends State<itemPageDetail> {
  int num = 0;
  int? userid;
  List recod = [];

  DbHelper dbHelper = DbHelper();

  Future<void> imageformdb() async {
    try {
      String uri = "${fire.URL_API}/lihatProduk.php";
      var response = await http.get(Uri.parse(uri));
      setState(() {
        recod = json.decode(response.body);
      });
    } catch (e) {}
  }
  saveKeranjang(Keranjang _keranjang) async{
    Database db = await dbHelper.database;
    var batch = db.batch();
    db.execute(
      'insert into keranjang(idproduk,nama_produk,harga,harga_modal,foto,jumlah,userid) VALUES(?,?,?,?,?,?,?)' ,
      [
        _keranjang.idproduk,
        _keranjang.nama_produk,
        _keranjang.harga,
        _keranjang.harga_modal,
        _keranjang.foto,
        _keranjang.qty,
        _keranjang.userid
      ],
    );
    await batch.commit();
    Navigator.of(context).pushReplacementNamed('/homie');
  }
  // bool instock = false;
  @override
  void initState() { 
    imageformdb();
    // TODO: implement initState
    super.initState();

    // if (widget.stock == true) {
    //   instock = widget.stock as bool;
    // }else{
    //   setState(() {
    //     instock = false;
    //   });
    // }
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (num <= widget.stock!.toInt()) {
                    Keranjang _keranjangku = Keranjang(
                      idproduk: widget.idproduk,
                      nama_produk: widget.nama_produk,
                      harga: widget.harga_jual,
                      harga_modal: widget.harga_modal,
                      foto: widget.foto,
                      qty: widget.stock,
                      userid: userid,
                      
                    );
                    saveKeranjang(_keranjangku);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height15,
                        bottom: Dimensions.height15,
                        left: Dimensions.widht100,
                        right: Dimensions.widht100),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        boxShadow: [
                          BoxShadow(
                            color: num > widget.stock!.toInt()
                                ? Colors.grey
                                : Colors.orange,
                          )
                        ]),
                    child: Text(
                      "Check Out",
                      style: GoogleFonts.roboto(
                          fontSize: Dimensions.font14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _body() {
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
                    image: NetworkImage(
                        "${fire.URL_API}/upload${widget.foto}"))),
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
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(context, '/homie');
                  // Navigator.of(context).pushAndRemoveUntil('/order', (Route<dynamic> route) => false);
                },
                  child: IconApp(icon: Icons.shopping_cart_outlined)),
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
                SizedBox(height: Dimensions.height30),
                DetailDescriptionText(text: "Description"),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: ExpandebeleText(
                      text:
                          "Pretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp Pretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp Pretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp Pretty women wonder where my secret lies I'm not cute or built to suit a fashion model's size But when I start to tell thempppppppppppppppppppppppppppppppppppppppppppppppppppppp",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: Dimensions.height10 * 2,
                      left: Dimensions.widht20,
                      right: Dimensions.widht20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            num -= 1;
                            if (num < 0) {
                              num = 0;
                            }
                          });
                        },
                        child: IconApp(
                            iconSize: Dimensions.icon16, icon: Icons.remove),
                      ),
                      DetailJudulText(
                          judulSize: Dimensions.font16, text: num.toString()),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            num += 1;
                          });
                        },
                        child: IconApp(
                            iconSize: Dimensions.icon16, icon: Icons.add),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        //Expandeble
      ],
    );
  }
}
