<?php

$servername = "localhost";
$username = "root";
$password = "";
$db_name = "bdPoke";
$porta = "3306";

$connect = mysqli_connect($servername, $username, $password, $db_name, $porta);

if(mysqli_connect_error())
{
    echo ("Falhou: ".mysqli_connect_error());
}

?>