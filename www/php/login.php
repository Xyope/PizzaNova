<?php
header("Access-Control-Allow-Origin:*");
include "db.php";
if(isset($_POST['login'])){
$usuario=$_POST['alias'];
$password=$_POST['password'];
$login = mysql_num_rows(mysqli_query($conn, "SELECT `alias`, `clave_usuario` FROM `usuarios` WHERE `alias`=$usuario and `clave_usuario`=$password"));
if ($login !=0)
    echo "succes";
else
     echo "error";
}
?>