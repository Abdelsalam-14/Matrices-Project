import 'package:flutter/material.dart';

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 70,
            title: (Text(" Gaussian Elimination ")),
            backgroundColor: Color.fromARGB(255, 8, 121, 213),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
            )),
        body: Container(
            color: Color.fromARGB(255, 255, 255, 255),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            )));
  }
}
