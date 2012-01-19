<?php
include_once("functions.inc.php");
include_once("bebop.conf.inc.php");

$action=$_GET["action"];
$by=$_GET["by"];
$pub=$_GET["pub"];

if($action != null)
  {
    if($action == "showbib")
      {
	$xmlfile='bibtex.xml';
	$xslfile='showbib.xsl';
	$params['pubid'] = $pub;
	echo transform($xmlfile, $xslfile, $params);
      }
    else if($action == "showentrydetail")
      {
	$xmlfile='bibtex.xml';
	$xslfile='showentrydetail.xsl';
	$params['pubid'] = $pub;
	$params['bebophome'] = $BEBOP_HOME;
	$params['bebopembeddingurl'] = $BEBOP_EMBEDDING_URL;
	echo transform($xmlfile, $xslfile, $params);
      }
    else if($action == "showkeywordscloud")
      {
	$xmlfile='bibtex.xml';
	$xslfile='showkeywordscloud.xsl';
	echo transform($xmlfile, $xslfile, $params);
      }
    else if($action == "showauthorlist")
      {
	$xmlfile='bibtex.xml';
	$xslfile='showauthorlist.xsl';
	echo transform($xmlfile, $xslfile, $params);
      }
    else if($action == "showcategory")
      {	
	$categoryby = $by;
	$categorytype = $pub;
	$sorttype = $by; // year mi olsa
	$breadcrumb1 = "by ".$longname[$categoryby];
	if($categoryby == 'entrytype')
	  $breadcrumb2 = $longnameEntrytype[$categorytype];
	else
	  $breadcrumb2 = $categorytype;

	$xmlfile='bibtex.xml';
	$xslfile='bibtex.xsl';
	$params['categoryby'] = $categoryby;
	$params['categorytype'] = $categorytype;
	$params['sorttype'] = $sorttype;
	$params['breadcrumb1'] = $breadcrumb1;
	$params['breadcrumb2'] = $breadcrumb2;
	$params['bebophome'] = $BEBOP_HOME;
	$params['bebopembeddingurl'] = $BEBOP_EMBEDDING_URL;
	echo transform($xmlfile, $xslfile, $params);
      }
    else if($action == 'copyright')
      {
	include('copyright.php');
      }
  }
 else // $pub empty, action empty -> index.php
   {
     $xmlfile='bibtex.xml';
     $xslfile='bibtex.xsl';
     $params['categoryby'] = "year";
     $params['categorytype'] = "all";
     $params['sorttype'] = "year";
     $params['breadcrumb1'] = "by year";
     $params['breadcrumb2'] = "all";
     $params['bebophome'] = $BEBOP_HOME;
     $params['bebopembeddingurl'] = $BEBOP_EMBEDDING_URL;
     echo transform($xmlfile, $xslfile, $params);
   }



if($action != null && $action != "showentrydetail" && $action != "showbib" && $action != "showkeywordscloud" && $action != "showauthorlist" && $action != "copyright" && $action != "search")
  {
    echo "<div class=\"content\">";
    echo "<div class=\"entry1\">";
    echo "<div class=\"entrybody\" style=\"visibility:visible;\">";
    echo "Use this URL to link to this page: <br/>";

    //$http_part = (isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"]=="on") ? "https://" : "http://";
    //$permalink=$http_part . $_SERVER["SERVER_NAME"] . $_SERVER['REQUEST_URI'];
    $permalink=$BEBOP_EMBEDDING_URL . "?action=" . $action;
    //$permalink=$http_part . $BEBOP_INCLUDING_FILE . "?action=" . $action;
    if($by != null)
      $permalink = $permalink."&amp;by=".$by;
    if($pub != null)
      $permalink = $permalink."&amp;pub=".$pub;

    echo "<a href=\"".$permalink."\">".$permalink."</a>";
    echo "</div>";
    echo "</div>";
    echo "</div>";

  }

?>
