import 'package:sqflite/sqflite.dart';

//Banco de dados
class DAO {
  static Future<Database> getConnection() async {
    final dbName = "contactsdb.db";
    final dbPath = getConnection();
    final path = "$dbPath $dbName";

    final db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, _) async {
     final sql = "CREATE TABLE contacts(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, phone TEXT, cellPhone TEXT, photo TEXT, password TEXT)";
     await db.execute(sql);
      },
    );
    return db;
  }
}
