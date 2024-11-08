import 'package:flutter/material.dart';
import 'package:course_flutter/base.dart';

class start extends StatefulWidget {
  const start({super.key});

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 8, 121, 213),
            toolbarHeight: 70,
            title: Center(
                child: Text(
              "Math Project",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 30),
            ))),
        body: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 250),
                  child: Image.asset("images/start.webp"),
                ),
                SizedBox(height: 8),
                Container(
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => base()));
                        },
                        child: Center(
                            child: Container(
                          height: 40,
                          width: 260,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 8, 121, 213)),
                          child: Center(
                            child: Text(
                              " Solving Matrices",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 25),
                            ),
                          ),
                        ))))
              ],
            ),
          ),
        ));
  }
}
