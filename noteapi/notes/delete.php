<?php

include "../connect.php";

$noteid     = filterRequest("id"); 

// get imagename from database to delete it from server later.

$stmt0 = $con->prepare("SELECT * FROM notes WHERE  `id` = ?"); 

$stmt0->execute(array($noteid)) ;
$notedelete=$stmt0->fetch(PDO::FETCH_ASSOC);
$imagename_arr =explode(",",$notedelete['images']);


// delete specific note from database.

$stmt = $con->prepare("DELETE FROM `notes` WHERE id  = ? ");

$stmt->execute(array($noteid));

$count = $stmt->rowCount();

if ($count > 0) {
    foreach ($imagename_arr as  $value) {
        deleteFile("../upload" , $value) ; 
    }


    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "fail"));
}
