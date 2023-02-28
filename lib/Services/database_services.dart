import 'package:advance_course/data/models/models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Local Database
class CartDatabaseHelper {
  CartDatabaseHelper._();
  static CartDatabaseHelper db = CartDatabaseHelper._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
              CREATE TABLE CartProduct (
                productId TEXT NOT NULL,
                name TEXT NOT NULL,
                image TEXT NOT NULL,
                price TEXT NOT NULL,
                category TEXT NOT NULL,
                quantity INTEGER NOT NULL)
                 ''');
    });
  }

  insert(CartProductModel cartProductModel) async {
    var dbClint = await database;
    await dbClint.insert('CartProduct', cartProductModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  delete(CartProductModel cartProductModel) async {
    var dbClint = await database;
    await dbClint.delete('CartProduct',
        where: 'productId = ?', whereArgs: [cartProductModel.productId]);
  }

  getAllProduct() async {
    var dbClint = await database;
    List<Map> maps = await dbClint.query('CartProduct');

    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
    return list;
  }
}
