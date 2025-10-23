  import 'package:intl/intl.dart';

String dateFormat(DateTime date) {
    final DateFormat formatter = DateFormat('EEEE MMMM d');
    return formatter.format(date);
  }