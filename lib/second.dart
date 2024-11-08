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
            title: (const Text("Gauss Jordan Elimination")),
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
