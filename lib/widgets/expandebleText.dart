import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaya_office/palet%20ukuran/dimension.dart';
import 'package:jaya_office/widgets/fontText12.dart';

class ExpandebeleText extends StatefulWidget {
  final String text;
  const ExpandebeleText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandebeleText> createState() => _ExpandebeleTextState();
}

class _ExpandebeleTextState extends State<ExpandebeleText> {
  late String firstText;
  late String secondText;

  bool hiddenText = true;
  // Height = 805.3
  // Height = 150
  double textHeight = Dimensions.screenHeight / 5.37;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > textHeight) {
      firstText = widget.text.substring(0, textHeight.toInt());
      secondText =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstText = widget.text;
      secondText = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondText.isEmpty
          ? textRoboto12(text: firstText)
          : Column(
              children: [
                textRoboto12(
                    text: hiddenText
                        ? (firstText + "...")
                        : (firstText + secondText)),
                SizedBox(
                  height: Dimensions.height10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      Text("Show More",
                          style: GoogleFonts.roboto(
                            fontSize: Dimensions.font12,
                            color: Colors.orange,
                            
                          )),
                      SizedBox(
                        width: Dimensions.widht5,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_circle_down_outlined
                            : Icons.arrow_circle_up_outlined,
                        color: Colors.orange,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
