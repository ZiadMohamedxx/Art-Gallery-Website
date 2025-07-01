<?php

$invalid = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (empty($_POST['username']) || empty($_POST['password'])) {
        $invalid = "Please fill in both fields.";
    } else {
        $username = $_POST['username'];
        $password = $_POST['password'];

        
        $conn = new mysqli("localhost", "root", "", "form");
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        
        $stmt = $conn->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
        $stmt->bind_param("ss", $username, $password);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $user = $result->fetch_assoc();
            echo "Login successful! Welcome back , " . htmlspecialchars($user['name']);
            header("Location: login-access.php");
            
            exit();

        } else {
            $invalid = "Incorrect username or password.";
        }
        $stmt->close();
        $conn->close();
    }
}

?>