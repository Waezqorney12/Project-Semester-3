import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class orders extends StatefulWidget {
  @override
  State<orders> createState() => _ordersState();
}

class _ordersState extends State<orders> {
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
}
