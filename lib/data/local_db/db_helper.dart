import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

// {
// "_id": "65b8df5660617f082eb64eac",
// "sku": 9691,
// "name": "ACI Pure Salt 1kg",
// "description": "Salt is the most essential item in human diet. ACI Pure Salt is 100% pure, free flow, vacuum evaporated . It also contain, sodium 97%, potassium, Iodine. ACI salt is 100% fresh, healthy and dust free",
// "shortDescription": "Salt is the most essential item in human diet.",
// "isVisible": true,
// "price": 42,
// "isPlastic": true,
// "weight": 8,
// "quantity": 412,
// "category": {
// "_id": "65a3c9231175e4945ec2c0b1",
// "name": "Pet Care ",
// "precedence": 6,
// "image": "categoryImages/1705996966165-4.png",
// "isActive": true,
// "isDiscount": false,
// "__v": 0
// },
// "image": "productImages/1706697021101-ACI Pure Salt 1kg.png",
// "updatedAt": "2024-02-06T09:58:01.460Z"
// }

class DbHelper {
  final String createTable = '''create table product(
  _id text primary key,
  sku text,
  name text,
  price int,
  isPlastic  int,
  qty int
  )''';

  Future<Database> _open() async {
    final root = await getDatabasesPath();
    final dbPath = p.join(root, 'product.db');
    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute(createTable);
      },
    );
  }

  Future insertDataToDb(dynamic data) async {
     final db = await _open();
     final insertItem = {
       "_id": data['_id'],
       "sku": data['sku'],
       "name": data['name'],
       "price": data['price'],
       "isPlastic": data['isPlastic']?1:0,
       "qty": data['qty'],
     };
     db.insert('product', insertItem);
  }

  Future<List<Map<String, dynamic>>> getAllItemsFromLocalDb() async {
    final db = await _open();
    List<dynamic> productItemsFromLocalDb = await db.rawQuery("select * from product");
    List<Map<String, dynamic>> dataList = [];
    for(int i = 0; i < productItemsFromLocalDb.length; i++){
      final single = {
        "_id": productItemsFromLocalDb[i]['_id'],
        "sku": productItemsFromLocalDb[i]['sku'],
        "name": productItemsFromLocalDb[i]['name'],
        "price": productItemsFromLocalDb[i]['price'],
        "isPlastic": productItemsFromLocalDb[i]['isPlastic'] == 1? true : false,
        "qty": productItemsFromLocalDb[i]['qty'],

      };
      dataList.add(single);
    }
     return dataList;
  }

  Future deleteDataFromDb(dynamic data) async {
    final db = await _open();
     db.delete('product',  where: '_id= ?', whereArgs: [data['_id']]);
  }
  Future<int> update(dynamic data) async {
    final db = await _open();
    final insertItem = {
      "sku": data['sku'],
      "name": data['name'],
      "price": data['price'],
      "isPlastic": data['isPlastic'] ? 1 : 0,
      "qty": data['qty'],
    };

    return await db.update('product', insertItem,
        where: '_id = ?', whereArgs: [data['_id']]);
  }

 Future<int> deleteAllItem() async {
   final db = await _open();
   return await db.delete('product');
 }

}
