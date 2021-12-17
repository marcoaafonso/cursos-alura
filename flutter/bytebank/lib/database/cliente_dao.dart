import 'package:bytebank/models/contato.dart';
import 'package:sqflite/sqflite.dart';

import 'app_database.dart';

class ClienteDao {
  static const String _nomeTabela = 'contatos';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _numeroConta = 'numero_conta';

  static const String query = 'CREATE TABLE $_nomeTabela ($_id INTEGER PRIMARY KEY, '
      '$_nome TEXT, '
      '$_numeroConta INTEGER)';

  Future<int> save(Contato contato) async {
    Database db = await recuperaDatabase();
    final Map<String, dynamic> mapaContato = Map();
    mapaContato[_nome] = contato.nome;
    mapaContato[_numeroConta] = contato.numeroConta;

    return db.insert(_nomeTabela, mapaContato);
  }

  Future<List<Contato>> findAll() async {
    Database db = await recuperaDatabase();
    List<Map<String, Object?>> listaMapaContato = await db.query(_nomeTabela);
    final List<Contato> contatos = List.empty(growable: true);

    for (Map<String, dynamic> mapaContato in listaMapaContato) {
      final Contato contato = Contato(
        id: mapaContato[_id],
        nome: mapaContato[_nome],
        numeroConta: mapaContato[_numeroConta],
      );
      contatos.add(contato);
    }

    return contatos;
  }

}
