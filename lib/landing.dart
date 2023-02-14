import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive/hive.dart';
import 'package:phone_otp_ui/verify.dart';
import 'myverify.dart';
import 'phone.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(210, 88, 40, 205),
        scrolledUnderElevation: 15,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
        ),
        title: const Text(
          textAlign: TextAlign.center,
          'Brikow',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: const Icon(
                Icons.logout,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'phone');
              },
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(),
                          color: Color.fromARGB(210, 88, 40, 205),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              opacity: (10),
                              image: AssetImage("images/final.jpg"),
                              fit: BoxFit.fitHeight)),
                    ),
                    // Center(
                    //   child: Container(child: Image.asset("images/final.jpg")),
                    // ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(220, 200, 219, 195),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: GestureDetector(
                          onTap: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Verify()));
                          }),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(210, 88, 40, 205),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Construction",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: GestureDetector(
                          onTap: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Verify()));
                          }),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(210, 88, 40, 205),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Property Manager / Broker",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
