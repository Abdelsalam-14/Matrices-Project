import 'package:course_flutter/first.dart';
import 'package:course_flutter/second.dart';
import 'package:flutter/material.dart';

class base extends StatefulWidget {
  const base({super.key});

  @override
  State<base> createState() => _baseState();
}

class _baseState extends State<base> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 8, 121, 213),
            toolbarHeight: 70,
            title: const Text(
              "Choose Method",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 25),
            )),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const first()));
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const second()));
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
        ));
  }
}
