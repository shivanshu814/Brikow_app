// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'fourth.dart';

// ignore: camel_case_types
class third extends StatelessWidget {
  String answer = 'Yes';
  TextEditingController ProjectNameController = TextEditingController();
  TextEditingController LocationController = TextEditingController();
  TextEditingController StartDateController = TextEditingController();
  TextEditingController MaterialsController = TextEditingController();
  TextEditingController ItemController = TextEditingController();
  TextEditingController RateController = TextEditingController();
  TextEditingController UnitController = TextEditingController();

  BuildContext? get context => null;

  // const third({super.key});

  @override
  Widget build(BuildContext context) {
    var items;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              "Add Project                                                  ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 360.0,
                  height: 55,
                  color: Colors.grey.shade300,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.home_work_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          controller: ProjectNameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Project Name",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 360.0,
              height: 55,
              color: Colors.grey.shade300,
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.location_on),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: LocationController,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Location",
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 360.0,
              height: 55,
              color: Colors.grey.shade300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.calendar_month_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: StartDateController,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Start Date",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextField(
                        controller: MaterialsController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "With Materials",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            const Text(
              "Items                                                                     ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 120.0,
                      height: 35,
                      color: Colors.grey.shade300,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            width: 1,
                          ),
                          Icon(
                            Icons.add_chart_rounded,
                            size: 0,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              controller: ItemController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "\tItem Name",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 120.0,
                      height: 35,
                      color: Colors.grey.shade300,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            width: 1,
                          ),
                          Icon(
                            Icons.add_chart_rounded,
                            size: 0,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              controller: RateController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "  Rate/Unit",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.grey.shade300,
                      width: 80.0,
                      height: 35,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            width: 1,
                          ),
                          Icon(Icons.arrow_drop_down_sharp),
                          Expanded(
                            child: TextField(
                              controller: UnitController,
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
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 100,
                  height: 35,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => fourth(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.add_outlined,
                      color: Colors.redAccent,
                    ), //icon data for elevated button
                    label: Text(
                      "Add",
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ), //label text
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 2, color: Colors.redAccent),
                        // ignore: deprecated_member_use
                        primary: Colors.white //elevated btton background color
                        ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    adddata();
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
        // body: ListView.builder(
        //   itemCount: items.length,
        //   itemBuilder: (context, index) {
        //     final item = items[index] as Map;
        //     return ListTile(
        //       title: Text(item['Project Name']),
        //       subtitle: Text(item['location']),
        //     );
        //   },
        // ),
      ),
    );
  }

  void adddata() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjkxODM3NWU3MjE4ZTc1ODIwMmY2MyIsImlhdCI6MTY3MzA3NDg4OCwiZXhwIjoxNjc1NjY2ODg4fQ.lSDOvNG2hyFEzzznQvw8d2vHsRxhf6yaY-MIsWjrpIM'
    };
    var request = http.Request('POST',
        Uri.parse('http://admin.brikow.com/api/contractor/add_project'));
    request.body = json.encode(
      {
        "Name": ProjectNameController,
        "Location": LocationController,
        "withMaterial": MaterialsController,
        "work": {
          ItemController: {"rate": RateController, "unit": UnitController},
        }
      },
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      ProjectNameController.text = '';
      LocationController.text = '';
      MaterialsController.text = '';
      ItemController.text = '';
      RateController.text = '';
      UnitController.text = '';
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  void setState(Null Function() param0) {}
}
