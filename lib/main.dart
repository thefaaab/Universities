import 'package:flutter/material.dart';
import 'package:universities/screens/home_screen.dart';
import 'package:universities/utilities/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
