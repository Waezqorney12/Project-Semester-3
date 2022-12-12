import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'register.dart';
import 'main.dart';

import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<login> {
  // Future<List> () async{
  //     final response = await http.post('http://10.0.2.2/mantul/login.php',body: {
  //       "username" : username.text,
  //       "password" : pass.text,
  //     });
  //     var dataUser = json.decode(response.body);

  //     if (dataUser.length == 0) {
  //       setState(() {
  //         msg = "Login Failed";
  //       });
  //     }
  //   }
  String _emailID = '';
  String _password = '';
  String _email = '123@gmail.com';
  String _pass = '123';

  bool _obscureText = false;

  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();

    void validationLogin() {
      if (_emailID == _email && _password == _pass) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      }
    }

    Widget inputEmail() {
      return Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        width: 300.0,
        height: 48.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: username,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, size: 17),
                  // contentPadding: EdgeInsets.only(left: 16, top: 16),
                  hintText: "Email Addres",
                  hintStyle: TextStyle(fontSize: 10)),
            ),
          ],
        ),
      );
    }

    Widget inputPass() {
      return Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        width: 300.0,
        height: 48.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Column(children: <Widget>[
          TextFormField(
            controller: pass,
            obscureText: _obscureText,
            decoration: InputDecoration(
              filled: true,
              hintText: "Password",
              hintStyle: TextStyle(fontSize: 10),
              prefixIcon: const Icon(
                Icons.lock,
                size: 17,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
        ]),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 18, 20, 22),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Center(
                child: Image.asset(
                  "assets/images/sally.png",
                  scale: 1.2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Login",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 2),
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Column(
                  children: const [
                    Text(
                      "Please sign in to continue",
                      style: TextStyle(
                          color: Color.fromARGB(100, 255, 255, 255),
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: <Widget>[
                  // BOX EMAIL
                  inputEmail(),
                  const SizedBox(
                    height: 20,
                  ),

                  // BOX PASSWORD
                  inputPass(),
                  const SizedBox(
                    height: 8,
                  ),

                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: Container(
                  //     child: Column(
                  //       children: <Widget>[
                  //         Text(msg, style: GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w200, color: Colors.red)),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // FONT FORGOT PASSWORD
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, '/forgot');
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Text(
                              "Forgot Password",
                              style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 255, 158, 128)),
                            ),
                            
                          ],
                          
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // BUTTON LOGIN
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
                          Navigator.pushReplacementNamed(context, '/register');
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Log In",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "or log in with",
                    style: GoogleFonts.roboto(fontSize: 10, color: Colors.grey),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    width: 300,
                    height: 40,
                    child: RawMaterialButton(
                      fillColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: validationLogin,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 24,
                            height: 24,
                            padding: EdgeInsets.only(right: 5),
                            child: Image.asset(
                              "assets/images/google.png",
                            ),
                          ),
                          Text(
                            "Log In with Google",
                            style: GoogleFonts.montserrat(
                                color: Color.fromARGB(255, 113, 109, 109),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          "Don't have Account?",
                          style: GoogleFonts.roboto(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            GestureDetector(
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.roboto(
                                      fontSize: 10, color: Colors.orange),
                                ),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Dashboard(),
                                  ));
                                })
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
