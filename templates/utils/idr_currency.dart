import 'package:intl/intl.dart';

class IdrCurrency {
  static String format(int number) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(number);
  }
}

