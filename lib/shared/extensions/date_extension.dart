import 'package:intl/intl.dart';

extension EDateTime on DateTime {
  /// Format the date to 'yyyy-MM-dd'
  String toFormatEn() => DateFormat('yyyy-MM-dd').format(this);
}
