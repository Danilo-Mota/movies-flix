import 'package:intl/intl.dart';

extension FormatDate on String {
  String toFormatDate() {
    final date = DateFormat('yyyy-MM-dd').parse(this);
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
