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

<xsl:param name="pubid">Der2007</xsl:param>
<xsl:param name="unapicall">false</xsl:param>
<!-- if it's being called by the unapi.php (i.e. zotero), then bibtex is produced w/o new lines (<br />). If it's for displaying on the webpage, then there are <br />s. -->

<xsl:template match="/">

      <xsl:for-each select="entries/entry[@name=$pubid]">

			@<xsl:value-of select="entrytype" />{<xsl:value-of select="@name" />,<xsl:if test="$unapicall!='true'"><br /></xsl:if>
			<xsl:for-each select="child::node()">
				<xsl:choose>
					<xsl:when test="name(.)='' or name(.)='entrytype' or name(.)='researcharea' or name(.)='filelink' or name(.)='presentation' or name(.)='poster'">
						<!-- do nothing! -->
					</xsl:when>
					<xsl:when test="name(.)='authors'">

						<!-- <xsl:copy-of select="$sp" /> -->
						author={<xsl:for-each select="author">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()"> and </xsl:if>
						</xsl:for-each>},<xsl:if test="$unapicall!='true'"><br /></xsl:if>
					</xsl:when>
					<xsl:when test="name(.)='keywords'">
					  <xsl:if test="$unapicall='true'">
						<!-- <xsl:copy-of select="$sp" /> -->
						keywords={<xsl:for-each select="keyword"><xsl:value-of select="."/><xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>},<xsl:if test="$unapicall!='true'"><br /></xsl:if>
					  </xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="name(.)"/>={<xsl:value-of select="."/>}<xsl:if test="position()!=last()">,</xsl:if><xsl:if test="$unapicall!='true'"><br /></xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			}

      </xsl:for-each>


</xsl:template>
</xsl:stylesheet>
