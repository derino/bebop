<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method='xml' version='1.0' encoding='UTF-8' indent='yes'/>

<xsl:param name="bebophome">http</xsl:param>
<xsl:param name="pagetitle">title</xsl:param>
<xsl:param name="pagedescription">description</xsl:param>
<xsl:param name="favicon">favicon</xsl:param>

<xsl:template match="/">
<rss version="2.0">
  <channel>
    <title><xsl:value-of select="$pagetitle" /></title>
    <link rel="shortcut icon" href="{$favicon}"/>    
    <link><xsl:value-of select="$bebophome" /></link>
    <description><xsl:value-of select="$pagedescription" /></description>
    <language>en-us</language>
    <copyright></copyright>


<xsl:variable name="vMonthNames" 
    select="'|January|February|March|April|May|June|July|August|September|October|November|December'"/>

	<xsl:for-each select="entries/entry">
	<xsl:sort select="year" order="descending"/>
	<xsl:sort 
           select="string-length(concat(substring-before($vMonthNames,substring-before(month,' ')), substring-before($vMonthNames,month)))" data-type="number" order="descending" />

	<item>
	<title><xsl:value-of select="title"/></title>
	<xsl:variable name="pubid" select="@name" />
	<link><xsl:value-of select="$bebophome" />/index.php?action=showcategory&amp;by=ID&amp;pub=<xsl:value-of select="@name"/></link>
	<description>
	<xsl:value-of select="document(concat('abstracts/', $pubid, '-abstract.xml'))//abstract" />
	</description>
    	</item>
      	</xsl:for-each>
</channel>
</rss>

</xsl:template>
</xsl:stylesheet>
