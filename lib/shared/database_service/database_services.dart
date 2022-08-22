import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DatabaseService {


  static Database? _db;

  Future<Database?> get db async {
    if(_db == null){
      _db = await init();
      return _db;
    }else {
      return _db;
    }
  }

  init()async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath , 'database.db');

    Database mydb = await openDatabase(path , onCreate: _createDb,version: 1);
    return mydb;
  }

  _createDb(Database db , int version)async{
    await db.execute('''
        CREATE TABLE "notes" (
          "id" INTEGER PRIMARY KEY AUTOINCREMENT ,
          "title" TEXT NOT NULL ,
          "note" TEXT NOT NULL , 
          "color" INTEGER NOT NULL ,
          "fav" INTEGER NOT NULL ,
          "category" TEXT NOT NULL ,
          "pin" INTEGER NOT NULL ,
          "trash" INTEGER NOT NULL
        )
      ''');
    print('database created ************************************');
  }

  Future<List<Map<String,dynamic>>> readData(String sql)async{
    Database? mydb = await db;
    List<Map<String,dynamic>> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql)async{
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql)async{
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql)async{
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}