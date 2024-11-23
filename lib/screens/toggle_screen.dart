import 'package:flutter/material.dart';

import '../core/general_widgets.dart';
 import 'operations_screen.dart';

class ToggleScreen extends StatefulWidget {
  const ToggleScreen({super.key});

  @override
  State<ToggleScreen> createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {
  @override
  Widget build(BuildContext context) {
    const List<String> images = ["base11.jpg", "base2.jpg", "inverse.png"];
    const List<String> buttonNames = ["Gaussian", "Gauss Jordan", "Inverse"];
    return Scaffold(
        appBar: const CustomAppBar(title: "Choose Method", isPop: false),
        body: ListView.separated(
            padding: const EdgeInsets.all(16),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 40),
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage("images/${images[index]}"),
                                fit: BoxFit.fill))),
                    const SizedBox(height: 16),
                    AppButton(
                        title: buttonNames[index],
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OperationsScreen(
                                      appBarTitle: buttonNames[index])));
                        })
                  ]
                )));
  }
}
