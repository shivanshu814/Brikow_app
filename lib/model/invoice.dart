import 'package:phone_otp_ui/model/customer.dart';
import 'package:phone_otp_ui/model/supplier.dart';

class Invoice {
  final InvoiceInfo info;
  final Supplier supplier;
  // final Customer customer;
  final List<InvoiceItem> items;
  final List<InvoiceItem1> items1;

  const Invoice({
    required this.info,
    required this.supplier,
    required this.items,
    required this.items1,
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
