<?php
header("Access-Control-Allow-Origin:*");
 include "db.php";
 if(isset($_POST['insert']))
 {
 $nombre_materia=$_POST['nombre_materia'];
 $descripcion=$_POST['descripcion'];
 $cantidad=$_POST['cantidad'];
 $q=mysqli_query($con,"INSERT INTO materias_primas_app (nombre_materia, descripcion, cantidad) VALUES ('$nombre_materia','$descripcion','$cantidad')");
 if($q)
  echo "success";
 else
  echo "error";
 }
 ?>