<?php

include "../connect.php";

$noteid         =   (int) filterRequest("id");
$title          =   filterRequest("title");
$content        =   filterRequest("content");
$imagename      =   array( filterRequest("file")) ;



//delete images first






if (isset($_FILES['file'])){

   $stmt0 = $con->prepare("SELECT * FROM notes WHERE  `id` = ?"); 

   $stmt0->execute(array($noteid)) ;
   $notedelete=$stmt0->fetch(PDO::FETCH_ASSOC);
   $imagename_arr = explode(",",$notedelete['images']);    

    foreach ($imagename_arr as  $value) {
        deleteFile("../upload" , $value) ; 
    }
    
    $imagename  =   imageUpload("file");
   

} 



//////////////////////////////////////////////////////////////////////////




// if (isset($_FILES['file'])){
    
//     deleteFile("../upload" , $imagename) ;
//     $imagename = imageUpload("file");
   

// } 


if ($imagename[0] != 'fail'){
    $stmt = $con->prepare("UPDATE `notes` SET 
 `title`=?,`content`=? , images = ?   WHERE id = ?
");
$stmt->execute(array($title, $content, $imagename [0], $noteid));
$count = $stmt->rowCount();

if ($count > 0) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "fail"));
}
}else{
    echo json_encode(array("ERRORS"=> $imagename[1])) ;
}


