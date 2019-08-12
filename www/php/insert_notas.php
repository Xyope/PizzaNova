<?php
header("Access-Control-Allow-Origin:*");
 include "db.php";
 print_r($_POST);   
 if(isset($_POST['insert']))
 {
 $mensaje=$_POST['mensaje'];
 $importancia=$_POST['importancia'];
 $q=mysqli_query($con,"INSERT INTO `tareas` (`mensaje`,`importancia`) VALUES ('$mensaje','$importancia')");
 if($q)
  echo "success";
 else
  echo "error";
 }
 ?>