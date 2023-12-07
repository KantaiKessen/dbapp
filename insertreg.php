<?php
$servername = "localhost";
$username = "dsuser";
$password = "Passw0rd";
$dbname = "aem";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
//taking POST data
$fname = $_REQUEST["firstname"];
$lname = $_REQUEST["lastname"];
$phone1 = $_REQUEST["phone1"];
$phone2 = $_REQUEST["phone2"];
$email = $_REQUEST["email"];
$pwd = $_REQUEST["password"];
$username = $_REQUEST["username"];


$sql = "INSERT INTO Users (first_name, last_name, phone_1, phone_2, email, password, username)
VALUES ('$fname', '$lname', '$phone1', '$phone2', '$email', '$pwd', '$username')";

if ($conn->multi_query($sql) === TRUE) {
  echo "User has been registered";
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?> 