// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, unnecessary_string_interpolations, deprecated_member_use
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phone_otp_ui/verify.dart';
import 'main.dart';

import 'package:shared_preferences/shared_preferences.dart';

String stringResponse = "";
String stringRespo = "";
Map mapResponse = <String, dynamic>{};
Map mapRespo = <String, dynamic>{};

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);
  static String verify = "";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryController = TextEditingController();
  var phone = "";
  @override
  void initState() {
    apicall();
    // ignore: todo
    // TODO: implement initState
    countryController.text = "+91";
    Colors.black;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Image.asset(
            'images/Front.png',
            width: 650,
            height: 300,
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Image.asset(
                    'images/logo.png',
                    width: 500,
                    height: 100,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "India's #1 Construction Billing and Property Management App",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 40,
                          child: TextField(
                            controller: countryController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            onChanged: (value) {
                              phone = value;
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
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                        width: 100,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                "phones",
                                (route) =>
                                    false); // Navigator.pushNamed(context, 'verify');
                          },
                          child: Text(
                            "Log In",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        width: 100,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () async {
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: '${countryController.text + phone}',
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent: (String verificationId,
                                  int? resendToken) async {
                                MyPhone.verify = verificationId;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => MyVerify())));
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                            );
                            // Navigator.pushNamed(context, 'verify');
                          },
                          child: Text("Sign Up"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
