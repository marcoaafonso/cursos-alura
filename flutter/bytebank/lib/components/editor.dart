import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;
  final bool numerico;

  Editor({
    this.controlador,
    this.rotulo = "Campo",
    this.dica = "",
    this.icone,
    this.numerico = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
          controller: controlador,
          style: TextStyle(fontSize: 24.0),
          decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: rotulo,
            hintText: dica,
          ),
          keyboardType: numerico ? TextInputType.number : TextInputType.text),
    );
  }
}
