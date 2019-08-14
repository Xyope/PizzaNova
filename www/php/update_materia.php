<?php
header("Access-Control-Allow-Origin:*");
 include "db.php";
 if(isset($_POST['update']))
 {
 $idMateria=$_POST['idMateria'];
 $nombre_materia=$_POST['nombre_materia'];
 $descripcion=$_POST['descripcion'];
 $cantidad=$_POST['cantidad'];
 
 $q=mysqli_query($con,"UPDATE materias_primas_app SET nombre_materia ='$nombre_materia', descripcion ='$descripcion', cantidad = '$cantidad'");
 if($q)
 echo "success";
 else
 echo "error";
 }
 ?>