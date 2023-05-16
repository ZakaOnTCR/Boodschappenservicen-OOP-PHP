<?php


$servername = "localhost";
$dbname = "boodschappenservice";
$username = "root";
$password = "";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname",$username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "<br>";
}
catch (PDOException $e)
{
    echo "connectie mislukt:". $e->getMessage();
}