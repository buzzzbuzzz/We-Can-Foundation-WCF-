<?php
    $servername = "localhost";
    $username = "root";
   $password = "123";
    $databasename = "wecanfoundation";

    $conn = mysqli_connect($servername,$username,$password,$databasename);
    if(!$conn){
        die("connection failed : ".mysqli_connect_error());
    }
?>