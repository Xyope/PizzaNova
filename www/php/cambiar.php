<?php
 if (isset($_SERVER['HTTP_ORIGIN'])) {  
    header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");  
    header('Access-Control-Allow-Credentials: true');  
    header('Access-Control-Max-Age: 86400');   
}  

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {  

    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))  
        header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");  

    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))  
        header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");  
}
include "db.php";
if(isset($_POST['login'])){
$usuario=$_POST['alias'];
    $sql = "UPDATE `usuarios` SET estado_usuario = 0 where alias= '$usuario'";
    //$pro = array();
    $result = $con->query($sql);
    if ( $result ) {
        echo "success";
    }
    else {
        echo "error";
    }
}
?>