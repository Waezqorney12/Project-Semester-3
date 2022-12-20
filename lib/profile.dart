import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaya_office/backgroundscreen.dart';

class profiles extends StatelessWidget {
  const profiles({super.key});

  @override
  Widget build(BuildContext context) {
    return background(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 100, left: 50, right: 50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            SizedBox(
              height: 50,
            ),

            Stack(
              children: [
                SizedBox(
                  width: 110,
                  height: 110,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/propil.jpg",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Text("Free Fire",
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text("Rapli", style: GoogleFonts.montserrat(color: Colors.white)),

            const SizedBox(
              height: 20,
            ),
            // SizedBox(
            //   width: 200,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(shape: StadiumBorder()),
            //     child: Text("Edit Profile"),

            //   ),
            // ),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),

            GestureDetector(
              onTap: () {
                // Navigator.pushReplacementNamed(context, '/editprofile');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        "Account Profile",
                        style: GoogleFonts.montserrat(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      // trailing: Container(
                      //   width: 30,
                      //   height: 30,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(100),
                      //     color: Colors.grey.withOpacity(0.1),
                      //   ),
                      //   child: Icon(
                      //     Icons.arrow_right,
                      //     color: Colors.white,
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ),
            ),

            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.history_outlined,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        "History Transaction",
                        style: GoogleFonts.montserrat(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        "Coming Soon",
                        style: GoogleFonts.montserrat(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 40,
            )
          ]),
        ),
      ),
    );
  }
}
// trailing: Container(
                      //   width: 30,
                      //   height: 30,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(100),
                      //     color: Colors.grey.withOpacity(0.1),
                      //   ),
                      //   child: Icon(
                      //     Icons.arrow_right,
                      //     color: Colors.white,
                      //   ),
                      // ),