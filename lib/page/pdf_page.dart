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
  late String keyab;
  Map<String, Map> titleMap = {};
  Map<String, Map> finalMap = {};

  List<InvoiceItem1> list = [];

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
    setState(
      () {
        titleMap = box1?.get("billvalue");
        print(titleMap);

        titleMap.forEach(
          (key, value) {
            keyab = key.toString();
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
      },
    );
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
                        description: keyab,

                        //number: box2?.get("phone")
                      ),
                      items1: list,
                      items: [],
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
                        name: 'Shivanshu Pathak',
                        address: 'Greater Noida, Uttar Pradesh',
                        paymentInfo: '',
                      ),
                      info: InvoiceInfo1(
                        date: date,
                        description: 'My description...',
                      ),
                      items: [
                        InvoiceItem(
                          description: 'Layout',
                          date: DateTime.now(),
                          quantity: 1,
                          vat: 0,
                          unitPrice: 50,
                        ),
                        InvoiceItem(
                          description: 'Excavation',
                          date: DateTime.now(),
                          quantity: 3,
                          vat: 0,
                          unitPrice: 20,
                        ),
                        InvoiceItem(
                          description: 'PCC',
                          date: DateTime.now(),
                          quantity: 2,
                          vat: 0,
                          unitPrice: 10,
                        ),
                        InvoiceItem(
                          description: 'Reinforcement With Tools',
                          date: DateTime.now(),
                          quantity: 1,
                          vat: 0,
                          unitPrice: 90,
                        ),
                      ],
                      items1: [],
                    );

                    final pdfFile = await PdfInvoiceApi.generate(invoice);

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
                        name: 'Shivanshu Pathak',
                        address: 'Greater Noida, Uttar Pradesh',
                        paymentInfo: '',
                      ),
                      info: InvoiceInfo1(
                        date: date,
                        description: 'My description...',
                      ),
                      items: [
                        InvoiceItem(
                          description: 'Layout',
                          date: DateTime.now(),
                          quantity: 1,
                          vat: 0,
                          unitPrice: 50,
                        ),
                        InvoiceItem(
                          description: 'Excavation',
                          date: DateTime.now(),
                          quantity: 3,
                          vat: 0,
                          unitPrice: 20,
                        ),
                        InvoiceItem(
                          description: 'PCC',
                          date: DateTime.now(),
                          quantity: 2,
                          vat: 0,
                          unitPrice: 10,
                        ),
                        InvoiceItem(
                          description: 'Reinforcement With Tools',
                          date: DateTime.now(),
                          quantity: 1,
                          vat: 0,
                          unitPrice: 90,
                        ),
                      ],
                      items1: [],
                    );

                    final pdfFile = await PdfInvoiceApi.generate(invoice);

                    PdfApi.openFile(pdfFile);
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
