import 'package:bytebank/models/contato.dart';
import 'package:bytebank/screens/contato/formulario_contato.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Contatos";

class ListaContatos extends StatefulWidget {
  final List<Contato> _contatos = List.empty(growable: true);

  @override
  State<StatefulWidget> createState() {
    return ListaContatosState();
  }
}

class ListaContatosState extends State<ListaContatos> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._contatos.length,
        itemBuilder: (context, index) {
          final contato = widget._contatos[index];
          return ItemContato(contato);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _chamarFormularioContato(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _chamarFormularioContato(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute<Contato>(builder: (context) {
      return FormularioContato();
    })).then((contato) => _atualiza(contato));
  }

  void _atualiza(Contato? contato) {
    if (contato != null) {
      setState(() {
        widget._contatos.add(contato);
      });
    }
  }
}

class ItemContato extends StatelessWidget {
  final Contato _contato;

  ItemContato(this._contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._contato.nome),
        subtitle: Text(this._contato.numeroConta.toString()),
      ),
    );
  }
}
