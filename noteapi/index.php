<?php
   include "connect.php";


   $username=filterRequest("username");
   $email=filterRequest("email");
   $password=filterRequest("password");

   $stm=$con->prepare("INSERT INTO `users`( `username`, `email`, `passward`) VALUES (?,?,?)");
   $stm->execute(array($username,$email,$password));

   $count=$stm->rowCount();

   $retVal = ($count==1) ? json_encode(array('status'=>"ok")):  json_encode(array('status'=>"failed"));
   echo $retVal;




   //explode(" ","amr esmail galal")