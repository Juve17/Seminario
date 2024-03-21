import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:delivery_1/src/models/usuarios_model.dart';
export 'package:delivery_1/src/models/usuarios_model.dart';
export 'package:delivery_1/src/models/pedido_model.dart';

class DBProvider {
  static late Database _database;
  static final DBProvider db = DBProvider._();
  final Completer<Database> _dbCompleter = Completer();

  DBProvider._() {
    _initDB();
  }

  Future<void> _initDB() async {
    _database = await initDB();
    _dbCompleter.complete(_database);
  }

  Future<Database> get database async {
    await _dbCompleter.future;
    // ignore: unnecessary_null_comparison
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

/*crear la base de datos*/
/* ===========================================*/
  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'DeliveryDB.db');
    if (kDebugMode) {
      print(path);
    }
    /*creamos la base de datos*/
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        /*creamos nuestras tablas*/
        /* AUTOINCREMENT */
        await db.execute('CREATE TABLE usuario ('
            'id INTEGER PRIMARY KEY,'
            'nombres TEXT,'
            'apellidos TEXT,'
            'estado INTEGER DEFAULT 1'
            ')');
      },
      
    );
  }

  /* ===========================================*/

  /*==============================================================================================*/
  /* usuarios */
  nuevoUsuario(UserModel nuevoUsuario) async {
    final db = await database;
    final res = db.insert('usuario', nuevoUsuario.toJson());
    return res;
  }

  /*=============================================================*/
  /* extraer información */
  Future<UserModel?> getUsuario(int id) async {
    final db = await database;

    final res = await db.query('usuario', where: 'id=?', whereArgs: [id]);

    /*retornara una lista de registros un map*/
    return res.isNotEmpty ? UserModel.fromJson(res.first) : null;
  }

/*metodo dos*/
  Future<List<UserModel>> getTodosUsuarios() async {
    final db = await database;
    final res = await db.query('usuario');
    List<UserModel> list =
        res.isNotEmpty ? res.map((e) => UserModel.fromJson(e)).toList() : [];
    return list;
  }

  Future<List<UserModel>> getUsuario2(String name) async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM usuario where nombre='$name'");
    List<UserModel> list =
        res.isNotEmpty ? res.map((e) => UserModel.fromJson(e)).toList() : [];
    return list;
  }

  /* actualizar regstros */
  Future<int> updateUser(UserModel nuevoUsuario) async {
    final db = await database;
    final res = await db.update('usuario', nuevoUsuario.toJson(),
        where: 'id=?', whereArgs: [nuevoUsuario.id]);
    return res;
  }

  /* eliminar registros por id */
  Future<int> deleteUser(int id) async {
    final db = await database;
    final res = await db.delete('usuario', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  /* eliminar todos los registros */
  Future<int> deleteUsuarios() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM usuario');
    return res;
  }
}
