<?php

define("MB", 1048576);

function filterRequest($requestname)
{
  return  htmlspecialchars(strip_tags($_POST[$requestname]));
}

function imageUpload($imageRequest)
{
  // global $msgError;
  $imagename  = $_FILES[$imageRequest]['name'];
  // $img_ran=rand(1000, 10000) . $imagename;
  $imagetmp   = $_FILES[$imageRequest]['tmp_name'];
  $imagesize  = $_FILES[$imageRequest]['size'];
  $allowExt   = array("jpg", "png", "gif","mp3","mp4");
 
  $img_count=count($_FILES[$imageRequest]['name']);

  $img_ran=[];

  global $all_images_error;

  
  for ($i=0; $i <$img_count ; $i++) { 

    $strToArray = explode(".", $imagename[$i]);
    $ext[$i]        = strtolower(end($strToArray));

    $msgError=[];
    $img_ran[$i]=rand(10, 100000).$imagename[$i];

    if (file_exists("upload" . "/" . $imagename[$i])) {
     
      $msgError[]="file already exist";
    }

    if (!empty($imagename[$i]) && !in_array($ext[$i], $allowExt)) {
      $msgError []= "not allawed extension";
    }
    if ($imagesize[$i] >3000* MB) {
      $msgError []= "size is bigger that allowed";
    }

    $all_images_error[$i]=$msgError;

    if (empty($msgError)) {
      move_uploaded_file($imagetmp[$i],  "../upload/" . $img_ran[$i]);
  
    }else{
      return array("fail",$msgError);
    }
  
  }

  $images_uploded=implode(",", $img_ran);

  return array($images_uploded);



}


function deleteFile($dir, $imagename)
{
  if (file_exists($dir . "/" . $imagename)) {
    unlink($dir . "/" . $imagename);
  }
}

function checkAuthenticate()
{
    if (isset($_SERVER['PHP_AUTH_USER'])  && isset($_SERVER['PHP_AUTH_PW'])) {
        if ($_SERVER['PHP_AUTH_USER'] != "wael" ||  $_SERVER['PHP_AUTH_PW'] != "wael12345"){
            header('WWW-Authenticate: Basic realm="My Realm"');
            header('HTTP/1.0 401 Unauthorized');
            echo 'Page Not Found';
            exit;
        }
    } else {
        exit;
    }
}

