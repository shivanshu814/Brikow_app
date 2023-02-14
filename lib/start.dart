import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:phone_otp_ui/myverify.dart';
import 'package:phone_otp_ui/phone.dart';

import 'landing.dart';
import 'phone.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late Box box2;

  @override
  void initState() {
    super.initState();
    startSplashScreen();
    getData();
  }

  void getData() async {
    box2 = await Hive.openBox('logindata');
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 10);
    return Timer(
      duration,
      () {
        print("splash" + box2.get('isLogged', defaultValue: false).toString());
        print(box2.get("isLogged"));

        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
        // box2.get('isLogged',defaultValue: false)?MyPhone(title: "phone"):Verify()
        //   ,),);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) =>
                //box2.get('isLogged',defaultValue: false)?MyPhone(title: "phone"):Verify(),
                box2.get('isLogged', defaultValue: false)
                    ? MyPhone(title: "phone")
                    : Landing(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 117, 134),
      body: Center(
        child: Image.asset(
          "images/logo.png",
          width: 700.0,
          height: 300.0,
        ),
      ),
    );
  }
}
