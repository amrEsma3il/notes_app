<?php
include "../connect.php";


$u_id=(int)htmlspecialchars(strip_tags($_GET['u_id']));

$allimagerecord_deleted=[];


// get images name of all notes that will have deleted by user id later
$stmt0= $con->prepare("SELECT * FROM notes WHERE  `user` = ?"); 

$stmt0->execute(array($u_id)) ;

$allnotes = $stmt0->fetchAll(PDO::FETCH_ASSOC) ;
foreach ($allnotes as $value) {
    array_push($allimagerecord_deleted,explode(",",$value['images']));
 

}


// delete all notes belongs to a secific user
$stm=$con->prepare("DELETE FROM `notes` WHERE `user`=$u_id");
$stm->execute();
$count=$stm->rowCount();

if ($count > 0) {
    foreach ($allimagerecord_deleted as  $record) {
       foreach ($record as  $value) {
        deleteFile("../upload" , $value) ; 
       }
       
    }
    
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "fail"));
}
