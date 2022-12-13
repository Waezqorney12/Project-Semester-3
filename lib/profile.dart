import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class profiles extends StatefulWidget {
  const profiles({super.key});

  @override
  State<profiles> createState() => _profilesState();
}

class _profilesState extends State<profiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 20, 22),
      body: Center(child: Text("Propil",
      style: TextStyle(
      fontSize: 20.0,
      color: Colors.white,
      ),
      ),
      ),
    );
  }
}