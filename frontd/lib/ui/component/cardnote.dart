
import 'package:flutter/material.dart';

import '../../data/model/notemodel.dart';
import '../../data/sqflite/sqllite.dart';
// import '../../main.dart';
import '../../shared/constant.dart';
import '../viewnotes.dart';

class CardDesign extends StatefulWidget {
  final NoteData usernote;
 final bool isSearch;
 final void Function()  ondelete;


   const CardDesign({super.key, required this.usernote, required this.ondelete, required this.isSearch});

  @override
  State<CardDesign> createState() => _CardDesignState();
}

class _CardDesignState extends State<CardDesign> {

  var db=SqlDb();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async {
if(widget.isSearch==true){


// insert
int response=await db.insertData(widget.usernote);
// ignore: avoid_print
print(response);

List<Map<String, dynamic>?>? res=await db.readData(58);
print(res);
//  sharedpref!.setStringList("search_list",searchList.map((note) => jsonEncode(note.toJson())).toList() );

}

 if(!mounted)return;

widget.isSearch?  Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (contect) => 
            ViewImages(usernote: widget.usernote, images: widget.usernote.notesImage,isSearch: true,))): Navigator.of(context).push(MaterialPageRoute(
            builder: (contect) => 
            ViewImages(usernote: widget.usernote, images: widget.usernote.notesImage,isSearch: false,)));
    
        // if(!mounted)return;
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (contect) => widget.isSearch?
        //     ViewImages(usernote: widget.usernote, images: widget.usernote.notesImage,isSearch: true,): ViewImages(usernote: widget.usernote, images: widget.usernote.notesImage,isSearch: false,)));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: const EdgeInsets.all(7),
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Color.fromARGB(180, 113, 110, 110),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Container(
            //color: Colors.pinkAccent,
            padding: const EdgeInsets.fromLTRB(4.5, 8, 11.5, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(900000000000000),
                      //  backgroundColor:Color.fromARGB(217, 255, 255, 255),
                      child: Image.network(
                        "$upload${widget.usernote.notesImage[0]}",
                        width: 75,
                        height: 75,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              widget.usernote.notesTitle,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 247, 247, 247),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  fontFamily: "Amr"),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                maxLines: 1,
                                widget.usernote.notesContent,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 9,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // height: 20,
                      // width: 20,
                      margin: const EdgeInsets.only(left: 10),
                      //color: Colors.pinkAccent,
                      child:  IconButton(onPressed:widget.ondelete ,
                      icon: const Icon (Icons.delete),
                        color: const Color.fromARGB(255, 234, 233, 233),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.usernote.date,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 240, 239, 239),
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






  // ignore: unused_local_variable
 
  