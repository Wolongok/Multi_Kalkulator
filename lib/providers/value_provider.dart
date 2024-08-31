import 'package:flutter/foundation.dart';

class ValueProvider with ChangeNotifier {
  String value = "0";

  void changeValue(String valueAfter) {
    value = valueAfter;
    notifyListeners();
  }
  void resetValue() {
    value = "0";
    notifyListeners();
  }
  void calculatePersegi(double number) {
    double result = number * 4;
    changeValue(result.toString());
  }

  void calculateLingkaran(double number) {
    double result = number * 22 / 7;
    changeValue(result.toString());
  }

  void calculateSegiPanjang(double numberSatu, double numberDua) {
    double result = 2 * (numberSatu + numberDua);
    changeValue(result.toString());
  }
}
