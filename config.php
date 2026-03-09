<?php
// ============================================
// Synergy Gas Services - Database Configuration
// ============================================

define('DB_HOST', 'localhost');
define('DB_USER', 'root');         // Change to your DB user
define('DB_PASS', '');             // Change to your DB password
define('DB_NAME', 'synergy_gas_db');

function getDBConnection() {
    $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    if ($conn->connect_error) {
        die(json_encode(['success' => false, 'message' => 'Database connection failed.']));
    }
    $conn->set_charset('utf8mb4');
    return $conn;
}
?>
