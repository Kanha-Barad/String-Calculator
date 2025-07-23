import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/models/string_calculator.dart';

void main() {
  final calculator = StringCalculator();

  test('Empty string returns 0', () {
    expect(calculator.add(''), 0);
  });

  test('One number returns itself', () {
    expect(calculator.add('1'), 1);
  });

  test('Two numbers comma-separated', () {
    expect(calculator.add('1,2'), 3);
  });

  test('Multiple numbers comma-separated', () {
    expect(calculator.add('1,2,3,4'), 10);
  });

  test('Newline as delimiter', () {
    expect(calculator.add('1\n2,3'), 6);
  });

  test('Custom delimiter ";"', () {
    expect(calculator.add('//;\n1;2'), 3);
  });

  test('Negative numbers throw exception', () {
    expect(() => calculator.add('1,-2'), throwsException);
  });

  test('Multiple negatives in exception message', () {
    expect(() => calculator.add('1,-2,-3'), throwsA(predicate((e) =>
        e.toString().contains('negative numbers not allowed -2,-3')
    )));
  });
}
