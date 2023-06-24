import 'dart:async';
import 'dart:io';
// import 'package:shared_preferences/shared_preferences.dart';

import 'package:flower_app/logic/cubit/note_cubit.dart';
import 'package:flower_app/ui/search.dart';
// import 'package:flower_app/ui/component/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as b;
import '../data/model/notemodel.dart';
import '../data/webServices/Curd.dart';
import '../shared/constant.dart';
import 'component/cardnote.dart';
import  'package:intl/intl.dart';


import 'component/dialog.dart';


// import '../shared/constant.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 Curd curd=Curd();


Map <String,List> filess={'imgname':[],'imgpath':[] };
bool isloading=false;
final titleController=TextEditingController();
final contentController=TextEditingController();
final formState=GlobalKey<FormState>();
ScrollController scrollController=ScrollController();

addNote()async{
  







  if( filess['imgpath']!.isEmpty || filess['imgname']!.isEmpty ){


   await showdialog(context,"No images!!🤨",const Text("please load one or more ") ,[
TextButton(onPressed: (){Navigator.of(context).pop();}, child: const Text("ok")),]);
 
 

  }else{

await showDialog( barrierDismissible: false,
    
            context: context,
            builder:(context)=>  Container(
              child: AlertDialog(
              title:const Text("Keep going !! 🤨",style: TextStyle(color: Color.fromARGB(255, 82, 82, 81),fontFamily: "Amr",fontSize: 25),) ,
              content: SingleChildScrollView(
                child: Form(key: formState,
                  child: Container(height: 330,
               
                  padding: const EdgeInsets.all(6),
                    child:  Column(
                      children: [
                       
                        TextFormField(controller: titleController,
                          decoration: const InputDecoration(hintText: "title",
                     
                        border: OutlineInputBorder(),
                        focusColor: Color.fromARGB(233, 66, 67, 67),
                        
                        ),
                        validator: (txt){ if (txt!.isEmpty ){
            
                          return  "please input title !!";
                        }
                        else{return null;}
                        }
                        ,),
                        const SizedBox(height: 35,),
                        TextFormField(controller: contentController,
                        // maxLength:8 ,
                        maxLines: 6,
                        
                          decoration: const InputDecoration(hintText: " content here ",
                        border: OutlineInputBorder(),
                        focusColor: Color.fromARGB(233, 66, 67, 67),
                        
                        ),
                        validator: (txt){ if (txt!.isEmpty ){
                          
                          return  "please input some description !!";
                        }
                        else{return null;}
                        }
                        ,),
                    
                     
                            
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
              Center(
                child: Container(margin: const EdgeInsets.only(bottom: 35,top: 5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color.fromARGB(255, 82, 82, 81),),
                 
                            child: MaterialButton(onPressed: ()async{
                          
                          if(formState.currentState!.validate()){
              
                     setState(() {
                              isloading=true;
                                });
                          
                            Map<String,dynamic> responsse=await curd.multipartrequest(addnote, filess, {
                          
                            "title":titleController.text,
                            "content":contentController.text,
                            "id":"58",
                            "date": DateFormat("hh:mm:ss a").format(DateTime.now()),
                            });                  
                            Future.delayed(const Duration(seconds:1 ));
                          
                            setState(() {
                            isloading=false;
                            filess={'imgname':[],'imgpath':[] };
                                           });
                          
                          
                            if(responsse['status']=='success'){
                              titleController.text="";
                              contentController.text="";
                          
                            if(!mounted)return;
                            
                             Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(padding:const  EdgeInsets.all(5),
                                     content: const Text("added successfully"),action: SnackBarAction(label: "Ok",onPressed: (){}),));}
              
              
                          }
                          
                          
                             
                          
                          
                                       },
                                child:isloading?const Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 254, 254, 253),),):  const Text("Add note",style: TextStyle(color: Colors.white,fontSize: 17,fontFamily: "Amr"),),),
                          ),
              )
                      
                        
                      
            
            
            
              ],
              
              ),
            ));

    


  }


 
 }




uoloadFile(ImageSource source , bool multi)async{

final ImagePicker picker = ImagePicker();

// here optional to make user able to select files and back to home page and select more files plus previous files without lost it.
if(multi==true){
final List<XFile?> images = await picker.pickMultiImage();
if(images.isNotEmpty){
images.forEach((file){ 
filess['imgpath']!.add((File(file!.path)).path) ;
filess['imgname']!.add(b.basename(file.path)) ;


});

}

}else{
final XFile? photo = await picker.pickImage(source: source);
if(photo!=null ){
filess['imgpath']!.add((File(photo.path)).path) ;
filess['imgname']!.add(b.basename(photo.path)) ;
}

}

}



deleteNote(String id)async{
Map<String,dynamic> responsse=await curd.postRequest(deletenote, {"id":id});

 if(responsse['status']=='success'){
  if(!mounted)return;
Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const Home()));
BlocProvider.of<NoteCubit>(context).loadmore=true;

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(padding:const  EdgeInsets.all(5),
                                 content: const Text("deleted successfully"),action: SnackBarAction (label: "Ok",onPressed: (){}),));

 }
}







//  uoloadFile(ImageSource  source,bool multi)async{


//   final ImagePicker picker = ImagePicker();


// if(multi==true){
// final List<XFile?> images = await picker.pickMultiImage();
// if(images[0]==null){
// images.forEach((file){ 
// files['imgpath'].add(File(file.path)) as List;
// files['imgname'].add(basename(file.path)) as List;


// });

// }

// }





  

// XFile? result=await picker.pickImage(source: source);
// try{if(result != null){

//   filepth=[File(result.path).path];
//   filename=[b.basename(result.path)];
//   print(filepth);

// }}catch(e){
//   print(e.toString());
// }

//  }

//   // getnotes()async{
  //   var response=await curd.postRequest(viweAllNotes, {"id":"58"});
  //  if(response['status']=='success'){
  //   return response;
  //  }
  //  else{return response['status'];}
  // }

 
int page=1;
// double opacity=0.2;

//   /// declare a timer
// Timer? timer;


   List<NoteData> allNotes=[];
  @override
  void initState() {
  
    super.initState();


//  timer = Timer.periodic(
//       const Duration(milliseconds: 960),
//       (timer) {
//         /// callback will be executed every 1 second, increament a count value 
//         /// on each callback
//         setState(() {
//           opacity=opacity>=1?0.1:opacity+0.4;
       
//         });
//       },
//     );


    
    scrollController.addListener((){
   

      if(scrollController.position.maxScrollExtent==scrollController.offset){
         BlocProvider.of<NoteCubit>(context).loadmoreDate("58" , page);
         page++;
        


      }
    });
    /// this line  maybe cause error 
    BlocProvider.of<NoteCubit>(context).getAllNotes("58" , 1);

  }
  @override
  Widget build(BuildContext context) {
// bool loadMore=BlocProvider.of<NoteCubit>(context).loadmore;
   
    return   Scaffold(
      appBar: AppBar(elevation:6,
        backgroundColor:const Color.fromARGB(180, 141, 139, 139) ,foregroundColor: const Color.fromARGB(242, 255, 255, 255),
        leading: const Icon(Icons.home),title:const Text("Home page",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
        actions: [IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Search()));}, icon: const Icon(Icons.search)),
          IconButton(onPressed: ()async{

          uoloadFile(ImageSource.gallery,true);

        }, icon:const Icon(Icons.upload_file))],),

 body:Container(color:  const Color.fromARGB(255, 18, 18, 18),
  child:BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          
         if(state is ServerLoading){
          
           return const Center(child: CircularProgressIndicator(color: Colors.white,),);}
         if(state is FailLoaded){print("${state.error}");
           return const Center(child: Text("Server Error",style: TextStyle(fontSize: 17,color: Colors.white),),);}
         if(state is Successloaded){
          // timer?.cancel();
          // Future.delayed(const Duration (microseconds: 500));
             allNotes.addAll(state.data);
          var seen = Set<String>();
          allNotes = allNotes.where((note) => seen.add(note.notesId.toString())).toList();
          
          // print("=========================${allNotes[0].notesContent}......${allNotes[0].notesTitle}");
           return  RefreshIndicator( displacement: 50,
           backgroundColor:Color.fromARGB(255, 73, 70, 70), 
            color: const Color.fromARGB(255, 255, 253, 253),
            strokeWidth: 2,
       
            
            onRefresh: () async{
           
          
              page=1;
           allNotes=[];
             await Future.delayed(const Duration(milliseconds: 1000));
            //  x=0;
             if(!mounted)return;
             BlocProvider.of<NoteCubit>(context).getAllNotes("58", 1);
              
               setState(() {
                      BlocProvider.of<NoteCubit>(context ).loadmore=true;
                        filess={'imgname':[],'imgpath':[] };
                                       });
           },
             child:  Container(padding: const EdgeInsets.only(top: 5),
             child: ListView.builder(
              controller: scrollController,
              shrinkWrap: true,
              // physics:const scroll ,
              itemBuilder:( context, i){ return (i<allNotes.length)?  CardDesign(usernote: allNotes[i],isSearch: false, ondelete:(){deleteNote( allNotes[i].notesId);}):  Padding(
                padding:const EdgeInsets.symmetric(vertical:16),
                child: Center(child: BlocProvider.of<NoteCubit>(context,listen: true ).loadmore==true?const CircularProgressIndicator(
                  strokeWidth: 5,strokeCap: StrokeCap.butt,
                  backgroundColor: Color.fromARGB(255, 146, 146, 144),
                  color: Color.fromARGB(255, 255, 255, 255),):const Text("No more data",style: TextStyle(color: Colors.white),)),
              );
               } ,
              itemCount: allNotes.length+1,),
                    ),
           );}
        else{return const Center(child: Text("watting......",style: TextStyle(fontSize: 17),),);}


        },
      ),) ,
      floatingActionButton:FloatingActionButton(  elevation: 5,
        backgroundColor:Color.fromARGB(180, 216, 212, 212)
       ,foregroundColor: const Color.fromARGB(242, 255, 255, 255),
        onPressed:()async{
        //  BlocProvider.of<NoteCubit>(context).getAllNotes(58); 




        addNote();





      },
      child:const Icon(Icons.add),) ,
    );
  }
}