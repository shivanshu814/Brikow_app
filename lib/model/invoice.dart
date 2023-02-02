import 'package:phone_otp_ui/model/customer.dart';
import 'package:phone_otp_ui/model/supplier.dart';

class Invoice {
 // final InvoiceInfo info;
  final InvoiceInfo1 info;
  final Supplier supplier;
  // final Customer customer;
  final List<InvoiceItem> items;
  final List<InvoiceItem1> items1;
  final List<InvoiceItem2> items2;
  final List<InvoiceItem3> items3;

  const Invoice({
    required this.info,
    required this.supplier,
    required this.items,
    required this.items1,
    required this.items2,
    required this.items3,
  });
}

class InvoiceInfo {
  final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}




class InvoiceInfo1 {
  final String description;
  final DateTime date;


  const InvoiceInfo1({
    required this.description,
    required this.date,
  });
}


class InvoiceItem {
  final String description;
  final DateTime date;
  final int quantity;
  final double vat;
  final double unitPrice;
  const InvoiceItem({
    required this.description,
    required this.date,
    required this.vat,
    required this.unitPrice,
    required this.quantity,
  });
}

class InvoiceItem1 {
  final String description;
  final String unit;
  final String NOS;
  final String L;
  final String W;
  final String H;
  final String quantity;

  const InvoiceItem1({
    required this.description,
    required this.unit,
    required this.NOS,
    required this.L,
    required this.W,
    required this.H,
    required this.quantity,
  });
}


class InvoiceItem2 {
  final String description;
  final String unit;
  final String NOS;
  final String quantity;

  const InvoiceItem2({
    required this.description,
    required this.unit,
    required this.NOS,
    required this.quantity,
  });
}

class InvoiceItem3 {
  final String description;
  final String unit;
  final String Rate;
  final String quantity;
  final String amount;

  const InvoiceItem3({
    required this.description,
    required this.unit,
    required this.Rate,
    required this.quantity,
    required this.amount,
  });
}
