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
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(210, 88, 40, 205),
      //   scrolledUnderElevation: 15,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
      //   ),
      //   title: const Text(
      //     textAlign: TextAlign.center,
      //     'Brikow',
      //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
      //   ),
      //   actions: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.only(right: 8),
      //       child: IconButton(
      //         icon: const Icon(
      //           Icons.logout,
      //           size: 30,
      //         ),
      //         onPressed: () {
      //           Navigator.pushNamed(context, 'phone');
      //         },
      //       ),
      //     ),
      //   ],
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'phone');
                      },
                      child: Container(
                        child: Icon(
                          Icons.logout,
                          size: 30,
                          color: Colors.black54,
                        ),
                        padding: EdgeInsets.only(right: 20),
                      ))
                ],
              ),
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    // Container(
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.only(),
                    //       color: Color.fromARGB(210, 88, 40, 205),
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           opacity: (10),
                    //           image: AssetImage("images/logo.png"),
                    //           fit: BoxFit.fitHeight)),
                    // ),

                    Center(
                      child: Image.asset(
                        'images/logo.png',
                        //width: 150.0,
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(42, 53, 71, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 30),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Welcome',
                            style: TextStyle(
                                fontFamily: 'roboto',
                                color: Colors.white,
                                fontSize: 25),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 30),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'A smarter, better way to manage Billing, Property Management & Investment',
                            style: TextStyle(
                                fontFamily: 'roboto',
                                color: Colors.white70,
                                fontSize: 15),
                          )),
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
                                color: Color.fromARGB(245, 224, 212, 255),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Construction",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w900),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black87,
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
                                color: Color.fromARGB(245, 224, 212, 255),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Property Manager / Broker",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w900),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black87,
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
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
