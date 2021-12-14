import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utilitarios/material_color_generator.dart';

void main() {
  test('adds one to input values', () {
    final MaterialColor cor = generateMaterialColor(Colors.green[900]);

    debugPrint(cor.toString());

  });
}
