import 'package:intl/intl.dart';

abstract class Base {
  static const String url = "https://api.balanja.id/";
  // static const String url = "https://api-erp.mybisnis.online/";
  static getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
    final DateTime docDateTime = DateTime.parse(givenDateTime);
    return DateFormat(dateFormat).format(docDateTime);
  }
}
