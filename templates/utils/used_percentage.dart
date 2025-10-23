class UsedPercentage {
  static String format(double valueExpense, double used) {
    final formatter = used / valueExpense;
    return "${(formatter * 100)}%";
  }
}