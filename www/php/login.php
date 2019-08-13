<?php

include "db.php";
if(isset($_POST['login'])){
$usuario=$_POST['alias'];
$password=$_POST['password'];
$login = mysqli_query($con, "SELECT `alias`, `clave_usuario` FROM `usuarios` WHERE `alias`='".$usuario."' and `clave_usuario`='".$password."'");

if ($login)
    echo "success";
else
     echo "error";
}
?>