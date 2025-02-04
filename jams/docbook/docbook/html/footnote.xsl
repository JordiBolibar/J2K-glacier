<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:d="http://docbook.org/ns/docbook"
xmlns:exsl="http://exslt.org/common"
                exclude-result-prefixes="exsl d"
                version='1.0'>

<!-- ********************************************************************
     $Id$
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://docbook.sf.net/release/xsl/current/ for
     copyright and other information.

     ******************************************************************** -->

<xsl:template match="d:footnote">
  <xsl:variable name="name">
    <xsl:call-template name="object.id"/>
  </xsl:variable>
  <xsl:variable name="href">
    <xsl:text>#ftn.</xsl:text>
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="ancestor::d:tgroup">
      <sup>
        <xsl:text>[</xsl:text>
        <a name="{$name}" href="{$href}">
          <xsl:apply-templates select="." mode="class.attribute"/>
          <xsl:apply-templates select="." mode="footnote.number"/>
        </a>
        <xsl:text>]</xsl:text>
      </sup>
    </xsl:when>
    <xsl:otherwise>
      <sup>
        <xsl:text>[</xsl:text>
        <a name="{$name}" href="{$href}">
          <xsl:apply-templates select="." mode="class.attribute"/>
          <xsl:apply-templates select="." mode="footnote.number"/>
        </a>
        <xsl:text>]</xsl:text>
      </sup>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="d:footnoteref">
  <xsl:variable name="targets" select="key('id',@linkend)"/>
  <xsl:variable name="footnote" select="$targets[1]"/>

  <xsl:if test="not(local-name($footnote) = 'footnote')">
   <xsl:message terminate="yes">
ERROR: A footnoteref element has a linkend that points to an element that is not a footnote. 
Typically this happens when an id attribute is accidentally applied to the child of a footnote element. 
target element: <xsl:value-of select="local-name($footnote)"/>
linkend/id: <xsl:value-of select="@linkend"/>
   </xsl:message>
  </xsl:if>

  <xsl:variable name="target.href">
    <xsl:call-template name="href.target">
      <xsl:with-param name="object" select="$footnote"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="href">
    <xsl:value-of select="substring-before($target.href, '#')"/>
    <xsl:text>#ftn.</xsl:text>
    <xsl:value-of select="substring-after($target.href, '#')"/>
  </xsl:variable>

  <sup>
    <xsl:text>[</xsl:text>
    <a href="{$href}">
      <xsl:apply-templates select="." mode="class.attribute"/>
      <xsl:apply-templates select="$footnote" mode="footnote.number"/>
    </a>
    <xsl:text>]</xsl:text>
  </sup>
</xsl:template>

<xsl:template match="d:footnote" mode="footnote.number">
  <xsl:choose>
    <xsl:when test="string-length(@label) != 0">
      <xsl:value-of select="@label"/>
    </xsl:when>
    <xsl:when test="ancestor::d:tgroup">
      <xsl:variable name="tfnum">
        <xsl:number level="any" from="d:table|d:informaltable" format="1"/>
      </xsl:variable>

      <xsl:choose>
        <xsl:when test="string-length($table.footnote.number.symbols) &gt;= $tfnum">
          <xsl:value-of select="substring($table.footnote.number.symbols, $tfnum, 1)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:number level="any" from="d:tgroup"
                      format="{$table.footnote.number.format}"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="pfoot" select="preceding::d:footnote[not(@label)]"/>
      <xsl:variable name="ptfoot" select="preceding::d:tgroup//d:footnote"/>
      <xsl:variable name="fnum" select="count($pfoot) - count($ptfoot) + 1"/>

      <xsl:choose>
        <xsl:when test="string-length($footnote.number.symbols) &gt;= $fnum">
          <xsl:value-of select="substring($footnote.number.symbols, $fnum, 1)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:number value="$fnum" format="{$footnote.number.format}"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template match="d:footnote/d:para[1]|d:footnote/d:simpara[1]" priority="2">
  <!-- this only works if the first thing in a footnote is a para, -->
  <!-- which is ok, because it usually is. -->
  <xsl:variable name="name">
    <xsl:text>ftn.</xsl:text>
    <xsl:call-template name="object.id">
      <xsl:with-param name="object" select="ancestor::d:footnote"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="href">
    <xsl:text>#</xsl:text>
    <xsl:call-template name="object.id">
      <xsl:with-param name="object" select="ancestor::d:footnote"/>
    </xsl:call-template>
  </xsl:variable>
  <p>
    <xsl:call-template name="locale.html.attributes"/>
    <xsl:if test="@role and $para.propagates.style != 0">
      <xsl:apply-templates select="." mode="class.attribute">
        <xsl:with-param name="class" select="@role"/>
      </xsl:apply-templates>
    </xsl:if>
    <sup>
      <xsl:text>[</xsl:text>
      <a name="{$name}" href="{$href}">
        <xsl:apply-templates select="." mode="class.attribute"/>
        <xsl:apply-templates select="ancestor::d:footnote"
                             mode="footnote.number"/>
      </a>
      <xsl:text>] </xsl:text>
    </sup>
    <xsl:apply-templates/>
  </p>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template match="*" mode="footnote.body.number">
  <xsl:variable name="name">
    <xsl:text>ftn.</xsl:text>
    <xsl:call-template name="object.id">
      <xsl:with-param name="object" select="ancestor::d:footnote"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="href">
    <xsl:text>#</xsl:text>
    <xsl:call-template name="object.id">
      <xsl:with-param name="object" select="ancestor::d:footnote"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="footnote.mark">
    <sup>
      <xsl:text>[</xsl:text>
      <a name="{$name}" href="{$href}">
        <xsl:apply-templates select="." mode="class.attribute"/>
        <xsl:apply-templates select="ancestor::d:footnote"
                             mode="footnote.number"/>
      </a>
      <xsl:text>] </xsl:text>
    </sup>
  </xsl:variable>

  <xsl:variable name="html">
    <xsl:apply-templates select="."/>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$exsl.node.set.available != 0">
      <xsl:variable name="html-nodes" select="exsl:node-set($html)"/>
      <xsl:choose>
        <xsl:when test="$html-nodes//p">
          <xsl:apply-templates select="$html-nodes" mode="insert.html.p">
            <xsl:with-param name="mark" select="$footnote.mark"/>
          </xsl:apply-templates>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="$html-nodes" mode="insert.html.text">
            <xsl:with-param name="mark" select="$footnote.mark"/>
          </xsl:apply-templates>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy-of select="$html"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ==================================================================== -->

<!--
<xsl:template name="count-element-from">
  <xsl:param name="from" select=".."/>
  <xsl:param name="to" select="."/>
  <xsl:param name="count" select="0"/>
  <xsl:param name="list" select="$from/following::*[local-name(.)=local-name($to)]
                                 |$from/descendant-or-self::*[local-name(.)=local-name($to)]"/>

  <xsl:choose>
    <xsl:when test="not($list)">
      <xsl:text>-1</xsl:text>
    </xsl:when>
    <xsl:when test="$list[1] = $to">
      <xsl:value-of select="$count + 1"/>
    </xsl:when>
    <xsl:otherwise>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
-->

<!-- ==================================================================== -->

<xsl:template name="process.footnotes">
  <xsl:variable name="footnotes" select=".//d:footnote"/>
  <xsl:variable name="table.footnotes"
                select=".//d:tgroup//d:footnote"/>

  <!-- Only bother to do this if there's at least one non-table footnote -->
  <xsl:if test="count($footnotes)>count($table.footnotes)">
    <div class="footnotes">
      <br/>
      <hr width="100" align="{$direction.align.start}"/>
      <xsl:apply-templates select="$footnotes" mode="process.footnote.mode"/>
    </div>
  </xsl:if>

  <xsl:if test="$annotation.support != 0 and //d:annotation">
    <div class="annotation-list">
      <div class="annotation-nocss">
	<p>The following annotations are from this essay. You are seeing
	them here because your browser doesn’t support the user-interface
	techniques used to make them appear as ‘popups’ on modern browsers.</p>
      </div>

      <xsl:apply-templates select="//d:annotation"
			   mode="annotation-popup"/>
    </div>
  </xsl:if>
</xsl:template>

<xsl:template name="process.chunk.footnotes">
  <!-- nop -->
</xsl:template>

<xsl:template match="d:footnote" name="process.footnote" mode="process.footnote.mode">
  <xsl:choose>
    <xsl:when test="local-name(*[1]) = 'para' or local-name(*[1]) = 'simpara'">
      <div>
        <xsl:call-template name="common.html.attributes"/>
        <xsl:apply-templates/>
      </div>
    </xsl:when>

    <xsl:when test="$html.cleanup != 0 and 
                    $exsl.node.set.available != 0">
      <div>
        <xsl:call-template name="common.html.attributes"/>
        <xsl:apply-templates select="*[1]" mode="footnote.body.number"/>
        <xsl:apply-templates select="*[position() &gt; 1]"/>
      </div>
    </xsl:when>

    <xsl:otherwise>
      <xsl:message>
        <xsl:text>Warning: footnote number may not be generated </xsl:text>
        <xsl:text>correctly; </xsl:text>
        <xsl:value-of select="local-name(*[1])"/>
        <xsl:text> unexpected as first child of footnote.</xsl:text>
      </xsl:message>
      <div>
        <xsl:call-template name="common.html.attributes"/>
        <xsl:apply-templates/>
      </div>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="d:tgroup//d:footnote"
              mode="process.footnote.mode">
</xsl:template>

<xsl:template match="d:footnote" mode="table.footnote.mode">
  <xsl:call-template name="process.footnote"/>
</xsl:template>

</xsl:stylesheet>
