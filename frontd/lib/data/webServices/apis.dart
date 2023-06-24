// import 'dart:io';
import 'dart:convert';

import 'package:flower_app/data/webServices/Curd.dart';

import '../../shared/constant.dart';
import '../model/notemodel.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:path/path.dart';




class WebServices{
  Curd curd=Curd();

Future<List<NoteData>> getAllNotes(String userid ,int page)async{

List<dynamic>? jsondata;
int limit=6;
http.Response response=await http.get(Uri.parse("$viweAllNotes?id=$userid&limit=$limit&page=$page")) ;
 
  if(response.statusCode==200){

     jsondata=(jsonDecode(response.body))['data'] ?? [] ;

    
  }
return jsondata!.map((note) => NoteData.fromJson(note)).toList() ;  
}




Future<List<NoteData>> searchdata(String userid,String filter)async{

List<dynamic>? jsondata;


 http.Response response=await http.get(Uri.parse("$viweAllNotes?id=$userid&filter='$filter'")) ;


 
  if(response.statusCode==200){

     jsondata=(jsonDecode(response.body))['data']??[] ;

    
  }
return jsondata!.map((note) => NoteData.fromJson(note)).toList() ;  
}








addNote(String url ,Map <String,List> files,Map <String,String> data)async{
  return curd.multipartrequest(url, files,data);
 
}


updateNote(String url ,Map <String,List>files,Map <String,String> data)async{

if(files['imgname']!.isNotEmpty){ return curd.multipartrequest(url, files,data);}

else{return curd.postRequest(url, data);}

}


deleteNote(String url ,Map data)async{
  return curd.postRequest(url, data);
}


deleteAllNotes(String url,int uid)async{
  return curd.getRequest("$url?u_id=$uid");
}




}
