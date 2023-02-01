import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:phone_otp_ui/api/pdf_api.dart';
import 'package:phone_otp_ui/api/pdf_invoice_api.dart';
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

            list.add(InvoiceItem1(
              description: key,
              unit: "",
              NOS: "",
              L: "",
              W: "",
              H: "",
              quantity: "",
            ),);

            value.forEach((key1, value1) {
              for (var i = 0; i < value1[1].length; i++) {
                if (i == 0) {
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
                } else {
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

        titleMap.forEach(
              (key, value) {
            keyab = key.toString();

            list2.add(InvoiceItem2(
              description: key,
              unit: "",
              NOS: "",
              quantity: "",
            ),);

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


        titleMap.forEach(
              (key, value) {
            keyab = key.toString();

            list3.add(InvoiceItem3(
              description: key,
              unit: "",
              Rate: "",
              quantity: "",
              amount: ""
            ),);

            value.forEach((key1, value1) {
              for (var i = 0; i < value1[1].length; i++) {

                list3.add(
                  InvoiceItem3(
                    description: value1[1][i],
                    unit: "SQM",
                    Rate: 2.toString(),
                    quantity: value1[5][i],
                    amount: (int.parse(value1[5][i]) * 2).toString()
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
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.blue.shade100,
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.picture_as_pdf, size: 150, color: Colors.red),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Generate Invoice',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
                const SizedBox(height: 48),
                ButtonWidget(
                  text: 'Measurement',
                  onClicked: () async {
                    final date = DateTime.now();
                    final dueDate = date.add(Duration(days: 7));

                    final invoice = Invoice(
                      supplier: Supplier(
                        name: box3?.get("name"),
                        address: box3?.get("location"),
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
                      items3: []
                    );

                    final pdfFile = await PdfInvoiceApi1.generate(invoice);

                    PdfApi.openFile(pdfFile);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  text: 'Summary',
                  onClicked: () async {
                    final date = DateTime.now();
                    final dueDate = date.add(Duration(days: 7));

                    final invoice = Invoice(
                        supplier: Supplier(
                          name: box3?.get("name"),
                          address: box3?.get("location"),
                          paymentInfo: '',
                        ),
                        info: InvoiceInfo1(
                          date: date,
                          description: "Summary",
                        ),
                      items: [],
                      items1: [],
                      items2: list2,
                        items3: []
                    );

                    final pdfFile = await PdfInvoiceApi1.generateSummary(invoice);

                    PdfApi.openFile(pdfFile);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  text: 'Abstract',
                  onClicked: () async {
                    final date = DateTime.now();
                    final dueDate = date.add(Duration(days: 7));

                    final invoice = Invoice(
                      supplier: Supplier(
                        name: box3?.get("name"),
                        address: box3?.get("location"),
                        paymentInfo: '',
                      ),
                      info: InvoiceInfo1(
                        date: date,
                        description: 'Abstract',
                      ),
                      items: [],
                      items1: [],
                      items2: [],
                        items3: list3
                    );

                    final pdfFile = await PdfInvoiceApi1.generateAbstract(invoice);

                    PdfApi.openFile(pdfFile);
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
