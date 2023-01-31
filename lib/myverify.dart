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
  List items = [];
  int _selectedIndex = 0;
  late Box box2;
  String name = "";

  void _onItemTapped(int index) {
    print("index");
    setState(() {
      print("index1");
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
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Projects                                 ",
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Your Projects                                                ",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          // Card(
          //   elevation: 5, // the size of the shadow
          //   shadowColor: Colors.black, // shadow color
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          //   color: Colors.red.shade100,
          //   margin: const EdgeInsets.symmetric(
          //     vertical: 10.0,
          //     horizontal: 25.0,
          //   ),
          //   child: const ListTile(
          //     title: Text(
          //       'Project Name       13-12-2022\n\n',
          //       style: TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.bold,
          //           letterSpacing: 1.0,
          //           fontSize: 18.0),
          //     ),
          //     trailing: Icon(
          //       Icons.location_on_outlined,
          //       color: Colors.black,
          //     ),
          //     subtitle: Text(
          //       'Location',
          //       style: TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.bold,
          //           letterSpacing: 1.0,
          //           fontSize: 15.0),
          //     ),
          //   ),
          // ),
          // Card(
          //   elevation: 5, // the size of the shadow
          //   shadowColor: Colors.black, // shadow color

          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          //   color: Colors.red.shade100,
          //   margin: const EdgeInsets.symmetric(
          //     vertical: 10.0,
          //     horizontal: 25.0,
          //   ),
          //   child: const ListTile(
          //     title: Text(
          //       'Project Name       13-12-2022\n\n',
          //       style: TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.bold,
          //           letterSpacing: 1.0,
          //           fontSize: 18.0),
          //     ),
          //     trailing: Icon(
          //       Icons.location_on_outlined,
          //       color: Colors.black,
          //     ),
          //     subtitle: Text(
          //       'Location',
          //       style: TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.bold,
          //           letterSpacing: 1.0,
          //           fontSize: 15.0),
          //     ),
          //   ),
          // ),
          // Card(
          //   elevation: 5, // the size of the shadow
          //   shadowColor: Colors.black, // shadow color
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          //   color: Colors.red.shade100,
          //   margin: const EdgeInsets.symmetric(
          //     vertical: 10.0,
          //     horizontal: 25.0,
          //   ),
          //   child: const ListTile(
          //     title: Text(
          //       'Project Name       13-12-2022\n\n',
          //       style: TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.bold,
          //           letterSpacing: 1.0,
          //           fontSize: 18.0),
          //     ),
          //     trailing: Icon(
          //       Icons.location_on_outlined,
          //       color: Colors.black,
          //     ),
          //     subtitle: Text(
          //       'Location',
          //       style: TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.bold,
          //           letterSpacing: 1.0,
          //           fontSize: 15.0),
          //     ),
          //   ),
          // ),
          const SizedBox(
            width: 20,
            height: 40,
          ),
          Center(
            child: SizedBox(
              width: 320,
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
                  color: Colors.black,
                ), //icon data for elevated button
                label: Text(
                  "Add Project",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ), //label text
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 3, color: Colors.blue),
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ), //elevated btton background color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => MyPhone(title: 'Phone')));
                box1.clear();
              },
              child: Icon(
                Icons.logout,
                color: Colors.black54,
              ),
            ),
          ],
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.black),
          ),
          //backgroundColor: Colors.red.shade100,
          backgroundColor: Color.fromRGBO(224, 234, 242, 1),
          // leading: BackButton(
          //   onPressed: (){
          //     Navigator.of(context).pushReplacement(
          //         //MaterialPageRoute(builder: (context) => CustomerRegistration("${widget.mobile}")));
          //         MaterialPageRoute(builder: (context) => LoginScreen()));
          //   },
          // ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red.shade100,
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
          //  currentIndex: _selectedIndex,
          // // onTap: _onItemTapped,
          //  onTap: (index){
          //
          //    setState(() {
          //      print("index1");
          //      _selectedIndex = index;
          //      print(_selectedIndex);
          //    });
          //  }
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

// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.red.shade100,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle_outlined),
//             label: 'Account',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//       backgroundColor: Colors.white,
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             SizedBox(
//               height: 60,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Text(
//               "Projects                                 ",
//               style: TextStyle(fontSize: 30),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             const Text(
//               "Your Projects                                                ",
//               style: TextStyle(fontSize: 20),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             // Card(
//             //   elevation: 5, // the size of the shadow
//             //   shadowColor: Colors.black, // shadow color
//             //   shape: RoundedRectangleBorder(
//             //     borderRadius: BorderRadius.circular(15),
//             //   ),
//             //   color: Colors.red.shade100,
//             //   margin: const EdgeInsets.symmetric(
//             //     vertical: 10.0,
//             //     horizontal: 25.0,
//             //   ),
//             //   child: const ListTile(
//             //     title: Text(
//             //       'Project Name       13-12-2022\n\n',
//             //       style: TextStyle(
//             //           color: Colors.black,
//             //           fontWeight: FontWeight.bold,
//             //           letterSpacing: 1.0,
//             //           fontSize: 18.0),
//             //     ),
//             //     trailing: Icon(
//             //       Icons.location_on_outlined,
//             //       color: Colors.black,
//             //     ),
//             //     subtitle: Text(
//             //       'Location',
//             //       style: TextStyle(
//             //           color: Colors.black,
//             //           fontWeight: FontWeight.bold,
//             //           letterSpacing: 1.0,
//             //           fontSize: 15.0),
//             //     ),
//             //   ),
//             // ),
//             // Card(
//             //   elevation: 5, // the size of the shadow
//             //   shadowColor: Colors.black, // shadow color
//
//             //   shape: RoundedRectangleBorder(
//             //     borderRadius: BorderRadius.circular(15),
//             //   ),
//             //   color: Colors.red.shade100,
//             //   margin: const EdgeInsets.symmetric(
//             //     vertical: 10.0,
//             //     horizontal: 25.0,
//             //   ),
//             //   child: const ListTile(
//             //     title: Text(
//             //       'Project Name       13-12-2022\n\n',
//             //       style: TextStyle(
//             //           color: Colors.black,
//             //           fontWeight: FontWeight.bold,
//             //           letterSpacing: 1.0,
//             //           fontSize: 18.0),
//             //     ),
//             //     trailing: Icon(
//             //       Icons.location_on_outlined,
//             //       color: Colors.black,
//             //     ),
//             //     subtitle: Text(
//             //       'Location',
//             //       style: TextStyle(
//             //           color: Colors.black,
//             //           fontWeight: FontWeight.bold,
//             //           letterSpacing: 1.0,
//             //           fontSize: 15.0),
//             //     ),
//             //   ),
//             // ),
//             // Card(
//             //   elevation: 5, // the size of the shadow
//             //   shadowColor: Colors.black, // shadow color
//             //   shape: RoundedRectangleBorder(
//             //     borderRadius: BorderRadius.circular(15),
//             //   ),
//             //   color: Colors.red.shade100,
//             //   margin: const EdgeInsets.symmetric(
//             //     vertical: 10.0,
//             //     horizontal: 25.0,
//             //   ),
//             //   child: const ListTile(
//             //     title: Text(
//             //       'Project Name       13-12-2022\n\n',
//             //       style: TextStyle(
//             //           color: Colors.black,
//             //           fontWeight: FontWeight.bold,
//             //           letterSpacing: 1.0,
//             //           fontSize: 18.0),
//             //     ),
//             //     trailing: Icon(
//             //       Icons.location_on_outlined,
//             //       color: Colors.black,
//             //     ),
//             //     subtitle: Text(
//             //       'Location',
//             //       style: TextStyle(
//             //           color: Colors.black,
//             //           fontWeight: FontWeight.bold,
//             //           letterSpacing: 1.0,
//             //           fontSize: 15.0),
//             //     ),
//             //   ),
//             // ),
//             const SizedBox(
//               width: 20,
//               height: 40,
//             ),
//             Center(
//               child: SizedBox(
//                 width: 320,
//                 height: 55,
//                 child: ElevatedButton.icon(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => third(),
//                       ),
//                     );
//                   },
//                   icon: Icon(
//                     Icons.add_circle_outline_outlined,
//                     color: Colors.black,
//                   ), //icon data for elevated button
//                   label: Text(
//                     "Add Project",
//                     style: TextStyle(color: Colors.black, fontSize: 25),
//                   ), //label text
//                   style: ElevatedButton.styleFrom(
//                     side: BorderSide(width: 3, color: Colors.blue),
//                     primary: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ), //elevated btton background color
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
