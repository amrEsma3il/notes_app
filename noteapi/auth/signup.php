<?php
   include "../connect.php";


   $username=$_POST["username"];
   $email=filterRequest("email");
   $password=filterRequest("password");

   $valid=true;

   $stmt0 = $con->prepare("SELECT * FROM users"); 
   $stmt0->execute();
   $allusers=$stmt0->fetchAll(PDO::FETCH_ASSOC);

for($i=0;$i<count($allusers);$i++){
   if($allusers[$i]['email']==$email){
      $valid=false;
      break;
   }
}


if ($valid==true) {

   $stm=$con->prepare("INSERT INTO `users`( `username`, `email`, `password`) VALUES (?,?,?)");
   $stm->execute(array($username,$email,$password));

   $count=$stm->rowCount();

   $retVal = ($count>0) ? json_encode(array('status'=>"ok")):  json_encode(array('status'=>"failed"));
   echo $retVal;

} else {
   echo json_encode(array("email_status"=> "not_valid"));
}



   


   //explode(" ","amr esmail galal")