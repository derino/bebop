<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output omit-xml-declaration="yes" />

<xsl:key name="rss_categories" match="entries/entry/authors/author" use="." />

<xsl:template match="/">
<ul>
<xsl:for-each select="entries/entry/authors/author">
<xsl:sort />
	<xsl:variable name="thisNode" select="generate-id(.)"/>
	<xsl:variable name="nodesAtSameLocation" select="key('rss_categories', .)"/>
	<xsl:variable name="firstNodeAtSameLocation" select="generate-id($nodesAtSameLocation[1])"/>

	<xsl:if test="$thisNode = $firstNodeAtSameLocation">
		<xsl:variable name="count" select="count(key('rss_categories', .))"/>                            
		<li><a>
			<xsl:attribute name="href">javascript:void(0)</xsl:attribute><!--#CfPTable-->
			<!--xsl:attribute name="class">tag<xsl:value-of select="$count" /></xsl:attribute-->
			<!--xsl:attribute name="title"><xsl:value-of select="$count" /></xsl:attribute-->
			<xsl:attribute name="onclick">showCategory('author','<xsl:value-of select="."/>')</xsl:attribute>
			<xsl:value-of select="."/>
		</a></li>
	</xsl:if>
</xsl:for-each>
</ul>
<br /><br />

</xsl:template>
</xsl:stylesheet>
