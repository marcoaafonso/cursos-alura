import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/contato.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Incluindo Contato';
const _rotuloCampoNome = "Nome";
const _dicaCampoNome = "";
const _rotuloCampoNumeroConta = "Número da Conta";
const _dicaCampoNumeroConta = "00000";
const _labelBotaConfirmar = "Confirmar";

class FormularioContato extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FormularioContatoState();
  }
}

class FormularioContatoState extends State<FormularioContato> {
  final TextEditingController _controladorCampoNome =
      TextEditingController();
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controlador: _controladorCampoNome,
                rotulo: _rotuloCampoNome,
                dica: _dicaCampoNome,
              ),
              Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
                dica: _dicaCampoNumeroConta,
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                onPressed: () => _criarContato(context),
                child: Text(_labelBotaConfirmar),
              )
            ],
          ),
        ));
  }

  void _criarContato(BuildContext context) {
    final String nome = _controladorCampoNome.text;
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);

    if (numeroConta != null && nome != null) {
      final contato = Contato(nome, numeroConta);
      Navigator.pop(context, contato);
    }
  }
}

