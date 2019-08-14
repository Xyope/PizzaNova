<?php
header("Access-Control-Allow-Origin:*");
include "db.php";
$data = array();

$query = mysqli_query($con, "SELECT * FROM prima");

while ($row = mysqli_fetch_object($query))
{
    $data[] = $row;
}
echo json_encode($data);
?>