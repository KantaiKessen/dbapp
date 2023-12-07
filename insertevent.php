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

$event = $_REQUEST["eventname"];
$desc = $_REQUEST["eventdescription"];
$stime = $_REQUEST["starttime"];
$etime = $_REQUEST["endtime"];
$cap = $_REQUEST["capacity"];
$absdead = $_REQUEST["abstractdeadline"];
$venue = $_REQUEST["venue"];
$univ = $_REQUEST["university"];
$address = $_REQUEST["address"];
$city = $_REQUEST["city"];
$state = $_REQUEST["state"];
$zip = $_REQUEST["zip"];


$sql = "INSERT INTO Events (name, description, start_time_date, end_date_time, capacity, abstract_deadline, venue, university, street_address, city, state, zipcode)
VALUES ('$event', '$desc', '$stime', '$etime', '$cap', '$absdead', '$venue', '$univ', '$address', '$city', '$state', '$zip')";

if ($conn->multi_query($sql) === TRUE) {
  echo "New records created successfully";
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?> 