import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/publication.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'proof.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE publication (id INTEGER PRIMARY KEY,title TEXT, description TEXT, stateGood INTEGER , stateBad INTEGER )",
      );
    }, version: 8);
  }

  static Future<void> insert(Publication animal) async {
    Database connection = await _openDB();
    connection.insert('publication', animal.toMap());
  }

  static Future<void> delete(Publication animal) async {
    Database connection = await _openDB();
    connection.delete('publication',where: "id = ?",whereArgs: [animal.id]);
  }

  static Future<void> update(Publication animal) async {
    Database connection = await _openDB();
    connection.update('publication',animal.toMap() ,where: "id = ?",whereArgs: [animal.id]);
  }

  static Future<List<Publication>> publications()async{
    Database connection = await _openDB();
    final List<Map<String,dynamic>> publicationMap = await connection.query("publication",orderBy: "id DESC");

    return List.generate(
        publicationMap.length,
            (index) => Publication.fromJson(publicationMap[index])
    );
  }
}
