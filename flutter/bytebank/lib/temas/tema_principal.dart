import 'package:flutter/material.dart';
import 'package:utilitarios/material_color_generator.dart';

ThemeData temaPrincipal() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: generateMaterialColor(Colors.green[900]))
        .copyWith(
          secondary: Colors.blueAccent[700],
        ),
    buttonTheme: ButtonThemeData(
        buttonColor: Colors.blueAccent[700],
        textTheme: ButtonTextTheme.primary),
  );
}
