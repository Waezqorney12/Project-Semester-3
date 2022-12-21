import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http ;

class orders extends StatefulWidget {
  

  @override
  State<orders> createState() => _ordersState();
}

class _ordersState extends State<orders> {
  File? _image;
  final picker = ImagePicker();
  TextEditingController nameControl = TextEditingController();

  Future choice()async{
    final pickImage = await picker.pickImage(source: ImageSource.gallery);
    
      
        setState(() {
          _image = File(pickImage!.path);
        });
      
      
    
  }

  Future uploadImage()async{
    final uri = Uri.parse("http://192.168.1.10/login/upload.php");
    var request = http.MultipartRequest('POST',uri);
    request.fields['userid'] = nameControl.text;
    var pic = await http.MultipartFile.fromPath("imagez", _image!.path);
    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      print("Image Upload");
    }else{
      print("Image not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 20, 22),
      body: Center(
        child: Column(
          children: <Widget> [
            Padding(padding: EdgeInsets.all(8),
            child: TextField(
              controller: nameControl,
              decoration: InputDecoration(labelText: "Name"),
              cursorColor: Colors.white,
            ),
            ),
            IconButton(
              icon: Icon(Icons.camera,color: Colors.white,),
              onPressed: (){
                choice();
              },
              ),
              Container(
                child: _image == null ? Text("No Image") : Image.file(_image!),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: Text("Upload Image"),
                onPressed: (){
                  uploadImage();
                },
                )
          ],
        )
      ),
    );
  }
}