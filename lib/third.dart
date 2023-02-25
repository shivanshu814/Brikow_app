// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable
import 'dart:convert';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:textfield_search/textfield_search.dart';
import 'api.dart';
import 'fourth.dart';
import 'main.dart';

// ignore: camel_case_types
class third extends StatefulWidget {
  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  ////////////////////////////////////////////////

  final dummyList = ['Excavation','PCC','Reinorcement Wit Tools','Shuttering','RCC Casting','Brick Work'];
  final dummList2 = ['Mumbai','Delhi','Bangalore','Hyderabad','Ahmedabad','Chennai','Kolkata','Surat','Vadodara','Pune','Jaipur',
  'Lucknow','Kanpur','Nagpur','Indore','Thane','Bhopal','Visakhapatnam','Pimpri-Chinchwad','Patna','Ghaziabad','Ludhiana'
    'Nashik','Faridabad','Meerut','Rajkot','Kalyan-Dombivli','Vasai-Virar','Varanasi','Srinagar','Aurangabad','Dhanbad','Amritsar'
        ,'Navi Mumbai','Allahabad','Howrah','Ranchi','Gwalior','Jabalpur','Coimbatore','Vijayawada','Jodhpur','Madurai'
    'Kota','Chandigarh','Guwahati','Solapur','Hubli–Dharwad','Bareilly','Mysore','Moradabad','Gurgaon','Aligarh','Jalandhar',
        'Tiruchirappalli','Bhubaneswar','Salem','Mira-Bhayandar','Thiruvananthapuram','Bhiwandi','Saharanpur','Gorakhpur','Guntur',
    'Amravati'];




  Map<TextField, List> controllerMap = {};
  Map<SimpleAutoCompleteTextField, List> controllerMap1 = {};
  Map<String, List> controllerMapInvoice = {};
  Map<String, Map> titleMap = {};
  //Map<TextField, List> controllerMapInvoice = {};
  //Map<String, Map> titleMap = {};
  Map<TextField, List> fieldMap = {};
  Map<SimpleAutoCompleteTextField, List> fieldMap1 = {};


  final TextEditingController _titleController = new TextEditingController();

  List<TextEditingController> _descriptionControllers = [];
  List<TextField> _descriptionFields = [];

  List<TextEditingController> _briefControllers = [];
  List<TextField> _briefFields = [];
  List<TextEditingController> _nosControllers = [];
  List<TextField> _nosFields = [];
  List<TextEditingController> _hgtControllers = [];
  List<TextField> _hgtFields = [];
  List<TextEditingController> _lenControllers = [];
  List<TextField> _lenFields = [];
  List<TextEditingController> _wthControllers = [];
  List<TextField> _wthFields = [];
  List<TextEditingController> _qtyControllers = [];
  List<TextField> _qtyFields = [];

  List<Container> _conFields = [];
  List<Container> _conFields1 = [];

  final _okController = TextEditingController();

  @override
  void dispose() {
    for (final controller in _descriptionControllers) {
      controller.dispose();
    }
    for (final controller in _briefControllers) {
      controller.dispose();
    }
    for (final controller in _nosControllers) {
      controller.dispose();
    }
    for (final controller in _hgtControllers) {
      controller.dispose();
    }
    for (final controller in _lenControllers) {
      controller.dispose();
    }
    for (final controller in _wthControllers) {
      controller.dispose();
    }
    for (final controller in _qtyControllers) {
      controller.dispose();
    }
    _okController.dispose();
    super.dispose();
  }
  ///////////////////////////////////////

  late Box box2;
  late Box box3;
  String token = "";

  String dropdownvalue8 = 'Yes';
  var items2 = [
    'Yes',
    'No',
  ];

  void initState() {
    super.initState();
    createBox();

    ////////////
    List<TextEditingController> _descriptionControllers = [];
    List<TextField> _descriptionFields = [];

    List<TextEditingController> _briefControllers = [];
    List<TextField> _briefFields = [];
    List<TextEditingController> _nosControllers = [];
    List<TextField> _nosFields = [];
    List<TextEditingController> _hgtControllers = [];
    List<TextField> _hgtFields = [];
    List<TextEditingController> _lenControllers = [];
    List<TextField> _lenFields = [];
    List<TextEditingController> _wthControllers = [];
    List<TextField> _wthFields = [];
    List<TextEditingController> _qtyControllers = [];
    List<TextField> _qtyFields = [];

    List<Container> _conFields = [];

    //final brief = new TextEditingController();
    GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
    final TextEditingController brief = new TextEditingController();
    final briefField = _generateBriefTextField(brief, "Description",key);

    final nos = TextEditingController();
    final hgt = TextEditingController();
    // final len = TextEditingController();
    // final wth = TextEditingController();
    // final qty = TextEditingController();

    final nosField = _generateTextFieldBr2(nos, 'Rate');

    var itemsVal = [
      'SQM',
      'SFY',
    ];

    String dropdownval = 'SQM';
    final hgtField = _generateDropDown(hgt, 'SQM/SFY',dropdownval);
    //final hgtField = _generateTextFieldBr2(hgt, 'SQM/SFY');


   // final lenField = _generateTextFieldBr2(len, 'Len');
    //final wthField = _generateTextFieldBr2(wth, 'Wth');
    //final qtyField = _generateTextFieldBr2(qty, 'Qty');

    final con = _generateBreifContainer(
        nosField, hgtField);

    _briefControllers.add(brief);
    _nosControllers.add(nos);
    _hgtControllers.add(hgt);
    // _lenControllers.add(len);
    // _wthControllers.add(wth);
    // _qtyControllers.add(qty);

    //_descriptionFields.add(descField);
    // _briefFields.add(briefField);
    // _nosFields.add(nosField);
    // _hgtFields.add(hgtField);
    // // _lenFields.add(lenField);
    // // _wthFields.add(wthField);
    // // _qtyFields.add(qtyField);
    //
    // _conFields.add(con);

    // controllerMap[descField] = [
    //   desc,
    //   _briefControllers,
    //   _nosControllers,
    //   _hgtControllers,
    //   _lenControllers,
    //   _wthControllers,
    //   _qtyControllers
    // ];
    // fieldMap[descField] = [
    //   _briefFields,
    //   _nosFields,
    //   _hgtFields,
    //   _lenFields,
    //   _wthFields,
    //   _qtyFields,
    //   _conFields
    // ];

    fieldMap1[briefField] = [nosField, hgtField, con];
    controllerMap1[briefField] = [brief,nos,dropdownval];

    /////////////
  }

  ////////////////
  Widget _listViewfinal() {
    print(fieldMap1);
    fieldMap1.forEach((k, v) => print(v[2]));

    List<Widget> list = <Widget>[];
    fieldMap1.forEach(
      (k, v) {
        list.add(
          Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: InputDecorator(
              child: Column(
                children: [
                 // k,
                  //for (var i = 0; i < fieldMap1.length; i++)
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          color: Color.fromRGBO(213, 212, 255, 0.39),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: k,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        //color: Colors.red.shade300,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(2),
                                            bottomRight: Radius.circular(2))),
                                    child: _deleteBrief1(k),
                                  )
                                ],
                              ),
                              v[2]//[0],
                            ],
                          ),
                        ),
                      ],
                    ),
                  // _addBrief(k, v[0].length+1),
                  //   //_conFields[i]
                  // _deleteDetail(k),


                ],
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        );
      },
    );
    return SingleChildScrollView(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true, // Only if you have layout issue
        children: list,
      ),
    );
  }

  Widget _deleteBrief1(SimpleAutoCompleteTextField tf) {
    return IconButton(
      icon: Icon(
        Icons.cancel_rounded,
        color: Colors.black54,
      ),
      style: IconButton.styleFrom(
          backgroundColor: Color.fromRGBO(213, 212, 255, 0.39)),
      onPressed: () {
        setState(
          () {

            fieldMap1.remove(tf);
            controllerMap1.remove(tf);

            // fieldMap1.forEach(
            //   (k, v) {
            //     if (k == tf) {
            //       print("found");
            //       print(v[0]);
            //       v[0].removeAt(i);
            //       v[1].removeAt(i);
            //       v[2].removeAt(i);
            //       // v[3].removeAt(i);
            //       // v[4].removeAt(i);
            //       // v[5].removeAt(i);
            //       // v[6].removeAt(i);
            //     }
            //   },
            // );

            // controllerMap.forEach(
            //   (k, v) {
            //     if (k == tf) {
            //       print("found");
            //       print(v[0]);
            //       v[1].removeAt(i);
            //       v[2].removeAt(i);
            //       v[3].removeAt(i);
            //       v[4].removeAt(i);
            //       v[5].removeAt(i);
            //       v[6].removeAt(i);
            //     }
            //   },
            // );
          },
        );
      },
    );
  }

  Widget _addBrief(TextField tf, int i) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(bottom: 10),
      child: TextButton.icon(
        onPressed: () {
          List<TextEditingController> _briefControllers = [];
          List<TextField> _briefFields = [];
          List<TextEditingController> _nosControllers = [];
          List<TextField> _nosFields = [];
          List<TextEditingController> _hgtControllers = [];
          List<TextField> _hgtFields = [];
          List<TextEditingController> _lenControllers = [];
          List<TextField> _lenFields = [];
          List<TextEditingController> _wthControllers = [];
          List<TextField> _wthFields = [];
          List<TextEditingController> _qtyControllers = [];
          List<TextField> _qtyFields = [];

          List<Container> _conFields = [];
          List<Container> _conFields1 = [];

          //final brief = new TextEditingController();
          GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
          final TextEditingController brief = new TextEditingController();
          final briefField = _generateBriefTextField(brief, "Description",key);

          final nos = TextEditingController();
          final hgt = TextEditingController();
          final len = TextEditingController();
          final wth = TextEditingController();
          final qty = TextEditingController();

          final nosField = _generateTextFieldBr2(nos, 'Rate');



          final hgtField = _generateTextFieldBr2(hgt, 'SQM/SFT');
          final lenField = _generateTextFieldBr2(len, 'Len');
          final wthField = _generateTextFieldBr2(wth, 'Wth');
          final qtyField = _generateTextFieldBr2(qty, 'Qty');

          final con;
          // = _generateBreifContainer(
          //     nosField, hgtField);

          setState(
            () {
              fieldMap1.forEach(
                (k, v) {
                  if (k == tf) {
                    print("found");
                    print(v[0]);
                    // v[0].add(briefField);
                    v[0].add(nosField);
                    v[1].add(hgtField);
                    // v[3].add(lenField);
                    // v[4].add(wthField);
                    // v[5].add(qtyField);
                   // v[2].add(con);
                  }
                },
              );

              controllerMap.forEach(
                (key, v) {
                  if (key == tf) {
                    v[1].add(brief);
                    v[2].add(nos);
                    v[3].add(hgt);
                    v[4].add(len);
                    v[5].add(wth);
                    v[6].add(qty);
                  }
                },
              );

              print(briefField);
              print(_briefFields);
              print("====");
              print(_briefFields);

             // _conFields.add(con);
            },
          );

          print(fieldMap1[tf]);
        },
        style: TextButton.styleFrom(
            fixedSize: const Size(100, 50),
            foregroundColor: Colors.red,
            elevation: 2,
            backgroundColor: Colors.white),
        icon: Icon(Icons.add),
        label: Text('Add Brieff'),
      ),
    );
  }

  Widget _addBrief1() {
    return Container(
      alignment: Alignment.centerRight,
      width: 150,
      margin: EdgeInsets.only(bottom: 10, top: 10),
      child: Ink(
        decoration: const ShapeDecoration(
          color: Color.fromRGBO(89, 44, 204, 1),
          shape: CircleBorder(),
        ),
        child: IconButton(
          iconSize: 30,
          icon: const Icon(Icons.add),
          color: Colors.white,
          onPressed: () {
            List<TextEditingController> _briefControllers = [];
            List<TextField> _briefFields = [];
            List<TextEditingController> _nosControllers = [];
            List<TextField> _nosFields = [];
            List<TextEditingController> _hgtControllers = [];
            List<TextField> _hgtFields = [];
            List<TextEditingController> _lenControllers = [];
            List<TextField> _lenFields = [];
            List<TextEditingController> _wthControllers = [];
            List<TextField> _wthFields = [];
            List<TextEditingController> _qtyControllers = [];
            List<TextField> _qtyFields = [];

            List<Container> _conFields = [];
            List<Container> _conFields1 = [];

            GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
            TextEditingController brief = new TextEditingController();
            final briefField = _generateBriefTextField(brief, "Description",key);

            final nos = TextEditingController();
            final hgt = TextEditingController();
            // final len = TextEditingController();
            // final wth = TextEditingController();
            // final qty = TextEditingController();

            final nosField = _generateTextFieldBr2(nos, 'Rate');

            String dropdownval = 'SQM';
            List itemsVal = [
              'SQM',
              'SFY',
            ];
            final hgtField = _generateDropDown(hgt, 'SQM/SFY',dropdownval);

            //final hgtField = _generateTextFieldBr2(hgt, 'SQM/SFT');
            // final lenField = _generateTextFieldBr2(len, 'Len');
            // final wthField = _generateTextFieldBr2(wth, 'Wth');
            // final qtyField = _generateTextFieldBr2(qty, 'Qty');

            final con = _generateBreifContainer(
                nosField, hgtField);

            TextField tf1;
            setState(
              () {
                fieldMap1[briefField]=[nosField,hgtField,con];
                controllerMap1[briefField]=[brief,nos,dropdownval];


                // fieldMap1.forEach(
                //   (k, v) {
                //     if (k == tf) {
                //       print("found");
                //       print(v[0]);
                //       // v[0].add(briefField);
                //       v[0].add(nosField);
                //       v[1].add(hgtField);
                //       // v[3].add(lenField);
                //       // v[4].add(wthField);
                //       // v[5].add(qtyField);
                //       v[2].add(con);
                //     }
                //   },
                // );
                //
                // controllerMap1.forEach(
                //   (key, v) {
                //     if (key == tf) {
                //       v[1].add(brief);
                //       v[2].add(nos);
                //       v[3].add(hgt);
                //       // v[4].add(len);
                //       // v[5].add(wth);
                //       // v[6].add(qty);
                //     }
                //   },
                // );

                print(briefField);
                print(_briefFields);
                print("====");
                print(_briefFields);

                _conFields.add(con);
              },
            );

            print("euououou");
            print(fieldMap1);
            fieldMap1.forEach((key, value) {print(value);});
            print("hat");
          },
        ),
      ),
    );
  }


  SimpleAutoCompleteTextField _generateBriefTextField(
      TextEditingController controller, String hint,GlobalKey<AutoCompleteTextFieldState<String>> key) {
    return SimpleAutoCompleteTextField(
      controller: controller,
      decoration: InputDecoration(
        //  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
      suggestions:dummyList, key: key,
    );
  }

  TextField _generateTextFieldBr2(
      TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  DropdownButton _generateDropDown(
      TextEditingController controller, String hint, String dropdownval) {
    var itemsVal = [
      'SQM',
      'SFY',
    ];

    return DropdownButton(
      isExpanded: true,
      // style: GoogleFonts.lato(
      //   textStyle: TextStyle(
      //       color: Colors.black54,
      //       letterSpacing: .2,
      //       fontSize: 16,
      //       fontWeight: FontWeight.w600
      //   ),
      // ),
      value: dropdownval,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: itemsVal.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),

        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (var newValue) {
        print("ey");
        setState(() {
          print("Drop: "+dropdownval.toString());
          print("new: "+newValue.toString());
          dropdownval = newValue!;
          print("Drop1: "+dropdownval.toString());
        });
        print("ey");
        print("Drop2: "+dropdownval.toString());
      },
    );
  }

  Container _generateBreifContainer(TextField Nos, DropdownButton Hgt) {
    return Container(
      margin: EdgeInsets.only(top: 0),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // use whichever suits your need
        children: <Widget>[
          Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  child: Nos)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Hgt,
            ),
          ),
          // Expanded(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          //     child: Len,
          //   ),
          // ),
          // Expanded(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          //     child: Wth,
          //   ),
          // ),
          // Expanded(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          //     child: Qty,
          //   ),
          // ),
        ],
      ),
    );
  }
  ////////////////

  void createBox() async {
    box1 = await Hive.openBox('logindata');
    box3 = await Hive.openBox('projectdata');
    setState(() {
      print("token");
      token = box1.get("token").toString();
      print(box1.get("token"));
    });
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
      'Cookie': token
      // 'Cookie':
      //     'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjkxODM3NWU3MjE4ZTc1ODIwMmY2MyIsImlhdCI6MTY3MzA3NDg4OCwiZXhwIjoxNjc1NjY2ODg4fQ.lSDOvNG2hyFEzzznQvw8d2vHsRxhf6yaY-MIsWjrpIM'
    };

    final now = new DateTime.now();
    String formatter = DateFormat('yMd').format(now);

    var request = http.Request(
        'POST',
        Uri.parse(
            'http://admin.brikow.com/api/construction/contractor/add_project'));
    request.body = json.encode({
      "Name": name.text,
      "Location": location.text,
      "Date": formatter,
      'withMaterial': "Yes",
      'work': [
        {'description': 'Layout', 'rate': "1", 'unit': "SQM"},
        {'description': 'Excavation', 'rate': "1", 'unit': "SQM"}
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
      box3.put('date', formatter);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => fourth(location.text, name.text, formatter),
        ),
      );
      print("data posted");
    } else {
      print(response.reasonPhrase);
      print("failed");
    }
    print(response.statusCode);
  }

  GlobalKey<AutoCompleteTextFieldState<String>> keyLoc = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(210, 88, 40, 205),
        title: Text(
          'Add Project',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 25,
            ),

            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text("Project Title",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(113, 63, 250, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
              padding: EdgeInsets.only(left: 5),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.only(left: 6, top: 4, right: 6, bottom: 4),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 245, 245, 1),
                  border: Border.all(color: Color.fromRGBO(245, 245, 245, 1)),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.only(top: 1, left: 15, right: 15),
              child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: name,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  //contentPadding: EdgeInsets.all(1),
                  hintText: "Enter Project Title",
                  prefixIcon: Icon(Icons.tips_and_updates_outlined),
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),

            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text("Location",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(113, 63, 250, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
              padding: EdgeInsets.only(left: 5),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.only(left: 6, top: 4, right: 6, bottom: 4),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 245, 245, 1),
                  border: Border.all(color: Color.fromRGBO(245, 245, 245, 1)),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.only(top: 1, left: 15, right: 15),
              child: SimpleAutoCompleteTextField(
                // onChanged: (value) {
                //   setState(() {});
                // },
                controller: location,
                //textAlign: TextAlign.start,
                //textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  //contentPadding: EdgeInsets.all(1),
                  hintText: "Enter Location",
                  prefixIcon: Icon(Icons.location_on_outlined),
                ), key: keyLoc, suggestions: dummList2,
              ),
            ),

            SizedBox(
              height: 15,
            ),

            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text("With Material",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(113, 63, 250, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
              padding: EdgeInsets.only(left: 5),
            ),
            SizedBox(
              height: 5,
            ),

            Container(
                margin: EdgeInsets.only(top: 1, left: 15, right: 15),
                padding: EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(245, 245, 245, 1),
                    border: Border.all(color: Color.fromRGBO(245, 245, 245, 1)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                //margin: EdgeInsets.only(top: 1),
                child: DropdownButton(
                  isExpanded: true,

                  value: dropdownvalue8,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items2.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue8 = newValue!;
                    });
                  },
                )),

            SizedBox(
              height: 15,
            ),

            _listViewfinal(),

            Row(
              children: <Widget>[
                Expanded(child: _addBrief1()),
                SizedBox(
                  width: 50,
                ),
                //Expanded(child: _deleteDetail(k)),
              ],
            ),

            SizedBox(
              height: 15,
            ),

            // Container(
            //   alignment: Alignment.centerRight,
            //     padding: EdgeInsets.only(right: 15),
            //     child: Ink(
            //   decoration: const ShapeDecoration(
            //
            //     color: Color.fromRGBO(89, 44, 204, 1),
            //     shape: CircleBorder(),
            //   ),
            //   child: IconButton(
            //     iconSize: 30,
            //     icon: const Icon(Icons.add),
            //     color: Colors.white,
            //     onPressed: () {
            //
            //     },
            //   ),
            // )),

            // Container(
            //   width: 125.0,
            //   height: 55,
            //   color: Colors.grey.shade300,
            //   child: Row(
            //     children: [
            //       SizedBox(
            //         width: 10,
            //       ),
            //
            //       Icon(Icons.tips_and_updates_outlined),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Expanded(
            //         child: TextField(
            //           controller: name,
            //           keyboardType: TextInputType.name,
            //           decoration: InputDecoration(
            //             border: InputBorder.none,
            //             hintText: " Project Title",
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // Container(
            //   width: 345.0,
            //   height: 55,
            //   color: Colors.grey.shade300,
            //   child: Row(
            //     children: [
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Icon(Icons.location_on_outlined),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Expanded(
            //         child: TextField(
            //           controller: location,
            //           keyboardType: TextInputType.name,
            //           decoration: InputDecoration(
            //             border: InputBorder.none,
            //             hintText: " Location1",
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 15,
            ),
            // Row(
            //   children: [
            //     Checkbox(
            //       value: this._checkbox,
            //       onChanged: (value) {
            //         setState(
            //           () {
            //             this._checkbox = !_checkbox;
            //           },
            //         );
            //       },
            //     ),
            //     Text(
            //       'Excavation',
            //       style: TextStyle(fontSize: 20),
            //     ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: 50,
            //     ),
            //     Container(
            //       alignment: Alignment.center,
            //       width: 110.0,
            //       height: 50,
            //       color: Colors.white,
            //       child: Row(
            //         children: [
            //           Expanded(
            //             child: TextField(
            //               controller: rate,
            //               textAlignVertical: TextAlignVertical.center,
            //               textAlign: TextAlign.left,
            //               maxLines: 1,
            //               keyboardType: TextInputType.phone,
            //               decoration: InputDecoration(
            //                 contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            //                 enabledBorder: OutlineInputBorder(
            //                   borderSide: BorderSide(
            //                       color: Colors.grey.shade600), //<-- SEE HERE
            //                 ),
            //                 hintText: "Rate",
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(
            //       width: 50,
            //     ),
            //     Container(
            //       height: 50,
            //       width: 110,
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(5),
            //         border: Border.all(color: Colors.grey.shade600),
            //       ),
            //       child: DropdownButton(
            //         value: dropdownvalue,
            //         icon: const Icon(Icons.keyboard_arrow_down),
            //         items: items.map(
            //           (String items) {
            //             return DropdownMenuItem(
            //               value: items,
            //               child: Text(items),
            //             );
            //           },
            //         ).toList(),
            //         onChanged: (String? newValue) {
            //           setState(
            //             () {
            //               dropdownvalue = newValue!;
            //             },
            //           );
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 14,
            // ),
            // Row(
            //   children: [
            //     Checkbox(
            //       value: this._checkbox2,
            //       onChanged: (value) {
            //         setState(
            //           () {
            //             this._checkbox2 = !_checkbox2;
            //           },
            //         );
            //       },
            //     ),
            //     Text(
            //       'PCC',
            //       style: TextStyle(fontSize: 20),
            //     ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: 50,
            //     ),
            //     Container(
            //       alignment: Alignment.center,
            //       width: 110.0,
            //       height: 50,
            //       color: Colors.white,
            //       child: Row(
            //         children: [
            //           Expanded(
            //             child: TextField(
            //               textAlignVertical: TextAlignVertical.center,
            //               textAlign: TextAlign.left,
            //               maxLines: 1,
            //               keyboardType: TextInputType.phone,
            //               decoration: InputDecoration(
            //                 contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            //                 enabledBorder: OutlineInputBorder(
            //                   borderSide: BorderSide(
            //                       color: Colors.grey.shade600), //<-- SEE HERE
            //                 ),
            //                 hintText: "Rate",
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(
            //       width: 50,
            //     ),
            //     Container(
            //       width: 110.0,
            //       height: 50,
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(5),
            //         border: Border.all(color: Colors.grey.shade600),
            //       ),
            //       child: DropdownButton(
            //         value: dropdownvalue2,
            //         icon: const Icon(Icons.keyboard_arrow_down),
            //         items: items.map(
            //           (String items) {
            //             return DropdownMenuItem(
            //               value: items,
            //               child: Text(items),
            //             );
            //           },
            //         ).toList(),
            //         onChanged: (String? newValue) {
            //           setState(
            //             () {
            //               dropdownvalue2 = newValue!;
            //             },
            //           );
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 14,
            // ),
            // Row(
            //   children: [
            //     Checkbox(
            //       value: this._checkbox3,
            //       onChanged: (value) {
            //         setState(
            //           () {
            //             this._checkbox3 = !_checkbox3;
            //           },
            //         );
            //       },
            //     ),
            //     Text(
            //       'Reinforcement With Tools',
            //       style: TextStyle(fontSize: 20),
            //     ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: 50,
            //     ),
            //     Container(
            //       alignment: Alignment.center,
            //       width: 110.0,
            //       height: 50,
            //       color: Colors.white,
            //       child: Row(
            //         children: [
            //           Expanded(
            //             child: TextField(
            //               textAlignVertical: TextAlignVertical.center,
            //               textAlign: TextAlign.left,
            //               maxLines: 1,
            //               keyboardType: TextInputType.phone,
            //               decoration: InputDecoration(
            //                 contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            //                 enabledBorder: OutlineInputBorder(
            //                   borderSide: BorderSide(
            //                       color: Colors.grey.shade600), //<-- SEE HERE
            //                 ),
            //                 hintText: "Rate",
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(
            //       width: 50,
            //     ),
            //     Container(
            //       width: 110.0,
            //       height: 50,
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(5),
            //         border: Border.all(color: Colors.grey.shade600),
            //       ),
            //       child: DropdownButton(
            //         value: dropdownvalue3,
            //         icon: const Icon(Icons.keyboard_arrow_down),
            //         items: items.map(
            //           (String items) {
            //             return DropdownMenuItem(
            //               value: items,
            //               child: Text(items),
            //             );
            //           },
            //         ).toList(),
            //         onChanged: (String? newValue) {
            //           setState(
            //             () {
            //               dropdownvalue3 = newValue!;
            //             },
            //           );
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 14,
            // ),
            // Row(
            //   children: [
            //     Checkbox(
            //       value: this._checkbox4,
            //       onChanged: (value) {
            //         setState(
            //           () {
            //             this._checkbox4 = !_checkbox4;
            //           },
            //         );
            //       },
            //     ),
            //     Text(
            //       'Shuttering',
            //       style: TextStyle(fontSize: 20),
            //     ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: 50,
            //     ),
            //     Container(
            //       alignment: Alignment.center,
            //       width: 110.0,
            //       height: 50,
            //       color: Colors.white,
            //       child: Row(
            //         children: [
            //           Expanded(
            //             child: TextField(
            //               textAlignVertical: TextAlignVertical.center,
            //               textAlign: TextAlign.left,
            //               maxLines: 1,
            //               keyboardType: TextInputType.phone,
            //               decoration: InputDecoration(
            //                 contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            //                 enabledBorder: OutlineInputBorder(
            //                   borderSide: BorderSide(
            //                       color: Colors.grey.shade600), //<-- SEE HERE
            //                 ),
            //                 hintText: "Rate",
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(
            //       width: 50,
            //     ),
            //     Container(
            //       width: 110.0,
            //       height: 50,
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(5),
            //         border: Border.all(color: Colors.grey.shade600),
            //       ),
            //       child: DropdownButton(
            //         value: dropdownvalue4,
            //         icon: const Icon(Icons.keyboard_arrow_down),
            //         items: items.map(
            //           (String items) {
            //             return DropdownMenuItem(
            //               value: items,
            //               child: Text(items),
            //             );
            //           },
            //         ).toList(),
            //         onChanged: (String? newValue) {
            //           setState(
            //             () {
            //               dropdownvalue4 = newValue!;
            //             },
            //           );
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 14,
            // ),
            // Row(
            //   children: [
            //     Checkbox(
            //       value: this._checkbox5,
            //       onChanged: (value) {
            //         setState(
            //           () {
            //             this._checkbox5 = !_checkbox5;
            //           },
            //         );
            //       },
            //     ),
            //     Text(
            //       'RCC Casting',
            //       style: TextStyle(fontSize: 20),
            //     ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: 50,
            //     ),
            //     Container(
            //       alignment: Alignment.center,
            //       width: 110.0,
            //       height: 50,
            //       color: Colors.white,
            //       child: Row(
            //         children: [
            //           Expanded(
            //             child: TextField(
            //               textAlignVertical: TextAlignVertical.center,
            //               textAlign: TextAlign.left,
            //               maxLines: 1,
            //               keyboardType: TextInputType.phone,
            //               decoration: InputDecoration(
            //                 contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            //                 enabledBorder: OutlineInputBorder(
            //                   borderSide: BorderSide(
            //                       color: Colors.grey.shade600), //<-- SEE HERE
            //                 ),
            //                 hintText: "Rate",
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(
            //       width: 50,
            //     ),
            //     Container(
            //       width: 110.0,
            //       height: 50,
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(5),
            //         border: Border.all(color: Colors.grey.shade600),
            //       ),
            //       child: DropdownButton(
            //         value: dropdownvalue5,
            //         icon: const Icon(Icons.keyboard_arrow_down),
            //         items: items.map(
            //           (String items) {
            //             return DropdownMenuItem(
            //               value: items,
            //               child: Text(items),
            //             );
            //           },
            //         ).toList(),
            //         onChanged: (String? newValue) {
            //           setState(
            //             () {
            //               dropdownvalue5 = newValue!;
            //             },
            //           );
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 14,
            // ),
            // Row(
            //   children: [
            //     Checkbox(
            //       value: this._checkbox6,
            //       onChanged: (value) {
            //         setState(
            //           () {
            //             this._checkbox6 = !_checkbox6;
            //           },
            //         );
            //       },
            //     ),
            //     Text(
            //       'Brick Work',
            //       style: TextStyle(fontSize: 20),
            //     ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: 50,
            //     ),
            //     Container(
            //       alignment: Alignment.center,
            //       width: 110.0,
            //       height: 50,
            //       color: Colors.white,
            //       child: Row(
            //         children: [
            //           Expanded(
            //             child: TextField(
            //               textAlignVertical: TextAlignVertical.center,
            //               textAlign: TextAlign.left,
            //               maxLines: 1,
            //               keyboardType: TextInputType.phone,
            //               decoration: InputDecoration(
            //                 contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            //                 enabledBorder: OutlineInputBorder(
            //                   borderSide: BorderSide(
            //                       color: Colors.grey.shade600), //<-- SEE HERE
            //                 ),
            //                 hintText: "Rate",
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(
            //       width: 50,
            //     ),
            //     Container(
            //       width: 110.0,
            //       height: 50,
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(5),
            //         border: Border.all(color: Colors.grey.shade600),
            //       ),
            //       child: DropdownButton(
            //         value: dropdownvalue6,
            //         icon: const Icon(Icons.keyboard_arrow_down),
            //         items: items.map(
            //           (String items) {
            //             return DropdownMenuItem(
            //               value: items,
            //               child: Text(items),
            //             );
            //           },
            //         ).toList(),
            //         onChanged: (String? newValue) {
            //           setState(
            //             () {
            //               dropdownvalue6 = newValue!;
            //             },
            //           );
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 273,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      box3.put('name', name.text);
                      box3.put('location', location.text);

                      print(box3.get("name"));
                      print(box3.get("location"));

                      _savedata();
                    },
                    icon: Icon(
                      Icons.save,
                      color: Color.fromARGB(210, 88, 40, 205),
                      size: 22,
                    ), //icon data for elevated button
                    label: Text(
                      "Save and Next",
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    ), //label text
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(
                            width: 2,
                            color: Color.fromARGB(210, 198, 177, 255)),
                        // ignore: deprecated_member_use
                        primary: Colors.white //elevated btton background color
                        ),
                  ),
                ),
                SizedBox(
                  width: 59,
                  height: 14,
                ),
              ],
            ),
            SizedBox(
              height: 44,
            ),
          ],
        ),
      ),
    );
  }
}
