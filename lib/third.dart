// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'fourth.dart';

// ignore: camel_case_types
class third extends StatelessWidget {
  String answer = "Yes";
  TextEditingController ProjectNameController = TextEditingController();
  TextEditingController LocationController = TextEditingController();
  TextEditingController StartDateController = TextEditingController();
  // TextEditingController MaterialsController = TextEditingController();
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
                  )
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
                      child: Row(
                        children: [
                          const Text(
                            "With Materials",
                            style: TextStyle(fontSize: 15),
                          ),
                          Radio(
                            value: 1,
                            groupValue: 'Yes',
                            onChanged: (index) {},
                          ),
                          Expanded(
                            child: Text('Yes'),
                          )
                        ],
                      ),
                      // flex: 1,
                    ),
                    Expanded(
                      // ignore: sort_child_properties_last
                      child: Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: 'No',
                            onChanged: (index) {},
                          ),
                          Expanded(
                            child: Text('No'),
                          )
                        ],
                      ),
                      flex: 1,
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
                      color: Colors.grey.shade300,
                      width: 120.0,
                      height: 35,
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
                      color: Colors.grey.shade300,
                      width: 120.0,
                      height: 35,
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
                      width: 80.0,
                      height: 35,
                      color: Colors.grey.shade300,
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
                SizedBox(
                  height: 5,
                ),
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
                      width: 80.0,
                      height: 35,
                      color: Colors.grey.shade300,
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
                SizedBox(
                  height: 5,
                ),
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
                      width: 80.0,
                      height: 35,
                      color: Colors.grey.shade300,
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
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 5,
                ),
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
                      width: 80.0,
                      height: 35,
                      color: Colors.grey.shade300,
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
                SizedBox(
                  height: 5,
                ),
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
                      adddata();
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

  Future<void> adddata() async {
    final ProjectName = ProjectNameController.text;
    final Location = LocationController.text;
    final Start = StartDateController.text;
    final ItemName = ItemController.text;
    final Rate = RateController.text;
    final Unit = UnitController.text;
    final body = {
      "projectname": ProjectName,
      "location": Location,
      "start": Start,
      "itemname": ItemName,
      "rate": Rate,
      "unit": Unit,
      "is_completed": false,
    };
    final url = "http://admin.brikow.com/api/contractor/add_project";
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      ProjectNameController.text = '';
      LocationController.text = '';
      StartDateController.text = '';
      ItemController.text = '';
      RateController.text = '';
      UnitController.text = '';

      print("Success");
      // showsucess("Success Fully Created Project");
    } else {
      // showfailure("Failed in Project Creation");
      print("Failure");
    }

    print(response.statusCode);
    print(response.body);
  }

  void setState(Null Function() param0) {}
}
