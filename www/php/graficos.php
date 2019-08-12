<?php
header("Access-Control-Allow-Origin:*");
include "db.php";
$data = array();
if ($result['dataset'] = $categoria->graficar_existencia_categoria_agotar()) {
    $result['status'] = 1;
} else {
    $result['exception'] = 'No hay categorías registradas';
}
$sql = 'SELECT SUM(materiasprimas.cantidad) cantidad, nombre_categoria FROM materiasprimas INNER JOIN categorias USING (id_categoria) WHERE materiasprimas.estado = 1 GROUP BY nombre_categoria ORDER BY nombre_categoria ASC LIMIT 5';
$params = array(null);
?>