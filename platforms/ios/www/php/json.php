<?php
header("Access-Control-Allow-origin: *");
include "db.php";
$data = array();

$alias = $_POST['alias'];
$clave = $_POST['id_usuario'];

$checkUsuario = mysqli_query($con,"SELECT id_usuario FROM usuarios WHERE alias = '$alias' AND estado_usuario = 1 AND clave_usuario = '$clave'");

if($checkUsuario){
 

            session_start();
            isset($_SESSION['idUsuario']);            
            $data[]=$row; 
            echo "success";
}else{
 echo "error";
}
                   

echo json_encode($data);
mysqli_close();
?>