<?php
$db = mysqli_connect('localhost', 'root', '', 'db_kasir2');
$username = $_POST['username'];
$password = $_POST['password'];
// if (isset($_POST['username'])) {
//     $username = mysqli_real_escape_string($db, $_POST['username']);
// }
$sql = "SELECT * FROM login WHERE username = '" . $username . "' AND password = '" . $password . "'";

$result = mysqli_query($db, $sql);
$count = mysqli_num_rows($result);

if ($count == 1) {
    echo json_encode("Succes");
}else {
    echo json_encode("Error");
}
?>