
import 'package:login/database/dbconnection.dart';
import 'package:sqflite/sqflite.dart';



class Repo{
   late DatabaseConnection _databaseConnection;
  Repo(){
    _databaseConnection=DatabaseConnection();
  }
  static Database? _database;

Future<Database?>get database async {
			if (_database != null) {
				return _database;
			} else {
				_database = await _databaseConnection.setDatabase();
				return _database;
			}
		}


insertData(table,data) async{

  var connection= await database;
  return await connection?.rawInsert(
     
      'INSERT INTO ${table} (name,email, password) VALUES(?,?,?)',[data["name"],data["email"],data["password"]]);
  

}
checkLogin(email,password) async{
  var connection=await database;
  return await connection?.query('users', where: '"email" = ?''"password"=?', whereArgs: [[email],[password]]);

}
}