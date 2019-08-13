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
$sql= $sql = 'SELECT SUM(cantidad) as cantidad, nombre_platillo, precio*SUM(cantidad) as subtotal
from platillos INNER JOIN detalle_pedido USING (id_platillo) 
where platillos.estado = 1 GROUP BY nombre_platillo ORDER BY subtotal DESC LIMIT 5';
//$sql = 'SELECT SUM(materiasprimas.cantidad) cantidad, nombre_categoria FROM materiasprimas INNER JOIN categorias USING (id_categoria) WHERE materiasprimas.estado = 1 GROUP BY nombre_categoria ORDER BY nombre_categoria DESC LIMIT 5';
$result = $con->query($sql);
$pro = array();
$result = $con->query($sql);
if ( $result ) {
    
    while ( $row = $result->fetch_object() ) {
        array_push( $pro,$row);
        $res['status'] = 1;
    }
}
else {
    $res['status'] = 0;
    $res['message'] = mysqli_error($con);
}
$res['dataset'] = $pro;
header( 'Content-type: application/json' );
echo json_encode($res);
?>