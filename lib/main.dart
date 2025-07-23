import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_calculator/view%20models/calculator_view_model.dart';
import 'package:string_calculator/view/calculator_screen.dart';
import 'package:string_calculator/theme/theme_provider.dart';
import 'package:string_calculator/theme/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalculatorViewModel()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'String Calculator',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home:  CalculatorScreen(),
    );
  }
}
