import 'package:intl/intl.dart';

class Utils {
  static String? getFormattedDate(String dateTime) {
    final parsedDate = DateTime.tryParse(dateTime);
    return parsedDate != null
        ? DateFormat('dd MMM yyyy, HH:mm').format(parsedDate)
        : null;
  }
}
