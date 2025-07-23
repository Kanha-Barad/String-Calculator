import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_calculator/view/calculator_screen.dart';
import 'package:string_calculator/viewmodels/calculator_view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CalculatorViewModel(),
      child: MaterialApp(
        home: CalculatorScreen(),
      ),
    ),
  );
}
