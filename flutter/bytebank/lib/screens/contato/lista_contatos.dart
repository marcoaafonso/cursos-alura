import 'package:bytebank/components/progresso.dart';
import 'package:bytebank/database/cliente_dao.dart';
import 'package:bytebank/models/contato.dart';
import 'package:bytebank/screens/contato/formulario_contato.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Contatos";
final ClienteDao _dao = ClienteDao();

class ListaContatos extends StatefulWidget {
  @override
  State<ListaContatos> createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: List.empty(),
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progresso();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contato> _contatos = snapshot.data as List<Contato>;

              return ListView.builder(
                itemCount: _contatos.length,
                itemBuilder: (context, index) {
                  final Contato contato = _contatos[index];
                  return _itemContato(contato);
                },
              );
          }

          return Text('Erro');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _chamarFormularioContato(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _chamarFormularioContato(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => FormularioContato()))
        .then((value) => setState((){}));
  }
}

class _itemContato extends StatelessWidget {
  final Contato _contato;

  _itemContato(this._contato);

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
