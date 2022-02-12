import 'package:sqflite/sqflite.dart';
import 'package:todo_app/shared/constants.dart';

class MyDatabase {
  static late Database database;

  static Future<void> onCreateDatabase() async {
    database = await openDatabase('todo.db', version: 1,
        onCreate: (database, version) async {
      print('database is created');
      await database.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY ,title TEXT , status TEXT, time TEXT , date TEXT)');
    }, onOpen: (database) async{
      tasks = await getAllDataFormDatabase(database);
      print('database is opened');
    });
  }

  static Future<void> insertToDatabase(String title) async {
    database.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO tasks(title, status,time, date) VALUES("$title","new" , "11" , "3434")');
    });
  }

  static Future<List<Map>> getAllDataFormDatabase(database) async {
    return await database.rawQuery('SELECT * FROM tasks');
  }
}
