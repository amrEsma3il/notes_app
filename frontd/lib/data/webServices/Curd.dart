// import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:path/path.dart';



class Curd{


getRequest(String url)async{
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch $e");
    }
  }

  
  


 Future< Map<String,dynamic>>   postRequest(String url,Map data)async{
    try {
      var response = await http.post(Uri.parse(url), body: data   );
      if (response.statusCode == 200) {
       var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch $e");
    }
    return {};
  }

  

Future< Map<String,dynamic>> multipartrequest(String url,Map <String,List> files ,Map <String,String>data)async{

 try {http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(url));

//data request

request.fields.addAll(data);


 

try{List<http.MultipartFile> newList = [];

  for (int i = 0; i < files['imgname']!.length; i++) {
    
      // Stri ng path=files['path'][i];
      // var multipartFile=await http.MultipartFile.fromPath('file[]', path); 


        String filepath=  files['imgpath']![i];
      // var stream = http.ByteStream(file.openRead());
      //  var length = await file.length();

      var multipartFile = http.MultipartFile.fromPath("file[]", filepath );

          newList.add(await multipartFile);
     
      // error ///////

// request.files.add(await http.MultipartFile.fromPath('file[]', '/E:/4269342.jpg'));

    }
  


  // files request
  
    request.files.addAll(newList);
    
    var req = await request.send();

    var response = await http.Response.fromStream(req) ; 

    
   if (req.statusCode == 200){
        return jsonDecode(response.body) ; 
 }else {
      print("Error ${req.statusCode}") ; 
      
    }


   
 } catch (e) {
    print("Error Catch $e");
   
 }
}catch(e){print("$e");}
return {};

}

}