
<?php

$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "form";


$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


if (isset($_GET['id'])) {
    $id = $_GET['id'];

   
    $sql = "SELECT * FROM artwork WHERE id = $id";
    $result = $conn->query($sql);

    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
    } else {
        echo "Painting not found!";
        exit();
    }
}


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $id = $_POST['id'];
    $name = $_POST['name'];
    $artistname = $_POST['artistname'];
    $price = $_POST['price'];
    $description = $_POST['description'];
    $photo = $_POST['img'];

    
    $sql = "UPDATE paintings 
            SET name = '$name', artistname = '$artistname', price = $price, description = '$description' 
            WHERE id = $id";

    
    if ($conn->query($sql) === TRUE) {
        echo "Painting updated successfully!";
        
        header("Location: " . $_SERVER['PHP_SELF'] . "?id=" . $id);
        exit();
    } else {
        echo "Error updating painting: " . $conn->error;
    }
}

$title = 'pablo picasso'; 


$sql_gallery = "SELECT * FROM artwork WHERE artistname = ?";
$stmt = $conn->prepare($sql_gallery);
$stmt->bind_param("s", $title);
$stmt->execute();
$result_gallery = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>pablo picasso</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <a href="index.html" class="home-button">Back to Gallery</a>
    </header>

    <?php
    
    if (isset($row)) {
        ?>
        <main class="edit-form">
            <h2>Edit <?php echo $row['name']; ?></h2>
            <form action="" method="POST">
                <input type="hidden" name="id" value="<?php echo $row['id']; ?>">

                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<?php echo $row['name']; ?>" required><br>

                <label for="artistname">Artist Name:</label>
                <input type="text" id="artistname" name="artistname" value="<?php echo $row['artistname']; ?>" required><br>

                <label for="price">Price:</label>
                <input type="number" id="price" name="price" value="<?php echo $row['price']; ?>" required><br>

                <label for="description">Description:</label>
                <textarea id="description" name="description" required><?php echo $row['description']; ?></textarea><br>

                <button type="submit">Update</button>
            </form>
        </main>
        <?php
    } else {
        
        if ($result_gallery->num_rows > 0) {
            while($row_gallery = $result_gallery->fetch_assoc()) {
                ?>
                <main class="photo-detail">
                <img src="<?php echo htmlspecialchars($row_gallery['img'], ENT_QUOTES, 'UTF-8'); ?>" 
                         alt="<?php echo htmlspecialchars($row_gallery['name'], ENT_QUOTES, 'UTF-8'); ?>">
                    <h2><?php echo htmlspecialchars($row_gallery['name'], ENT_QUOTES, 'UTF-8'); ?></h2>
                    <p class="price">$<?php echo htmlspecialchars($row_gallery['price'], ENT_QUOTES, 'UTF-8'); ?></p>
                    <p class="description"><?php echo htmlspecialchars($row_gallery['description'], ENT_QUOTES, 'UTF-8'); ?></p>
                    <button onclick="buyNow(event)">Buy Now</button>
                </main>
                <?php
            }
        } else {
            echo "No paintings found!";
        }
    }

    
    $conn->close();
    ?>

    <script src="detail-script.js"></script>
</body>
</html>

