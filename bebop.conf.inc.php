<?php

include_once("functions.inc.php");

// URL address of the bebop installation folder on your server.
$BEBOP_HOME="http://www.alari.ch/people/derino/apps/devel/bebop";

// OPTIONAL: page title
$PAGE_TITLE="Publications";

// OPTIONAL: page description
$PAGE_DESCRIPTION="My publication list";

// OPTIONAL: page keywords
$PAGE_KEYWORDS="publications";

// OPTIONAL: favicon - used for the page and the RSS feed
$FAVICON="http://www.alari.ch/favicon.ico";

// The year of the earliest publication
$START_YEAR = 2001;

// Menu matrix - comment out the rows to exclude.
$MENU = array(
	      "year" => yearArraySince($START_YEAR), //array('2009', '2008', '2007', '2006', '2005', '2004', '2003', '2002', '2001'),
	      "researcharea" => array('Your research area', 'Your other research area'),
	      "keywords" => array(),
	      "entrytype" => array('paper', 'inproceedings', 'inbookincollection', 'book', 'mastersthesis', 'mastersproject', 'phdthesis', 'techreport', 'patent', 'misc'),
	      //"author" => array('A. U. Thor')
	      );

// full path to the Java executable (needed by addpub.php)
$JAVA_EXECUTABLE="/usr/java/latest/bin/java";

// OPTIONAL: Bebop page can be customized by including a header file of your own. Specify below the path to your header file.
//$EXTERNAL_HEADER="includes/header.html";

// OPTIONAL: Bebop page can be customized by including a footer file of your own. Specify below the path to your footer file.
//$EXTERNAL_FOOTER="includes/footer.html";

// OPTIONAL: an external CSS file may be needed by EXTERNAL_HEADER and EXTERNAL_FOOTER
// relative path to external css from bebop home directory
//$EXTERNAL_CSS="../../css/stylesheet.css";

include_once("user.conf.inc.php");

?>