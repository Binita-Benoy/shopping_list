import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static final _dbName = 'lists.db';
  static final _dbVersion=1;
  static final _tableName='MyTable';
  static final columnId='_id';
  static final columnName='name';
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database>get database async{
  _database ??=await _initiateDatabase();
  return database;
}
_initiateDatabase() async{
  Directory directory= await getApplicationDocumentsDirectory();
  String path=join(directory.path,_dbName);
  return await openDatabase(path,version:_dbVersion,onCreate: _onCreate);
}
Future _onCreate(Database db,int version){
  try{
  db.execute(
'''
CREATE TABLE $_tableName (
$columnId INTEGER PRIMARY KEY,
$columnName TEXT NOT NULL)
''');
return database;
  }
  catch(Exc){
    rethrow;
  }
}

Future<int> insert(Map<String,dynamic>row)async{
  Database db = await instance.database;
  return await db.insert(_tableName, row);
}
Future<List<Map<String,dynamic>>> queryAll()async{
    Database db = await instance.database;
  return await db.query(_tableName);
  }
Future<int> delete(int id)async{
  Database db = await instance.database;
  return await db.delete(_tableName,where:'$columnId=?',whereArgs:[id]);
}
}