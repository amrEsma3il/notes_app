import 'package:flutter/material.dart';

import 'component/textform_component.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  final titlecontroller=TextEditingController();

 final  contentcontroller=TextEditingController();


  addNote(){}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(


     appBar: AppBar(backgroundColor: Color.fromARGB(255, 39, 126, 197),foregroundColor: const Color.fromARGB(242, 255, 255, 255),
        leading: const Icon(Icons.home),title: const Text("Add Note",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),),

body: SingleChildScrollView(
  child: Container(padding: EdgeInsets.only(top: 18,left: 5,right: 5,bottom: 5),
    
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      
      children: [
 CustTextFormSign(hint:"title" ,
 mycontroller: titlecontroller,
 valid:(txt){
 if(txt!.isEmpty ){

return "invalid title";
 }return null;


 } ), 
 SizedBox(height: 20,),
  CustTextFormSign(hint:"title" ,
 mycontroller: contentcontroller,
 valid:(txt){
 if(txt!.isEmpty ){

return "invalid content";
 }return null;


 } ),
  SizedBox(height: 25,),

  
  Container(width: 75,
  color: const Color.fromARGB(255, 63, 62, 61),
  alignment: Alignment.center,
  height: 35,
  padding: EdgeInsets.all(6),
    child: MaterialButton(textColor:const Color.fromARGB(255, 255, 255, 255) ,
      onPressed: (){addNote();},child: Text("add note",style: TextStyle(fontFamily: "Amr"),),)
      )



  ],),),
),

    );
  }
}