import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:phone_otp_ui/verify.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

import 'myverify.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key, required String title}) : super(key: key);
  static String verify = "";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  late Box box1;
  var Phone = '';
  // TextEditingController countryController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  String phone = "";
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    // countryController.text = "+91";
    Colors.black;
    super.initState();
    createBox();
  }

  void createBox() async {
    box1 = await Hive.openBox('logindata');
  }

  // ignore: non_constant_identifier_names
  signup() async {
    var headers = {
      'Content-Type': 'application/json',
      // 'Cookie':
      //     'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjkxODM3NWU3MjE4ZTc1ODIwMmY2MyIsImlhdCI6MTY3MzA3NDg4OCwiZXhwIjoxNjc1NjY2ODg4fQ.lSDOvNG2hyFEzzznQvw8d2vHsRxhf6yaY-MIsWjrpIM'
    };
    var request =
        http.Request('POST', Uri.parse('http://admin.brikow.com/api/getOTP'));

    request.body = json.encode({"phone_no": "$Phone"});
    //request.body = json.encode({"phone_no": "8839100911"});

    request.headers.addAll(headers);
    print("req" + request.toString());
    print("body" + request.body);
    print("headers" + request.headers.toString());

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print("otp sent succesfully");
      box1.put('phone', Phone);
    } else {
      print(response.reasonPhrase);
      print("failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 2,
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
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              opacity: (20),
                              image: AssetImage("images/login.jpg"),
                              fit: BoxFit.fitHeight)),
                    ),
                    // new Image(image: new AssetImage('assets/workers2.png')),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "India's #1",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Text(
                          "Construction Billing and",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Text(
                          "Property Management App",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "+91",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade900,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                controller: PhoneController,
                                keyboardType: TextInputType.phone,
                                onChanged: (value) {
                                  Phone = value;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter Mobile Number",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 38),
                        child: GestureDetector(
                          onTap: (() {
                            Navigator.pushReplacementNamed(context, 'verify');
                            signup();
                          }),
                          child: Container(
                            height: 55,
                            width: 550,
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 70),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              textAlign: TextAlign.center,
                              "Send OTP",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
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
