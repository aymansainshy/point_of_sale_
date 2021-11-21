// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import '../models/product.dart';

// class ProductsDatabase {
//   static final ProductsDatabase instance = ProductsDatabase._init();

//   static Database? _database;

//   ProductsDatabase._init();

//   Future<Database> get database async {
//     if (_database != null) return _database;

//     _database = await _initDB('products.db');

//     return _database;
//   }

//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();

//     final path = join(dbPath, filePath);

//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }

//   Future _createDB(Database db, int version) async {
//     final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
//     final textType = 'TEXT NOT NULL';
//     final integerType = 'INTEGER NOT NULL';

//     await db.execute('''
//     CREATE TABLE $productsTable (
//       ${ProductsFields.id} $idType,
//       ${ProductsFields.name} $textType,
//       ${ProductsFields.qty} $integerType,
//       ${ProductsFields.price} $integerType,
//       ${ProductsFields.createdAt} $textType,
//     )
//     ''');
//   }

//   Future<Product> create(Product product) async {
//     final db = await instance.database;

//     final id = await db.insert(productsTable, product.toJson());

//     return product.copy(id: id);
//   }

//   Future<Product> find(int id) async {
//     final db = await instance.database;

//     final maps = await db.query(
//       productsTable,
//       columns: ProductsFields.values,
//       where: "${ProductsFields.id} ?",
//       whereArgs: [id],
//     );

//     if (maps.isNotEmpty) {
//       return Product.fromJson(maps.first);
//     } else {
//       throw ('ID $id not found');
//     }
//   }

//   Future<List<Product>> all(int id) async {
//     final db = await instance.database;
//     final orderBy = "${ProductsFields.createdAt} ASC";

//     final result = await db.query(
//       productsTable,
//       orderBy: orderBy,
//     );

//     if (result.isNotEmpty) {
//       return result.map((json) => Product.fromJson(json)).toList();
//     } else {
//       return [];
//     }
//   }

//   Future<int> update(Product product) async {
//     final db = await instance.database;

//     return await db.update(
//       productsTable,
//       product.toJson(),
//       where: "${ProductsFields.id} ?",
//       whereArgs: [product.id],
//     );
//   }

//   Future<int> delete(Product product) async {
//     final db = await instance.database;

//     return await db.delete(
//       productsTable,
//       where: "${ProductsFields.id} ?",
//       whereArgs: [product.id],
//     );
//   }

//   Future close() async {
//     final db = await instance.database;

//     db.close();
//   }
// }
