<html>
<body>
This is a test for MariaDB.<br>
<br>
It is implicit that PHP is running.<br>
<hr>
<?php
echo("Yes, PHP runs, now let us test a simple MariaDB query:<hr>");
$link = mysqli_connect('localhost', 'ft_user', 'passwd42sp', 'ft_db');
if (!$link) {
    die('Could not connect: ' . mysqli_connect_errno());
}
printf("MariaDB/MySQL host info: %s\n", mysqli_get_host_info($link));
mysql_close($link);
?>
<hr>
</body>
</html>
