// ignore: camel_case_types
// ignore_for_file: unnecessary_import, camel_case_types, prefer_const_constructors, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_otp_ui/fifth1.dart';

import 'fifth.dart';

class fourth extends StatelessWidget {
  const fourth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    width: 330,
                    height: 30,
                    child: const Text(
                      "                                                                 Edit",
                      style: TextStyle(color: Colors.black, fontSize: 18),
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
                      vertical: 20.0,
                      horizontal: 35.0,
                    ),
                    child: const ListTile(
                      title: Text(
                        'Project Name          13-12-2022\n\n',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            fontSize: 15.0),
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
                    height: 30,
                  ),
                  const Text(
                    "Functions                                ",
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 260,
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Fifth(),
                          ),
                        );
                      },
                      child: const Text(
                        "Create Bill",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 260,
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const fifth(),
                          ),
                        );
                      },
                      child: const Text(
                        "Employees",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 260,
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const fifth(),
                          ),
                        );
                      },
                      child: const Text(
                        "Expenses",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 260,
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const fifth(),
                          ),
                        );
                      },
                      child: const Text(
                        "Recieving",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
