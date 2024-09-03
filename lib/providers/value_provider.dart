import 'dart:math';

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

  void calculatePangkat(double numberSatu, double numberDua) {
    double result = 1;

    for (int i = 1; 1 <= numberDua; i++) {
      result *= numberSatu;
    }
    changeValue(result.toString());
  }

  void calculateKubus(double number) {
    double result = number * number * 6;
    changeValue(result.toString());
  }

  void calculateBola(double number) {
    double result = 4 * 3.14159 * number * number;
    changeValue(result.toString());
  }

  void calculateKerucut(double r, double t) {
    const double PI = 3.14159265358979323846;
    num s = pow(r * r + t * t, 0.5);
    double luasAlas = PI * r * r;
    double luasSelimut = PI * r * s;
    double totalLuas = luasAlas + luasSelimut;
    changeValue(totalLuas.toString());
  }

  void caladd(double numberSatu, double numberDua) {
    double result = numberSatu += numberDua;
    changeValue(result.toString());
  }

  void calkurang(double numberSatu, double numberDua) {
    double result = numberSatu -= numberDua;
    changeValue(result.toString());
  }

  void calmultyplay(double numberSatu, double numberDua) {
    double result = numberSatu *= numberDua;
    changeValue(result.toString());
  }

  void caldivide(double numberSatu, double numberDua) {
    double result = numberSatu /= numberDua;
    changeValue(result.toString());
  }

  void calmodulus(double numberSatu, double numberDua) {
    double result = numberSatu %= numberDua;
    changeValue(result.toString());
  }
}
