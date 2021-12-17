import 'package:bytebank/screens/dashboard.dart';
import 'package:bytebank/temas/tema_principal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: temaPrincipal(),
      home: DashBoard(),
    );
  }
}
