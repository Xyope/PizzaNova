<?php
 include "db.php";
 if(isset($_POST['update']))
 {
 $id_tarea=$_POST['id_tarea'];
 $mensaje=$_POST['mensaje'];
 $importancia=$_POST['importancia'];
 $q=mysqli_query($con,"UPDATE `tareas` SET `mensaje`='$mensaje',`importancia`='$importancia' where `id_tarea`='$id_tarea'");
 if($q)
 echo "success";
 else
 echo "error";
 }
 ?>