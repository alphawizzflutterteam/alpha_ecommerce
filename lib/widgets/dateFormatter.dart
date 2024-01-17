import 'package:intl/intl.dart';

class CustomDateFormat {
  static String formatDaate(String dateString) {
    // Parse the date string
    DateTime dateTime = DateTime.parse(dateString);

    // Format the date
    String formattedDate = DateFormat('dd MMM yyyy, h:mm a').format(dateTime);
    return formattedDate;
  }

  static String formatDateOnly(String dateString) {
    // Parse the date string
    DateTime dateTime = DateTime.parse(dateString);

    // Format the date
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return formattedDate;
  }
}
