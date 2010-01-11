<?php
include_once("functions.inc.php");
include_once("bebop.conf.inc.php");

$xmlfile='bibtex.xml';
$xslfile='rss.xsl';
$params['bebophome'] = $BEBOP_HOME;
$params['pagetitle'] = $PAGE_TITLE;
$params['pagedescription'] = $PAGE_DESCRIPTION;
$params['favicon'] = $FAVICON;
echo transform($xmlfile, $xslfile, $params);
?>
