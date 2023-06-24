import 'package:flower_app/data/sqflite/sqllite.dart';
import 'package:flower_app/logic/cubit/note_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:path/path.dart';

import '../data/model/notemodel.dart';
import 'component/cardnote.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  List<NoteData> allNotes=[];
 bool  isSearch=false;
 List <NoteData?> ?searchList;
 var searchController=TextEditingController();
 var db=SqlDb();

  List<Map<String,dynamic>>? response;
  List<Map>? getDB;

@override
  void initState() {


    // db.readData(58)!.then((value) => getDB=value);
    // isSearch=false;

//        sharedpref!.getStringList("search_list");

       
//      response= db.readData(58);
//     response==null?searchList=[]
 

// :response!.then((value) =>value .map((note) => NoteData.fromJson(note)).toList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      appBar: AppBar(backgroundColor:const Color.fromARGB(255, 199, 194, 194),elevation: 0,
        leading: IconButton(onPressed: (){
  
        Navigator.of(context).pop();
    
      }, icon: const Icon(Icons.arrow_back,color: Colors.black87)),
      ),
    body:
     Column(
       children: [
        Container(height: 60,padding: const EdgeInsets.only(bottom: 11,left: 8,right: 8,top: 6),
        width: double.infinity,
        decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
          color: Color.fromARGB(255, 199, 194, 194),),
        child:  Container(height: 55,
        decoration: BoxDecoration(
          color: Colors.black87,
        borderRadius:BorderRadius.circular(25),),
          width: MediaQuery.of(context).size.width*0.8,
            child: TextFormField(
        controller: searchController,
            
        onChanged: (val){
         
           BlocProvider.of<NoteCubit>(context).searchInDB("58","%${searchController.text}%");
          
        },
        decoration:
             InputDecoration(
        border: InputBorder.none,
        
        hintText: "Search",
        
        prefixIcon: IconButton(onPressed: (){
        
          BlocProvider.of<NoteCubit>(context).searchInDB("58","%${searchController.text}%");
        
        }, icon: const Icon(Icons.search,color: Colors.white,)),),),
          ),),
        const SizedBox(height: 8,),
         Expanded(
           child: BlocBuilder<NoteCubit, NoteState>(
            builder: (context, state) {
           if(state is FailLoaded){print("${state.error}");
                 return const Center(child: Text("Server Error",style: TextStyle(fontSize: 17,color: Colors.white),),);}
               if(state is Successloaded && searchController.text.isNotEmpty){
                // timer?.cancel();
                // Future.delayed(const Duration (microseconds: 500));
                //    allNotes.addAll(state.data);
                // var seen = <String>{};
              
             
             
             
            
              allNotes=state.data;
         
         
         
              //.where((element) => element.notesTitle.startsWith(searchController.text)).toList()
               
             
               
             
                // print("=========================${allNotes[0].notesContent}......${allNotes[0].notesTitle}");
                 return 
                  Container(padding: const EdgeInsets.only(top: 5),
                  child: ListView.builder(
                  
                   shrinkWrap: true,
                   // physics:const scroll ,
                   itemBuilder:( context, i){ return   CardDesign(usernote: allNotes[i],isSearch: true, ondelete:(){
                    
                  //   setState(() {
                  //    allNotes.removeAt(i);
                  //  });
                   
                   });} ,
                   itemCount: allNotes.length,),
                         );}
                 else{return  FutureBuilder(
                  future: (db.readData(58)),
                  
                  builder:(BuildContext context,AsyncSnapshot<List<Map<String, dynamic>?>?> snapshot){
                    
                    if(!(snapshot.hasData) || snapshot.data!.isEmpty ||snapshot.data == null){
                      return const Center(child: Text("لم تقم باي عملية بحث",style: TextStyle(fontFamily: "Amr",color: Colors.white,fontSize: 25),),);}
                    else{return 
                    Container(padding: const EdgeInsets.only(top: 5),
                  child: ListView.builder(
                  
                   shrinkWrap: true,
                   // physics:const scroll ,
                   itemBuilder:( context, i){ 
                    NoteData usernot=NoteData.fromJson(snapshot.data![i]!);
                    
                    return   CardDesign(usernote: usernot,isSearch: false, ondelete:(){
                    
                     
                    db.deleteData(int.parse(usernot.notesId));
         
                    setState(() {
                      
                    });
         
                
         
                      //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Search()));
         
         
                  });} ,
                   itemCount: snapshot.data!.length,),
                         );}
         
         
                  
                  
                  
                  } )
         
         //            searchList!.isEmpty?const Center(child: Text("لم تقم باي عملية بحث",style: TextStyle(fontFamily: "Amr",color: Colors.white,fontSize: 25),),):
                 
         // Container(padding: const EdgeInsets.only(top: 5),
         //             child: ListView.builder(
                  
         //              shrinkWrap: true,
         //              // physics:const scroll ,
         //              itemBuilder:( context, i){ return   CardDesign(usernote: searchList![i]!,isSearch: false, ondelete:(){
         //                searchList!.removeAt(i);
         
         
         //                 sharedpref!.setStringList("search_list",searchList!.map((note) => jsonEncode(note!.toJson())).toList() );
         
         //                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Search()));
         
         
         //             });} ,
         //              itemCount: searchList!.length,),
         //                    )
         
                 ;}
            }
             ),
         ),
       ],
     )
    
    
    
    
    
    
    
    
    );
  }
}