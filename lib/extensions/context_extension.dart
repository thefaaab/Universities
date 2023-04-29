import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  navigator(Widget page) => Navigator.of(this).push(
        MaterialPageRoute(builder: (context) => page),
      );

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  Size get screensize => MediaQuery.of(this).size;
}
