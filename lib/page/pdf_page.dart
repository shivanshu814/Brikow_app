import 'package:flutter/material.dart';
import 'package:phone_otp_ui/api/pdf_api.dart';
import 'package:phone_otp_ui/api/pdf_invoice_api.dart';
import 'package:phone_otp_ui/main.dart';
import 'package:phone_otp_ui/model/customer.dart';
import 'package:phone_otp_ui/model/invoice.dart';
import 'package:phone_otp_ui/model/supplier.dart';
import 'package:phone_otp_ui/widget/button_widget.dart';
import 'package:phone_otp_ui/widget/title_widget.dart';

class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
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
                        name: 'Shivanshu Pathak',
                        address: 'Greater Noida, Uttar Pradesh',
                        paymentInfo: '',
                      ),
                      info: InvoiceInfo(
                        date: date,
                        dueDate: dueDate,
                        description: 'My description...',
                        number: '${DateTime.now().year}-9999',
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
                    );

                    final pdfFile = await PdfInvoiceApi.generate(invoice);

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
                      info: InvoiceInfo(
                        date: date,
                        dueDate: dueDate,
                        description: 'My description...',
                        number: '${DateTime.now().year}-9999',
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
                      info: InvoiceInfo(
                        date: date,
                        dueDate: dueDate,
                        description: 'My description...',
                        number: '${DateTime.now().year}-9999',
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
