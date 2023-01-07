// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, unnecessary_string_interpolations, deprecated_member_use
import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_otp_ui/verify.dart';
import 'api_provider.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key, required String title}) : super(key: key);
  static String verify = "";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  var Phone = '';
  // TextEditingController countryController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  var phone = "";
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    // countryController.text = "+91";
    Colors.black;
    super.initState();
  }

  // ignore: non_constant_identifier_names
  signup() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjkxODM3NWU3MjE4ZTc1ODIwMmY2MyIsImlhdCI6MTY3MzA3NDg4OCwiZXhwIjoxNjc1NjY2ODg4fQ.lSDOvNG2hyFEzzznQvw8d2vHsRxhf6yaY-MIsWjrpIM'
    };
    var request =
        http.Request('POST', Uri.parse('http://admin.brikow.com/api/getOTP'));
    request.body = json.encode({"phone_no": "$Phone"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print("otp sent succesfully");
    } else {
      print(response.reasonPhrase);
      print("failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Image.asset(
            'images/Front.png',
            width: double.infinity,
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
                    height: 15,
                  ),
                  Image.asset(
                    'images/logo2.png',
                    width: 500,
                    height: 200,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "India's #1 Construction Billing and",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Property Management App",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Log in or Sign up",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade900,
                    ),
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
                          width: 20,
                        ),
                        Text(
                          "+91",
                          style: TextStyle(
                            fontSize: 20,
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
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'verify');
                      signup();
                    },
                    child: Container(
                      width: 230,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.red.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Continue"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
