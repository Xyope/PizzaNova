<?php
 include "db.php";
 if(isset($_GET['id']))
 {
 $id=$_GET['id'];
 $q=mysqli_query($con,"delete from `tareas` where `id_tarea`='$id_tarea'");
 if($q)
 echo "success";
 else
 echo "error";
 }
 ?>