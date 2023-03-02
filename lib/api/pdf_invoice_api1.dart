import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:phone_otp_ui/api/pdf_api.dart';
import 'package:phone_otp_ui/model/customer.dart';
import 'package:phone_otp_ui/model/invoice.dart';
import 'package:phone_otp_ui/model/supplier.dart';
import 'package:phone_otp_ui/utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfInvoiceApi1 {
  static int totalQty = 0;
  static int totalAmt = 0;

  static Future<File> generate(Invoice invoice) async {
    final pdf = Document();
    final ByteData bytes = await rootBundle.load('images/logo.png');
    final Uint8List byteList = bytes.buffer.asUint8List();
    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(invoice),
        SizedBox(height: 3 * PdfPageFormat.cm),
        buildTitle(invoice),
        buildInvoice(invoice),
        Divider(),
        //buildTotal(invoice),
      ],
      footer: (context) => buildFooter(invoice),
    ));

    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }

  static Future<File> generateSummary(Invoice invoice) async {
    final pdf = Document();
    final ByteData bytes = await rootBundle.load('images/logo.png');
    final Uint8List byteList = bytes.buffer.asUint8List();
    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(invoice),
        SizedBox(height: 3 * PdfPageFormat.cm),
        buildTitle(invoice),
        buildInvoice1(invoice),
        Divider(),
        buildTotal(invoice),
      ],
      footer: (context) => buildFooter(invoice),
    ));

    return PdfApi.saveDocument(name: 'Brikow_Invoice.pdf', pdf: pdf);
  }

  static Future<File> generateAbstract(Invoice invoice) async {
    final pdf = Document();
    final ByteData bytes = await rootBundle.load('images/logo.png');
    final Uint8List byteList = bytes.buffer.asUint8List();
    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(invoice),
        SizedBox(height: 9 * PdfPageFormat.cm),
        buildTitle(invoice),
        buildInvoice2(invoice),
        Divider(),
        buildTotal1(invoice),
      ],
      footer: (context) => buildFooter(invoice),
    ));

    return PdfApi.saveDocument(name: 'Brikow_Invoice.pdf', pdf: pdf);
  }

  static Widget buildHeader(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                Text(
                  'Brikow',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
                ),
                Text(
                  'Construction Billing',
                  style: TextStyle(fontSize: 10),
                ),
              ]),
              SizedBox(width: 15),
              Text(
                'INVOICE',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 1 * PdfPageFormat.cm),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSupplierAddress(invoice.supplier),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildInvoiceInfo(invoice.info),
            ],
          ),
        ],
      );

  static Widget buildCustomerAddress(Customer customer) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(customer.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(customer.address),
        ],
      );

  static Widget buildInvoiceInfo(InvoiceInfo1 info) {
    //final paymentTerms = '${info.dueDate.difference(info.date).inDays} days';
    final titles = <String>[
      'Description:',
      'Invoice Date:',
    ];
    final data = <String>[
      info.description,
      Utils.formatDate(info.date),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        titles.length,
        (index) {
          final title = titles[index];
          final value = data[index];

          return buildText(title: title, value: value, width: 200);
        },
      ),
    );
  }

  static Widget buildSupplierAddress(Supplier supplier) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Supplier Name: ",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(supplier.name),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text("Supplier Address: ",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(supplier.address),
        ],
      );

  static Widget buildTitle(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 0.8 * PdfPageFormat.cm),
          // Text(invoice.info.description),
          // SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildInvoice(Invoice invoice) {
    final headers = [
      'Description',
      'Unit',
      'NOS',
      'Length',
      'Width',
      'Height',
      'Quantity'
    ];
    int qtyTotal = 0;
    bool so = false;
    final data = invoice.items1.map(
      (item) {
        final total = 100;

        print(item.quantity);
        // if (item.quantity != "") {
        //   qtyTotal = qtyTotal + int.parse(item.quantity);
        // }
        if(item.description==""){
          qtyTotal = qtyTotal + int.parse(item.quantity);
          so=true;
          return [
            item.description,
            item.unit,
            item.NOS,
            item.L,
            item.W,
            item.H,
            "Total Qty: "+item.quantity.toString(),
          ];
        }else{
          return [
            item.description,
            item.unit,
            item.NOS,
            item.L,
            item.W,
            item.H,
            item.quantity,
          ];
        }


      },
    ).toList();

    totalQty = qtyTotal;



    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,

      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
        6: Alignment.centerRight,
      },
    );
  }

  static Widget buildInvoice1(Invoice invoice) {
    final headers = ['Description', 'Unit', 'NOS', 'Quantity'];

    int qtyTotal = 0;
    final data = invoice.items2.map(
      (item) {
        final total = 100;

        print(item.quantity);
        if (item.quantity != "") {
          qtyTotal = qtyTotal + int.parse(item.quantity);
        }
        SizedBox(
          height: 15,
        );
        return [
          item.description,
          item.unit,
          item.NOS,
          item.quantity,
        ];
      },
    ).toList();

    totalQty = qtyTotal;
    SizedBox(
      height: 15,
    );
    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
        6: Alignment.centerRight,
      },
    );
  }

  static Widget buildInvoice2(Invoice invoice) {
    final headers = ['Description', 'Unit', 'Rate', 'Quantity', 'Amount'];

    int qtyTotal = 0;
    int amtTotal = 0;

    final data = invoice.items3.map(
      (item) {
        final total = 100;

        print(item.quantity);
        if (item.quantity != "") {
          qtyTotal = qtyTotal + int.parse(item.quantity);

          amtTotal = amtTotal + int.parse(item.amount);
        }

        return [
          item.description,
          item.unit,
          item.Rate,
          item.quantity,
          item.amount
        ];
      },
    ).toList();

    totalQty = qtyTotal;
    totalAmt = amtTotal;

    return Table.fromTextArray(

      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300,),
      cellHeight: 90,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
        6: Alignment.centerRight,
      },
    );
  }

  static Widget buildTotal(Invoice invoice) {
    final netTotal = invoice.items.map((item) => item.quantity);
    final vatPercent = 10;
    final vat = 20;
    final total = 20;

    final netTotal1 = invoice.items.map((item) => item.quantity);
    final vatPercent1 = 10;
    final vat1 = 20;
    final total1 = 20;
    final totalDistributor = 28;
    final createVirtualMeeting = 1;
    final haveYouCheck = true;

    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 4),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // buildText(
                //   title: 'Net total',
                //   value: netTotal.toString(),
                //   unite: true,
                // ),
                Divider(),
                buildText(
                  title: 'Total',
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  value: totalQty.toString(),
                  unite: true,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildTotal1(Invoice invoice) {
    final netTotal = invoice.items.map((item) => item.quantity);

    //final netTotal = 2.0;
    final vatPercent = 10;
    final vat = 20;
    final total = 20;

    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // buildText(
                //   title: 'Net total',
                //   value: netTotal.toString(),
                //   unite: true,
                // ),
                // Divider(),
                buildText(
                  title: 'Total',
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  value: totalQty.toString() +
                      "                       " +
                      totalAmt.toString(),
                  unite: true,
                ),
                buildText(
                  title: 'Total',
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  value: totalQty.toString(),
                  unite: true,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 1.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildFooter(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          buildSimpleText(title: 'Address', value: invoice.supplier.address),
          SizedBox(height: 1 * PdfPageFormat.mm),
          buildSimpleText(
              title: 'Thank you for Your Bussiness',
              value: invoice.supplier.paymentInfo),
        ],
      );

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);
    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}
