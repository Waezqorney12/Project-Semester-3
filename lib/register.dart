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
            decoration: InputDecoration(
              hintText: "sa",
              
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 18, 20, 22),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    // FONT REGISTER
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "Register",
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
                            "Please fill to continue",
                            style: TextStyle(
                                color: Color.fromARGB(100, 255, 255, 255),
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //Label Register Email
              regisEmail(),


              //Button Register
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
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
                      alignment: Alignment.center,
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
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "or log in with",
                  style: GoogleFonts.roboto(fontSize: 10, color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //BUTTON LOGIN WITH GOOGLE
              Container(
                width: 300,
                height: 40,
                margin: EdgeInsets.only(left: 30),
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

              //FONT DONT HAVE ACCOUNT
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
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
                    margin: EdgeInsets.only(top: 5),
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
            ],
          ),
        ));
  }
}
