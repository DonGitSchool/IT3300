<?php
include_once("config.php");


$db_conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name); 

if($_POST['f_desc'] && $_POST['f_link'])
{
  $db_result =
    mysqli_query($db_conn, "INSERT INTO Links VALUES ('$_POST[f_desc]', '$_POST[f_link]')")
    or die("Database Error");
}


$db_result = mysqli_query($db_conn, "SELECT label,link FROM Links" ) or die("Database Error");

print '
<html>
 <head>
   <title>The Water Pokemon</title>
 </head>
 <body bgcolor="#66BBBB">
  <center>
';
$row_count = mysqli_num_rows($db_result);

if(mysqli_num_rows($db_result) < 1)
{
  print '
   <h2>No water type pokemon have entered their pages.</h2>
';
}
else
{
  print '
   <h2>The Water Pokemon</h2>
   <table border="1">
    <tr><th>Name</th><th>Web Site</th></tr>
';
  
  while($db_row = mysqli_fetch_array($db_result))
    {
      print '<tr><td>'.$db_row['label'].'</td>';
      print '<td><a href="'.$db_row['link'].'">'.$db_row['link'].'</a></td></tr>';
    }
  print '
   </table>
';
}

print '
   <br>
   <br>
   <hr>
   <br>
   <br>
   <form method="post" action="index.php">
   <input type="hidden" name="nlink" value="'.$row_count.'" />
   <table border="0">
     <tr>
       <td>Pokemon Name:</td><td><input type="text" name="f_desc"></td>
     </tr>
     <tr>
       <td>Site URL:</td><td><input type="text" size="50" name="f_link"></td>
     </tr>
     <tr>
       <td colspan="2" align="center"><input type="submit" value="Add Link"></td>
     </tr>
   </table>
   <form>
';

print "<h3>The server ip address is ". $_SERVER['SERVER_ADDR']."</h3>";

print '
  </center>
 </body>
</html>
';
?>
