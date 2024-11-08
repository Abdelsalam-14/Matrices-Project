import 'package:flutter/material.dart';

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            title: (Text("Gauss Jordan Elimination")),
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
