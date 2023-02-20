// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, camel_case_types, duplicate_ignore, prefer_const_constructors

import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:phone_otp_ui/main.dart';
import 'package:phone_otp_ui/phone.dart';
import 'package:phone_otp_ui/third.dart';
import 'package:phone_otp_ui/third.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);
  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  Map<String, dynamic> result = {};

  List items = [];
  int _selectedIndex = 0;
  late Box box2;
  late Box box1;
  String token = "";
  String name = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init_state");
    createBox();
    _getProjectData();
  }

  void createBox() async {
    box1 = await Hive.openBox('logindata');
    setState(() {
      print("token");
      print(box1.get("token").toString());
      token = box1.get("token").toString();
    });
  }

  logout() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': token
      //'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjkxODM3NWU3MjE4ZTc1ODIwMmY2MyIsImlhdCI6MTY3MzA3NDg4OCwiZXhwIjoxNjc1NjY2ODg4fQ.lSDOvNG2hyFEzzznQvw8d2vHsRxhf6yaY-MIsWjrpIM'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://admin.brikow.com/api/construction/contractor/logout'));

    request.headers.addAll(headers);

    print("verify req:" + request.toString());
    print("verify head:" + request.headers.toString());

    print(request);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      result = jsonDecode(await response.stream.bytesToString())
          as Map<String, dynamic>;

      print(result["response"][0]["Name"]);

      //print(await response.stream.bytesToString());
      // Navigator.pushNamed(context, 'myverify');
      print("logout SUccessful");
    } else {
      print(response.reasonPhrase);
      print("logout failed");
    }
    print(response.statusCode);
  }

  @override
  _getProjectData() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': token
      //'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjkxODM3NWU3MjE4ZTc1ODIwMmY2MyIsImlhdCI6MTY3MzA3NDg4OCwiZXhwIjoxNjc1NjY2ODg4fQ.lSDOvNG2hyFEzzznQvw8d2vHsRxhf6yaY-MIsWjrpIM'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://admin.brikow.com/api/construction/contractor/getAllProjects'));

    request.headers.addAll(headers);

    print("verify req:" + request.toString());
    print("verify head:" + request.headers.toString());

    print(request);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      result = jsonDecode(await response.stream.bytesToString())
          as Map<String, dynamic>;

      print(result["response"][0]["Name"]);

      //print(await response.stream.bytesToString());
      // Navigator.pushNamed(context, 'myverify');
      print("data GET SUccessful");
    } else {
      print(response.reasonPhrase);
      print("failed");
    }
    print(response.statusCode);
  }

  void _onItemTapped(int index) {
    print("index");
    setState(() {
      print("index1 ");
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  addproject() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjkxODM3NWU3MjE4ZTc1ODIwMmY2MyIsImlhdCI6MTY3NDg5ODg3NCwiZXhwIjoxNjc3NDkwODc0fQ.VsJHU1Evf2H1BYRXi-iMXFRfzwGbnku_xfbUUtEdeJI'
    };
    var request = http.Request(
        'POST', Uri.parse('http://admin.brikow.com/api/contractor/getProject'));
    request.body = json.encode({"Name": this.name});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Widget _homeWidget(int index) {
    if (index == 0) {
      print("object");
      createBox();
      _getProjectData();
      return new Container(
        child: _buildHome(),
      );
    } else {
      print("object1");
      return new Container(
          child: //_widgetOptions.elementAt(2),
              _buildProfile());
    }
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  Widget _buildProfile() {
    return Container(
      child: Text("Profile"),
    );
  }

  Widget _buildHome() {
    print("buidl");
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 0,
              ),
              Container(
                //padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    IconButton(
                      color: Colors.blueGrey,
                      highlightColor: Colors.black54,
                      iconSize: 30,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        logout();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => MyPhone(title: 'landing'),
                          ),
                        );
                        box1.clear();
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Welcome",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 28,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),

              // const Text(
              //   "Projects                                 ",
              //   style: TextStyle(fontSize: 30),
              // ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Your Projects                                                ",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),

              Container(
                child: GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: result["response"] == null
                      ? []
                      : List.generate(
                          //box2.get('isLogged',defaultValue: false)?MyPhone(title: "phone"):Verify(),
                          result["response"]
                              .length, //this is the total number of cards
                          (index) {
                            return Container(
                              child: Card(
                                  color: Color.fromARGB(210, 88, 40, 205),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: "Date: " +
                                                    result["response"][index]
                                                            ["Date"]
                                                        .substring(0, 10) +
                                                    "\n",
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.7),
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          //mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Icon(
                                                      Icons.work,
                                                      color: Colors.white,
                                                      //size: 30,
                                                    )
                                                  ],
                                                )),
                                            Expanded(
                                                flex: 2,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: result["response"]
                                                                            [
                                                                            index]
                                                                        ["Name"]
                                                                    .toUpperCase() +
                                                                "\n",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: "Location: ",
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                    fontSize: 14),
                                              ),
                                              TextSpan(
                                                text: result["response"][index]
                                                    ["Location"],
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.8),
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: "Material: ",
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                    fontSize: 14),
                                              ),
                                              TextSpan(
                                                text: result["response"][index]
                                                        ["withMaterial"] +
                                                    "\n",
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.8),
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  //Text(result["response"][index]["Name"]),
                                  ),
                            );
                          },
                        ),
                ),
              ),
              const SizedBox(
                width: 20,
                height: 40,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 350,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // addproject();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => third(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.add_circle_outline_outlined,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ), //icon data for elevated button
                    label: Text(
                      "Add Project",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 22),
                    ), //label text
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        width: 1,
                        color: Color.fromARGB(21, 88, 40, 205),
                      ),
                      primary: Color.fromARGB(210, 88, 40, 205),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ), //elevated btton background color
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromARGB(210, 88, 40, 205),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Account',
            ),
          ],
          onTap: (index) {
            print(index);
            setState(() {
              _selectedIndex = index;
            });
            print(_selectedIndex);
          },
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: _homeWidget(_selectedIndex),
        ),
      ),
    );
  }
}
