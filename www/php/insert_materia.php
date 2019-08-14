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
    $nombre=$_POST['nombre_materia'];
    $descripcion=$_POST['descripcion'];
    $cantidad=$_POST['cantidad'];
    $sql = "INSERT INTO `prima` (`nombre_materia`, `descripcion`, `cantidad`) VALUES ('".$nombre."','".$descripcion."','".$cantidad."')";
    //$pro = array();
    $result = $con->query($sql);
    if ( $result ) {
        $res['status'] = 1;
        $res['message'] = "success";
       /* while ( $row = $result->fetch_object() ) {
            array_push( $pro,$row);
            $res['status'] = 1;
        }*/
    }
    else {
        $res['status'] = 0;
        $res['message'] = mysqli_error($con);
    }
    //$res['dataset'] = $pro;
    header( 'Content-type: application/json' );
    echo json_encode($res);

?>
 
