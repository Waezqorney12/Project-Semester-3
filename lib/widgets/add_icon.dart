import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class addIcon extends StatefulWidget {
  const addIcon({super.key});

  @override
  State<addIcon> createState() => _addIconState();
  
}

class _addIconState extends State<addIcon> {
  int num = 0;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          num += 1;
        });
      },
      child: Icon(Icons.add, color: Colors.black),
    );
  }
}