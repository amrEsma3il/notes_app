import 'package:flutter/material.dart';



 showdialog(BuildContext context,String title,Widget content,List<Widget>? actions)async{

return  await showDialog( barrierDismissible: false,

    
            context: context,
            builder:(context)=>  AlertDialog(
            title: Text(title) ,
            content: content,
            actions:actions,
));
 

  
}



 