// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, unnecessary_string_interpolations, unused_element
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String stringResponse = "";
String stringRespo = "";
Map mapResponse = <String, dynamic>{};
Map mapRespo = <String, dynamic>{};

class MySignUp extends StatefulWidget {
  const MySignUp({Key? key}) : super(key: key);
  static String verify = "";

  @override
  State<MySignUp> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MySignUp> {
  Future apicall() async {
    http.Response response;
    http.Response respo;
    response = await http.get(
      Uri.parse("http://admin.brikow.com/api/"),
    );
    respo = await http.get(
      Uri.parse("http://3.109.154.123/api"),
    );
    if (response.statusCode == 200) {
      setState(
        () {
          mapResponse = jsonDecode(response.body);
        },
      );
    } else {
      setState(
        () {
          mapRespo = jsonDecode(respo.body);
        },
      );
    }
  }

  TextEditingController countryController = TextEditingController();
  var phone = "";
  @override
  void initState() {
    apicall();
    // ignore: todo
    // TODO: implement initState
    countryController.text = " +91";
    Colors.black;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/Front.png',
                width: 650,
                height: 300,
              ),
              SizedBox(
                height: 35,
              ),
              Image.asset(
                'images/logo.png',
                width: 300,
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
              Text(
                "Signing up",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
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
                    mapResponse == null
                        ? Text("Data is loading")
                        : Text(
                            mapResponse['message'].toString(),
                          ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red.shade200,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countryController.text + phone}',
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        MySignUp.verify = verificationId;
                        Navigator.pushNamed(context, 'verify');
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                  child: Text("Sign Up"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
