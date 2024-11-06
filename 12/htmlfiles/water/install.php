<?php
include_once("config.php");

$db_conn = mysqli_connect($db_host, $db_user, $db_pass);
if(! $db_conn )
  {
    print mysqli_error();
    die("Unable to connect to the database server.");
  }

$db_result =
  mysqli_query($db_conn, "CREATE DATABASE IF NOT EXISTS pokemondb")
  or die("Database Error " . mysqli_error());

$db_conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
if(! $db_conn )
  {
    print mysqli_error();
    die("Unable to connect to the database server.");
  }

$db_result =
  mysqli_query($db_conn, "CREATE TABLE Links ( label VARCHAR(255), link  VARCHAR(255) )")
  or die("Database Error " . mysqli_error());

$db_result =
  mysqli_query($db_conn, "INSERT INTO Links (label, link) VALUES ('Squirtle', 'squirtle/')")
  or die("Database Error " . mysqli_error());

$db_result =
  mysqli_query($db_conn, "INSERT INTO Links (label, link) VALUES ('Wartortle', 'wartortle/')")
  or die("Database Error " . mysqli_error());

$db_result =
  mysqli_query($db_conn, "INSERT INTO Links (label, link) VALUES ('Blastoise', 'blastoise/')")
  or die("Database Error " . mysqli_error());

print '
<html>
 <head>
   <title>Installation</title>
 </head>
 <body bgcolor="#66BBBB">
';

print 'The installation appears to have been configured correctly.  You should remove this file.';

print '
 </body>
</html>
';
?>
