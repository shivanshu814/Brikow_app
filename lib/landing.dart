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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(236, 219, 179, 240),
        title: Text(
          'Welcome',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              color: Color.fromARGB(255, 0, 0, 0),
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
      backgroundColor: Colors.white,
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
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    Container(
                      height: 420,
                      width: 520,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            opacity: (20),
                            image: AssetImage("images/8104.jpg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Text(
                  "A smarter, better way to manage Billling,",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Text(
                  "Property Management & Investment",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            child: GestureDetector(
                              onTap: (() {
                                Navigator.pushReplacementNamed(
                                    context, 'myverify');
                              }),
                              child: Container(
                                height: 150,
                                width: 150,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "images/icons8-city-buildings-96.png"),
                                    ),
                                    color: Color.fromARGB(176, 226, 221, 221),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Construction",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 2),
                            child: GestureDetector(
                              onTap: (() {
                                Navigator.pushReplacementNamed(
                                    context, 'myverify');
                              }),
                              child: Container(
                                height: 150,
                                width: 150,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "images/icons8-property-64.png"),
                                    ),
                                    color: Color.fromARGB(176, 226, 221, 221),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Property",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            child: GestureDetector(
                              onTap: (() {
                                Navigator.pushReplacementNamed(
                                    context, 'myverify');
                              }),
                              child: Container(
                                height: 150,
                                width: 150,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "images/icons8-rent-96.png"),
                                    ),
                                    color: Color.fromARGB(176, 226, 221, 221),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Sell Property",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 2),
                            child: GestureDetector(
                              onTap: (() {
                                Navigator.pushReplacementNamed(
                                    context, 'myverify');
                              }),
                              child: Container(
                                height: 150,
                                width: 150,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "images/icons8-finance-64.png"),
                                    ),
                                    color: Color.fromARGB(176, 226, 221, 221),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Finance",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
