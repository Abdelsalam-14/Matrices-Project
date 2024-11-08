import 'package:course_flutter/screens/second.dart';
import 'package:course_flutter/widgets/general_widgets.dart';
import 'package:flutter/material.dart';

import 'first.dart';

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
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("images/${images[index]}"),
                              fit: BoxFit.fill)),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                        title: buttonNames[index],
                        onPressed: () {
                          if (index == 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const first()));
                          } else if (index == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const second()));
                          }else {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const third()));
                          }
                        })
                  ],
                )));
  }
}
/*
body: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 100, right: 30, left: 30),
                child: Image.asset(
                  "images/base11.jpg",
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const first()));
                      },
                      child: Center(
                          child: Container(
                        height: 44,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 8, 121, 213)),
                        child: const Center(
                          child: Text(
                            " Gaussian Elimination ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18),
                          ),
                        ),
                      )))),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
                child: Image.asset(
                  "images/base2.jpg",
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const second()));
                      },
                      child: Center(
                          child: Container(
                        height: 44,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 8, 121, 213)),
                        child: const Center(
                          child: Text(
                            "Gauss Jordan Elimination",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18),
                          ),
                        ),
                      ))))
            ],
          ),
        )
 */
