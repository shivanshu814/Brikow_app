// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, camel_case_types, duplicate_ignore, prefer_const_constructors

import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:phone_otp_ui/fourth.dart';
import 'package:phone_otp_ui/main.dart';
import 'package:phone_otp_ui/phone.dart';
import 'package:phone_otp_ui/third.dart';
import 'package:phone_otp_ui/third.dart';

import 'landing.dart';

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
    return (Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(217, 151, 113, 227),
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Home',
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Verify(),
              ),
            );
          },
        ),
        title: Text(
          'Welcome',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 3,
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
                      height: 420,
                      width: 520,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            opacity: (20),
                            image: AssetImage("images/crane.gif"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Text(
                  "A smarter, better way to manage Billling,",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Text(
                  "Property Management & Investment",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                ),
              ),
              SizedBox(
                height: 50,
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
                      primary: Color.fromARGB(210, 113, 64, 235),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ), //elevated btton background color
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _addProject() {
    return Container(
      child: Text("Profile"),
    );
  }

  Widget _buildHome() {
    print("build");
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
                      color: Color.fromARGB(255, 0, 0, 0),
                      highlightColor: Color.fromARGB(255, 0, 0, 0),
                      iconSize: 40,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => Landing(),
                          ),
                        );
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Add Project",
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
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "                                      Your Projects",
                      style: TextStyle(
                          color: Color.fromRGBO(237, 99, 0, 1),
                          fontSize: 23,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
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
                            return GestureDetector(
                              onTap: (){

                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => fourth(result["response"][index]["Location"], result["response"][index]["Name"], result["response"][index]["Date"].substring(0, 10)),
                                  ),
                                );
                              },
                                child: Container(
                              child: Card(
                                  color: Color.fromARGB(217, 151, 113, 227),
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
                                                    color: Color.fromARGB(
                                                            255, 0, 0, 0)
                                                        .withOpacity(0.7),
                                                    fontSize: 15),
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
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
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
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0),
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
                                                    color: Color.fromARGB(
                                                            255, 0, 0, 0)
                                                        .withOpacity(0.5),
                                                    fontSize: 15),
                                              ),
                                              TextSpan(
                                                text: result["response"][index]
                                                    ["Location"],
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                            255, 0, 0, 0)
                                                        .withOpacity(0.8),
                                                    fontSize: 15),
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
                                                    color: Color.fromARGB(
                                                            255, 0, 0, 0)
                                                        .withOpacity(0.5),
                                                    fontSize: 15),
                                              ),
                                              TextSpan(
                                                text: result["response"][index]
                                                        ["withMaterial"] +
                                                    "\n",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                            255, 0, 0, 0)
                                                        .withOpacity(0.8),
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  //Text(result["response"][index]["Name"]),
                                  ),
                            ));
                          },
                        ),
                ),
              ),
              const SizedBox(
                width: 20,
                height: 40,
              ),
              // Container(
              //   alignment: Alignment.bottomCenter,
              //   child: SizedBox(
              //     width: 350,
              //     height: 55,
              //     child: ElevatedButton.icon(
              //       onPressed: () {
              //         // addproject();
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => third(),
              //           ),
              //         );
              //       },
              //       icon: Icon(
              //         Icons.add_circle_outline_outlined,
              //         color: Color.fromARGB(255, 255, 255, 255),
              //       ), //icon data for elevated button
              //       label: Text(
              //         "Add Project",
              //         style: TextStyle(
              //             color: Color.fromARGB(255, 255, 255, 255),
              //             fontSize: 22),
              //       ), //label text
              //       style: ElevatedButton.styleFrom(
              //         side: BorderSide(
              //           width: 1,
              //           color: Color.fromARGB(21, 88, 40, 205),
              //         ),
              //         primary: Color.fromARGB(210, 113, 64, 235),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20),
              //         ), //elevated btton background color
              //       ),
              //     ),
              //   ),
              // )
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
          backgroundColor: Color.fromARGB(217, 151, 113, 227),
          selectedItemColor: Color.fromARGB(210, 0, 0, 0),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add Project',
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
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: _homeWidget(_selectedIndex),
        ),
      ),
    );
  }
}
