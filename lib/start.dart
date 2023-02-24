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
    var duration = const Duration(seconds: 4);
    return Timer(
      duration,
      () {
        print("splashh" + box2.get('isLogged').toString());
        print(box2.get("isLogged"));
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) =>
                //Landing()
                //box2.get('isLogged',defaultValue: false)?MyPhone(title: "phone"):Verify(),
                box2.get('isLogged')
                    ? MyPhone(title: "phone")
                    : Landing(),
            // box2.get('isLogged')==null
            //     ? MyPhone(title: "phone")
            //     : Landing(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(210, 214, 203, 243),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "images/output-onlinepngtools.png",
              width: 600.0,
              height: 350.0,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
