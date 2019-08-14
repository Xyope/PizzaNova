<?php

header("Access-Control-Allow-Origin:*");
 include "db.php";
 if(isset($_GET['id']))
 {
 $id=$_GET['id'];
 $q=mysqli_query($con,"DELETE from `tareas` where `id_tarea`='$id'");
 if($q)
 echo "success";
 else
 echo "error";
 }
 ?>