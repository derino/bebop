<?php
include_once("functions.inc.php");

$id=$_GET['id'];
$format=$_GET['format'];

//$id="OtReLa07";
//$format="bibtex";

if($id == null)
  {
    echo "Needs to be called with a publication id!";
    return;
  }
 else if($format == null)
   {
     echo "<formats id=\"" . $id . "\">";
     echo "<format name=\"bibtex\" type=\"text/plain\" docs=\"http://en.wikipedia.org/wiki/BibTeX\"/>";
     echo "</formats>";
   }
 else if($format == "bibtex")
   {
     $xmlfile='bibtex.xml';
     $xslfile='showbib.xsl';
     $params['pubid'] = $id;
     $params['unapicall'] = 'true';
     echo transform($xmlfile, $xslfile, $params);
   }
 else
   echo "Unsupported format!";

?>