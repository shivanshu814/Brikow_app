// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'api.dart';
import 'fourth.dart';
import 'main.dart';

// ignore: camel_case_types
class third extends StatefulWidget {
  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  late Box box2;
  late Box box3;
  void initState() {
    super.initState();
    createBox();
  }

  void createBox() async {
    box1 = await Hive.openBox('logindata');
    box3 = await Hive.openBox('projectdata');
  }

  bool _checkbox = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  bool _checkbox4 = false;
  bool _checkbox5 = false;
  bool _checkbox6 = false;
  String dropdownvalue = 'SQM';
  String dropdownvalue2 = 'SQM';
  String dropdownvalue3 = 'SQM';
  String dropdownvalue4 = 'SQM';
  String dropdownvalue5 = 'SQM';
  String dropdownvalue6 = 'SQM';

  var items = [
    'SQM',
    'SFT',
  ];
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController withMaterial = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController unit = TextEditingController();

  @override
  _savedata() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjkxODM3NWU3MjE4ZTc1ODIwMmY2MyIsImlhdCI6MTY3MzA3NDg4OCwiZXhwIjoxNjc1NjY2ODg4fQ.lSDOvNG2hyFEzzznQvw8d2vHsRxhf6yaY-MIsWjrpIM'
    };
    var request = http.Request('POST',
        Uri.parse('http://admin.brikow.com/api/construction/contractor/add_project'));
    request.body = json.encode({
      "Name": name.text,
      "Location": location.text,
      'withMaterial': withMaterial.text,
      'work': [
         {'description':'Layout','rate': rate.text, 'unit': unit.text},
        {'description':'Excavation','rate': rate.text, 'unit': unit.text}
      ]
    });
    request.headers.addAll(headers);

    print("verify req:" + request.toString());
    print("verify body:" + request.body);
    print("verify head:" + request.headers.toString());

    http.StreamedResponse response = await request.send();





    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      // Navigator.pushNamed(context, 'myverify');
      Navigator.pushReplacementNamed(context, 'fourth');
      print("data posted");
    } else {
      print(response.reasonPhrase);
      print("failed");
    }
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(224, 234, 242, 1),
        title: Text(
          'Add Project',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              width: 345.0,
              height: 55,
              color: Colors.grey.shade300,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.tips_and_updates_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: name,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: " Project Title",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 345.0,
              height: 55,
              color: Colors.grey.shade300,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.location_on_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: location,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: " Location",
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
              children: [
                Checkbox(
                  value: this._checkbox,
                  onChanged: (value) {
                    setState(
                      () {
                        this._checkbox = !_checkbox;
                      },
                    );
                  },
                ),
                Text(
                  'Excavation',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 120.0,
                  height: 35,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: rate,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade600), //<-- SEE HERE
                            ),
                            hintText: "Rate",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  height: 35,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade600),
                  ),
                  child: DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map(
                      (String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      },
                    ).toList(),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          dropdownvalue = newValue!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Checkbox(
                  value: this._checkbox2,
                  onChanged: (value) {
                    setState(
                      () {
                        this._checkbox2 = !_checkbox2;
                      },
                    );
                  },
                ),
                Text(
                  'PCC',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 120.0,
                  height: 35,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade600), //<-- SEE HERE
                            ),
                            hintText: "Rate",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  height: 35,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade600),
                  ),
                  child: DropdownButton(
                    value: dropdownvalue2,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map(
                      (String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      },
                    ).toList(),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          dropdownvalue2 = newValue!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Checkbox(
                  value: this._checkbox3,
                  onChanged: (value) {
                    setState(
                      () {
                        this._checkbox3 = !_checkbox3;
                      },
                    );
                  },
                ),
                Text(
                  'Reinforcement With Tools',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 120.0,
                  height: 35,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade600), //<-- SEE HERE
                            ),
                            hintText: "Rate",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  height: 35,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade600),
                  ),
                  child: DropdownButton(
                    value: dropdownvalue3,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map(
                      (String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      },
                    ).toList(),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          dropdownvalue3 = newValue!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Checkbox(
                  value: this._checkbox4,
                  onChanged: (value) {
                    setState(
                      () {
                        this._checkbox4 = !_checkbox4;
                      },
                    );
                  },
                ),
                Text(
                  'Shuttering',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 120.0,
                  height: 35,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade600), //<-- SEE HERE
                            ),
                            hintText: "Rate",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  height: 35,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade600),
                  ),
                  child: DropdownButton(
                    value: dropdownvalue4,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map(
                      (String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      },
                    ).toList(),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          dropdownvalue4 = newValue!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Checkbox(
                  value: this._checkbox5,
                  onChanged: (value) {
                    setState(
                      () {
                        this._checkbox5 = !_checkbox5;
                      },
                    );
                  },
                ),
                Text(
                  'RCC Casting',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 120.0,
                  height: 35,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade600), //<-- SEE HERE
                            ),
                            hintText: "Rate",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  height: 35,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade600),
                  ),
                  child: DropdownButton(
                    value: dropdownvalue5,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map(
                      (String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      },
                    ).toList(),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          dropdownvalue5 = newValue!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Checkbox(
                  value: this._checkbox6,
                  onChanged: (value) {
                    setState(
                      () {
                        this._checkbox6 = !_checkbox6;
                      },
                    );
                  },
                ),
                Text(
                  'Brick Work',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 120.0,
                  height: 35,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade600), //<-- SEE HERE
                            ),
                            hintText: "Rate",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  height: 35,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade600),
                  ),
                  child: DropdownButton(
                    value: dropdownvalue6,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map(
                      (String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      },
                    ).toList(),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          dropdownvalue6 = newValue!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 250,
                  height: 35,
                  child: ElevatedButton.icon(
                    onPressed: () {

                      box3.put('name', name.text);
                      box3.put('location', location.text);

                      print(box3.get("name"));
                      print(box3.get("location"));

                      _savedata();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => fourth(),
                      //   ),
                      // );
                    },
                    icon: Icon(
                      Icons.save,
                      color: Colors.red.shade200,
                    ), //icon data for elevated button
                    label: Text(
                      "Save and Next",
                      style:
                          TextStyle(color: Colors.red.shade200, fontSize: 18),
                    ), //label text
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 2, color: Colors.red.shade200),
                        // ignore: deprecated_member_use
                        primary: Colors.white //elevated btton background color
                        ),
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                SizedBox(
                  height: 14,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





// GestureDetector(
                //   onTap: () {
                //     _savedata();
                //   },
                //   child: Container(
                //     width: 230,
                //     height: 45,
                //     decoration: BoxDecoration(
                //       color: Colors.red.shade200,
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: Center(
                //       child: Text("Save and Next"),
                //     ),
                //   ),
                // ),
                