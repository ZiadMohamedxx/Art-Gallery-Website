<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $username = $_POST['username'];
    $password = $_POST['password'];

   
    $conn = new mysqli("localhost", "root", "", "form");
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    
    $checkQuery = "SELECT * FROM users WHERE username = ? AND password=?";
    $stmt = $conn->prepare($checkQuery);
    $stmt->bind_param("s", $username);
    $stmt->bind_param("", $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        echo "<script>alert('Username already exists. Please choose a different one.');</script>";
    } else {
       
        $insertQuery = "INSERT INTO users (name, username, password) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($insertQuery);
        $stmt->bind_param("sss", $name, $username, $password);

        if ($stmt->execute()) {
            echo "<script>alert('Signup successful! You can now log in.');</script>";
            header("Location: login.php");
            exit();
        } else {
            echo "<script>alert('Signup failed. Please try again.');</script>";
        }
    }

    $stmt->close();
    $conn->close();
}
?>
