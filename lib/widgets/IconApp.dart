import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jaya_office/palet%20ukuran/dimension.dart';

class IconApp extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;
  const IconApp({Key? key,
  required this.icon,
  this.backgroundColor = Colors.white,
  this.iconColor = const Color(0xFF756d54),
  this.size = 40,
  this.iconSize = 16,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
        ),
    );
  }
}