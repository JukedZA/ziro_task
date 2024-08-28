import 'package:intl/intl.dart';

class Formatters {
  static String dateTime(DateTime? date) {
    if (date == null) {
      return 'Error';
    } else {
      return DateFormat('dd.MM.yyyy').format(date);
    }
  }

  static String date(String date) {
    DateTime? d = DateTime.tryParse(date);

    if (d == null) {
      return 'Error';
    } else {
      return DateFormat('dd.MM.yyyy').format(d);
    }
  }

  static String compactCurrency(double amount) {
    NumberFormat currencyFormat = NumberFormat.compactCurrency(
      locale: 'en_ZA',
      symbol: 'R',
      decimalDigits: 0,
    );

    return currencyFormat.format(amount);
  }

  static String currency(double amount) {
    bool isInt = amount == amount.roundToDouble();

    NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'en_ZA',
      symbol: 'R',
      decimalDigits: isInt ? 0 : 2,
    );

    return currencyFormat.format(amount);
  }
}
