import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaya_office/login.dart';

import 'login.dart';
import 'main.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _OBS = true;

  TextEditingController usernamaRegis = TextEditingController();
  TextEditingController passwordRegis = TextEditingController();
  TextEditingController emailRegis = TextEditingController();
  TextEditingController nomorRegis = TextEditingController();

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
            decoration:
                InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(fontSize: 10),
                  prefixIcon: Icon(Icons.person,size: 17,),
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
            decoration:
                InputDecoration(
                  hintText: 'Phone Number',
                  hintStyle: TextStyle(fontSize: 10),
                  prefixIcon: Icon(Icons.phone,size: 17,),
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
                height: 20,
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
                height: 30,
              ),

              //Label Register Email
              regisEmail(),

              SizedBox(height: 20),

              regisPass(),

              SizedBox(
                height: 20,
              ),

              regisUsername(),
              SizedBox(
                height: 20,
              ),

              regisNomor(),
              SizedBox(
                height: 40,
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => login()));
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
                height: 20,
              ),
              Align(
                //alignment: Alignment.center,
                child: Text(
                  "or log in with",
                  style: GoogleFonts.roboto(fontSize: 10, color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //BUTTON LOGIN WITH GOOGLE
              Container(
                width: 300,
                height: 40,
                //margin: EdgeInsets.only(left: 30),
                child: GestureDetector(
                  child: RawMaterialButton(
                    fillColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
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
              ),

              SizedBox(
                height: 20,
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
                    width: 5,
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
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) => login(),
                              ));
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
