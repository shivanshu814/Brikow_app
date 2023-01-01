// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, camel_case_types, duplicate_ignore, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:phone_otp_ui/third.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);
  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        ),
        backgroundColor: Colors.white,
        body: Container(
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
                "Projects                             ",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Your Projects                                         ",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 5, // the size of the shadow
                shadowColor: Colors.black, // shadow color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.red.shade100,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: const ListTile(
                  title: Text(
                    'Project Name       13-12-2022\n\n',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 18.0),
                  ),
                  trailing: Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                  ),
                  subtitle: Text(
                    'Location',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 15.0),
                  ),
                ),
              ),
              Card(
                elevation: 5, // the size of the shadow
                shadowColor: Colors.black, // shadow color

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.red.shade100,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: const ListTile(
                  title: Text(
                    'Project Name       13-12-2022\n\n',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 18.0),
                  ),
                  trailing: Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                  ),
                  subtitle: Text(
                    'Location',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 15.0),
                  ),
                ),
              ),
              Card(
                elevation: 5, // the size of the shadow
                shadowColor: Colors.black, // shadow color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.red.shade100,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: const ListTile(
                  title: Text(
                    'Project Name       13-12-2022\n\n',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 18.0),
                  ),
                  trailing: Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                  ),
                  subtitle: Text(
                    'Location',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 15.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 320,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {
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
            ],
          ),
        ),
      ),
    );
  }
}
