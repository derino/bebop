<?php
include_once("bebop.conf.inc.php");

//if (isset($_POST['submit'])) 
//{
$entryid = $_REQUEST['entryid'];
//}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-us" lang="en-us" dir="ltr">
<head>
<title>Upload the full text of a publication</title>
  <link href="site.css" rel="stylesheet" type="text/css" />
<script src="addpub.js" type="text/javascript"></script>
</head>

<body style="margin:10px">

<h3>Upload the full text of a publication</h3>
  <!--<b>Note</b>: Beware of the copyright requirements. You may want to modify the <a href="copyright.php">copyright.php</a> file.<br /><br />-->
<?php
if (isset($_POST['submit']) )
  {

    if ((($_FILES["file"]["type"] == "application/pdf")
	 || ($_FILES["file"]["type"] == "application/postscript")
	 || ($_FILES["file"]["type"] == "application/x-dvi")
	 || ($_FILES["file"]["type"] == "application/msword")
	 || ($_FILES["file"]["type"] == "application/zip")
	 || ($_FILES["file"]["type"] == "application/x-compressed")
	 || ($_FILES["file"]["type"] == "application/x-compress")
	 || ($_FILES["file"]["type"] == "application/x-gzip"))
	&& ($_FILES["file"]["size"] < 10000000))
      {
	if ($_FILES["file"]["error"] > 0)
	  {
	    echo "Error: " . $_FILES["file"]["error"] . "<br />";
	  }
	else
	  {
	    //echo "Upload: " . $_FILES["file"]["name"] . "<br />";
	    //echo "Type: " . $_FILES["file"]["type"] . "<br />";
	    //echo "Size: " . ($_FILES["file"]["size"] / 1024) . " Kb<br />";
	    //echo "Stored in: " . $_FILES["file"]["tmp_name"];

	    if ( $entryid != null && $entryid != '')
	      {
		$dot_ext = strrchr($_FILES["file"]["name"], '.');
		$entryid_dot_ext = $entryid . $dot_ext;
	      }
	    else // if no new name is provided, keep existing file name
	      $entryid_dot_ext = $_FILES["file"]["name"];

	    if (file_exists("upload/" . $entryid_dot_ext))  //  $_FILES["file"]["name"]))
	      {
		//echo $_FILES["file"]["name"] . " already exists. ";
		echo "<b>Error</b>: " . $entryid_dot_ext . " already exists.<br />";
		echo "Upload again giving it a unique file name (using BibTeX entry id is a good idea):";
	      }
	    else
	      {
		move_uploaded_file($_FILES["file"]["tmp_name"],
				   //				   "upload/" . $_FILES["file"]["name"]);
				   "upload/" . $entryid_dot_ext);
		//		echo "Stored in: " . "upload/" . $_FILES["file"]["name"];
		//echo "Stored in: " . "upload/" . $entryid_dot_ext;
		echo "Copy & paste the following as the <b>filelink</b> value in the other form: <br /><br />";
		$filelink = $BEBOP_HOME . "/upload/" . $entryid_dot_ext;
		echo "<a href=\"" . $filelink . "\">" . $filelink . "</a><br /><br />";
		
		//		echo "<button onclick=\"returnFilelinkAndClose(\"" . $filelink . "\");\">Close window</button>";
		echo "<button onclick=\"returnFilelinkAndClose('" . $filelink . "');\">Close window</button>";
		echo "<br /><br /><br />Upload another file:";
	      }
	  }
      }
    else
      {
	echo "<b>Error</b>: Invalid file format! This file format is not allowed to be uploaded.<br /><br />";
      }
    
  }

?>

<form action="<?php $_PHP_SELF ?>" method="post" enctype="multipart/form-data">
    
    <label for="entryid">New file name on the server without file extension (suggestion: use BibTeX entry ID, e.g. Knuth09)</label><br />
      <?php
      echo "<input type=\"text\" name=\"entryid\" id=\"entryid\" value=\"". $entryid . "\" style=\"width:350px;\" /><br /><br />";
      ?>
      
    <label for="file">Document:</label>
    <input type="file" name="file" id="file" /><br />
      Common formats are supported. File size limit is 10 Mb. <br />

    <input type="submit" name="submit" value="Upload" />
</form>

</body>
</html> 

