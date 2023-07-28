import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/car_model.dart';

class DatabaseHelper {
  static const _databaseName = "CarDatabase.db";
  static const _databaseVersion = 1;

  static const table = 'car';

  static const columnId = 'id';
  static const columnName = 'name';
  static const columnPrice = 'price';
  static const columnKilometer = 'kilometer';
  static const columnImage = 'image';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId TEXT PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnPrice TEXT NOT NULL,
            $columnKilometer TEXT NOT NULL,
            $columnImage TEXT NOT NULL
          )
          ''');
  }

  Future<int> insert(CarModel car) async {
    Database? db = await instance.database;
    return await db!.insert(table, car.toMap(car));
  }

  Future<List<CarModel>> getAllCars() async {
    Database? db = await instance.database;
    var res = await db!.query(table);

    List<CarModel> list =
        res.isNotEmpty ? res.map((c) => CarModel.fromMap(c)).toList() : [];
    return list;
  }

  Future<void> deleteItem(String name) async {
    Database? db = await instance.database;

  await db!.delete(
    table,
    where: "name = ?",
    whereArgs: [name],
  );
}
}
