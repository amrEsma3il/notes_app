// ignore_for_file: sized_box_for_whitespace

// import 'package:flower_app/ui/homepage.dart';
import 'package:flower_app/ui/search.dart';
import 'package:flutter/material.dart';

import '../data/model/notemodel.dart';
import '../shared/constant.dart';

class ViewImages extends StatelessWidget {
  const ViewImages({super.key, required this.usernote, required this.images,  this.isSearch});
  final NoteData usernote;
  final List<dynamic> images;  

  final bool? isSearch;

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      
      appBar: AppBar(elevation:0,

       leading: IconButton(onPressed: (){
        // isSearch=false;
    // sharedpref!.setStringList("search_list",searchList!.map((note) => jsonEncode(note!.toJson())).toList() );

   isSearch! ?  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const Search())): Navigator.of(context).pop();
    
      }, icon: const Icon(Icons.arrow_back,color: Color.fromARGB(255, 199, 194, 194),)),
        backgroundColor:const Color.fromARGB(180, 141, 139, 139) ,
        title:  const Text("view"),
        titleSpacing: 5,
      ),
      body: Container(padding:const EdgeInsets.symmetric(vertical: 5),color: const Color.fromARGB(255, 18, 18, 18),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(height: 230,
                 
                    child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(margin: const EdgeInsets.symmetric(horizontal: 6),
                        decoration:  BoxDecoration(color:Colors.transparent,borderRadius: BorderRadius.circular(5)),
                      
                        child: ClipRRect(borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            "$upload${images[index]}",
                            fit: BoxFit.fill,
                            height: 80,
                            width: 140,
                          ),
                        ),
                      ),
                      itemCount: images.length,
                    ),
                  ),
                  const SizedBox(
                    height: 112,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // ignore: unnecessary_string_interpolations
                      Text("${usernote.notesTitle}",style: const TextStyle(fontSize: 48,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 236, 239, 239),fontFamily: "som3a"),),
                      const SizedBox(height:14),
                      Text(" ${usernote.notesContent}",maxLines: 3,style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 164, 168, 171)),),
                      const SizedBox(height:25),
                        Text(" ${usernote.date}",maxLines: 3,style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 164, 168, 171)),),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
