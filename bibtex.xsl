<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE xsl:stylesheet  [
	<!ENTITY nbsp   "&#160;">
	<!ENTITY squo "&#145;">
	<!ENTITY copy   "&#169;">
	<!ENTITY reg    "&#174;">
	<!ENTITY trade  "&#8482;">
	<!ENTITY mdash  "&#8212;">
	<!ENTITY ldquo  "&#8220;">
	<!ENTITY rdquo  "&#8221;"> 
	<!ENTITY pound  "&#163;">
	<!ENTITY yen    "&#165;">
	<!ENTITY euro   "&#8364;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="showentrydetail.xsl" />
<xsl:output omit-xml-declaration="yes" />
<!--xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/-->

<!--xsl:param name="categoryby">entrytype</xsl:param>
<xsl:param name="categorytype">paper</xsl:param>
<xsl:param name="sorttype">year</xsl:param-->
<xsl:param name="categoryby">entrytype</xsl:param>
<xsl:param name="categorytype">mastersthesis</xsl:param>
<xsl:param name="sorttype">year</xsl:param>
<xsl:param name="breadcrumb1">by year</xsl:param>
<xsl:param name="breadcrumb2">all</xsl:param>


<xsl:template match="/">
<br />
<div class="content">
<span class="tag8"> / <xsl:value-of select="$breadcrumb1" /> / <xsl:value-of select="$breadcrumb2" /></span>


<!--xsl:value-of select="$categoryby"/>
<xsl:value-of select="$categorytype"/>
<xsl:value-of select="$sorttype"/>
<xsl:value-of select="$queryselect"/-->
	
<xsl:choose>
	<xsl:when test="$categorytype='all'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='year'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry[year=$categorytype]" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='researcharea'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry[researcharea=$categorytype]" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='entrytype'">
		<xsl:choose>
			<xsl:when test="$categorytype='paper'">
				<xsl:call-template name="listPubs">
					<xsl:with-param name="sortype" select="$sorttype" />
					<xsl:with-param name="query" select="entries/entry[entrytype='article']" />
				</xsl:call-template>			
			</xsl:when>
			<xsl:when test="$categorytype='inproceedings'">
				<xsl:call-template name="listPubs">
					<xsl:with-param name="sortype" select="$sorttype" />
					<xsl:with-param name="query" select="entries/entry[entrytype='inproceedings' or entrytype='conference']" />
				</xsl:call-template>			
			</xsl:when>
			<xsl:when test="$categorytype='book'">
				<xsl:call-template name="listPubs">
					<xsl:with-param name="sortype" select="$sorttype" />
					<xsl:with-param name="query" select="entries/entry[entrytype='book']" />
				</xsl:call-template>			
			</xsl:when>
			<xsl:when test="$categorytype='inbookincollection'">
				<xsl:call-template name="listPubs">
					<xsl:with-param name="sortype" select="$sorttype" />
					<xsl:with-param name="query" select="entries/entry[entrytype='incollection' or entrytype='inbook']" />
				</xsl:call-template>			
			</xsl:when>
			<xsl:when test="$categorytype='mastersthesis'">
				<xsl:call-template name="listPubs">
					<xsl:with-param name="sortype" select="$sorttype" />
					<xsl:with-param name="query" select="entries/entry[entrytype='mastersthesis' and substring-after(@name, substring-before(@name,'MS'))='MS']" />
				</xsl:call-template>			
			</xsl:when>
			<xsl:when test="$categorytype='mastersproject'">
				<xsl:call-template name="listPubs">
					<xsl:with-param name="sortype" select="$sorttype" />
					<!-- following is equal to ends-with(@name, 'MAS'), but ends-with not available -->
					<xsl:with-param name="query" select="entries/entry[entrytype='mastersthesis' and substring-after(@name, substring-before(@name,'MAS'))='MAS']" />
				</xsl:call-template>			
			</xsl:when>
			<xsl:when test="$categorytype='patent'">
				<xsl:call-template name="listPubs">
					<xsl:with-param name="sortype" select="$sorttype" />
					<!-- following is equal to ends-with(@name, 'PATENT'), but ends-with not available -->
					<xsl:with-param name="query" select="entries/entry[entrytype='misc' and substring-after(@name, substring-before(@name,'PATENT'))='PATENT']" />
				</xsl:call-template>			
			</xsl:when>
			<xsl:when test="$categorytype='misc'">
				<xsl:call-template name="listPubs">
					<xsl:with-param name="sortype" select="$sorttype" />
					<!-- following is equal to ends-with(@name, 'MISC'), but ends-with not available -->
					<xsl:with-param name="query" select="entries/entry[entrytype='misc' and substring-after(@name, substring-before(@name,'MISC'))='MISC']" />
				</xsl:call-template>			
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="listPubs">
					<xsl:with-param name="sortype" select="$sorttype" />
					<xsl:with-param name="query" select="entries/entry[entrytype=$categorytype]" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:when>
	<xsl:when test="$categoryby='author'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry[authors/author=$categorytype]" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='keyword'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry[keywords/keyword=$categorytype]" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='ID'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry[@name=$categorytype]" />
			<xsl:with-param name="categorybyID" select="'true'" />
		</xsl:call-template>
	</xsl:when>
	<xsl:otherwise> <!-- All -->
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry" />
		</xsl:call-template>
	</xsl:otherwise>
</xsl:choose>

</div> <!-- /content -->

</xsl:template>

<xsl:template name="listPubs">
<xsl:param name="sortype" />
<xsl:param name="query" />
<xsl:param name="categorybyID">false</xsl:param> <!-- when this param is true, entry details are printed, otherwise no -->

<xsl:variable name="vMonthNames" 
    select="'|January|February|March|April|May|June|July|August|September|October|November|December'"/>


<xsl:variable name="count" select="count($query)"/>
<div class="total">Total: <xsl:value-of select="$count" /></div>

<xsl:for-each select="$query">
<xsl:sort select="*[name()=$sortype]" order="descending"/>
<xsl:sort select="year" order="descending"/>
<xsl:sort 
           select="string-length(concat(substring-before($vMonthNames,substring-before(month,' ')), substring-before($vMonthNames,month)))" data-type="number" order="descending" />
<!-- sort by year and month anyway, month field is sometimes filled with only the month name(e.g. April) and sometimes as month name and days(e.g. April 2-4). -->



<!-- Paper box -->
<div class="entry1">

<xsl:choose>
	<xsl:when test="entrytype='mastersthesis' and substring-after(@name, substring-before(@name,'MS'))='MS'">
		<div class="{entrytype}"><a class="{entrytype}" href="index.php?action=showcategory&amp;by=ID&amp;pub={@name}" title="{entrytype}"></a></div>
	</xsl:when>
	<xsl:when test="entrytype='mastersthesis' and substring-after(@name, substring-before(@name,'MAS'))='MAS'">
		<div class="{entrytype}"><a class="{entrytype}" href="index.php?action=showcategory&amp;by=ID&amp;pub={@name}" title="MAS project"></a></div>
	</xsl:when>
	<xsl:otherwise>
		 <div class="{entrytype}"><a class="{entrytype}" href="index.php?action=showcategory&amp;by=ID&amp;pub={@name}" title="{entrytype}">&nbsp;</a></div>
	</xsl:otherwise>
</xsl:choose>


<!--div class="title" /-->
<!--div class="topright" /-->
<div class="bottomleft">


<!-- handle booktitle, journal ... specifially -->
<xsl:choose>
	<xsl:when test="entrytype='article' or entrytype='ARTICLE'">
		<xsl:call-template name="printArticle" />
	</xsl:when>
	<xsl:when test="entrytype='inproceedings' or entrytype='INPROCEEDINGS' or entrytype='conference' or entrytype='CONFERENCE'">
		<xsl:call-template name="printInproceedings" />
	</xsl:when>
	<xsl:when test="entrytype='book' or entrytype='BOOK'">
		<xsl:call-template name="printBook" />
	</xsl:when>
	<xsl:when test="entrytype='incollection' or entrytype='INCOLLECTION'">
		<xsl:call-template name="printIncollection" />
	</xsl:when>
	<xsl:when test="entrytype='inbook' or entrytype='INBOOK'">
		<xsl:call-template name="printInbook" />
	</xsl:when>
	<xsl:when test="entrytype='mastersthesis' and substring-after(@name, substring-before(@name,'MS'))='MS'">
		<xsl:call-template name="printMastersthesis" />
	</xsl:when>
	<xsl:when test="entrytype='mastersthesis' and substring-after(@name, substring-before(@name,'MAS'))='MAS'">
		<xsl:call-template name="printMastersproject" />
	</xsl:when>
	<xsl:when test="entrytype='phdthesis' or entrytype='PHDTHESIS'">
		<xsl:call-template name="printPhdthesis" />
	</xsl:when>
	<xsl:when test="entrytype='techreport' or entrytype='TECHREPORT'">
		<xsl:call-template name="printTechreport" />
	</xsl:when>
	<xsl:when test="entrytype='misc' or entrytype='MISC'">
		<xsl:call-template name="printMisc" />
	</xsl:when>
	<xsl:when test="entrytype='unpublished' or entrytype='UNPUBLISHED'">
		<xsl:call-template name="printUnpublished" />
	</xsl:when>
	<xsl:otherwise>
		Unhandled type
	</xsl:otherwise>
</xsl:choose>

</div> 
<!-- /bottomleft -->

<div class="bottomright">
<a href="javascript:void(0)" onclick="getEntryDetail('{@name}')"><img src="img/more.jpg" class="moreButton" alt="toggle details" title="toggle details" /></a>
</div>

<!-- IDEA: show details by default when it's a paper being shown by its ID (permalink to a paper) 
     if permalink-to-a-paper then call also showentrydetails.xsl
     else print empty entrybody and bibbody
     debug: <xsl:value-of select="$categorybyID" />
-->

<xsl:choose>
  <xsl:when test="$categorybyID='true'">

    <!-- entrybody and bib to appear here -->
    <div class="entrybody" id="entrydetail{@name}">

      <xsl:call-template name="printEntryDetails">
	<xsl:with-param name="pubid" select="@name" />
      </xsl:call-template>
    </div>
    <!--hr /-->
    <!--bibcode-->
    <div class="bibbody" id="bib{@name}">&#160;</div>
    <!--/bibcode-->
    <abbr class="unapi-id" title="{@name}"></abbr>
    <!-- finally set it as toggled -->
    <script type="text/javascript">toggleEntryDetail['<xsl:value-of select="@name" />']='s';</script>
  </xsl:when>
  <xsl:otherwise>
    <!-- entrybody and bib to appear here -->
    <div class="entrybody" id="entrydetail{@name}">&#160;</div>
    <!--hr /-->
    <!--bibcode-->
    <div class="bibbody" id="bib{@name}">&#160;</div>
    <!--/bibcode-->
    <abbr class="unapi-id" title="{@name}"></abbr>
  </xsl:otherwise>
</xsl:choose>

</div> 
<!-- /entry -->

</xsl:for-each>

</xsl:template>

<xsl:template name="printArticle">

	<xsl:apply-templates select="authors" />
	<xsl:call-template name="printTitle" />
	<xsl:value-of select="journal"/>,&#160;
	<xsl:call-template name="printVolumeNumberPages" />
	<xsl:call-template name="printYear" />
	.
</xsl:template>

<xsl:template name="printInproceedings">

	<xsl:apply-templates select="authors" />
	<xsl:call-template name="printTitle" />
	In&#160;
	<xsl:value-of select="booktitle"/>
	<xsl:if test="editor">, eds: <xsl:value-of select="editor"/></xsl:if>,&#160;
	<xsl:call-template name="printPages" />
	<xsl:call-template name="printPublisher" />
	<xsl:call-template name="printAddress" />
	<xsl:call-template name="printYear" />
	.
</xsl:template>

<xsl:template name="printBook">

	<xsl:apply-templates select="authors" />
	<xsl:call-template name="printTitle" />
	<xsl:call-template name="printPublisher" />
	<xsl:call-template name="printYear" />
	.
</xsl:template>

<xsl:template name="printIncollection">

	<xsl:apply-templates select="authors" />
	<xsl:call-template name="printTitle" />
	In&#160;
	<xsl:value-of select="booktitle"/>;
	<xsl:if test="editor">&#160;<xsl:value-of select="editor"/>, Eds.;&#160;</xsl:if>
	<xsl:call-template name="printPublisher" />
	<xsl:call-template name="printAddress" />
	<xsl:call-template name="printPages" />
	<xsl:call-template name="printYear" />
	.
</xsl:template>

<xsl:template name="printInbook">

	<xsl:apply-templates select="authors" />
	<xsl:call-template name="printTitle" />
	<xsl:call-template name="printPublisher" />
	<xsl:call-template name="printYear" />
	.
</xsl:template>

<xsl:template name="printMastersthesis">

	<xsl:apply-templates select="authors" />
	<xsl:call-template name="printTitle" />
	Master's thesis,&#160;
	<xsl:value-of select="school" />,&#160;
	<xsl:call-template name="printAddress" />
	<xsl:call-template name="printYear" />
	.
</xsl:template>

<xsl:template name="printMastersproject">

	<xsl:apply-templates select="authors" />
	<xsl:call-template name="printTitle" />
	Master of Advanced Studies project,&#160;
	<xsl:value-of select="school" />,&#160;
	<xsl:call-template name="printAddress" />
	<xsl:call-template name="printYear" />
	.
</xsl:template>

<xsl:template name="printPhdthesis">

	<xsl:apply-templates select="authors" />
	<xsl:call-template name="printTitle" />
	PhD thesis,&#160;
	<xsl:value-of select="school" />,&#160;
	<xsl:call-template name="printAddress" />
	<xsl:call-template name="printYear" />
	.
</xsl:template>

<xsl:template name="printTechreport">

	<xsl:apply-templates select="authors" />
	<xsl:call-template name="printTitle" />
	<xsl:if test="institution">
		<xsl:value-of select="institution" />,&#160;
	</xsl:if>
	<xsl:if test="number">
		<xsl:value-of select="number" />,&#160;
	</xsl:if>
	<xsl:call-template name="printAddress" />
	<xsl:call-template name="printYear" />
	.
</xsl:template>

<xsl:template name="printMisc">

	<xsl:apply-templates select="authors" />
	<xsl:call-template name="printTitle" />
	<xsl:if test="howpublished">
		<xsl:value-of select="howpublished" />,&#160;
	</xsl:if>
	<xsl:call-template name="printYear" />
	.
</xsl:template>

<xsl:template name="printUnpublished">

	<xsl:apply-templates select="authors" />
	<xsl:call-template name="printTitle" />
	<xsl:value-of select="note"/>,&#160;
	<xsl:if test="year">
		<xsl:call-template name="printYear" />
	</xsl:if>
	.
</xsl:template>

<xsl:template match="authors">

		<!-- handle authors specially -->
		<xsl:choose>
			<xsl:when test="count(author)=1">
				<a href="javascript:void(0)" onclick="showCategory('author','{author[1]}')">
					<xsl:value-of select="author[1]"/>
				</a>,&#160;
			</xsl:when>
			<xsl:when test="count(author)=2">
				<a href="javascript:void(0)" onclick="showCategory('author','{author[1]}')">
					<xsl:value-of select="author[1]"/>
				</a>&#160;and&#160;
				<a href="javascript:void(0)" onclick="showCategory('author','{author[2]}')">
					<xsl:value-of select="author[2]"/>
				</a>,&#160;
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="author">
					<xsl:if test="position()=last()">and&#160;</xsl:if>
					<a href="javascript:void(0)" onclick="showCategory('author','{.}')">
						<xsl:value-of select="."/>
					</a>,&#160;
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>

</xsl:template>

<xsl:template name="printTitle">
      		"<b><a href="javascript:void(0)" onclick="getEntryDetail('{@name}')"><xsl:value-of select="title"/></a></b>".&#160;
</xsl:template>

<xsl:template name="printPages">
	<xsl:if test="pages">
      		pp.<xsl:value-of select="pages"/>.&#160;
	</xsl:if>
</xsl:template>

<xsl:template name="printVolumeNumberPages">
	<xsl:if test="volume">
      		<b><xsl:value-of select="volume"/></b>&#160;
	</xsl:if>
	<xsl:if test="number">
      		(<xsl:value-of select="number"/>):
	</xsl:if>
	<xsl:if test="pages">
      		<xsl:value-of select="pages"/>,&#160;
	</xsl:if>
</xsl:template>

<xsl:template name="printPublisher">
	<xsl:if test="publisher">
      		<xsl:value-of select="publisher"/>,&#160;
	</xsl:if>
</xsl:template>

<xsl:template name="printAddress">
		<xsl:if test="address">
			<xsl:value-of select="address" />,&#160;
		</xsl:if>
</xsl:template>


<!-- shown as month year -->
<xsl:template name="printYear">
		<xsl:choose>
		<xsl:when test="month and substring-before(month, ' ')">
			<xsl:value-of select="substring-before(month, ' ')" />
		</xsl:when>
		<xsl:when test="month">
			<xsl:value-of select="month" />
		</xsl:when>
		</xsl:choose>&#160;
		<a href="javascript:void(0)" onclick="showCategory('year',{year})"><xsl:value-of select="year"/></a>
</xsl:template>

</xsl:stylesheet>
