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
            title: (const Text(" Gaussian Elimination ")),
            backgroundColor: const Color.fromARGB(255, 8, 121, 213),
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 22,
            )),
        body: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            height: double.infinity,
            width: double.infinity,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            )));
  }
}
