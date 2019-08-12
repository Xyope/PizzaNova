<?php
header("Access-Control-Allow-Origin:*");
include "db.php";
$data=array();
$q=mysqli_query($con,"SELECT * from `tareas`");
while ($row=mysqli_fetch_object($q)){
 $data[]=$row;
}
echo json_encode($data);
?>