// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class SqlDb {

//   static Database? _db ; 
  
//   Future<Database?> get db async {
//       if (_db == null){
//         _db  = await intialDb() ;
//         return _db ;  
//       }else {
//         return _db ; 
//       }
//   }


// intialDb() async {
//   String databasepath = await getDatabasesPath() ; 
//   String path = join(databasepath , 'wael.db') ;   
//   Database mydb = await openDatabase(path , onCreate: _onCreate , version: 3  , onUpgrade:_onUpgrade ) ;  
//   return mydb ; 
// }

// _onUpgrade(Database db , int oldversion , int newversion ) {


//  print("onUpgrade =====================================") ; 
  
// }

// _onCreate(Database db , int version) async {
//   await db.execute('''
//   CREATE TABLE "notes" (
//     "notes_id " INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
//     "notes_title" TEXT NOT NULL,
//     "notes_content" TEXT NOT NULL,
//     "notes_image" TEXT NOT NULL,
//     "notes_users " TEXT NOT NULL,
//     "notes_date" TEXT NOT NULL,
//   )
//  ''') ;
//  print(" onCreate =====================================") ; 

// }

//  Future<List<Map<String, dynamic>> > readData(String sql) async {
//   Database? mydb = await db ; 
//   List<Map<String,dynamic>>? response = await  mydb!.rawQuery(sql);
//   return response ; 
// }
// insertData(String sql) async {
//   Database? mydb = await db ; 
//   int  response = await  mydb!.rawInsert(sql);
//   return response ; 
// }
// updateData(String sql) async {
//   Database? mydb = await db ; 
//   int  response = await  mydb!.rawUpdate(sql);
//   return response ; 
// }
// deleteData(String sql) async {
//   Database? mydb = await db ; 
//   int  response = await  mydb!.rawDelete(sql);
//   return response ; 
// }
 

// // SELECT 
// // DELETE 
// // UPDATE 
// // INSERT 
 

// }
















































import 'package:flower_app/data/model/notemodel.dart';
import 'package:path/path.dart';
import 'package:sqlbrite/sqlbrite.dart';










class SqlDb {

  static Database? _db ; 
  
  Future<Database?> get db async {
      if (_db == null){
        _db  = await intialDb() ;
        return _db ;  
      }else {
        return _db ; 
      }
  }


intialDb() async {
  String databasepath = await getDatabasesPath() ; 
  String path = join(databasepath , 'amr.db') ;   
  final mydb =await openDatabase(path , onCreate: _onCreate , version: 6, onUpgrade:_onUpgrade ) ;  
  return mydb ; 
}

_onUpgrade(Database db , int oldversion , int newversion ) {


 print("onUpgrade =====================================") ; 
  
}

_onCreate(Database db , int version) async {
//   await db.execute('''
//   CREATE TABLE "notes0" (
//     "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
//     "note" TEXT NOT NULL
//   )
//  ''') ;



   await db.execute('''
  CREATE TABLE "notes" (
      "id" INTEGER NOT NULL PRIMARY KEY, 
       "title" TEXT NOT NULL,
       "content" TEXT NOT NULL,
       "images" TEXT NOT NULL,
       "user" TEXT NOT NULL,
       "date" TEXT NOT NULL
  )
 ''') ;



 print(" onCreate =====================================") ; 

}

 Future<List<Map<String, dynamic>?>?>? readData(int user) async {
  Database? mydb = await db ; 
List<Map<String,dynamic>?>? response =await  mydb!.rawQuery(' SELECT * FROM notes WHERE  user = $user ');
  return response ; 
}

 Future<int> insertData(NoteData usernote) async {
  Database? mydb = await db ; 
                        int  response = await  mydb!.rawInsert('INSERT INTO notes (id,title,content,images,user,date)VALUES ( "${int.parse(usernote.notesId)}","${usernote.notesTitle}","${usernote.notesContent}","${usernote.notesImage.join(",")}","${usernote.notesUsers}","${usernote.date}")');
  return response ; 
}
// updateData(NoteData usernote,int id) async {
//   Database? mydb = await db ; 
//   int  response = await  mydb!.rawUpdate('UPDATE notes SET title= ${usernote.notesTitle} , content = ${usernote.notesContent} , images= ');
//   return response ; 
// }
  Future<int> deleteData(int id) async {
  Database? mydb = await db ; 
  int  response = await  mydb!.rawDelete(' DELETE FROM notes WHERE id = $id ');
  return response ; 
}
 

// SELECT 
// DELETE 
// UPDATE 
// INSERT 
 

}



































































































































// class SqlDb {

//   static BriteDatabase? _db ; 
  
//   Future<BriteDatabase?> get db async {
//       if (_db == null){
//         _db  = await intialDb() ;
//         return _db ;  
//       }else {
//         return _db ; 
//       }
//   }


// intialDb() async {
//   String databasepath = await getDatabasesPath() ; 
//   String path = join(databasepath , 'amr.db') ;   
//   final mydb =BriteDatabase( await openDatabase(path , onCreate: _onCreate , version: 2  , onUpgrade:_onUpgrade )) ;  
//   return mydb ; 
// }

// _onUpgrade(Database db , int oldversion , int newversion ) {


//  print("onUpgrade =====================================") ; 
  
// }

// _onCreate(Database db , int version) async {
// //   await db.execute('''
// //   CREATE TABLE "notes0" (
// //     "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
// //     "note" TEXT NOT NULL
// //   )
// //  ''') ;



//    await db.execute('''
//   CREATE TABLE "notes" (
//       "id" TEXT NOT NULL PRIMARY KEY, 
//        "title" TEXT NOT NULL,
//        "content" TEXT NOT NULL,
//        "images" TEXT NOT NULL,
//        "user" TEXT NOT NULL,
//        "date" TEXT NOT NULL
//   )
//  ''') ;



//  print(" onCreate =====================================") ; 

// }

//  readData(int user,String tableName) async* {
//   BriteDatabase? mydb = await db ; 
//   Stream<List<NoteData>?>? response =yield* mydb!.createQuery(tableName,where: 'user = ? ',whereArgs:[user] ).mapToList((row) => NoteData.fromJson(row));
//   return response ; 
// }

// insertData(NoteData usernote,String tableName) async {
//   BriteDatabase? mydb = await db ; 
//            int  response = await  mydb!.insert(tableName, usernote.toJson(),);
//   return response ; 
// }
// updateData(NoteData usernote,String tableName,int id) async {
//   BriteDatabase? mydb = await db ; 
//   int  response = await  mydb!.update(tableName, usernote.toJson(), where: 'id = ? ',
//   whereArgs: [id]);
//   return response ; 
// }
// deleteData(int id,String tableName) async {
//   BriteDatabase? mydb = await db ; 
//   int  response = await  mydb!.delete(tableName,where: 'id = ? ',whereArgs: [id]);
//   return response ; 
// }
 

// // SELECT 
// // DELETE 
// // UPDATE 
// // INSERT 
 

// }



































