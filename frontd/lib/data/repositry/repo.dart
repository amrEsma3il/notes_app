

import 'package:flower_app/data/model/notemodel.dart';
import 'package:flower_app/data/webServices/apis.dart';

class Repo{

WebServices ws=WebServices();


Future<List<NoteData>> getAllNotes(String userid,int page)async{


List<NoteData> getNotes=await ws.getAllNotes( userid,page);  // return note gson



return getNotes;

}

Future<List<NoteData>> searchdata(String userid,String filter)async{


List<NoteData> searchresult=await ws.searchdata( userid,filter);  // return note gson



return searchresult;

}

}