import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class HumanFormats {

  static String number(double number, [int decimalDigits = 0]) {

    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: decimalDigits,
      symbol: '',
      locale: 'en'
    ).format(number);

    return formattedNumber;
  }

  static String shortDate( DateTime date ) {
    initializeDateFormatting();
    final format = DateFormat.yMMMEd('en');
    return format.format(date);
  }
}
