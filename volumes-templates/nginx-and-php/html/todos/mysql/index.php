<?php
// Load environment variables
$database = $_ENV['MYSQL_DATABASE'] ?? 'php-app';
$user = $_ENV['MYSQL_USER'] ?? 'php-agent';
$password = $_ENV['MYSQL_PASSWORD'] ?? 'vtG89AmsfReJcloZUpqeTQEGhZg95ky9';
$port = $_ENV['MYSQL_TCP_PORT'] ?? '3311';
$host = $_ENV['MYSQL_HOST'] ?? 'db-svc';
$timezone = $_ENV['TZ'] ?? 'America/Kentucky/Louisville';

try {
    // Set the timezone
    date_default_timezone_set($timezone);

    // Create a new PDO instance
    $dsn = "mysql:host=$host;port=$port;dbname=$database;charset=utf8mb4";
    $pdo = new PDO($dsn, $user, $password, [
        PDO::ATTR_TIMEOUT => 3, // Set timeout to 3 seconds
    ]);

    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Check if the script name matches the file name
    if (__FILE__ == $_SERVER['SCRIPT_FILENAME']) {
        echo "Connected successfully";
    }
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>