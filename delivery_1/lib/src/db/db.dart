import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:delivery_1/src/models/pedido_model.dart';
export 'package:delivery_1/src/models/pedido_model.dart';
class DBProvider {
  static late Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    // ignore: unnecessary_null_comparison
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

/*crear la base de datos*/
/* ===========================================*/
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'DeliveryDB.db');
    /*creamos la base de datos*/
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        /*creamos nuestras tablas*/
        /* AUTOINCREMENT */
        await db.execute('CREATE TABLE pedido ('
            'id INTEGER PRIMARY KEY,'
            'fecha DATE,'
            'cliente TEXT,'
            'estado INTEGER DEFAULT 1'
            ')');
      },
    );
  }

  /* ===========================================*/
  /* crear registros */
  nuevoPedidoRaw(PedidoModel nuevoPedido) async {
    final db = await database;
    /*insercion*/

    final res = await db.rawInsert("INSERT INTO pedido (id,fecha,cliente) "
        "VALUES (${nuevoPedido.id}',${nuevoPedido.fecha}','${nuevoPedido.cliente}')");
    return res;
  }

  /* metodo dos recomendado para insertar */
  nuevoPedido(PedidoModel nuevoPedido) async {
    final db = await database;
    final res = db.insert('pedido', nuevoPedido.toJson());
    return res;
  }

  /*=============================================================*/
  /* extraer información */
  Future<PedidoModel?> gedPedido(int id) async{
    final db=await database;

    final res =await db.query('pedido',where: 'id=?',whereArgs: [id]);

    /*retornara una lista de registros un map*/
    return res.isNotEmpty ? PedidoModel.fromJson(res.first):null;
  }
/*metodo dos*/
  Future<List<PedidoModel>> getTodosPedidos() async {
    final db = await database;
    final res = await db.query('pedido');
    List<PedidoModel> list=res.isNotEmpty
                          ?res.map((e) => PedidoModel.fromJson(e)).toList()
                          :[];
    return list;
  }

  Future<List<PedidoModel>> getPedidos(String fecha) async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM pedido where fecha='$fecha'");
    List<PedidoModel> list=res.isNotEmpty
                          ?res.map((e) => PedidoModel.fromJson(e)).toList()
                          :[];
    return list;
  }

  /* actualizar regstros */
  updatePedido(PedidoModel nuevoPedido )async{
    final db=await database;
    final res=await db.update('pedido', nuevoPedido.toJson(),where: 'id=?',whereArgs:[nuevoPedido.id] );
    return res;

  }

  /* eliminar registros por id */
  Future<int> deletePedido( int id ) async {

    final db  = await database;
    final res = await db.delete('pedido', where: 'id = ?', whereArgs: [id]);
    return res;
  }
  /* eliminar todos los registros */
  Future<int> deletePedidos() async {

    final db  = await database;
    final res = await db.rawDelete('DELETE FROM pedido');
    return res;
  }
}
