import 'dart:async';

import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static const _databaseName = "duara.db";
  static const _databaseVersion = 1;

  static const inventoryTable = 'inventory';
  static const columnInvId = 'id';
  static const columnInvCode = 'productCode';
  static const columnInvName = 'name';
  static const columnInvQty = 'quantity';
  static const columnInvBp = 'buyingPrice';
  static const columnInvUnitSp = 'unitSellingPrice';
  static const columnCreatedAt = 'createdAt';

  static const salesTable = 'sales';
  static const columnSalesId = 'id';
  static const columnSalesPcode = 'productCode';
  static const columnSalesName = 'name';
  static const columnSalesQty = 'quantity';
  static const columnSalesUnitSp = 'price';
  static const columnSalesTotal = 'total_price';
  static const columnSalesDate = 'date';

  // SQL code to create the database tables
  static Future<void> createTables(sql.Database database) async {
    await database.execute('''
        CREATE TABLE IF NOT EXISTS $inventoryTable (
          $columnInvId INT IDENTITY(1, 1),
          $columnInvCode CHAR(30) NOT NULL PRIMARY KEY,
          $columnInvName TEXT,
          $columnInvQty INTEGER,
          $columnInvBp INTEGER,
          $columnInvUnitSp INTEGER,
          $columnCreatedAt TEXT NOT NULL
        )
      ''');
    await database.execute('''
        CREATE TABLE IF NOT EXISTS $salesTable (
          $columnSalesId INTEGER PRIMARY KEY AUTOINCREMENT,
          $columnSalesPcode CHAR(30) NOT NULL,
          $columnSalesName TEXT,
          $columnSalesQty INTEGER,
          $columnSalesUnitSp INTEGER,
          $columnSalesTotal INTEGER,
          $columnSalesDate TEXT,
          
          FOREIGN KEY(productCode) REFERENCES $inventoryTable(productCode)
        )
      ''');
    //testInsert();
  }

  static Future testInsert() async {
    final db = await SQLHelper.db();
    await db.execute(
        'INSERT INTO $inventoryTable VALUES (0, "12", "fruit", 2, 200, 10, "02-02-2021")');
    await db.execute(
        'INSERT INTO $salesTable VALUES (0, "12", "fruit", 1, 10, 10, "02-03-2021")');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      _databaseName,
      version: _databaseVersion,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  /*------------
  INVENTORY TABLE
  ------------*/

  // create new item (inventory)
  static Future<int> addInventoryItem(String productCode, String name, int qty,
      int buyingPrice, int unitSp, String date) async {
    final db = await SQLHelper.db();

    final inventoryData = {
      'productCode': productCode,
      'name': name,
      'quantity': qty,
      'buyingPrice': buyingPrice,
      'unitSellingPrice': unitSp,
      'createdAt': date,
    };

    final id = await db.insert(
      inventoryTable,
      inventoryData,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );

    return id;
  }

  // update an inventory item by id
  static Future<int> updateInventoryItem(String pCode, String name, int qty,
      int buyingPrice, int unitSp, String date) async {
    final db = await SQLHelper.db();

    final inventoryData = {
      'productCode': pCode,
      'name': name,
      'quantity': qty,
      'buyingPrice': buyingPrice,
      'unitSellingPrice': unitSp,
      'createdAt': date,
    };

    final id = await db.update(
      inventoryTable,
      inventoryData,
      where: 'productCode = ?',
      whereArgs: [pCode],
    );
    return id;
  }

  // read all items (inventory list)
  static Future<List<Map<String, dynamic>>> fetchInventoryItems() async {
    final db = await SQLHelper.db();
    return db.query(inventoryTable, orderBy: columnCreatedAt);
  }

  // read all items (sold items list)
  static Future<List<Map<String, dynamic>>> fetchSoldItems() async {
    final db = await SQLHelper.db();
    //var rawQuery = db.rawQuery('SELECT * FROM $salesTable ');
    var ormResult = db.query(salesTable, orderBy: columnSalesDate);
    return ormResult;
  }

  // delete inventory item from the database
  static Future<int> deleteInventoryItem(String pCode) async {
    final db = await SQLHelper.db();
    int result = await db.delete(
      inventoryTable,
      where: 'productCode = ?',
      whereArgs: [pCode],
    );
    return result;
  }

  // delete sold item from the database
  static Future<int> deleteSoldItem(String pCode) async {
    final db = await SQLHelper.db();
    int id = await db.delete(
      salesTable,
      where: 'productCode = ?',
      whereArgs: [pCode],
    );
    return id;
  }

  // fetch all inventory data from the database
  static Future<List> fetchAllInventory() async {
    var db = await SQLHelper.db();
    var result = await db.rawQuery("SELECT * from inventory");
    return result.toList();
  }

  // update inventory upon successful sale of an item
  static Future<int> updateInvOnItemSale(int qty, String pCode) async {
    var db = await SQLHelper.db();
    int id = await db.rawDelete('''
        UPDATE $inventoryTable 
        SET quantity = ?
        WHERE productCode = ?
      ''', [qty, pCode]);
    return id;
  }

  /*---------
  SALES TABLE 
  -----------*/

  // create new item (sales table)
  static Future<int> addSoldItem(String productCode, String name, int qty,
      int price, int totalPrice, String date) async {
    final db = await SQLHelper.db();
    final soldItem = {
      'productCode': productCode,
      'name': name,
      'quantity': qty,
      'price': price,
      'total_price': totalPrice,
      'date': date,
    };

    final id = await db.insert(
      salesTable,
      soldItem,
    );

    return id;
  }

  // update sold item entry by id (sales table)
  static Future<int> updateSoldItem(String pCode, String name, int qty,
      int price, int totalPrice, String date) async {
    final db = await SQLHelper.db();
    final updateItem = {
      'productCode': pCode,
      'name': name,
      'quantity': qty,
      'price': price,
      'total_price': totalPrice,
      'date': date,
    };
    final id = db.update(
      salesTable,
      updateItem,
      where: 'productCode = ?',
      whereArgs: [pCode],
    );
    return id;
  }
}
