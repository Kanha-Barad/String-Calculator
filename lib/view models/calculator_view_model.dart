import 'package:flutter/material.dart';
import '../models/string_calculator.dart';

class CalculatorViewModel extends ChangeNotifier {
  final StringCalculator _calculator = StringCalculator();

  String result = '';
  String error = '';

  void calculate(String input) {
    try {
      final sum = _calculator.add(input);
      result = 'Sum: $sum';
      error = '';
    } catch (e) {
      error = e.toString().replaceFirst('Exception: ', '');
      result = '';
    }
    notifyListeners();
  }

  void clear() {
    result = '';
    error = '';
    notifyListeners();
  }
}
