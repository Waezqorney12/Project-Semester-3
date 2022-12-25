import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaya_office/palet%20ukuran/dimension.dart';

class DetailDescriptionText extends StatelessWidget {
  final String text;
  const DetailDescriptionText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.roboto(
            fontSize: Dimensions.font14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
