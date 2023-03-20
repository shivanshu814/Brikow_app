import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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


  GoogleSignInAccount? _googleUser;
  GoogleSignIn _googleSignIn11 = GoogleSignIn(scopes: ['profile', 'email']);
  Future<void> _signInGoogle1() async {
    try{
      await _googleSignIn11.signIn();
      print("NO ERRROR");
    }catch(error){
      print("ERROR");
      print(error);
    }
  }

  googleLogin1() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try{
      var result = await _googleSignIn.signIn();
      print("NO ERRROR");
      print(result);
    }catch(error){
      print("ERROR1");
      print(error);
    }
  }

  ///sign out from google
  Future<void> signOut() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    _googleUser = null;
  }




  googleLogin() async{
    print("Login with Google");

    GoogleSignIn _googleSignIn = GoogleSignIn();
    try{
      var result = await _googleSignIn.signIn();
      print("RES+"+result.toString());
    }catch(error){
      print(error);
    }
  }


  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signingup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      if (result != null) {
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => HomePage()));
        Navigator.pushReplacementNamed(context, 'landing');
      }  // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

  //GoogleSignInAccount? _googleUser;
  Future<void> _signInGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          ///TODO: put scopes app will use
        ],
      );
      /// if previously signed in, it will signin silently
      /// if not, the signin dialog/login page will pop up
      _googleUser = await googleSignIn.signInSilently() ?? await googleSignIn.signIn();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  GoogleSignInAccount? _currentUser;
  String _contactText = '';
  Future<void> _handleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
        clientId:"69368674333-i8r5nrhk5f5jt6imt3h4leulbsclib1h.apps.googleusercontent.com");
    try {
      await googleSignIn.signIn();
      //print("HERE:"+_currentUser.toString());
      // _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      //   setState(() {
      //     _currentUser = account;
      //     print("HERE:"+_currentUser.toString());
      //   });
      //   if (_currentUser != null) {
      //     _handleGetContact(_currentUser!);
      //   }
      // });
    } catch (error) {
      print("err+"+error.toString());
    }


  }

  GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    clientId: '69368674333-i8r5nrhk5f5jt6imt3h4leulbsclib1h.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      'https://www.gooxgleapis.com/auth/contacts.readonly',
    ],

  );


  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      _contactText = 'Loading contact info...';
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = 'People API gave a ${response.statusCode} '
            'response. Check logs for details.';
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data =
    json.decode(response.body) as Map<String, dynamic>;
    final String? namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = 'I see you know $namedContact!';
      } else {
        _contactText = 'No contacts to display.';
      }
    });
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'] as List<dynamic>?;
    final Map<String, dynamic>? contact = connections?.firstWhere(
          (dynamic contact) => (contact as Map<Object?, dynamic>)['names'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>?;
    if (contact != null) {
      final List<dynamic> names = contact['names'] as List<dynamic>;
      final Map<String, dynamic>? name = names.firstWhere(
            (dynamic name) =>
        (name as Map<Object?, dynamic>)['displayName'] != null,
        orElse: () => null,
      ) as Map<String, dynamic>?;
      if (name != null) {
        return name['displayName'] as String?;
      }
    }
    return null;
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

                      Padding(
                        padding: const EdgeInsets.only(left: 80, right: 80),
                        child: MaterialButton(
                          color: Colors.white70,
                          elevation: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30.0,
                                width: 30.0,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                      AssetImage('images/google_icon.png'),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text("Sign In with Google")
                            ],
                          ),

                          // by onpressed we call the function signup function
                          onPressed: (){
                            //signup(context);
                            //signingup(context);
                            //googleLogin();
                            //_signInGoogle1();
                            googleLogin1();
                          },
                        ),
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
