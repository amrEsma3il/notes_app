<?php 
 
 include "../connect.php" ; 
 
  // $userid     = filterRequest("id");
  $userid     =(int) $_GET["id"];


  
  $stm0=$con->prepare("SELECT COUNT( id ) AS count FROM notes WHERE  `user` =  ".$userid);
  $stm0->execute();
  $record_count = $stm0->fetch(PDO::FETCH_ASSOC)['count'] ;
  


  if (!isset($_GET['page'])&& !isset($_GET['limit']) && isset($_GET['filter']) ) 
  
  
  {
    $limit=$record_count;
      $page=1;
      $offset=$limit *($page-1);
    
    $filter= $_GET["filter"];
  
    $stmt = $con->prepare("SELECT * FROM notes WHERE  `user` =  ".$userid. " AND  `title` LIKE " .$filter." ORDER BY `id` DESC LIMIT ".$limit." OFFSET ".$offset); 

    $stmt->execute() ;
  
   
  
  } else
  
  {



    if (isset($_GET['page'])&&isset($_GET['limit']) && !isset($_GET['filter']) )

    {    
      
      
      
      $limit     =(int) $_GET["limit"];
         $page     =(int) $_GET["page"];
         $offset=$limit *($page-1);
        
      $stmt = $con->prepare("SELECT * FROM notes WHERE `user` = ".$userid." ORDER BY `id` DESC LIMIT ".$limit." OFFSET ".$offset); 
    
      $stmt->execute() ;
    
      $pages_number=ceil($record_count/$limit);
    
    
    
    } else if(!isset($_GET['page'])&& !isset($_GET['limit']) && !isset($_GET['filter']))
    
    
    {
    
    
    
      $limit=$record_count;
      $page=1;
      $offset=$limit *($page-1);
$stmt = $con->prepare("SELECT * FROM notes WHERE `user` = ".$userid." ORDER BY `id` DESC LIMIT ".$limit." OFFSET ".$offset); 
    
      $stmt->execute() ;
    
    }



  }




  $data = $stmt->fetchAll(PDO::FETCH_ASSOC) ;
  $new_data=[];
  $map=[];

 foreach ($data as  $value) {
    foreach ($value as $notekey => $noteval) {

     if ((string)$notekey == "images") {
      $noteval= explode(",",$noteval);
     }
     $map[$notekey]=$noteval;

    }
    array_push($new_data,$map);
  }

  $count = $stmt->rowCount() ; 

  if ($count > 0) {
    echo json_encode(array("status" => "success" , "data" => $new_data)) ; 
  }else {
    echo json_encode(array("status" => "fail")) ; 
  }
