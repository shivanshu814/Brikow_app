import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:phone_otp_ui/fifth.dart';
import 'package:phone_otp_ui/fourth.dart';
import 'package:phone_otp_ui/invoice.dart';
import 'package:phone_otp_ui/page/pdf_page.dart';
import 'package:phone_otp_ui/sixth.dart';

class Fifth extends StatefulWidget {
  @override
  FifthState createState() => FifthState();
}

class FifthState extends State<Fifth> {
  late Box box1;

  Map<TextField, List> controllerMap = {};
  Map<String, List> controllerMapInvoice = {};
  Map<String, Map> titleMap  = {};
  //Map<TextField, List> controllerMapInvoice = {};
  //Map<String, Map> titleMap = {};
  Map<TextField, List> fieldMap = {};

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    createBox();

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

    final desc = TextEditingController();
    final descField = _generateBriefTextField(desc, "Description");

    final brief = TextEditingController();
    final briefField = _generateBriefTextField(brief, "Brief");

    final nos = TextEditingController();
    final hgt = TextEditingController();
    final len = TextEditingController();
    final wth = TextEditingController();
    final qty = TextEditingController();

    final nosField = _generateTextFieldBr2(nos, 'Nos');
    final hgtField = _generateTextFieldBr2(hgt, 'Hgt');
    final lenField = _generateTextFieldBr2(len, 'Len');
    final wthField = _generateTextFieldBr2(wth, 'Wth');
    final qtyField = _generateTextFieldBr2(qty, 'Qty');

    final con = _generateBreifContainer(
        nosField, hgtField, lenField, wthField, qtyField);

    _descriptionControllers.add(desc);
    _briefControllers.add(brief);
    _nosControllers.add(nos);
    _hgtControllers.add(hgt);
    _lenControllers.add(len);
    _wthControllers.add(wth);
    _qtyControllers.add(qty);

    _descriptionFields.add(descField);
    _briefFields.add(briefField);
    _nosFields.add(nosField);
    _hgtFields.add(hgtField);
    _lenFields.add(lenField);
    _wthFields.add(wthField);
    _qtyFields.add(qtyField);

    _conFields.add(con);

    controllerMap[descField] = [
      desc,
      _briefControllers,
      _nosControllers,
      _hgtControllers,
      _lenControllers,
      _wthControllers,
      _qtyControllers
    ];
    fieldMap[descField] = [
      _briefFields,
      _nosFields,
      _hgtFields,
      _lenFields,
      _wthFields,
      _qtyFields,
      _conFields
    ];
  }

  void createBox() async {
    box1 = await Hive.openBox('bill');
  }

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

  Container _firstTitleCon() {
    return Container(
      child: Column(
        children: [
          Text(
            "Details                                                           ",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: 355.0,
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
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: _titleController,
                    keyboardType: TextInputType.name,
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
            width: 355.0,
            height: 55,
            margin: EdgeInsets.only(bottom: 0),
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
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "   Brief",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 25, right: 25, top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // use whichever suits your need
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nos',
                      ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Hgt',
                      ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Len',
                      ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Wth',
                      ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Qty',
                      ),
                    ),
                  )),
                ],
              )),
          _addTile(),
        ],
      ),
    );
  }

  Widget _firstTitle() {
    return Container(
      child: Column(
        children: [
          Container(
            width: 355.0,
            height: 55,
            color: Color.fromRGBO(255, 239, 244, 1),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.engineering_outlined),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: _titleController,
                    keyboardType: TextInputType.name,
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
            height: 25,
          ),
          Text(
            "Details                                                           ",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  Widget _addTile() {
    return ListTile(
      title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
            width: 150,
            margin: EdgeInsets.only(bottom: 10),
            child: TextButton.icon(
              onPressed: () {
                final brief = TextEditingController();
                final nos = TextEditingController();
                final hgt = TextEditingController();
                final len = TextEditingController();
                final wth = TextEditingController();
                final qty = TextEditingController();

                final briefField = _generateBriefTextField(brief, "Brief");

                final nosField = _generateTextFieldBr2(nos, 'Nos');
                final hgtField = _generateTextFieldBr2(hgt, 'Hgt');
                final lenField = _generateTextFieldBr2(len, 'Len');
                final wthField = _generateTextFieldBr2(wth, 'Wth');
                final qtyField = _generateTextFieldBr2(qty, 'Qty');

                final con = _generateBreifContainer(
                    nosField, hgtField, lenField, wthField, qtyField);

                // final nosField = _generateTextField(nos, "nos");
                // final hgtField = _generateTextField(hgt, "hgt");
                // final lenField = _generateTextField(len, "len");
                // final wthField = _generateTextField(wth, "wth");
                // final qtyField = _generateTextField(qty, "qty");

                setState(() {
                  _briefControllers.add(brief);
                  _nosControllers.add(nos);
                  _hgtControllers.add(hgt);
                  _lenControllers.add(len);
                  _wthControllers.add(wth);
                  _qtyControllers.add(qty);

                  _briefFields.add(briefField);
                  _nosFields.add(nosField);
                  _hgtFields.add(hgtField);
                  _lenFields.add(lenField);
                  _wthFields.add(wthField);
                  _qtyFields.add(qtyField);

                  _conFields.add(con);
                });
              },
              style: TextButton.styleFrom(
                  fixedSize: const Size(100, 50),
                  foregroundColor: Colors.red,
                  elevation: 2,
                  backgroundColor: Colors.white),
              icon: Icon(Icons.add),
              label: Text('Add Brief'),
            )),
        Container(
            width: 150,
            margin: EdgeInsets.only(bottom: 10),
            child: TextButton.icon(
              onPressed: () {
                //_firstTitle();
                // final brief = TextEditingController();
                // final nos = TextEditingController();
                // final hgt = TextEditingController();
                // final len = TextEditingController();
                // final wth = TextEditingController();
                // final qty = TextEditingController();
                //
                // final briefField = _generateBriefTextField(brief, "Brief");
                //
                // final nosField = _generateTextFieldBr2(nos,'Nos');
                // final hgtField = _generateTextFieldBr2(hgt,'Hgt');
                // final lenField = _generateTextFieldBr2(len,'Len');
                // final wthField = _generateTextFieldBr2(wth,'Wth');
                // final qtyField = _generateTextFieldBr2(qty,'Qty');
                //
                final con = _firstTitleCon();
                //
                // // final nosField = _generateTextField(nos, "nos");
                // // final hgtField = _generateTextField(hgt, "hgt");
                // // final lenField = _generateTextField(len, "len");
                // // final wthField = _generateTextField(wth, "wth");
                // // final qtyField = _generateTextField(qty, "qty");
                //
                //
                setState(() {
                  _conFields1.add(con);
                });
              },
              style: TextButton.styleFrom(
                  fixedSize: const Size(100, 50),
                  foregroundColor: Colors.red,
                  elevation: 2,
                  backgroundColor: Colors.white),
              icon: Icon(Icons.add),
              label: Text('Add Details'),
            ))
      ]),
      //title: Icon(Icons.add),
      onTap: () {},
    );
  }

  Widget _deleteBrief1(TextField tf, int i) {
    return IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        style: IconButton.styleFrom(backgroundColor: Colors.red.shade300),
        onPressed: () {
          setState(() {
            fieldMap.forEach((k, v) {
              if (k == tf) {
                print("found");
                print(v[0]);
                v[0].removeAt(i);
                v[1].removeAt(i);
                v[2].removeAt(i);
                v[3].removeAt(i);
                v[4].removeAt(i);
                v[5].removeAt(i);
                v[6].removeAt(i);
              }
            });

            controllerMap.forEach((k, v) {
              if (k == tf) {
                print("found");
                print(v[0]);
                v[1].removeAt(i);
                v[2].removeAt(i);
                v[3].removeAt(i);
                v[4].removeAt(i);
                v[5].removeAt(i);
                v[6].removeAt(i);
              }
            });
          });
        });
  }

  Widget _deleteBrief(TextField tf, int i) {
    return ListTile(
      title: Row(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                width: 50,
                //margin: EdgeInsets.only(bottom: 10),
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      fieldMap.forEach((k, v) {
                        if (k == tf) {
                          print("found");
                          print(v[0]);
                          v[0].removeAt(i);
                          v[1].removeAt(i);
                          v[2].removeAt(i);
                          v[3].removeAt(i);
                          v[4].removeAt(i);
                          v[5].removeAt(i);
                          v[6].removeAt(i);
                        }
                      });
                    });
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      elevation: 2,
                      backgroundColor: Colors.red.shade300),
                  icon: Icon(Icons.delete),
                  label: Text(''),
                ))
          ]),
      //title: Icon(Icons.add),
      onTap: () {},
    );
  }

  Widget _deleteDetail(TextField tf) {
// <<<<<<< HEAD
//
//     return
//             Container(
//                 width: 150,
//                 margin: EdgeInsets.only(bottom: 10),
//                 child: TextButton.icon(
//
//                   onPressed: () {
//                     setState(() {
//                       fieldMap.remove(tf);
//                       controllerMap.remove(tf);
//                     });
//
//                   },
//                   style: TextButton.styleFrom(
//                       fixedSize: const Size(100, 50),
//                       foregroundColor: Colors.white,
//                       elevation: 2,
//                       backgroundColor: Colors.blueGrey),
//                   icon: Icon(Icons.delete),
//                   label: Text('Delete Detail'),
//                 ));
// =======
    return Container(
        width: 150,
        margin: EdgeInsets.only(bottom: 10),
        child: TextButton.icon(
          onPressed: () {
            setState(() {
              fieldMap.remove(tf);
              controllerMap.remove(tf);
            });
          },
          style: TextButton.styleFrom(
              fixedSize: const Size(100, 50),
              foregroundColor: Colors.white,
              elevation: 2,
              backgroundColor: Colors.blueGrey),
          icon: Icon(Icons.remove),
          label: Text('Delete Detail'),
        ));
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

            final brief = new TextEditingController();
            final briefField = _generateBriefTextField(brief, "Brief");

            final nos = TextEditingController();
            final hgt = TextEditingController();
            final len = TextEditingController();
            final wth = TextEditingController();
            final qty = TextEditingController();

            final nosField = _generateTextFieldBr2(nos, 'Nos');
            final hgtField = _generateTextFieldBr2(hgt, 'Hgt');
            final lenField = _generateTextFieldBr2(len, 'Len');
            final wthField = _generateTextFieldBr2(wth, 'Wth');
            final qtyField = _generateTextFieldBr2(qty, 'Qty');

            final con = _generateBreifContainer(
                nosField, hgtField, lenField, wthField, qtyField);

            setState(() {
              fieldMap.forEach((k, v) {
                if (k == tf) {
                  print("found");
                  print(v[0]);
                  v[0].add(briefField);
                  v[1].add(nosField);
                  v[2].add(hgtField);
                  v[3].add(lenField);
                  v[4].add(wthField);
                  v[5].add(qtyField);
                  v[6].add(con);
                }
              });

              controllerMap.forEach((key, v) {
                if (key == tf) {
                  v[1].add(brief);
                  v[2].add(nos);
                  v[3].add(hgt);
                  v[4].add(len);
                  v[5].add(wth);
                  v[6].add(qty);
                }
              });

              // _briefControllers.add(brief);
              // _nosControllers.add(nos);
              // _hgtControllers.add(hgt);
              // _lenControllers.add(len);
              // _wthControllers.add(wth);
              // _qtyControllers.add(qty);

              // _briefFields.add(briefField);
              // _nosFields.add(nosField);
              // _hgtFields.add(hgtField);
              // _lenFields.add(lenField);
              // _wthFields.add(wthField);
              // _qtyFields.add(qtyField);

              print(briefField);
              print(_briefFields);
              print("====");
              print(_briefFields);

              _conFields.add(con);

              //fieldMap[tf] = [_briefFields, _nosFields, _hgtFields, _lenFields, _wthFields, _qtyFields, _conFields];
            });

            print(fieldMap[tf]);
            //controllerMap[_descriptionControllers[0]] = [_briefControllers, _nosControllers,_hgtControllers, _lenControllers, _wthControllers, _qtyControllers];
          },
          style: TextButton.styleFrom(
              fixedSize: const Size(100, 50),
              foregroundColor: Colors.red,
              elevation: 2,
              backgroundColor: Colors.white),
          icon: Icon(Icons.add),
          label: Text('Add Brief'),
        ));
  }

  Widget _addDetails() {
    return ListTile(
      title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
            width: 150,
            margin: EdgeInsets.only(bottom: 10),
            child: TextButton.icon(
              onPressed: () {
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

                final desc = TextEditingController();
                final descField = _generateBriefTextField(desc, "Description");

                final brief = TextEditingController();
                final briefField = _generateBriefTextField(brief, "Brief");

                final nos = TextEditingController();
                final hgt = TextEditingController();
                final len = TextEditingController();
                final wth = TextEditingController();
                final qty = TextEditingController();

                final nosField = _generateTextFieldBr2(nos, 'Nos');
                final hgtField = _generateTextFieldBr2(hgt, 'Hgt');
                final lenField = _generateTextFieldBr2(len, 'Len');
                final wthField = _generateTextFieldBr2(wth, 'Wth');
                final qtyField = _generateTextFieldBr2(qty, 'Qty');

                final con = _generateBreifContainer(
                    nosField, hgtField, lenField, wthField, qtyField);

                setState(() {
                  _descriptionControllers.add(desc);
                  _briefControllers.add(brief);
                  _nosControllers.add(nos);
                  _hgtControllers.add(hgt);
                  _lenControllers.add(len);
                  _wthControllers.add(wth);
                  _qtyControllers.add(qty);

                  _descriptionFields.add(descField);
                  _briefFields.add(briefField);
                  _nosFields.add(nosField);
                  _hgtFields.add(hgtField);
                  _lenFields.add(lenField);
                  _wthFields.add(wthField);
                  _qtyFields.add(qtyField);

                  _conFields.add(con);
                });

                controllerMap[descField] = [
                  desc,
                  _briefControllers,
                  _nosControllers,
                  _hgtControllers,
                  _lenControllers,
                  _wthControllers,
                  _qtyControllers
                ];
                fieldMap[descField] = [
                  _briefFields,
                  _nosFields,
                  _hgtFields,
                  _lenFields,
                  _wthFields,
                  _qtyFields,
                  _conFields
                ];
              },
              style: TextButton.styleFrom(
                  fixedSize: const Size(100, 50),
                  foregroundColor: Colors.red,
                  elevation: 2,
                  backgroundColor: Colors.white),
              icon: Icon(Icons.add),
              label: Text('Add Details'),
            ))
      ]),
      //title: Icon(Icons.add),
      onTap: () {},
    );
  }

  TextField _generateTextField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: hint,
      ),
    );
  }

  TextField _generateBriefTextField(
      TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.contact_page_outlined),
          prefixIconColor: Colors.black,
          //  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          hintText: hint,
          filled: true,
          fillColor: Colors.grey.shade300,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide.none,
          )),
    );
  }

  TextField _generateTextFieldBr2(
      TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hint,
      ),
    );
  }

  TextField _generateTextFieldDesc(
      TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hint,
      ),
    );
  }

  Container _generateBreifContainer(TextField Nos, TextField Hgt, TextField Len,
      TextField Wth, TextField Qty) {
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
            )),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Len,
            )),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Wth,
            )),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Qty,
            )),
          ],
        ));
  }

  Widget _listView() {
    final children = [
      for (var i = 0; i < _briefControllers.length; i++)
        Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          child: InputDecorator(
            child: Column(
              children: [
                _descriptionFields[i],
                _briefFields[i],
                // _nosFields[i],
                // _hgtFields[i],
                // _lenFields[i],
                // _wthFields[i],
                // _qtyFields[i],
                _conFields[i]
              ],
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        )
    ];
    return SingleChildScrollView(
      child: Column(
        children: children,
      ),
    );
  }

  Widget _listViewfinal() {
    fieldMap.forEach((k, v) => print(v[0].length));

    List<Widget> list = <Widget>[];
    fieldMap.forEach((k, v) {
      list.add(Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: InputDecorator(
          child: Column(
            children: [
              k,
              SizedBox(
                height: 3,
              ),
              for (var i = 0; i < v[0].length; i++)
                Column(children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: v[0][i],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red.shade300,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(2),
                                bottomRight: Radius.circular(2))),
                        child: _deleteBrief1(k, i),
                      )
                    ],
                  ),
                  v[6][i],
                ]),
              // _addBrief(k, v[0].length+1),
              //   //_conFields[i]
              // _deleteDetail(k),

              Row(
                children: <Widget>[
                  Expanded(child: _addBrief(k, v[0].length + 1)),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(child: _deleteDetail(k)),
                ],
              ),
            ],
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ));
    });

    final children = [
      // fieldMap.forEach((k,v) =>
      //     //print('${k}: ${v}')
      // Container(
      //   margin: EdgeInsets.only(left: 25, right: 25),
      //   child: InputDecorator(
      //     child: Column(
      //       children: [
      //         k,
      //         k,
      //         // _nosFields[i],
      //         // _hgtFields[i],
      //         // _lenFields[i],
      //         // _wthFields[i],
      //         // _qtyFields[i],
      //         k
      //       ],
      //     ),
      //     decoration: InputDecoration(
      //       border: InputBorder.none,
      //     ),
      //   ),
      // )
      // )
    ];
    // return SingleChildScrollView(child:ListView(
    //   shrinkWrap: true,
    //   children: list,
    // ));
    return SingleChildScrollView(
        child: ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true, // Only if you have layout issue
      children: list,
    ));
  }

  Widget _listView1() {
    final children = [
      for (var i = 0; i < _conFields1.length; i++)
        Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          child: InputDecorator(
            child: Column(
              children: [_conFields1[i]],
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        )
    ];
    return SingleChildScrollView(
      child: Column(
        children: children,
      ),
    );
  }

  final _okController = TextEditingController();

  Widget _okButton1(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 110,
          height: 45,
          child: ElevatedButton.icon(
            onPressed: () {
              String desc = "";

              if(box1.get("billvalue")!=null){
                print("hydro");
                print(box1.get("billvalue"));
                print(titleMap);
                titleMap = box1.get("billvalue");
              }


              controllerMap.forEach((key, v) {

                print(key);
                print(v);
                List a = [], b = [], c = [], d = [], e = [], f = [];
                for (int i = 0; i < v[1].length; i++) {

                  //List a = [], b = [], c = [], d = [], e = [], f = [];

                  print("=======");
                  print(i);
                  print(v[0].text);
                  desc = v[0].text;

                  print(v[1][i].text);
                  a.add(v[1][i].text);

                  print(v[2][i].text);
                  b.add(v[2][i].text);

                  print(v[3][i].text);
                  c.add(v[3][i].text);

                  print(v[4][i].text);
                  d.add(v[4][i].text);

                  print(v[5][i].text);
                  e.add(v[5][i].text);

                  print(v[6][i].text);
                  f.add(v[6][i].text);

                  print("=========");

                  controllerMapInvoice[key.toString()] = [desc, a, b, c, e, f];

                  //print(controllerMapInvoice[key.toString()]);


                }


              });

              titleMap[_titleController.text] = controllerMapInvoice;

              print(titleMap);

              //box1.get("billvalue")[_titleController.text] = controllerMapInvoice;

              box1.put("billvalue", titleMap);

              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    _buildPopupDialogCreated(context),
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
                primary: Colors.white //elevated btton background color
                ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 250,
          height: 45,
          child: ElevatedButton.icon(
            onPressed: () {
              String desc = "";

              if(box1.get("billvalue")!=null){
                print("hydro");
                print(box1.get("billvalue"));
                print(titleMap);
                titleMap = box1.get("billvalue");
              }


              print("Value of title");
              print(titleMap);



              controllerMap.forEach((key, v) {

                List a = [], b = [], c = [], d = [], e = [], f = [];

                for (int i = 0; i < v[1].length; i++) {
                  print("=======");
                  print(i);
                  print(v[0]);
                  print(v[0].text);
                  desc = v[0].text.toString();

                  print("DESCCCCCCC"+desc);
                 // print(desc);

                  print(v[1][i].text);
                  a.add(v[1][i].text);

                  print(v[2][i].text);
                  b.add(v[2][i].text);

                  print(v[3][i].text);
                  c.add(v[3][i].text);

                  print(v[4][i].text);
                  d.add(v[4][i].text);

                  print(v[5][i].text);
                  e.add(v[5][i].text);

                  print(v[6][i].text);
                  f.add(v[6][i].text);

                  print("=========");

                  controllerMapInvoice[key.toString()] = [desc, a, b, c, e, f];

                }


              });

              titleMap[_titleController.text] = controllerMapInvoice;

              box1.put("billvalue", titleMap);
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => sixth(),
              //   ),
              // );
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
                primary: Colors.white //elevated btton background color
                ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text(
        'Bill Details Saved Succussfully',
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text("Please enter details for next title in create bill"),
          )
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            print("billvaluevalue");
            print(box1.get("billvalue"));

            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Fifth(),
              ),
             );
          },
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildPopupDialogCreated(BuildContext context) {
    return new AlertDialog(
      title: const Text(
        'Bill Created Succussfully',
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text("Bill details are saved and bill created successfully"),
          )
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            print("Done");
            print(box1.get("billvalue"));

            box1.put("billvalue1", box1.get("billvalue"));

            print("box1");
            print(box1.get("billvalue1"));

            box1.delete("billvalue");


            print("box1");
            print(box1.get("billvalue1"));

            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PdfPage(),
              ),
            );
          },
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _okButton(BuildContext context) {
    final textField = TextField(
      controller: _okController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    );

    final button = ElevatedButton(
      onPressed: () async {
        final index = int.parse(_okController.text);
        String text = "brief: ${_briefControllers[index].text}\n" +
            "nos: ${_nosControllers[index].text}\n" +
            "hgt: ${_hgtControllers[index].text}\n" +
            "len: ${_lenControllers[index].text}\n" +
            "wth: ${_wthControllers[index].text}\n" +
            "qty: ${_qtyControllers[index].text}";
        // await showMessage(context, text, "Result");
      },
      child: Text("OK"),
    );

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: textField,
          width: 100,
          height: 50,
        ),
        button,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: Text('Generate Bill'),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              _firstTitle(),
              Expanded(
                  child: ListView(shrinkWrap: true, children: [
                Column(
                  children: [
                    //_listView1(),
                    //_listView(),
                    _listViewfinal(), _addDetails()
                  ],
                )
              ])),
              //Expanded(child: _listView()),
              //_addTile(),
              _okButton1(context),
            ],
          )),
    );
  }
}
