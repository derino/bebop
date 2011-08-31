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
<xsl:output omit-xml-declaration="yes" />

<xsl:param name="pubid">371690</xsl:param>
<xsl:param name="bebophome">http</xsl:param>

<xsl:template match="/">

      <xsl:for-each select="entries/entry[@name=$pubid]">
	<xsl:call-template name="printEntryDetails">
	  <xsl:with-param name="pubid" select="$pubid" />
	  <xsl:with-param name="bebophome" select="$bebophome" />
	</xsl:call-template>

      </xsl:for-each>

</xsl:template>

<xsl:template name="printEntryDetails">
<xsl:param name="pubid" />
<xsl:param name="bebophome" />

			<hr />
			<table>
				<tr><td><b>Abstract</b></td>
				    <td>
					  <xsl:value-of select="document(concat('abstracts/',$pubid,'-abstract.xml'))//abstract" />				      
				    </td>
				</tr>
				
				<tr><td><b>Keywords</b></td>
				    <td><xsl:for-each select="keywords/keyword">
					<a href="javascript:void(0)" onclick="showCategory('keyword','{.}')"><xsl:value-of select="." /></a><xsl:if test="position()!=last()">,&#160;</xsl:if></xsl:for-each></td></tr>
				<tr><td><b>Research area</b></td>
				    <td><a href="javascript:void(0)" onclick="showCategory('researcharea','{researcharea}')"><xsl:value-of select="researcharea"/></a></td></tr>

				<tr><td><b>Document</b></td>
				    <td>
				      <img align="absmiddle" src="{$bebophome}/img/spacer.gif" class="sprites permalinkSprite" title="permalink" /><a href="{$bebophome}/index.php?action=showcategory&amp;by=ID&amp;pub={@name}">permanent link</a>
				      <!-- <xsl:value-of select="$bebophome" />/index.php?action=showcategory&amp;by=ID&amp;pub=<xsl:value-of select="@name" /> -->

				      &#160;<img align="absmiddle" src="{$bebophome}/img/spacer.gif" class="sprites bibtexSprite" title="cite" /><a href="javascript:void(0)" onclick="getBib('{@name}')">BibTeX</a>
			<xsl:if test="doi">
        			&#160;<img align="absmiddle" src="{$bebophome}/img/spacer.gif" class="sprites htmlSprite" title="DOI" /><a href="{doi}" target="_blank">DOI</a>
			</xsl:if>

 			<xsl:if test="filelink">
        			&#160;<img align="absmiddle" src="{$bebophome}/img/spacer.gif" class="sprites pdfSprite" title="full text" /><a href="{filelink}">full text</a>
			</xsl:if>
 			<xsl:if test="presentation">
        			&#160;<img align="absmiddle" src="{$bebophome}/img/spacer.gif" class="sprites slidesSprite" title="presentation" /><a href="{presentation}">slides</a>
			</xsl:if>
 			<xsl:if test="poster">
        			&#160;<img align="absmiddle" src="{$bebophome}/img/spacer.gif" class="sprites posterSprite" title="poster" /><a href="{poster}">poster</a>
			</xsl:if>
				</td></tr>
			</table>		
</xsl:template>
<!-- /printEntryDetails -->

</xsl:stylesheet>
