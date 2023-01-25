// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:phone_otp_ui/fifth.dart';
import 'package:phone_otp_ui/fourth.dart';
import 'package:phone_otp_ui/myverify.dart';
import 'package:phone_otp_ui/phone.dart';
import 'package:phone_otp_ui/sign_up.dart';
import 'package:phone_otp_ui/sixth.dart';
import 'package:phone_otp_ui/start.dart';
import 'package:phone_otp_ui/third.dart';
// ignore: depend_on_referenced_packages
import 'package:phone_otp_ui/verify.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:hive_flutter/adapters.dart';

import 'landing.dart';

late Box box1;

Future<void> main() async {
  await Hive.initFlutter();
  box1 = await Hive.openBox('logindata');
  apicall();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      initialRoute: 'start',
      debugShowCheckedModeBanner: false,
      routes: {
        'phone': (context) => const MyPhone(
              title: 'phone',
            ),

        'verify': (context) => const MyVerify(
              Phone: '',
            ),
        'third': (context) => third(),
        'fourth': (context) => fourth(),
        'fifth': (context) => fifth(),
        // ignore: prefer_const_constructors
        'sixth': (context) => sixth(),
        'myverify': (context) => Verify(),
        'landing': (context) => Landing(),
        'start': (context) => SplashScreenPage()
      },
    ),
  );
}

String stringResponse = "";
Map mapResponse = <String, dynamic>{};
void apicall() {
  Future apicall() async {
    http.Response response;
    response = await http.get(
      Uri.parse("http://admin.brikow.com/api/"),
    );

    if (response.statusCode == 200) {
      setState() {
        mapResponse = jsonDecode(response.body);
      }
      // setState(
      //   () {
      //     mapResponse = jsonDecode(response.body);
      //   },
      // );
    } else {
      return null;
    }
  }
}

//void setState(Null Function() param0) {}
