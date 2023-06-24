
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../data/model/notemodel.dart';
import '../../data/repositry/repo.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  bool loadmore=true;
  // bool isSearsh=false;

  // int page=1;
  // ScrollController scrollcountroller=ScrollController() ;
  NoteCubit(this.repo) : super(NoteInitial());

  Repo repo;

getAllNotes( String userid,int page)async{
  emit(ServerLoading());

  try{

List<NoteData> allnotes=await repo.getAllNotes(userid,page);
if(allnotes.length<6 || allnotes.isEmpty){loadmore=false;}
emit(Successloaded(data: allnotes));

  }
  catch(e){

    emit(FailLoaded(error: e.toString()));
  }
}


loadmoreDate(String userid,int page)async{


  try{

List<NoteData> allnotes=await repo.getAllNotes(userid,page);
if(allnotes.length<6 || allnotes.isEmpty){loadmore=false;}
emit(Successloaded(data: allnotes));

  }
  catch(e){

    emit(FailLoaded(error: e.toString()));
  }
}




searchInDB( String userid,String filter)async{


  try{

List<NoteData> allnotes=await repo.searchdata(userid,filter);
emit(Successloaded(data: allnotes));

  }
  catch(e){

    emit(FailLoaded(error: e.toString()));
  }
}


}
