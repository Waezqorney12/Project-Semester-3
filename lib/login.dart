import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard.dart';

class login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<login> {
  String _emailID = '';
  String _password = '';
  String _email = '123@gmail.com';
  String _pass = '123';

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();

    void validationLogin() {
      if (_form.currentState!.validate()) {
        _form.currentState!.save();
        // Paksa

        if (_emailID == _email && _password == _pass) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        }
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
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: Image.asset("assets/images/User.png"),
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
        child: Column(
          children: <Widget>[
          TextFormField(
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
              Center(
                child: Image.asset(
                  "assets/images/sally.png",
                  scale: 1.2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
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
                margin: EdgeInsets.only(left: 20),
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

                  // FONT FORGOT PASSWORD
                  Align(
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
                  const SizedBox(
                    height: 20,
                  ),

                  // BUTTON LOGIN
                  Container(
                    width: 300,
                    height: 40,
                    child: RawMaterialButton(
                      fillColor: Color.fromARGB(255, 255, 101, 67),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: validationLogin,
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

                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "or log in with",
                    style: GoogleFonts.roboto(fontSize: 10, color: Colors.grey),
                  ),

                  const SizedBox(
                    height: 15,
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
