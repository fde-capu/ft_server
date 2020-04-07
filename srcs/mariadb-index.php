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
?>
<hr>
Test ft_db:<br>
<?php
$connection = "SELECT name, id42 FROM squad";
$result = mysqli_query($link, $connection);;
if (mysqli_num_rows($result) > 0)
{
	echo "<table>";
	while ($row = mysqli_fetch_assoc($result))
	{
		echo "<tr><td>name: " . $row["name"] . "<td>id42: " . $row["id42"];
	}
	echo "</table>";
}
else
{
	echo "No test entries found.";
}
mysqli_close($link);
?>
<hr>
</body>
</html>
