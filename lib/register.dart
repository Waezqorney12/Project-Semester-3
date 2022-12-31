import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaya_office/login.dart';
import 'package:http/http.dart' as http;
import 'package:jaya_office/model/signup_model_body.dart';
import 'package:jaya_office/palet%20ukuran/dimension.dart';
import 'login.dart';
import 'main.dart';

class regis extends StatefulWidget {
  @override
  State<regis> createState() => _regisState();
}

class _regisState extends State<regis> {
  //obscure text
  bool _OBS = true;
  TextEditingController idRegis = TextEditingController();

  TextEditingController usernamaRegis = TextEditingController();
  TextEditingController passwordRegis = TextEditingController();
  TextEditingController emailRegis = TextEditingController();
  TextEditingController nomorRegis = TextEditingController();
  TextEditingController alamatRegis = TextEditingController();

  // void _registar() {
  //   var id = idRegis.text.trim();
  //   var username = usernamaRegis.text.trim();
  //   var password = passwordRegis.text.trim();
  //   var email = emailRegis.text.trim();
  //   var alamat = alamatRegis.text.trim();
  //   var nomor = nomorRegis.text.trim();

  //   if (id.isEmpty) {
  //     Fluttertoast.showToast(
  //       msg: "Input ur ID",
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       toastLength: Toast.LENGTH_SHORT,
  //     );
  //   } else if (username.isEmpty) {
  //     Fluttertoast.showToast(
  //       msg: "Input ur username",
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       toastLength: Toast.LENGTH_SHORT,
  //     );
  //   } else if (password.isEmpty) {
  //     Fluttertoast.showToast(
  //       msg: "Input ur Password",
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       toastLength: Toast.LENGTH_SHORT,
  //     );
  //   } else if (email.isEmpty) {
  //     Fluttertoast.showToast(
  //       msg: "Input ur email",
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       toastLength: Toast.LENGTH_SHORT,
  //     );
  //   } else if (!EmailValidator.validate(email, true)) {
  //     setState(() {
  //       Fluttertoast.showToast(
  //         msg: "Invalid Format Email",
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         toastLength: Toast.LENGTH_SHORT,
  //       );
  //     });
  //   } else if (alamat.isEmpty) {
  //     Fluttertoast.showToast(
  //       msg: "Input your address",
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       toastLength: Toast.LENGTH_SHORT,
  //     );
  //   } else if (nomor.isEmpty) {
  //     Fluttertoast.showToast(
  //       msg: "Input your phone number",
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       toastLength: Toast.LENGTH_SHORT,
  //     );
  //   } else {
  //     Fluttertoast.showToast(
  //       msg: "All Good",
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       toastLength: Toast.LENGTH_SHORT,
  //     );
  //   }
  //   // signupBody SignUpBody = signupBody(
  //   //   id: id,
  //   //   username: username,
  //   //   password: password,
  //   //   email: email,
  //   //   alamat: alamat,
  //   //   telepon: nomor
  //   //   );
  //   //   print(SignUpBody.toString());
  // }

  Future registar() async {
    var url = Uri.http("192.168.1.6", '/login/register.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "userid": idRegis.text,
      "username": usernamaRegis.text,
      "password": passwordRegis.text,
      "email": emailRegis.text,
      "alamat": alamatRegis.text,
      "telepon": nomorRegis.text,
    });
    var id = idRegis.text.trim();
    var username = usernamaRegis.text.trim();
    var password = passwordRegis.text.trim();
    var email = emailRegis.text.trim();
    var alamat = alamatRegis.text.trim();
    var nomor = nomorRegis.text.trim();

    if (id.isEmpty) {
      Fluttertoast.showToast(
        msg: "Input ur ID",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    } else if (username.isEmpty) {
      Fluttertoast.showToast(
        msg: "Input ur username",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    } else if (password.isEmpty) {
      Fluttertoast.showToast(
        msg: "Input ur Password",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    } else if (email.isEmpty) {
      Fluttertoast.showToast(
        msg: "Input ur email",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    } else if (!EmailValidator.validate(email, true)) {
      setState(() {
        Fluttertoast.showToast(
          msg: "Invalid Format Email",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
      });
    } else if (alamat.isEmpty) {
      Fluttertoast.showToast(
        msg: "Input your address",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    } else if (nomor.isEmpty) {
      Fluttertoast.showToast(
        msg: "Input your phone number",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      Fluttertoast.showToast(
        msg: "All Good",
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => login(),
        ),
      );
    }
  }

  Widget regisPass() {
    return Container(
      width: 300,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: passwordRegis,
            obscureText: _OBS,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(fontSize: 10),
              prefixIcon: Icon(Icons.lock, size: 17),
              suffixIcon: IconButton(
                icon: Icon(_OBS ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _OBS = !_OBS;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget regisEmail() {
    return Container(
      width: 300.0,
      height: 48.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailRegis,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Email Address",
                hintStyle: TextStyle(fontSize: 10),
                prefixIcon: Icon(
                  Icons.email,
                  size: 17,
                )),
          ),
        ],
      ),
    );
  }

  Widget regisUsername() {
    return Container(
      width: 300,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: usernamaRegis,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Username',
              hintStyle: TextStyle(fontSize: 10),
              prefixIcon: Icon(
                Icons.person,
                size: 17,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget regisNomor() {
    return Container(
      width: 300,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: nomorRegis,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'Phone Number',
              hintStyle: TextStyle(fontSize: 10),
              prefixIcon: Icon(
                Icons.phone,
                size: 17,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget regisAlamat() {
    return Container(
      width: 300,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: alamatRegis,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Address',
              hintStyle: TextStyle(fontSize: 10),
              prefixIcon: Icon(
                Icons.map,
                size: 17,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget idRegister() {
    return Container(
      width: 300,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: idRegis,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Id',
              hintStyle: TextStyle(fontSize: 10),
              prefixIcon: Icon(
                Icons.person,
                size: 17,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 18, 20, 22),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: Dimensions.height20,
              ),
              Container(
                margin: EdgeInsets.only(right: 170),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Register",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: Colors.white),
                    ),
                    Text(
                      "Please fill to continue",
                      style: TextStyle(
                          color: Color.fromARGB(100, 255, 255, 255),
                          fontSize: 12),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: Dimensions.height30,
              ),

              //Label Register Email
              idRegister(),

              SizedBox(height: Dimensions.height20),

              regisUsername(),
              SizedBox(height: Dimensions.height20),

              regisPass(),

              SizedBox(
                height: Dimensions.height20,
              ),

              regisEmail(),
              SizedBox(
                height: Dimensions.height20,
              ),

              regisAlamat(),
              SizedBox(
                height: Dimensions.height20,
              ),

              regisNomor(),
              SizedBox(
                height: Dimensions.height40,
              ),
              //Button Register
              Container(
                width: 300,
                height: 40,
                child: GestureDetector(
                  child: RawMaterialButton(
                    fillColor: Color.fromARGB(255, 255, 101, 67),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      registar();
                      //Regist();
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => login()));
                    },
                    child: Align(
                      //alignment: Alignment.center,
                      child: Text(
                        "Register",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),

              //FONT LOGIN WITH
              SizedBox(
                height: Dimensions.height15,
              ),

              //FONT DONT HAVE ACCOUNT
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //margin: EdgeInsets.only(top: 5),
                    child: Text(
                      "Already have Account?",
                      style: GoogleFonts.roboto(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.height5,
                  ),

                  //FONT SIGN IN
                  Container(
                    //margin: EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        GestureDetector(
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.roboto(
                                  fontSize: 10, color: Colors.orange),
                            ),
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/login');
                            })
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
            ],
          ),
        ));
  }
}
