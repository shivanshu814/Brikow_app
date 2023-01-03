// ignore_for_file: prefer_const_constructors, sort_child_properties_last, camel_case_types

import 'package:flutter/material.dart';

class sixth extends StatelessWidget {
  const sixth({super.key});

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
                "Profile                                                          ",
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
                          hintText: "   Contractor",
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
                    Icon(Icons.person),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "   Your Name",
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
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.phone_android_sharp),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "   Mobile Number",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          "     GST        ",
                          style: TextStyle(fontSize: 15),
                        ),
                        Radio(
                          value: 0,
                          groupValue: 'Registered',
                          onChanged: (index) {},
                        ),
                        Expanded(
                          child: Text('Registered'),
                        )
                      ],
                    ),
                    // flex: 1,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: 'null',
                          onChanged: (index) {},
                        ),
                        Expanded(
                          child: Text('UnRegistered'),
                        )
                      ],
                    ),
                    flex: 1,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Center(
                    child: Container(
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
                          Icon(Icons.copy),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "   GST Number",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                    height: 15,
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
                        Icon(Icons.copy),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "   PAN Number",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                        Icon(Icons.house_sharp),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "   Firm/Company Name",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 10,
                  ),
                  SizedBox(
                    width: 180,
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
                        "Save Profile              ",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ), //label text
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 2, color: Colors.redAccent),
                          primary:
                              Colors.redAccent //elevated btton background color
                          ),
                    ),
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
