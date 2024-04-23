import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

abstract class DateTimeFormatterHelper {
  static String tryParse({
    String dateFormat = "dd MMMM yyyy HH:mm",
    String? dateTime,
  }) {
    try {
      initializeDateFormatting();
      List<String> splitFirst = dateTime?.split("T") ?? [];
      List<String> splitLast = splitFirst[1].split("+");
      String mergeSplit = "${splitFirst[0]} ${splitLast[0]}";
      final dt = DateTime.tryParse(mergeSplit) ?? DateTime(2024);
      return DateFormat(dateFormat).format(dt);
    } catch (e) {
      return DateFormat(dateFormat).format(DateTime(2024));
    }
  }
}