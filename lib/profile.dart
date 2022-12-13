import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class profiles extends StatelessWidget {
  const profiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/images/propil.jpg",
                ),
              ),
            ),
            Text("Rapli",style: GoogleFonts.montserrat(color:Colors.white)),
            Text("Rapli",style: GoogleFonts.montserrat(color:Colors.white)),
            const SizedBox(height: 20,),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: (){

                },
                child: Text("Edit Profile"),
                
              ),
            ),
            const SizedBox(height: 30,),
                const Divider(),
                const SizedBox(height: 10,),
                ///MENU
                ListTile(
                  leading: Container(
                   width: 40,
                   height: 40,
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                   ), 
                  ),
                  
                )
          ]),
        ),
      ),
    );
  }
}
