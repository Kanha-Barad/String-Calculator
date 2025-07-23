import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/viewmodels/calculator_view_model.dart';

void main() {
  test('calculate returns correct result', () {
    final viewModel = CalculatorViewModel();

    viewModel.calculate('1,2');
    expect(viewModel.result, 'Sum: 3');
    expect(viewModel.error, '');
  });

  test('calculate handles error', () {
    final viewModel = CalculatorViewModel();

    viewModel.calculate('1,-2');
    expect(viewModel.result, '');
    expect(viewModel.error, 'negative numbers not allowed -2');
  });

  test('clear resets result and error', () {
    final viewModel = CalculatorViewModel();
    viewModel.calculate('1,2');
    viewModel.clear();

    expect(viewModel.result, '');
    expect(viewModel.error, '');
  });
}
