import 'package:flutter/material.dart';

class Fifth extends StatefulWidget {

  @override
  FifthState createState() => FifthState();
}

class FifthState extends State<Fifth> {

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

  @override
  void dispose() {
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


  Widget _firstTitle(){
    return Container(
      child: Column(
        children: [
          Container(
            width: 345.0,
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
            "Details                                                          ",
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
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
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
            width: 345.0,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // use whichever suits your need
            children: <Widget>[
              Expanded(child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nos',
                  ),
                ),
              )),
              Expanded(child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Hgt',
                  ),
                ),
              )),
              Expanded(child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Len',
                  ),
                ),
              )),
              Expanded(child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Wth',
                  ),
                ),
              )),
              Expanded(child: Padding(
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
          ))
        ],
      ),
    );
  }

  Widget _addTile() {
    return ListTile(
      title: Icon(Icons.add),
      onTap: () {
        final brief = TextEditingController();
        final nos = TextEditingController();
        final hgt = TextEditingController();
        final len = TextEditingController();
        final wth = TextEditingController();
        final qty = TextEditingController();

        final briefField = _generateBriefTextField(brief, "brief");
        final nosField = _generateTextField(nos, "nos");
        final hgtField = _generateTextField(hgt, "hgt");
        final lenField = _generateTextField(len, "len");
        final wthField = _generateTextField(wth, "wth");
        final qtyField = _generateTextField(qty, "qty");


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
        });
      },
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

  TextField _generateBriefTextField(TextEditingController controller, String hint) {
    return  TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
          filled: true,
          fillColor: Colors.black26,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          )
      ),
    );
  }


  Widget _listView() {
    final children = [
      for (var i = 0; i < _briefControllers.length; i++)
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: InputDecorator(
            child: Column(
              children: [
                _briefFields[i],
                _nosFields[i],
                _hgtFields[i],
                _lenFields[i],
                _wthFields[i],
                _qtyFields[i],
              ],
            ),
            decoration: InputDecoration(

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
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
              SizedBox(height: 20,),
              _firstTitle(),
              _addTile(),
              Expanded(child: _listView()),
              _okButton(context),
            ],
          )),
    );
  }
}