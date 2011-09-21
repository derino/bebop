<?php 
include_once("functions.inc.php");
include_once("bebop.conf.inc.php");

$action=$_GET["action"];
?>

<div class="bebop">

<?php 
  if(isset($EXTERNAL_HEADER))
    include $EXTERNAL_HEADER 
?>

<!-- header -->
<div class="whitebox">

<!--
<div class="header">

   <a href="rss.php" class="logout"><span>RSS</span></a>
   <a href="." class="logo"><span>Publications</span></a> 
</div>--> <!-- /header -->

<div class="content">
<div class="entry1">
  <div class="entrybody" style="visibility:visible;">
<?php
      if($MENU_STYLE == "HORIZONTAL")
	print "<table id=\"filters\" width=\"100%\">";
      else // default: VERTICAL
	print "<table width=\"100%\">";
?>
<tr>
<td>
List publications:
</td>
<?php

foreach ($MENU as $_category => $items)
{
  print "<td>";
  if($_category == "keywords")
    {
      print "<b><a href=\"javascript:void(0)\" onclick=\"showCategory('','showkeywords')\">by ".$_category."</a></b>&#160;&#160;&#160;<br />";
      //      print "<b><a href=\"index.php?action=showkeywordscloud\">by ".$_category."</a></b>&#160;&#160;&#160;<br />";
    }

  else if($_category == "author")
    {
      print "<b><a href=\"javascript:void(0)\" onclick=\"showCategory('','showauthors')\">by ".$_category."</a></b>&#160;&#160;&#160;<br />";
      //      print "<b><a href=\"index.php?action=showauthorlist\">by ".$_category."</a></b>&#160;&#160;&#160;<br />";
    }
  else
    {
      print "<b><a href=\"javascript:void(0)\" onclick=\"showCategory('$_category','all')\">by ".$longname[$_category]."</a></b>&#160;&#160;&#160;<br />";

//      print "<b><a href=\"index.php?action=showcategory&amp;by=".$_category."&amp;pub=all\">by ".$longname[$_category]."</a></b>&#160;&#160;&#160;<br />";
    }

  print "<ul>";

  if($_category == "keywords")
    {
      print "<li><a href=\"javascript:void(0)\" onclick=\"showCategory('','showkeywords')\">show all</a></li>"; 
      //      print "<li><a href=\"index.php?action=showkeywordscloud\">show all</a></li>"; 
    }
  if($_category == "author")
    {
      print "<li><a href=\"javascript:void(0)\" onclick=\"showCategory('','showauthors')\">show all</a></li>"; 
      //      print "<li><a href=\"index.php?action=showauthorlist\">show all</a></li>"; 
    }

  foreach ($items as $_item)
  {
    $_itemtext = ($_category == "entrytype") ? $longnameEntrytype[$_item] : $_item;
    print "<li><a href=\"javascript:void(0)\" onclick=\"showCategory('$_category','$_item')\">".$_itemtext."</a></li>"; 
    //    print "<li><a href=\"index.php?action=showcategory&amp;by=".$_category."&amp;pub=".$_item."\">".$_itemtext."</a></li>"; 
  }

  print "</ul>";
  print "</td>";
}
?>

</tr>
</table>
</div>
</div>
</div><!-- // categorytable -->

<?php
  if($action == "showkeywordscloud")
    {
      echo "<div class=\"content\">";
      echo "<div class=\"entry1\">";
      echo "<div id=\"keywordsCloud\" class=\"bigLinks\">";
      include("ajax.php");
      echo "</div>";
      echo "</div>";
      echo "</div>";
      echo "<script type=\"text/javascript\">toggleKeywordsCloud='s';</script>";
    }
else if($action == "showauthorlist")
    {
      echo "<div class=\"content\">";
      echo "<div class=\"entry1\">";
      echo "<div id=\"keywordsCloud\" class=\"authorListLinks\">";
      include("ajax.php");
      echo "</div>";
      echo "</div>";
      echo "</div>";
      echo "<script type=\"text/javascript\">toggleAuthorList='s';</script>";
    }
  else
    {
      echo "<div id=\"keywordsCloud\" class=\"bigLinks\">";
      echo "</div>";
    }

echo "<div id=\"CfPTable\">";
if($action != "showkeywordscloud" && $action != "showauthorlist")
    include("ajax.php");  // 'include' is google-friendly, allows index.php?blahblah
echo "</div>";
?>

</div> <!-- whitebox -->

<div class="bottomleft">
  <span>
<a href="index.php?action=copyright">Copyright notice</a> &#149;
<?php
  echo "<a href=\"".$BEBOP_HOME."/addpub.php\">Add a publication</a> &#149;";
  echo "<a href=\"".$BEBOP_HOME."/rss.php\">RSS</a> &#149;";
?>
<a href="http://validator.w3.org/check/referer">valid xhtml</a> &#149;
<a href="http://jigsaw.w3.org/css-validator/check/referer">valid css</a> &#149;
Powered by <a href="http://www.alari.ch/people/derino/Software/Bebop/index.php">bebop</a> and 
<?php
  echo "<a href=\"".$BEBOP_HOME."/bibtex.bib\">BibTeX</a>."
?>
</span><br/><br/><br/>&nbsp;
</div> 

</div> <!-- bebop -->

<?php 
  if(isset($EXTERNAL_FOOTER))
    include $EXTERNAL_FOOTER 
?>