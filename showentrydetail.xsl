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

<xsl:variable name="abstract" 
    select="document(concat('abstracts/',$pubid,'-abstract.xml'))//abstract"/>
			<hr />
			<table>
				<tr><td><b>Abstract</b></td>
				    <td>
				      <xsl:value-of select="$abstract" />
					  <!--xsl:value-of select="document(concat('abstracts/',$pubid,'-abstract.xml'))//abstract" /-->				      
				    </td>
				</tr>
				
				<tr><td><b>Keywords</b></td>
				    <td><xsl:for-each select="keywords/keyword">
					<a href="javascript:void(0)" onclick="showCategory('keyword','{.}')"><xsl:value-of select="." /></a><xsl:if test="position()!=last()">,&#160;</xsl:if></xsl:for-each></td></tr>
				<tr><td><b>Research area</b></td>
				    <td><a href="javascript:void(0)" onclick="showCategory('researcharea','{researcharea}')"><xsl:value-of select="researcharea"/></a></td></tr>

				<tr><td><b>Document</b></td>
				    <td>
				      <img align="absmiddle" src="{$bebophome}/img/spacer.gif" class="permalinkSprite" style="background-image:url('{$bebophome}/img/sprites.gif');margin:2px 0 0 0;" title="permalink" /><a href="index.php?action=showcategory&amp;by=ID&amp;pub={@name}">permanent link</a>
				      <!-- <xsl:value-of select="$bebophome" />/index.php?action=showcategory&amp;by=ID&amp;pub=<xsl:value-of select="@name" /> -->

				      &#160;<img align="absmiddle" src="{$bebophome}/img/spacer.gif" class="bibtexSprite" style="background-image:url('{$bebophome}/img/sprites.gif');margin:2px 0 0 0;" title="cite" /><a href="javascript:void(0)" onclick="getBib('{@name}')">BibTeX</a>
			<xsl:if test="doi">
        			&#160;<img align="absmiddle" src="{$bebophome}/img/spacer.gif" class="htmlSprite" style="background-image:url('{$bebophome}/img/sprites.gif');margin:2px 0 0 0;" title="DOI" /><a href="{doi}" target="_blank">DOI</a>
			</xsl:if>

 			<xsl:if test="filelink">
        			&#160;<img align="absmiddle" src="{$bebophome}/img/spacer.gif" class="pdfSprite" style="background-image:url('{$bebophome}/img/sprites.gif');margin:2px 0 0 0;" title="full text" /><a href="{filelink}">full text</a>
			</xsl:if>
 			<xsl:if test="presentation">
        			&#160;<img align="absmiddle" src="{$bebophome}/img/spacer.gif" class="slidesSprite" style="background-image:url('{$bebophome}/img/sprites.gif');margin:2px 0 0 0;" title="presentation" /><a href="{presentation}">slides</a>
			</xsl:if>
 			<xsl:if test="poster">
        			&#160;<img align="absmiddle" src="{$bebophome}/img/spacer.gif" class="posterSprite" style="background-image:url('{$bebophome}/img/sprites.gif');margin:2px 0 0 0;" title="poster" /><a href="{poster}">poster</a>
			</xsl:if>
				</td></tr>

				<tr><td><b>Share</b></td>
				<td>

<div class="sociable">
<ul>
<!--li class="sociablefirst"><a rel="nofollow"  target="_blank" href="mailto:?subject={title}%26body={$bebophome}/index.php?action=showcategory%25%32%36by=ID%25%32%36pub={@name}" title="email"><img src="{$bebophome}/img/services-sprite.gif" title="email" alt="" style="width: 16px; height: 16px; background: transparent url('{$bebophome}/img/services-sprite.png') no-repeat; background-position:-325px -1px" class="sociable-hovers" /></a></li-->
<li><a rel="nofollow"  target="_blank" href="https://twitter.com/intent/tweet?text={title} - {$bebophome}/index.php?action=showcategory%26by=ID%26pub={@name}&amp;via=bibpub" title="Twitter"><img src="{$bebophome}/img/services-sprite.gif" title="Twitter" alt="" style="width: 16px; height: 16px; background: transparent url('{$bebophome}/img/services-sprite.png') no-repeat; background-position:-343px -55px" class="sociable-hovers" /></a></li>


<li><a rel="nofollow"  target="_blank" href="http://www.facebook.com/sharer/sharer.php?s=100&amp;p[url]={$bebophome}/index.php?action=showcategory%26by=ID%26pub={@name}&amp;p[title]={title}&amp;p[summary]={$abstract}&amp;p[images][0]={$bebophome}/img/bebop-logo_w100.png" title="Facebook"><img src="{$bebophome}/img/services-sprite.gif" title="Facebook" alt="" style="width: 16px; height: 16px; background: transparent url('{$bebophome}/img/services-sprite.png') no-repeat; background-position:-343px -1px" class="sociable-hovers" /></a></li>

</ul>

</div>



				</td>
				</tr>

			</table>		
</xsl:template>
<!-- /printEntryDetails -->

</xsl:stylesheet>
