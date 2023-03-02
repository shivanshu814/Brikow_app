import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:phone_otp_ui/api/pdf_api.dart';
import 'package:phone_otp_ui/main.dart';
import 'package:phone_otp_ui/model/customer.dart';
import 'package:phone_otp_ui/model/invoice.dart';
import 'package:phone_otp_ui/model/supplier.dart';
import 'package:phone_otp_ui/widget/button_widget.dart';
import 'package:phone_otp_ui/widget/title_widget.dart';

import '../api/pdf_invoice_api1.dart';

class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  Box? box1;
  Box? box2;
  Box? box3;
  String keyab = "";
  Map<String, Map> titleMap = {};
  Map<String, Map> finalMap = {};

  List<InvoiceItem1> list = [];
  List<InvoiceItem2> list2 = [];
  List<InvoiceItem3> list3 = [];

  @override
  void initState() {
    super.initState();
    createBox();
  }

  void createBox() async {
    box1 = await Hive.openBox('bill');
    box2 = await Hive.openBox('logindata');
    box3 = await Hive.openBox('projectdata');
    print(" ==========");

    print("box1");
    print(box1?.get("billvalue1"));

    setState(
      () {
        print("titlemap");
        print(box1?.get("billvalue1"));
        titleMap = box1?.get("billvalue1");
        print(titleMap);

        titleMap.forEach(
          (key, value) {
            keyab = key.toString();

            list.add(
              InvoiceItem1(
                description: key,
                unit: "",
                NOS: "",
                L: "",
                W: "",
                H: "",
                quantity: "",
              ),
            );
            SizedBox(
              height: 15,
            );
            value.forEach((key1, value1) {
              int val = 0;
              for (var i = 0; i < value1[1].length; i++) {
                print("VALUE1: "+val.toString());
                print("VALUE2: "+value1[5][i]);
                print("VALUE3: "+int.parse(value1[5][i]).toString());
                val=val+int.parse(value1[5][i]);
                print("VAUE+ "+val.toString());
                print(i.toString()+": "+value1[1].length.toString());
                if (i == 0) {
                  print("inside 0");
                  if(i == value1[1].length-1){
                    list.add(
                      InvoiceItem1(
                        description: value1[1][i],
                        unit: "SQM",
                        NOS: value1[2][i],
                        L: value1[3][i],
                        W: value1[4][i],
                        H: value1[5][i],
                        quantity: value1[5][i],
                      ),
                    );
                    list.add(
                      InvoiceItem1(
                        description: "",
                        unit: "",
                        NOS: "",
                        L: "",
                        W: "",
                        H: "",
                        quantity: val.toString(),
                      ),
                    );
                  }else{
                    list.add(
                      InvoiceItem1(
                        description: value1[0],
                        unit: "",
                        NOS: "",
                        L: "",
                        W: "",
                        H: "",
                        quantity: "",
                      ),
                    );
                    list.add(
                      InvoiceItem1(
                        description: value1[1][i],
                        unit: "SQM",
                        NOS: value1[2][i],
                        L: value1[3][i],
                        W: value1[4][i],
                        H: value1[5][i],
                        quantity: value1[5][i],
                      ),
                    );
                  }

                }
                else if(i == value1[1].length-1) {
                  print("inside last");
                  print(val.toString());
                  list.add(
                    InvoiceItem1(
                      description: value1[1][i],
                      unit: "SQM",
                      NOS: value1[2][i],
                      L: value1[3][i],
                      W: value1[4][i],
                      H: value1[5][i],
                      quantity: value1[5][i],
                    ),
                  );
                  list.add(
                    InvoiceItem1(
                      description: "",
                      unit: "",
                      NOS: "",
                      L: "",
                      W: "",
                      H: "",
                      quantity: val.toString(),
                    ),
                  );
                }
                else {
                  print("inside else");
                  list.add(
                    InvoiceItem1(
                      description: value1[1][i],
                      unit: "SQM",
                      NOS: value1[2][i],
                      L: value1[3][i],
                      W: value1[4][i],
                      H: value1[5][i],
                      quantity: value1[5][i],
                    ),
                  );
                }

                print(value1[1][i]);
                print(value1[1][i]);
                print(value1[2][i]);
                print(value1[3][i]);
                print(value1[4][i]);
              }
            });
          },
        );
        SizedBox(
          height: 15,
        );
        titleMap.forEach(
          (key, value) {
            keyab = key.toString();

            list2.add(
              InvoiceItem2(
                description: key,
                unit: "",
                NOS: "",
                quantity: "",
              ),
            );
            SizedBox(
              height: 15,
            );
            value.forEach((key1, value1) {
              for (var i = 0; i < value1[1].length; i++) {
                list2.add(
                  InvoiceItem2(
                    description: value1[1][i],
                    unit: "SQM",
                    NOS: value1[2][i],
                    quantity: value1[5][i],
                  ),
                );

                print(value1[1][i]);
                print(value1[1][i]);
                print(value1[2][i]);
                print(value1[3][i]);
                print(value1[4][i]);
              }
            });
          },
        );
        SizedBox(
          height: 15,
        );
        titleMap.forEach(
          (key, value) {
            keyab = key.toString();

            list3.add(
              InvoiceItem3(
                  description: key,
                  unit: "",
                  Rate: "",
                  quantity: "",
                  amount: ""),
            );
            SizedBox(
              height: 15,
            );
            value.forEach((key1, value1) {
              for (var i = 0; i < value1[1].length; i++) {
                list3.add(
                  InvoiceItem3(
                      description: value1[1][i],
                      unit: "SQM",
                      Rate: 2.toString(),
                      quantity: value1[5][i],
                      amount: (int.parse(value1[5][i]) * 2).toString()),
                );
                SizedBox(
                  height: 15,
                );
                print(value1[1][i]);
                print(value1[1][i]);
                print(value1[2][i]);
                print(value1[3][i]);
                print(value1[4][i]);
              }
            });
          },
        );

        print("lis22");
        print(list2);
      },
    );

    print("lis2");
    print(list);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Invoice',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(210, 88, 40, 205),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Icon(Icons.picture_as_pdf, size: 150, color: Colors.red),
                Image.asset(
                  'images/invoice2.png',
                  height: 200,
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  'Generate Invoice',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
                const SizedBox(height: 78),
                ElevatedButton(
                  // text: 'Measurement',
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      primary: Color.fromRGBO(
                          212, 212, 255, 1), //background color of button
                      side: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(
                              212, 212, 255, 1)), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                          EdgeInsets.all(20) //content padding inside button
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Measurement",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      )
                    ],
                  ),

                  onPressed: () async {
                    final date = DateTime.now();
                    final dueDate = date.add(Duration(days: 7));

                    final invoice = Invoice(
                        supplier: Supplier(
                          name: box1?.get("name"),
                          address: box1?.get("location"),
                          paymentInfo: '',
                        ),
                        info: InvoiceInfo1(
                          date: date,
                          description: "Measurement",

                          //number: box2?.get("phone")
                        ),
                        items1: list,
                        items: [],
                        items2: [],
                        items3: []);

                    final pdfFile = await PdfInvoiceApi1.generate(invoice);

                    PdfApi.openFile(pdfFile);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  // text: 'Measurement',
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      primary: Color.fromRGBO(
                          212, 212, 255, 1), //background color of button
                      side: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(
                              212, 212, 255, 1)), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                          EdgeInsets.all(20) //content padding inside button
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Summary",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      )
                    ],
                  ),
                  onPressed: () async {
                    final date = DateTime.now();
                    final dueDate = date.add(Duration(days: 7));

                    final invoice = Invoice(
                        supplier: Supplier(
                          name: box1?.get("name"),
                          address: box1?.get("location"),
                          paymentInfo: '',
                        ),
                        info: InvoiceInfo1(
                          date: date,
                          description: "Summary",
                        ),
                        items: [],
                        items1: [],
                        items2: list2,
                        items3: []);

                    final pdfFile =
                        await PdfInvoiceApi1.generateSummary(invoice);

                    PdfApi.openFile(pdfFile);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  // text: 'Measurement',
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      primary: Color.fromRGBO(
                          212, 212, 255, 1), //background color of button
                      side: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(
                              212, 212, 255, 1)), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                          EdgeInsets.all(20) //content padding inside button
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Abstract",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      )
                    ],
                  ),
                  onPressed: () async {
                    final date = DateTime.now();
                    final dueDate = date.add(Duration(days: 7));

                    final invoice = Invoice(
                        supplier: Supplier(
                          name: box1?.get("name"),
                          address: box1?.get("location"),
                          paymentInfo: '',
                        ),
                        info: InvoiceInfo1(
                          date: date,
                          description: 'Abstract',
                        ),
                        items: [],
                        items1: [],
                        items2: [],
                        items3: list3);

                    final pdfFile =
                        await PdfInvoiceApi1.generateAbstract(invoice);

                    PdfApi.openFile(pdfFile);
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
