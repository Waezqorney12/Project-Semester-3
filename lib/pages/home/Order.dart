import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:jaya_office/data/helper/dbhelper.dart';
import 'package:jaya_office/model/keranjang.dart';
import 'package:jaya_office/widgets/food_detail_text.dart';
import 'package:sqflite/sqflite.dart';

class orders extends StatefulWidget {
  @override
  State<orders> createState() => _ordersState();
}

class _ordersState extends State<orders> {
  DbHelper dbHelper = DbHelper();
  List<Keranjang> keranjanglist = [];
  int _subTotal = 0;

  @override
  void initState() {
    super.initState();
    getkeranjang();
  }

  Future<List<Keranjang>> getkeranjang() async {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Keranjang>> listFuture = dbHelper.getkeranjang();
      listFuture.then((_keranjanglist) {
        if (mounted) {
          setState(() {
            keranjanglist = _keranjanglist;
          });
        }
      });
    });
    int subtotal = 0;
    for (int i = 0; i < keranjanglist.length; i++) {
      if (keranjanglist[i].harga != "0") {
        subtotal += keranjanglist[i].qty! *
            int.parse(keranjanglist[i].harga.toString());
      }
    }
    setState(() {
      _subTotal = subtotal;
    });
    return keranjanglist;
  }
  // File? _image;
  // final picker = ImagePicker();
  // TextEditingController nameControl = TextEditingController();

  // TextEditingController caption = TextEditingController();

  // File? imagepath;
  // String? imagename;
  // String? imagedata;

  // ImagePicker imagePicker = ImagePicker();

  // Future<void> uploadImage() async {
  //   try {
  //     String uri = "http://192.168.1.10/login/upload.php";
  //     var res = await http
  //         .post(Uri.parse(uri), body: {"data": imagedata, "name": imagename});
  //     var response = json.decode(res.body);
  //     if (response["Success"] == "true") {
  //       print("uploaded");
  //     } else {
  //       print("error");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> getImage() async {
  //   var getimage = await imagePicker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     imagepath = File(getimage!.path);
  //     imagename = getimage.path.split('/').last;
  //     imagedata = base64Encode(imagepath!.readAsBytesSync());
  //     print(imagepath);
  //     print(imagename);
  //     print(imagedata);
  //   });
  // }

  // Future choice()async{
  //   final pickImage = await picker.pickImage(source: ImageSource.gallery);

  //       setState(() {
  //         _image = File(pickImage!.path);
  //       });

  // }

  // Future uploadImage()async{
  //   final uri = Uri.parse("http://192.168.1.10/login/upload.php");
  //   var request = http.MultipartRequest('POST',uri);
  //   request.fields['userid'] = nameControl.text;
  //   var pic = await http.MultipartFile.fromPath("imagez", _image!.path);
  //   request.files.add(pic);
  //   var response = await request.send();

  //   if (response.statusCode == 200) {
  //     print("Image Upload");
  //   }else{
  //     print("Image not found");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 20, 22),
      body: keranjanglist.isEmpty ? _keranjangKosong() : _widgetKeranjang(),
      //   body: Center(
      //       child: Column(
      //     children: <Widget>[
      //       Padding(
      //         padding: EdgeInsets.all(8),
      //         child: TextField(
      //           controller: caption,
      //           decoration: InputDecoration(labelText: "Name"),
      //           cursorColor: Colors.white,
      //         ),
      //       ),
      //       IconButton(
      //         icon: Icon(
      //           Icons.camera,
      //           color: Colors.white,
      //         ),
      //         onPressed: () {
      //           getImage();
      //         },
      //       ),
      //       Container(
      //         child: Text("Select Image"),
      //       ),
      //       SizedBox(
      //         height: 10,
      //       ),
      //       imagepath != null
      //           ? Image.file(imagepath!)
      //           : Text(
      //               "Image Not Choose Yet",
      //               style: TextStyle(color: Colors.white),
      //             ),
      //       SizedBox(
      //         height: 10,
      //       ),
      //       ElevatedButton(
      //         child: Text("Upload Image"),
      //         onPressed: () {
      //           uploadImage();
      //         },
      //       )
      //     ],
      //   )),
    );
  }

  Widget _keranjangKosong() {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 1)),
      builder: (c, s) => s.connectionState == ConnectionState.done
          ? keranjanglist.isEmpty
              ? SafeArea(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Container(
                                padding:
                                    EdgeInsets.only(left: 25.0, right: 25.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Keranjang Kosong',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
  Widget _widgetKeranjang() {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder<List<Keranjang>>(
                future: getkeranjang(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());


                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return Container(
                        height: 110.0,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300],
                              width: 1.0,
                            ),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.white, spreadRadius: 1),
                          ],
                        ),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                          title: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Image.network(
                                  Palette.sUrl +"/"+ snapshot.data[i].thumbnail,
                                  height: 110.0,
                                  width: 110.0,
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(snapshot.data[i].judul,
                                            style: TextStyle(fontSize: 16.0)),
                                        Text(snapshot.data[i].harga,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 14.0)),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              height: 30,
                                              width: 100,
                                              margin:
                                                  EdgeInsets.only(top: 10.0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  InkWell(
                                                    onTap: () {
                                                      if (snapshot
                                                              .data[i].jumlah >
                                                          1) {
                                                        _kurangJmlKeranjang(
                                                            snapshot
                                                                .data[i].id);
                                                      }
                                                    },
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: Colors.green,
                                                      size: 22,
                                                    ),
                                                  ),
                                                  Text(
                                                    snapshot.data[i].jumlah
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.0),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      _tambahJmlKeranjang(
                                                          snapshot.data[i].id);
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.green,
                                                      size: 22,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 10.0),
                                                padding: EdgeInsets.only(
                                                    right: 10.0,
                                                    top: 7.0,
                                                    bottom: 5.0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: InkWell(
                                                    onTap: () {
                                                      _deleteKeranjang(
                                                          snapshot.data[i].id);
                                                    },
                                                    child: Container(
                                                      height: 25,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                        border: Border.all(
                                                            color: Colors.red),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors.red,
                                                              spreadRadius: 1),
                                                        ],
                                                      ),
                                                      child: Icon(
                                                        Icons.delete,
                                                        color: Colors.white,
                                                        size: 22,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
