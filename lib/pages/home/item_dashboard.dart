import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaya_office/palet%20ukuran/dimension.dart';
import 'package:http/http.dart' as http;

class ItemPageBody extends StatefulWidget {
  const ItemPageBody({super.key});

  @override
  State<ItemPageBody> createState() => _ItemPageBodyState();
}

class _ItemPageBodyState extends State<ItemPageBody> {
  Future<List> getImage() async {
    final response = await http.get(Uri.parse("http://192.168.1.6/login/product.php"));
    final get = jsonDecode(response.body);
    return get;
    
  }

  // PageController pageController = PageController(viewportFraction: 0.85);
  // var currentPage = 0.0;
  // double scaleFactor = 0.8;
  // final double _height = 220;

  // @override
  // void initState() {
  //   super.initState();
  //   pageController.addListener(() {
  //     setState(() {
  //       currentPage = pageController.page!;
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   pageController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    //print("current height is " + MediaQuery.of(context).size.height.toString());
    return Scaffold(
        body: FutureBuilder<List>(
            future: getImage(),
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? itemList(
                      list: [snapshot.data],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }));
  }
}

class itemList extends StatelessWidget {
  List list;
  itemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (BuildContext context, i) {
        return Text(
          "${list[i]['stock']}"
        );
      },
    );
  }
}
