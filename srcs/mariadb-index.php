<html>
<body>
This is a test for MariaDB.<br>
<br>
It is implicit that PHP is running.<br>
<hr>
<?php
echo("Yes, it runs.<br>");
$link = mysqli_connect('localhost', 'ft_user', 'passwd42sp', 'ft_db');
if (!$link) {
    die('Could not connect: ' . mysql_error());
}
printf("MySQL server version: %s\n", mysql_get_server_info());
?>

?>
<hr>
</body>
</html>
