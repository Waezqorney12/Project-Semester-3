import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class forgotPass2 extends StatefulWidget {
  @override
  State<forgotPass2> createState() => _forgotPass2State();
}

class _forgotPass2State extends State<forgotPass2> {
  TextEditingController _emailReset = TextEditingController();
  var obs = true;
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
            obscureText: obs,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, size: 17),
                // contentPadding: EdgeInsets.only(left: 16, top: 16),
                hintText: "Password",
                hintStyle: TextStyle(fontSize: 10),
                suffixIcon: IconButton(
                  icon: Icon(obs ? Icons.visibility_off : Icons.visibility),
                  onPressed: (){
                    setState(() {
                      obs = !obs;
                    });
                  },)
                ),
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
            Navigator.pushReplacementNamed(context, '/login');
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
                  Image.asset("assets/images/Passw.png"),
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
