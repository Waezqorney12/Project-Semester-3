import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jaya_office/palet/dimension.dart';

class IconApp extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  
  const IconApp({Key? key,
  required this.icon,
  this.backgroundColor = const Color(0xFFfcf4e4),
  this.iconColor = const Color(0xFF756d54),
  this.size = 40
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.icon16,
        ),
    );
  }
}