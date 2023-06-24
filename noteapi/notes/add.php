<?php

include "../connect.php";

$title       = filterRequest("title");
$content     = filterRequest("content");
$userid      =(int) filterRequest("id");
$date        =  filterRequest("date");
$imagename = imageUpload("file");

if ($imagename[0] != 'fail') {
    
    $stmt = $con->prepare("INSERT INTO `notes` ( `title`, `content`, `user`,`images`,`date`) VALUES  (? , ?  , ? , ?,?)
  ");

    $stmt->execute(array($title , $content , $userid , $imagename[0],$date));

    $count = $stmt->rowCount();

    if ($count > 0) {
        echo json_encode(array("status" => "success"));
    } else {
        echo json_encode(array("status" => "fail"));
    }
} else {
    echo json_encode(array("ERRORS"=> $imagename[1])) ;
}
