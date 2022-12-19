import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:jaya_office/forgotPass_part2.dart';

class forgotPass extends StatefulWidget {
  @override
  State<forgotPass> createState() => _forgotPassState();
}

class _forgotPassState extends State<forgotPass> {
  TextEditingController _emailReset = TextEditingController();

  Future forgot1() async {
    var url = Uri.http("192.168.1.10", '/login/verif.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "email" : _emailReset.text,
      
    });
    
    if (response.body.isNotEmpty) {
      json.decode(response.body);
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => forgotPass2(),
        ),
      );
    } else {
      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: "Something went wrong...",
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }
  Widget inputEmailReset() {
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
            controller: _emailReset,
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

  Widget ButtonContinue() {
    return Container(
      width: 300,
      height: 40,
      child: GestureDetector(
        child: RawMaterialButton(
          fillColor: Color.fromARGB(255, 255, 101, 67),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            forgot1();
            //Navigator.pushReplacementNamed(context, '/forgot2');
          },
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Continue",
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 18, 20, 22),
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 18, 20, 22),
      //   elevation: 0,
      //   actions: [
      //     Container(
      //       margin: EdgeInsets.only(right: 270),
      //       child:
      //         RawMaterialButton(
      //           child: Icon(Icons.,size: 20,),
      //           onPressed: (){
      //           Navigator.pushReplacementNamed(context, '/login');
      //         })

      //     )
      //   ],
      // ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            // Font Exit
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Image.asset("assets/images/Exit.png"),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Forgot Password",
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Fill the column to reset your password",
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            color: Color.fromARGB(100, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset("assets/images/Mail.png"),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 50),
                    child: Row(
                      children: [
                        Text("Email",style: GoogleFonts.roboto(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w300),),
                      ],
                    )
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  inputEmailReset(),
                  SizedBox(
                    height: 40,
                  ),
                  ButtonContinue(),
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
