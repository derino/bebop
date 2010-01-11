<?php
include_once("bebop.conf.inc.php");

if (isset($_POST['submit'])) {
   
   $bibtexcode = $_POST['bibtexcode'];
   $bibtexcode = stripslashes($bibtexcode);
   $bibtexcode = str_replace("\r", "", $bibtexcode);

   /* NOW I DO THIS with shell_exec
   // Append new bib entry to the bibtex.bib file.   
   $fr = fopen('bibtex.bib', 'a+t');
   if(!$fr) 
     {
       echo "Could not write/open the bibtex.bib file!";
       exit;
     }
   fputs($fr, "$bibtexcode\r\n" );
   fclose($fr);
   */

   // Add new pub to the XML file.
   // For that first create newpub.bib
   $fr = fopen('newpub.bib', 'w');
   if(!$fr) 
     {
       echo "Could not create/open the newpub.bib file!";
       exit;
     }
   fputs($fr, "$bibtexcode\n" );
   fclose($fr);

   $output = shell_exec('cp bibtex.bib backup/');
   $output = shell_exec('cat newpub.bib >> bibtex.bib');
   $output = shell_exec($JAVA_EXECUTABLE.' -DVERBOSE=yes -jar bib2xml/bib2xml.jar -i newpub.bib bibtex.xml');
   $success = true;
}
else if (isset($_POST['regenerate'])) 
{
  $output = shell_exec('cp bibtex.bib backup/');
  $output = shell_exec('make clean');
  $output = shell_exec('make');
  echo "bibtex.xml is regenerated";
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-us" lang="en-us" dir="ltr">
<head>
<title>Add a publication</title>
  <link href="site.css" rel="stylesheet" type="text/css" />
<script src="addpub.js" type="text/javascript"></script>
</head>
<body style="margin:10px">

<?php
if (isset($_POST['submit']) )
  {
    echo "<p style='padding: .5em; border: 2px solid red;'>" . $output . "</p>";

    if( $success == TRUE) 
      {
	echo "<p style='padding: .5em; border: 2px solid red;'>Thanks! You can keep on adding below or go to <a href=\"index.php\">publication page</a>. Hit refresh if you don't see your submission immediately.</p>";
}
    
    if ( $success == FALSE) 
      {
	echo "<p style='padding: .5em; border: 2px solid red;'>Error: Form not filled properly. Please go back and fill all the fields except the optional fields.</p>";
      }
  }
?>

<h1>Add a new publication</h1>
<p>
You can use this form to add a publication. It will appear in <a href="index.php">this page</a>. It will also be available in the <a href="rss.php">RSS feed</a>.<br />
You can add your publication in <u>one</u> of two ways:<br />
  1) <a href="#fillform">Choose the type of your publication below, fill in the form and generate BibTeX code.</a> <br />
2) <a href="#pastebibtex">Or directly paste the BibTeX code of your publication.</a><br />
<br />
<b>NOTE: </b>Before adding your publication, refer to the <a href="bibtex-help.txt" target="_blank">help page</a> or see similar examples in the <a href="bibtex.bib" target="_blank">BibTeX file</a>.
</p>

<h2 id="fillform">1) By filling in the form</h2>
*: obligatory fields
<form name="bibentryform" id="bibentryform" action="">
<p>
<fieldset>
<legend>Add your publication</legend>
<div>
  <label for="entrytype">Select publication type:</label><br />
  <select name="entrytype" id="entrytype" onChange="showForm(this.value)">
    <option value="article" selected="true">Article (Journal paper)</option>
    <option value="book">Book</option>
    <option value="inproceedings">Inproceedings (Conference paper)</option>
    <option value="incollection">Incollection (Book chapter)</option>
    <option value="inbook">Inbook (Book chapter without titled chapter)</option>
    <option value="mastersthesis">Masters thesis</option>
    <option value="masproject">MAS project</option>
    <option value="phdthesis">PhD thesis</option>
    <option value="techreport">Technical report</option>
  <option value="misc">Misc (Patent, Presentation etc.)</option>
    <option value="unpublished">Unpublished</option>
  </select> <br /><br />

  <label for="entryname">entry ID(*) (e.g. BeCeDe06) NOTE: MS thesis ID ends with MS (e.g. deri06MS), MAS project ID ends with MAS (e.g. dani04MAS). Patent ID ends with PATENT (e.g. BeCe04PATENT)</label><br />
    <input type="text" name="entryname" id="entryname" value=""  style="width:400px;" /><a href="bibtex.bib" target="_blank">check uniqueness</a><br /><br />
  
    <div id="entryform">
      <script type="text/javascript">showForm("article")</script>
    </div>

</div>
</fieldset>

<fieldset>
<legend>Extended BibTeX fields</legend>
<div>
  <label for="abstract">Abstract</label><br />
  <textarea name="abstract" id="abstract" rows="10" cols="80"></textarea><br /><br />

  <label for="researcharea">Research area</label><br />
  <input type="text" name="researcharea" id="researcharea" value="" style="width:400px;" /><br /><br />  

  <label for="keywords">Keywords seperated with comma(,). e.g. unified modeling language (UML), model checking</label><br />
  <input type="text" name="keywords" id="keywords" value="" style="width:400px;" /><br /><br />

       <label for="filelink">File link</label> (Enter the URL to the full text document. If missing, <a href="javascript:openUploadPubForm()">click to upload the full text document</a>)<br />
  <input type="text" name="filelink" id="filelink" value="" style="width:400px;" /><br /><br />

</div>
</fieldset>
</form>

<p><button onclick="genBib()">Generate BibTeX code</button> Then preview it below and click the 'Publish' button.</p>

<h2 id="pastebibtex">2) By pasting your BibTeX code if you already have it.</h2>

If the full text document is not on the server, <a href="javascript:openUploadPubForm()">click to upload the full text document</a>.<br /><br />

<form name="bibcodeform" id="bibcodeform" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">

  <label for="bibtexcode">BibTeX of your entry</label><br />
  <textarea name="bibtexcode" id="bibtexcode" rows="10" cols="80"></textarea><br /><br />

<div>
<label for="submit"></label>
<input type="submit" name="submit" id="submit" value="Publish" />
</div>
</form>


<h1>Regenerate bibtex.xml</h1>
			 <form name="regenerate-form" id="regenerate-form" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
			 <div>
			 <label for="regenerate"></label>
			 <input type="submit" name="regenerate" id="regenerate" value="Regenerate" />
			 </div>
			 </form>
			 
</body>
</html>
