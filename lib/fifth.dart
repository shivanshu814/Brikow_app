// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:phone_otp_ui/sixth.dart';

class fifth extends StatelessWidget {
  const fifth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "  Generate Bill                                                ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 345.0,
                height: 55,
                color: Colors.grey.shade300,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.engineering_outlined),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "   Title",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
                height: 15,
              ),
              Text(
                "Details                                                         ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 345.0,
                height: 55,
                color: Colors.grey.shade300,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.description),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "   Description",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 345.0,
                height: 55,
                color: Colors.grey.shade300,
                // ignore: duplicate_ignore
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.contact_page_outlined),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "   Brief",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 40.0,
                    height: 35,
                    color: Colors.grey.shade300,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        SizedBox(
                          width: 1,
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: 12),
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "  Nos",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 50.0,
                    height: 35,
                    color: Colors.grey.shade300,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        SizedBox(
                          width: 1,
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: 12),
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "  Length",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey.shade300,
                    width: 50.0,
                    height: 35,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        SizedBox(
                          width: 2,
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: 12),
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "  Width",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey.shade300,
                    width: 50.0,
                    height: 35,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        SizedBox(
                          width: 2,
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: 12),
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "  Height",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey.shade300,
                    width: 70.0,
                    height: 35,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        SizedBox(
                          width: 2,
                        ),
                        Icon(Icons.arrow_drop_down_sharp),
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: 12),
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "  Unit",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 140,
                    height: 45,
                    child: SizedBox(
                      width: 110,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: null,
                        child: const Text(
                          'Add Brief',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 140,
                    height: 45,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => sixth(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.add_outlined,
                        color: Colors.white,
                      ), //icon data for elevated button
                      label: Text(
                        "Add Details",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ), //label text
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 2, color: Colors.redAccent),
                          primary: Colors.red //elevated btton background color
                          ),
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                ],
              ),
              SizedBox(
                height: 160,
                width: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 120,
                    height: 45,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => sixth(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.format_align_justify_sharp,
                        color: Colors.redAccent,
                      ), //icon data for elevated button
                      label: Text(
                        "Finish",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ), //label text
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 2, color: Colors.redAccent),
                          primary:
                              Colors.white //elevated btton background color
                          ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 220,
                    height: 45,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => sixth(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.save,
                        color: Colors.redAccent,
                      ), //icon data for elevated button
                      label: Text(
                        "Save and Create new Title",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ), //label text
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 2, color: Colors.redAccent),
                          primary:
                              Colors.white //elevated btton background color
                          ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
