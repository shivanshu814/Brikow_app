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
                // TitleWidget(
                //   icon: Icons.picture_as_pdf,
                //   text: 'Generate Invoice',
                // ),
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
                      // customer: Customer(
                      //   name: 'Brikow',
                      //   address: 'Noida, Uttar Pradesh',
                      // ),
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
                        // InvoiceItem(
                        //   description: 'Mango',
                        //   date: DateTime.now(),
                        //   quantity: 1,
                        //   vat: 0.19,
                        //   unitPrice: 1.59,
                        // ),
                        // InvoiceItem(
                        //   description: 'Blue Berries',
                        //   date: DateTime.now(),
                        //   quantity: 5,
                        //   vat: 0.19,
                        //   unitPrice: 0.99,
                        // ),
                        // InvoiceItem(
                        //   description: 'Lemon',
                        //   date: DateTime.now(),
                        //   quantity: 4,
                        //   vat: 0.19,
                        //   unitPrice: 1.29,
                        // ),
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
                        name: 'name',
                        address: 'Sarah Street 9, Beijing, China',
                        paymentInfo: 'https://paypal.me/sarahfieldzz',
                      ),
                      // customer: Customer(
                      //   name: 'Apple Inc.',
                      //   address: 'Apple Street, Cupertino, CA 95014',
                      // ),
                      info: InvoiceInfo(
                        date: date,
                        dueDate: dueDate,
                        description: 'My description...',
                        number: '${DateTime.now().year}-9999',
                      ),
                      items: [
                        InvoiceItem(
                          description: 'Coffee',
                          date: DateTime.now(),
                          quantity: 3,
                          vat: 0.19,
                          unitPrice: 5.99,
                        ),
                        InvoiceItem(
                          description: 'Water',
                          date: DateTime.now(),
                          quantity: 8,
                          vat: 0.19,
                          unitPrice: 0.99,
                        ),
                        InvoiceItem(
                          description: 'Orange',
                          date: DateTime.now(),
                          quantity: 3,
                          vat: 0.19,
                          unitPrice: 2.99,
                        ),
                        InvoiceItem(
                          description: 'Apple',
                          date: DateTime.now(),
                          quantity: 8,
                          vat: 0.19,
                          unitPrice: 3.99,
                        ),
                        InvoiceItem(
                          description: 'Mango',
                          date: DateTime.now(),
                          quantity: 1,
                          vat: 0.19,
                          unitPrice: 1.59,
                        ),
                        InvoiceItem(
                          description: 'Blue Berries',
                          date: DateTime.now(),
                          quantity: 5,
                          vat: 0.19,
                          unitPrice: 0.99,
                        ),
                        InvoiceItem(
                          description: 'Lemon',
                          date: DateTime.now(),
                          quantity: 4,
                          vat: 0.19,
                          unitPrice: 1.29,
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
                        name: 'name',
                        address: 'Sarah Street 9, Beijing, China',
                        paymentInfo: 'https://paypal.me/sarahfieldzz',
                      ),
                      // customer: Customer(
                      //   name: 'Apple Inc.',
                      //   address: 'Apple Street, Cupertino, CA 95014',
                      // ),
                      info: InvoiceInfo(
                        date: date,
                        dueDate: dueDate,
                        description: 'My description...',
                        number: '${DateTime.now().year}-9999',
                      ),
                      items: [
                        InvoiceItem(
                          description: 'Coffee',
                          date: DateTime.now(),
                          quantity: 3,
                          vat: 0.19,
                          unitPrice: 5.99,
                        ),
                        InvoiceItem(
                          description: 'Water',
                          date: DateTime.now(),
                          quantity: 8,
                          vat: 0.19,
                          unitPrice: 0.99,
                        ),
                        InvoiceItem(
                          description: 'Orange',
                          date: DateTime.now(),
                          quantity: 3,
                          vat: 0.19,
                          unitPrice: 2.99,
                        ),
                        InvoiceItem(
                          description: 'Apple',
                          date: DateTime.now(),
                          quantity: 8,
                          vat: 0.19,
                          unitPrice: 3.99,
                        ),
                        InvoiceItem(
                          description: 'Mango',
                          date: DateTime.now(),
                          quantity: 1,
                          vat: 0.19,
                          unitPrice: 1.59,
                        ),
                        InvoiceItem(
                          description: 'Blue Berries',
                          date: DateTime.now(),
                          quantity: 5,
                          vat: 0.19,
                          unitPrice: 0.99,
                        ),
                        InvoiceItem(
                          description: 'Lemon',
                          date: DateTime.now(),
                          quantity: 4,
                          vat: 0.19,
                          unitPrice: 1.29,
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
