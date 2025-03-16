<?php
$host=$_ENV['MYSQL_HOST'];
$port=$_ENV['MYSQL_TCP_PORT'];
$dbname=$_ENV['MYSQL_DATABASE'];
$user=$_ENV['MYSQL_USER'];
$password=$_ENV['MYSQL_PASSWORD'];
$charset='utf8mb4';

$dsn="mysql:host=$host;port=$port;dbname=$dbname;charset=$charset";
$options=[];

try {
    $pdo = new PDO($dsn, $user, $password, $options);
    if (basename(__FILE__) == basename($_SERVER["SCRIPT_FILENAME"])) {
        echo "Connected successfully";
    }
} catch (PDOException $e) {
    throw new PDOException($e->getMessage(), (int)$e->getCode());
}

?>