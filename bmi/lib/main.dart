import 'package:bmi/providers/theme_provider.dart';
import 'package:bmi/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ThemeProvider(),
        ),
      ],
      child: const MaterialApp(
        title: 'BMI Calculator',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
