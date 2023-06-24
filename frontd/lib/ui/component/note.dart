


import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

import '../../data/model/notemodel.dart';
import '../../shared/constant.dart';
import '../viewnotes.dart';
// import '../../shared/constant.dart';
// import '../viewimages.dart';

// ignore: must_be_immutable
class NoteComponent extends StatelessWidget {
   // ignore: prefer_const_constructors_in_immutables
   NoteComponent({super.key,required this.usernote});
  final  NoteData usernote;
  




  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return  Container(padding: const EdgeInsets.all(4),
      margin: const EdgeInsetsDirectional.only(bottom: 4),
      child: GestureDetector(
          onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ViewImages(usernote: usernote,images:usernote.notesImage)));},
        child: Card(elevation:0.5,
          child:
         Row(  mainAxisAlignment: MainAxisAlignment.start,
          children: [ Expanded(flex:1,
           
          child: Image.network("$upload${usernote.notesImage[0]}",
           width: 100,
            height: 100,
            fit: BoxFit.fill,)),
          Expanded(flex: 3,
            child: ListTile(
              title: Text(usernote.notesTitle),
            subtitle: Text(usernote.notesContent,maxLines: 2,overflow:TextOverflow.ellipsis ,style: const TextStyle(fontSize: 6),),
            ))
          
        ],),),
      ),
    );
  }
}













//  @override
//   Widget build(BuildContext context) {
//     // ignore: avoid_unnecessary_containers
//     return  Container(
//       child: Card(child:
//        Row(  mainAxisAlignment: MainAxisAlignment.start,
//         children: [ GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ViewImages(images:usernote.notesImage.split(","))));},
//           child: Expanded(flex:1,
           
//           child: Image.network("$upload${(usernote.notesImage.split(","))[0]}",
//            width: 100,
//             height: 100,
//             fit: BoxFit.fill,)),
//         ),
//         Expanded(flex: 3,
//           child: ListTile(title: Text(usernote.notesTitle),
//           subtitle: Text(usernote.notesContent,maxLines: 2,overflow:TextOverflow.ellipsis ,style: TextStyle(fontSize: 6),),
//           ))
        
//       ],),),
//     );
//   }
// }