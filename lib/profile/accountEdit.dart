import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile.dart';

import 'package:http/http.dart' as http;
import 'package:jaya_office/data/api/api.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String username = "";
  String userid = "";
  String email = "";
  String telepon = "";
  String alamat = "";
  String password = "";

  int _selectedIndex = 0;

  Future getkode() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      username = (prefs.getString('username') ?? "");
      userid = (prefs.getString('userid') ?? "");
      email = (prefs.getString('email') ?? "");
      telepon = (prefs.getString('telepon') ?? "");
      alamat = (prefs.getString('alamat') ?? "");
      password = (prefs.getString('password') ?? "");
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getkode();
  }
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure=false;

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController(text: username);
    final _emailController = TextEditingController(text: email);
    final _teleponController = TextEditingController(text: telepon);
    final _alamat1Controller = TextEditingController(text: alamat);
    final _passController = TextEditingController(text: password);
    final _idController = TextEditingController(text: userid);
    FocusNode _nameFocusNode = FocusNode();
    FocusNode _emailFocusNode = FocusNode();
    FocusNode _teleponFocusNode = FocusNode();
    FocusNode _alamat1FocusNode = FocusNode();
    FocusNode _passFocusNode = FocusNode();
    FocusNode _idFocusNode = FocusNode();
    
    Future<void> editProfile() async {
      var url = Uri.parse("${fire.URL_API}/profil.php");
      var response = await http.post(url, body: {
        "id_user": _idController.text.toString(),
        "username": _emailController.text.toString(),
        "nama_lengkap": _nameController.text.toString(),
        "password": _passController.text.toString(),
        "telepon": _teleponController.text.toString(),
        "alamat1": _alamat1Controller.text.toString(),

      });
      var dataAwal = jsonEncode(response.body);
      var dataJadi = jsonDecode(dataAwal);
      // print(dataJadi);
      if (dataJadi == "gagal") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Edit Gagal")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Edit Berhasil")),
        );

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('nama_lengkap', _nameController.text.toString());
        await prefs.setString('password', _passController.text.toString());
        await prefs.setString('telepon', _teleponController.text.toString());
        await prefs.setString('alamat1', _alamat1Controller.text.toString());

        
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => profiles()));
      }
    }

    TextFormField _passWidget() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Data tidak boleh kosong";
          } else {
            return null;
          }
        },
        controller: _passController,
        focusNode: _passFocusNode,
        style: TextStyle(height: 1.5),
        decoration: InputDecoration(
            hintText: password,
            labelText: "Password",
            labelStyle: TextStyle(fontSize: 24, fontFamily: 'Exo2'),
            prefixIcon: Icon(
              Icons.lock_outline,
            ),
            suffixIcon: IconButton(
                icon:
                    Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.black))),
        obscureText: _isObscure ? false : true,
        onFieldSubmitted: (String value) {
          FocusScope.of(context).requestFocus(_teleponFocusNode);
        }
        );
  }

  TextFormField _emailWidget() {
    return TextFormField(
      readOnly: true,
        controller: _emailController,
        focusNode: _emailFocusNode,
        style: TextStyle(height: 1.5),
        decoration: InputDecoration(
            hintText: email,
            labelStyle: TextStyle(fontSize: 24, fontFamily: 'Exo2'),
            labelText: 'Email',
            prefixIcon: Icon(Icons.email, color: Colors.black),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.black))),
        obscureText: false,
        onFieldSubmitted: (String value) {
          FocusScope.of(context).requestFocus(_passFocusNode);
        });
  }

  TextFormField _nameWidget() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Data tidak boleh kosong";
          } else {
            return null;
          }
        },
        controller: _nameController,
        focusNode: _nameFocusNode,
        style: TextStyle(height: 1.5),
        decoration: InputDecoration(
            labelStyle: TextStyle(fontSize: 24, fontFamily: 'Exo2'),
            labelText: 'Nama',
            hintText: username,
            prefixIcon: Icon(Icons.person, color: Colors.black),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.black))),
        obscureText: false,
        onFieldSubmitted: (String value) {
          FocusScope.of(context).requestFocus(_alamat1FocusNode);
        });
  }

  TextFormField _teleponWidget() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Data tidak boleh kosong";
          } else {
            return null;
          }
        },
        controller: _teleponController,
        focusNode: _teleponFocusNode,
        style: TextStyle(height: 1.5),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            labelStyle: TextStyle(fontSize: 24, fontFamily: 'Exo2'),
            labelText: 'Telepon',
            hintText: telepon,
            prefixIcon: Icon(Icons.phone, color: Colors.black),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.black))),
        obscureText: false,
        onFieldSubmitted: (String value) {
          FocusScope.of(context).requestFocus(_nameFocusNode);
        });
  }

  TextFormField _idWidget() {
    return TextFormField(
      readOnly: true,
      controller: _idController,
      focusNode: _idFocusNode,
      style: TextStyle(height: 1.5),
      decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 24, fontFamily: 'Exo2'),
          labelText: 'ID User',
          prefixIcon: Icon(Icons.person_add_disabled, color: Colors.black),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.black))),
      obscureText: false,
      onFieldSubmitted: (String value) {
        FocusScope.of(context).requestFocus(_emailFocusNode);
      });
  }

  TextFormField _alamat1Widget() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Data tidak boleh kosong";
          } else {
            return null;
          }
        },
        controller: _alamat1Controller,
        focusNode: _alamat1FocusNode,
        style: TextStyle(height: 1.5),
        decoration: InputDecoration(
            labelStyle: TextStyle(fontSize: 24, fontFamily: 'Exo2'),
            labelText: 'Alamat',
            hintText: alamat,
            prefixIcon: Icon(Icons.my_location, color: Colors.black),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.black))),
        obscureText: false,
        );
  }

  // TextFormField _alamat2Widget() {
  //   return TextFormField(
  //     validator: (value) {
  //       if (value == null || value.isEmpty) {
  //         return "Data tidak boleh kosong";
  //         } else {
  //           return null;
  //         }
  //       },
  //       controller: _alamat2Controller,
  //       focusNode: _alamat2FocusNode,
  //       style: TextStyle(height: 1.5),
  //       decoration: InputDecoration(
  //           labelStyle: TextStyle(fontSize: 24, fontFamily: 'Exo2'),
  //           labelText: 'Alamat',
  //           hintText: alamat2S,
  //           prefixIcon: Icon(Icons.my_location, color: Colors.black),
  //           border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(8.0),
  //               borderSide: BorderSide(color: Colors.black))),
  //       obscureText: false,
  //       onFieldSubmitted: (String value) {
  //         FocusScope.of(context).requestFocus(_alamat3FocusNode);
  //       });
  // }

  // TextFormField _alamat3Widget() {
  //   return TextFormField(
  //     validator: (value) {
  //       if (value == null || value.isEmpty) {
  //         return "Data tidak boleh kosong";
  //         } else {
  //           return null;
  //         }
  //       },
  //       controller: _alamat3Controller,
  //       focusNode: _alamat3FocusNode,
  //       style: TextStyle(height: 1.5),
  //       decoration: InputDecoration(
  //           labelStyle: TextStyle(fontSize: 24, fontFamily: 'Exo2'),
  //           labelText: 'Alamat',
  //           hintText: alamat3S,
  //           prefixIcon: Icon(Icons.my_location, color: Colors.black),
  //           border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(8.0),
  //               borderSide: BorderSide(color: Colors.black))),
  //       obscureText: false,);
  // }

  Container _saveButtonWidget() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical:20, horizontal:20),
      width: 200,
      child: ElevatedButton(
        // elevation: 8.0,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0))),
        // padding: EdgeInsets.all(size.getWidthPx(12)),
        child: Text(
          "Save",
          style: TextStyle(
              fontFamily: 'Exo2', color: Colors.white, fontSize: 20.0),
        ),
        // color: colorCurve,
        onPressed: () async {
          editProfile();
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => ProfilePage()));
          // Going to DashBoard
        },
      ),
    );
  }
  
  registerFields() => Container(
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _idWidget(),
                SizedBox(height: 10),
                _emailWidget(),
                SizedBox(height: 10),
                _passWidget(),
                SizedBox(height: 10),
                _teleponWidget(),
                SizedBox(height: 10),
                _nameWidget(),
                SizedBox(height: 10),
                _alamat1Widget(),
                SizedBox(height: 10),
                SizedBox(height: 10),
                _saveButtonWidget(),
              ],
            )),
      );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(children: <Widget>[
        ClipPath(
            // clipper: ,
            child: Container(
                height: (200),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [],
                )))),
        SingleChildScrollView(
            child: SafeArea(
          top: true,
          bottom: false,
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: 20, vertical: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    // padding: EdgeInsets.only(top: 60),
                    child: Column(children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.pop(context, false),
                          ),
                          SizedBox(width: 10),
                          Text("Edit Profile", style: TextStyle(fontFamily: "Exo2", fontSize: 24, color: Colors.white),),
                        ],
                      ),
                      SizedBox(height: 36,),
                      SafeArea(
                        child: CircleAvatar(
                          maxRadius: 50,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: Colors.grey.shade300,
                            size: 80.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                        child: Icon(
                          Icons.add_circle,
                          color: Colors.grey.shade700,
                          size: 25.0,
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(height: 10),
                  // SizedBox(height: size.getWidthPx(10)),
                  // _textAccount(),
                  // SizedBox(height: size.getWidthPx(30)),
                  registerFields()
                ]),
          ),
        ))
      ]),
    );
  }

  
}
