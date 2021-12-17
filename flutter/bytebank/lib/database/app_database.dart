import 'package:bytebank/database/cliente_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const int versao_db = 1;

Future<Database> recuperaDatabase() async {
  String caminho = join(await getDatabasesPath(), 'bytebank.db');

  return await openDatabase(caminho
    ,
    onDowngrade: onDatabaseDowngradeDelete,
    onCreate: (db, version) {
      db.execute(ClienteDao.query);
    },
    version: versao_db,
  );
}
