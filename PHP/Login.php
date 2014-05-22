<?php
 
$host="gandibleux.eu.mysql"; // Host name 
$username="gandibleux_eu"; // Mysql username 
$password="LyUhkBQB"; // Mysql password 
$db_name="gandibleux.eu"; // Database name 
//$tbl_name="members"; // Table name 

// Connect to server and select databse.
//$connection = mysql_connect("$host", "$username", "$password")or die("cannot connect"); 
//mysql_select_db("$db_name")or die("cannot select DB");

// Create connection
 $connection =mysql_connect("$host","$username","$password","$db_name");
 
// Check connection
if (mysqli_connect_errno())
{
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
 
// This SQL statement selects ALL from the table 'Accounts'
$sql = "SELECT * FROM Accounts";
 
// Check if there are results
if ($result = mysqli_query($connection, $sql))
{
    // If so, then create a results array and a temporary one
    // to hold the data
    $resultArray = array();
    $tempArray = array();
 
    // Loop through each row in the result set
    while($row = $result->fetch_object())
    {
        // Add each row into our results array
        $tempArray = $row;
        array_push($resultArray, $tempArray);
    }
 
    // Finally, encode the array to JSON and output the results
    echo json_encode($resultArray);
}
 
// Close connections
mysqli_close($result);
mysqli_close($connection);
?>