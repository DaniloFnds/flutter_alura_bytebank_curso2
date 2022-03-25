import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDataBase() async {
  // colocar esse async para tornar todo o escopo desse metodo dentro deum future, ecom isso podemos usar o await
  return openDatabase(
    join(await getDatabasesPath(), 'bytebank.db'),
    onCreate: (db, version) {
      db.execute('CREATE TABLE contacts( '
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER) ');
    },
    //esse version é tipo o migration, vc muda para el atualizar as versoes
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}


