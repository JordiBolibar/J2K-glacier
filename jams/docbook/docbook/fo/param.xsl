<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:d="http://docbook.org/ns/docbook" exclude-result-prefixes="d" version="1.0">

<!-- This file is generated from param.xweb -->

<!-- ********************************************************************
     $Id$
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://docbook.sf.net/release/xsl/current/ for
     copyright and other information.

     ******************************************************************** -->


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="abstract.properties">
<refmeta>
<refentrytitle>abstract.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>abstract.properties</refname>
<refpurpose>Properties associated with the block surrounding an abstract</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Block styling properties for abstract.</para>

<para>See also <parameter>abstract.title.properties</parameter>.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="abstract.properties">
  <xsl:attribute name="start-indent">0.0in</xsl:attribute>
  <xsl:attribute name="end-indent">0.0in</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="abstract.title.properties">
<refmeta>
<refentrytitle>abstract.title.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>abstract.title.properties</refname>
<refpurpose>Properties for abstract titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties for abstract titles.</para>

<para>See also <parameter>abstract.properties</parameter>.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="abstract.title.properties">
  <xsl:attribute name="font-family"><xsl:value-of select="$title.fontset"/></xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  <xsl:attribute name="space-before.optimum"><xsl:value-of select="concat($body.font.master, 'pt')"/></xsl:attribute>
  <xsl:attribute name="space-before.minimum"><xsl:value-of select="concat($body.font.master, 'pt * 0.8')"/></xsl:attribute>
  <xsl:attribute name="space-before.maximum"><xsl:value-of select="concat($body.font.master, 'pt * 1.2')"/></xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="text-align">center</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="admon.graphics.extension">
<refmeta>
<refentrytitle>admon.graphics.extension</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>admon.graphics.extension</refname>
<refpurpose>Filename extension for admonition graphics</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Sets the filename extension to use on admonition graphics.</para>

</refsection>
</doc:refentry>
<xsl:param name="admon.graphics.extension">.png</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="admon.graphics">
<refmeta>
<refentrytitle>admon.graphics</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>admon.graphics</refname>
<refpurpose>Use graphics in admonitions?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If true (non-zero), admonitions are presented in an alternate style that uses
a graphic.  Default graphics are provided in the distribution.
</para>

</refsection>
</doc:refentry>
<xsl:param name="admon.graphics" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="admon.graphics.path">
<refmeta>
<refentrytitle>admon.graphics.path</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>admon.graphics.path</refname>
<refpurpose>Path to admonition graphics</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Sets the path to the directory containing the admonition graphics
(caution.png, important.png etc). This location is normally relative
to the output html directory. See <parameter>base.dir</parameter></para>

</refsection>
</doc:refentry>
<xsl:param name="admon.graphics.path">images/</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="admon.textlabel">
<refmeta>
<refentrytitle>admon.textlabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>admon.textlabel</refname>
<refpurpose>Use text label in admonitions?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If true (non-zero), admonitions are presented with a generated
text label such as Note or Warning in the appropriate language.
If zero, such labels are turned off, but any title child
of the admonition element are still output.
The default value is 1.
</para>

</refsection>
</doc:refentry>
<xsl:param name="admon.textlabel" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="admonition.properties">
<refmeta>
  <refentrytitle>admonition.properties</refentrytitle>
  <refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>  
<refnamediv>
<refname>admonition.properties</refname>
<refpurpose>To set the style for admonitions.</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>How do you want admonitions styled? </para>
<para>Set the font-size, weight, etc. to the style required</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="admonition.properties"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="admonition.title.properties">

<refmeta>
  <refentrytitle>admonition.title.properties</refentrytitle>
  <refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>admonition.title.properties</refname>
<refpurpose>To set the style for admonitions titles.</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>How do you want admonitions titles styled? </para>
<para>Set the font-size, weight etc to the style required.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="admonition.title.properties">
  <xsl:attribute name="font-size">14pt</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="graphical.admonition.properties">
<refmeta>
<refentrytitle>graphical.admonition.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>graphical.admonition.properties</refname>
<refpurpose>To add properties to the outer block of a graphical admonition.</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>These properties are added to the outer block containing the
entire graphical admonition, including its title.
It is used when the parameter
<parameter>admon.graphics</parameter> is set to nonzero.
Use this attribute-set to set the space above and below,
and any indent for the whole admonition.</para>

<para>In addition to these properties, a graphical admonition
also applies the <parameter>admonition.title.properties</parameter>
attribute-set to the title, and applies the
<parameter>admonition.properties</parameter> attribute-set
to the rest of the content.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="graphical.admonition.properties">
  <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">1.2em</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="nongraphical.admonition.properties">
<refmeta>
<refentrytitle>nongraphical.admonition.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>nongraphical.admonition.properties</refname>
<refpurpose>To add properties to the outer block of a nongraphical admonition.</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>These properties are added to the outer block containing the
entire nongraphical admonition, including its title.
It is used when the parameter
<parameter>admon.graphics</parameter> is set to zero.
Use this attribute-set to set the space above and below,
and any indent for the whole admonition.</para>

<para>In addition to these properties, a nongraphical admonition
also applies the <parameter>admonition.title.properties</parameter>
attribute-set to the title, and the
<parameter>admonition.properties</parameter> attribute-set
to the rest of the content.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="nongraphical.admonition.properties">
  <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
  <xsl:attribute name="margin-{$direction.align.start}">0.25in</xsl:attribute>
  <xsl:attribute name="margin-{$direction.align.end}">0.25in</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="alignment">
<refmeta>
<refentrytitle>alignment</refentrytitle>
  <refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
  <refmiscinfo class="other" otherclass="list-type">open</refmiscinfo>
  <refmiscinfo class="other" otherclass="value">left</refmiscinfo>
  <refmiscinfo class="other" otherclass="value">start</refmiscinfo>
  <refmiscinfo class="other" otherclass="value">right</refmiscinfo>
  <refmiscinfo class="other" otherclass="value">end</refmiscinfo>
  <refmiscinfo class="other" otherclass="value">center</refmiscinfo>
  <refmiscinfo class="other" otherclass="value">justify</refmiscinfo>
</refmeta>
<refnamediv>
<refname>alignment</refname>
<refpurpose>Specify the default text alignment</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The default text alignment is used for most body text.
Allowed values are 
<literal>left</literal>,
<literal>right</literal>,
<literal>start</literal>,
<literal>end</literal>,
<literal>center</literal>,
<literal>justify</literal>.
The default value is <literal>justify</literal>.
</para>

</refsection>
</doc:refentry>
<xsl:param name="alignment">justify</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="appendix.autolabel">
<refmeta>
<refentrytitle>appendix.autolabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">0<alt>none</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">1<alt>1,2,3...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A<alt>A,B,C...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">a<alt>a,b,c...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">i<alt>i,ii,iii...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">I<alt>I,II,III...</alt></refmiscinfo>
</refmeta>
<refnamediv>
<refname>appendix.autolabel</refname>
<refpurpose>Specifies the labeling format for Appendix titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, then appendices will be numbered using the
parameter value as the number format if the value matches one of the
following:
</para>

<variablelist>
  <varlistentry>
    <term>1 or arabic</term>
    <listitem>
      <para>Arabic numeration (1, 2, 3 ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>A or upperalpha</term>
    <listitem>
      <para>Uppercase letter numeration (A, B, C ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>a or loweralpha</term>
    <listitem>
      <para>Lowercase letter numeration (a, b, c ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>I or upperroman</term>
    <listitem>
      <para>Uppercase roman numeration (I, II, III ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>i or lowerroman</term>
    <listitem>
      <para>Lowercase roman letter numeration (i, ii, iii ...).</para>
    </listitem>
  </varlistentry>
</variablelist>

<para>Any nonzero value other than the above will generate
the default number format (upperalpha).
</para>

</refsection>
</doc:refentry>
<xsl:param name="appendix.autolabel">A</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="arbortext.extensions">
<refmeta>
<refentrytitle>arbortext.extensions</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>arbortext.extensions</refname>
<refpurpose>Enable Arbortext extensions?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero,
<link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.arbortext.com/">Arbortext</link>
extensions will be used.
</para>
<para>This parameter can also affect which graphics file formats
are supported</para>

</refsection>
</doc:refentry>
<xsl:param name="arbortext.extensions" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="article.appendix.title.properties">
<refmeta>
<refentrytitle>article.appendix.title.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>article.appendix.title.properties</refname>
<refpurpose>Properties for appendix titles that appear in an article</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties for the title of an appendix that
appears inside an article.  The default is to use
the properties of sect1 titles.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="article.appendix.title.properties" use-attribute-sets="section.title.properties                          section.title.level1.properties">
  <xsl:attribute name="margin-{$direction.align.start}">
    <xsl:value-of select="$title.margin.left"/>
  </xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="author.othername.in.middle">
<refmeta>
<refentrytitle>author.othername.in.middle</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>author.othername.in.middle</refname>
<refpurpose>Is <tag>othername</tag> in <tag>author</tag> a
middle name?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, the <tag>othername</tag> of an <tag>author</tag>
appears between the <tag>firstname</tag> and
<tag>surname</tag>.  Otherwise, <tag>othername</tag>
is suppressed.
</para>

</refsection>
</doc:refentry>
<xsl:param name="author.othername.in.middle" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="autotoc.label.separator">
<refmeta>
<refentrytitle>autotoc.label.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>autotoc.label.separator</refname>
<refpurpose>Separator between labels and titles in the ToC</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>String used to separate labels and titles in a table of contents.</para>

</refsection>
</doc:refentry>
<xsl:param name="autotoc.label.separator">. </xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="axf.extensions">
<refmeta>
<refentrytitle>axf.extensions</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>axf.extensions</refname>
<refpurpose>Enable XSL Formatter extensions?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero,
<link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.antennahouse.com/">XSL Formatter</link>
extensions will be used. XSL Formatter extensions consists of PDF bookmarks,
document information and better index processing.</para>

<para>This parameter can also affect which graphics file formats
are supported</para>

</refsection>
</doc:refentry>
<xsl:param name="axf.extensions" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="biblioentry.item.separator">
<refmeta>
<refentrytitle>biblioentry.item.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>biblioentry.item.separator</refname>
<refpurpose>Text to separate bibliography entries</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Text to separate bibliography entries
</para>

</refsection>
</doc:refentry>
<xsl:param name="biblioentry.item.separator">. </xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="biblioentry.properties">
<refmeta>
  <refentrytitle>biblioentry.properties</refentrytitle>
  <refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>biblioentry.properties</refname>
<refpurpose>To set the style for biblioentry.</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>How do you want biblioentry styled? </para>
<para>Set the font-size, weight, space-above and space-below, indents, etc. to the style required</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="biblioentry.properties" use-attribute-sets="normal.para.spacing">
  <xsl:attribute name="start-indent">0.5in</xsl:attribute>
  <xsl:attribute name="text-indent">-0.5in</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="bibliography.collection">
<refmeta>
<refentrytitle>bibliography.collection</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>bibliography.collection</refname>
<refpurpose>Name of the bibliography collection file</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Maintaining bibliography entries across a set of documents is tedious, time
consuming, and error prone. It makes much more sense, usually, to store all of
the bibliography entries in a single place and simply <quote>extract</quote>
the ones you need in each document.</para>

<para>That's the purpose of the
<parameter>bibliography.collection</parameter> parameter. To setup a global
bibliography <quote>database</quote>, follow these steps:</para>

<para>First, create a stand-alone bibliography document that contains all of
the documents that you wish to reference. Make sure that each bibliography
entry (whether you use <tag>biblioentry</tag> or <tag>bibliomixed</tag>)
has an ID.</para>

<para>My global bibliography, <filename>~/bibliography.xml</filename> begins
like this:</para>

<informalexample>
<programlisting>&lt;!DOCTYPE bibliography
  PUBLIC "-//OASIS//DTD DocBook XML V4.1.2//EN"
  "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"&gt;
&lt;bibliography&gt;&lt;title&gt;References&lt;/title&gt;

&lt;bibliomixed id="xml-rec"&gt;&lt;abbrev&gt;XML 1.0&lt;/abbrev&gt;Tim Bray,
Jean Paoli, C. M. Sperberg-McQueen, and Eve Maler, editors.
&lt;citetitle&gt;&lt;ulink url="http://www.w3.org/TR/REC-xml"&gt;Extensible Markup
Language (XML) 1.0 Second Edition&lt;/ulink&gt;&lt;/citetitle&gt;.
World Wide Web Consortium, 2000.
&lt;/bibliomixed&gt;

&lt;bibliomixed id="xml-names"&gt;&lt;abbrev&gt;Namespaces&lt;/abbrev&gt;Tim Bray,
Dave Hollander,
and Andrew Layman, editors.
&lt;citetitle&gt;&lt;ulink url="http://www.w3.org/TR/REC-xml-names/"&gt;Namespaces in
XML&lt;/ulink&gt;&lt;/citetitle&gt;.
World Wide Web Consortium, 1999.
&lt;/bibliomixed&gt;

&lt;!-- ... --&gt;
&lt;/bibliography&gt;
</programlisting>
</informalexample>

<para>When you create a bibliography in your document, simply
provide <emphasis>empty</emphasis> <tag>bibliomixed</tag>
entries for each document that you wish to cite. Make sure that these
elements have the same ID as the corresponding <quote>real</quote>
entry in your global bibliography.</para>

<para>For example:</para>

<informalexample>
<programlisting>&lt;bibliography&gt;&lt;title&gt;Bibliography&lt;/title&gt;

&lt;bibliomixed id="xml-rec"/&gt;
&lt;bibliomixed id="xml-names"/&gt;
&lt;bibliomixed id="DKnuth86"&gt;Donald E. Knuth. &lt;citetitle&gt;Computers and
Typesetting: Volume B, TeX: The Program&lt;/citetitle&gt;. Addison-Wesley,
1986.  ISBN 0-201-13437-3.
&lt;/bibliomixed&gt;
&lt;bibliomixed id="relaxng"/&gt;

&lt;/bibliography&gt;</programlisting>
</informalexample>

<para>Note that it's perfectly acceptable to mix entries from your
global bibliography with <quote>normal</quote> entries. You can use
<tag>xref</tag> or other elements to cross-reference your
bibliography entries in exactly the same way you do now.</para>

<para>Finally, when you are ready to format your document, simply set the
<parameter>bibliography.collection</parameter> parameter (in either a
customization layer or directly through your processor's interface) to
point to your global bibliography.</para>

<para>The stylesheets will format the bibliography in your document as if
all of the entries referenced appeared there literally.</para>

</refsection>
</doc:refentry>
<xsl:param name="bibliography.collection">http://docbook.sourceforge.net/release/bibliography/bibliography.xml</xsl:param>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="bibliography.numbered">
<refmeta>
<refentrytitle>bibliography.numbered</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>bibliography.numbered</refname>
<refpurpose>Should bibliography entries be numbered?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero bibliography entries will be numbered</para>

</refsection>
</doc:refentry>
<xsl:param name="bibliography.numbered" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="bibliography.style">
<refmeta>
<refentrytitle>bibliography.style</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="value">normal</refmiscinfo>
<refmiscinfo class="other" otherclass="value">iso690</refmiscinfo>
</refmeta>
<refnamediv>
<refname>bibliography.style</refname>
<refpurpose>Style used for formatting of biblioentries.</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Currently only <literal>normal</literal> and
<literal>iso690</literal> styles are supported.</para>

<para>In order to use ISO690 style to the full extent you might need
to use additional markup described on <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://wiki.docbook.org/topic/ISO690Bibliography">the
following WiKi page</link>.</para>

</refsection>
</doc:refentry>
<xsl:param name="bibliography.style">normal</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="blockquote.properties">
<refmeta>
  <refentrytitle>blockquote.properties</refentrytitle>
  <refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>  
<refnamediv>
<refname>blockquote.properties</refname>
<refpurpose>To set the style for block quotations.</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The <parameter>blockquote.properties</parameter> attribute set specifies
the formating properties of block quotations.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="blockquote.properties">
<xsl:attribute name="margin-{$direction.align.start}">0.5in</xsl:attribute>
<xsl:attribute name="margin-{$direction.align.end}">0.5in</xsl:attribute>
<xsl:attribute name="space-after.minimum">0.5em</xsl:attribute>
<xsl:attribute name="space-after.optimum">1em</xsl:attribute>
<xsl:attribute name="space-after.maximum">2em</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="body.font.family">
<refmeta>
<refentrytitle>body.font.family</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="list-type">open</refmiscinfo>
<refmiscinfo class="other" otherclass="value">serif</refmiscinfo>
<refmiscinfo class="other" otherclass="value">sans-serif</refmiscinfo>
<refmiscinfo class="other" otherclass="value">monospace</refmiscinfo>
</refmeta>
<refnamediv>
<refname>body.font.family</refname>
<refpurpose>The default font family for body text</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The body font family is the default font used for text in the page body.
</para>

</refsection>
</doc:refentry>
<xsl:param name="body.font.family">serif</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="body.font.master">
<refmeta>
<refentrytitle>body.font.master</refentrytitle>
  <refmiscinfo class="other" otherclass="datatype">number</refmiscinfo>
</refmeta>
<refnamediv>
<refname>body.font.master</refname>
<refpurpose>Specifies the default point size for body text</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The body font size is specified in two parameters
(<parameter>body.font.master</parameter> and <parameter>body.font.size</parameter>)
so that math can be performed on the font size by XSLT.
</para>

</refsection>
</doc:refentry>
<xsl:param name="body.font.master">10</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="body.font.size">
<refmeta>
<refentrytitle>body.font.size</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>body.font.size</refname>
<refpurpose>Specifies the default font size for body text</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The body font size is specified in two parameters
(<parameter>body.font.master</parameter> and <parameter>body.font.size</parameter>)
so that math can be performed on the font size by XSLT.
</para>

</refsection>
</doc:refentry>
<xsl:param name="body.font.size">
 <xsl:value-of select="$body.font.master"/><xsl:text>pt</xsl:text>
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="body.margin.bottom">
<refmeta>
<refentrytitle>body.margin.bottom</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>body.margin.bottom</refname>
<refpurpose>The bottom margin of the body text</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The body bottom margin is the distance from the last line of text
in the page body to the bottom of the region-after.
</para>

</refsection>
</doc:refentry>
<xsl:param name="body.margin.bottom">0.5in</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="body.margin.top">
<refmeta>
<refentrytitle>body.margin.top</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>body.margin.top</refname>
<refpurpose>To specify the size of the top margin of a page</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The body top margin is the distance from the top of the
region-before to the first line of text in the page body.</para>

</refsection>
</doc:refentry>
<xsl:param name="body.margin.top">0.5in</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="body.start.indent">
<refmeta>
<refentrytitle>body.start.indent</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>body.start.indent</refname>
<refpurpose>The start-indent for the body text</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This parameter provides
the means of indenting the body text relative to
section titles.
For left-to-right text direction, it indents the left side.
For right-to-left text direction, it indents the right side.
It is used in place of the 
<parameter>title.margin.left</parameter> for
all XSL-FO processors except FOP 0.25.
It enables support for side floats to appear
in the indented margin area.
</para>
<para>This start-indent property is added to the fo:flow
for certain page sequences.  Which page-sequences it is 
applied to is determined by the template named
<literal>set.flow.properties</literal>.
By default, that template adds it to the flow
for page-sequences using the <quote>body</quote>
master-reference, as well as appendixes and prefaces.
</para>
<para>If this parameter is used, section titles should have
a start-indent value of 0pt if they are to be
outdented relative to the body text.
</para>

<para>If you are using FOP, then set this parameter to a zero
width value and set the <parameter>title.margin.left</parameter>
parameter to the negative value of the desired indent.
</para>

<para>See also <parameter>body.end.indent</parameter> and
<parameter>title.margin.left</parameter>.
</para>

</refsection>
</doc:refentry>
<xsl:param name="body.start.indent">
  <xsl:choose>
    <xsl:when test="$fop.extensions != 0">0pt</xsl:when>
    <xsl:when test="$passivetex.extensions != 0">0pt</xsl:when>
    <xsl:otherwise>4pc</xsl:otherwise>
  </xsl:choose>
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="body.end.indent">
<refmeta>
<refentrytitle>body.end.indent</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>body.end.indent</refname>
<refpurpose>The end-indent for the body text</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This end-indent property is added to the fo:flow
for certain page sequences.  Which page-sequences it is 
applied to is determined by the template named
<literal>set.flow.properties</literal>.
By default, that template adds it to the flow
for page-sequences using the <quote>body</quote>
master-reference, as well as appendixes and prefaces.
</para>

<para>See also <parameter>body.start.indent</parameter>.
</para>

</refsection>
</doc:refentry>
<xsl:param name="body.end.indent">0pt</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="bookmarks.collapse">
<refmeta>
<refentrytitle>bookmarks.collapse</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo> 
</refmeta>
<refnamediv>
<refname>bookmarks.collapse</refname>
<refpurpose>Specifies the initial state of bookmarks</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, the bookmark tree is collapsed so that only the 
top-level bookmarks are displayed initially. Otherwise, the whole tree 
of bookmarks is displayed.</para>

<para>This parameter currently works with FOP 0.93 or later.</para>

</refsection>
</doc:refentry>
<xsl:param name="bookmarks.collapse" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="bridgehead.in.toc">
<refmeta>
<refentrytitle>bridgehead.in.toc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>bridgehead.in.toc</refname>
<refpurpose>Should bridgehead elements appear in the TOC?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, <tag>bridgehead</tag>s appear in the TOC. Note that
this option is not fully supported and may be removed in a future
version of the stylesheets.
</para>

</refsection>
</doc:refentry>
<xsl:param name="bridgehead.in.toc" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.defaultcolumn">
<refmeta>
<refentrytitle>callout.defaultcolumn</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv>
<refname>callout.defaultcolumn</refname>
<refpurpose>Indicates what column callouts appear in by default</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If a callout does not identify a column (for example, if it uses
the <literal>linerange</literal> <tag class="attribute">unit</tag>),
it will appear in the default column.
</para>

</refsection>
</doc:refentry>
<xsl:param name="callout.defaultcolumn">60</xsl:param>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.graphics.extension">
<refmeta>
<refentrytitle>callout.graphics.extension</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>callout.graphics.extension</refname>
<refpurpose>Filename extension for callout graphics</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>
<para>Sets the filename extension to use on callout graphics. </para>

<itemizedlist>
<para>The Docbook XSL distribution provides callout graphics in the following formats:</para>
<listitem><para>SVG (extension: <filename class="extension">.svg</filename>)</para></listitem>
<listitem><para>PNG (extension: <filename class="extension">.png</filename>)</para></listitem>
<listitem><para>GIF (extension: <filename class="extension">.gif</filename>)</para></listitem>
</itemizedlist>
</refsection>
</doc:refentry>
<xsl:param name="callout.graphics.extension">.svg</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.graphics">
<refmeta>
<refentrytitle>callout.graphics</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>callout.graphics</refname>
<refpurpose>Use graphics for callouts?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, callouts are presented with graphics (e.g., reverse-video
circled numbers instead of "(1)", "(2)", etc.).
Default graphics are provided in the distribution.
</para>

</refsection>
</doc:refentry>
<xsl:param name="callout.graphics" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.icon.size">
<refmeta>
<refentrytitle>callout.icon.size</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>callout.icon.size</refname>
<refpurpose>Specifies the size of callout marker icons</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies the size of the callout marker icons.
The default size is 7 points.</para>

</refsection>
</doc:refentry>
<xsl:param name="callout.icon.size">7pt</xsl:param>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.graphics.number.limit">
<refmeta>
<refentrytitle>callout.graphics.number.limit</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv>
<refname>callout.graphics.number.limit</refname>
<refpurpose>Number of the largest callout graphic</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If <parameter>callout.graphics</parameter> is non-zero, graphics
are used to represent callout numbers instead of plain text. The value
of <parameter>callout.graphics.number.limit</parameter> is the largest
number for which a graphic exists. If the callout number exceeds this
limit, the default presentation "(plain text instead of a graphic)"
will  be used.
</para>

</refsection>
</doc:refentry>
<xsl:param name="callout.graphics.number.limit">30</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.graphics.path">
<refmeta>
<refentrytitle>callout.graphics.path</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>callout.graphics.path</refname>
<refpurpose>Path to callout graphics</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Sets the path to the directory holding the callout graphics. his
location is normally relative to the output html directory. see
base.dir. Always terminate the directory with / since the graphic file
is appended to this string, hence needs the separator.
</para>

</refsection>
</doc:refentry>
<xsl:param name="callout.graphics.path">images/callouts/</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.unicode.font">
<refmeta>
<refentrytitle>callout.unicode.font</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>callout.unicode.font</refname>
<refpurpose>Specify a font for Unicode glyphs</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The name of the font to specify around Unicode callout glyphs.
If set to the empty string, no font change will occur.
</para>

</refsection>
</doc:refentry>
<xsl:param name="callout.unicode.font">ZapfDingbats</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.unicode">
<refmeta>
<refentrytitle>callout.unicode</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>callout.unicode</refname>
<refpurpose>Use Unicode characters rather than images for callouts.</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The stylesheets can use either an image of the numbers one to ten, or the single Unicode character which represents the numeral, in white on a black background. Use this to select the Unicode character option.
</para>

</refsection>
</doc:refentry>
<xsl:param name="callout.unicode" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.unicode.number.limit">
<refmeta>
<refentrytitle>callout.unicode.number.limit</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv>
<refname>callout.unicode.number.limit</refname>
<refpurpose>Number of the largest unicode callout character</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If <parameter>callout.unicode</parameter>
is non-zero, unicode characters are used to represent
callout numbers. The value of
<parameter>callout.unicode.number.limit</parameter>
is
the largest number for which a unicode character exists. If the callout number
exceeds this limit, the default presentation "(nnn)" will always
be used.
</para>

</refsection>
</doc:refentry>
<xsl:param name="callout.unicode.number.limit">10</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.unicode.start.character">
<refmeta>
<refentrytitle>callout.unicode.start.character</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv>
<refname>callout.unicode.start.character</refname>
<refpurpose>First Unicode character to use, decimal value.</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If <parameter>callout.graphics</parameter> is zero and <parameter>callout.unicode</parameter>
is non-zero, unicode characters are used to represent
callout numbers. The value of
<parameter>callout.unicode.start.character</parameter>
is the decimal unicode value used for callout number one. Currently, 
only 10102 is supported in the stylesheets for this parameter. 
</para>

</refsection>
</doc:refentry>
<xsl:param name="callout.unicode.start.character">10102</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callouts.extension">
<refmeta>
<refentrytitle>callouts.extension</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>callouts.extension</refname>
<refpurpose>Enable the callout extension</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The callouts extension processes <tag>areaset</tag>
elements in <tag>ProgramListingCO</tag> and other text-based
callout elements.
</para>

</refsection>
</doc:refentry>
<xsl:param name="callouts.extension" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="chapter.autolabel">
<refmeta>
<refentrytitle>chapter.autolabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">0<alt>none</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">1<alt>1,2,3...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A<alt>A,B,C...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">a<alt>a,b,c...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">i<alt>i,ii,iii...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">I<alt>I,II,III...</alt></refmiscinfo>
</refmeta>
<refnamediv>
<refname>chapter.autolabel</refname>
<refpurpose>Specifies the labeling format for Chapter titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, then chapters will be numbered using the parameter
value as the number format if the value matches one of the following:
</para>

<variablelist>
  <varlistentry>
    <term>1 or arabic</term>
    <listitem>
      <para>Arabic numeration (1, 2, 3 ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>A or upperalpha</term>
    <listitem>
      <para>Uppercase letter numeration (A, B, C ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>a or loweralpha</term>
    <listitem>
      <para>Lowercase letter numeration (a, b, c ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>I or upperroman</term>
    <listitem>
      <para>Uppercase roman numeration (I, II, III ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>i or lowerroman</term>
    <listitem>
      <para>Lowercase roman letter numeration (i, ii, iii ...).</para>
    </listitem>
  </varlistentry>
</variablelist>

<para>Any nonzero value other than the above will generate
the default number format (arabic).
</para>

</refsection>
</doc:refentry>
<xsl:param name="chapter.autolabel" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="collect.xref.targets"> 
<refmeta> 
<refentrytitle>collect.xref.targets</refentrytitle> 
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">no</refmiscinfo>
<refmiscinfo class="other" otherclass="value">yes</refmiscinfo>
<refmiscinfo class="other" otherclass="value">only</refmiscinfo>
</refmeta> 
<refnamediv> 
<refname>collect.xref.targets</refname> 
<refpurpose>Controls whether cross reference data is
collected</refpurpose> 
</refnamediv> 
 
<refsection><info><title>Description</title></info> 
 
<para>
In order to resolve olinks efficiently, the stylesheets can
generate an external data file containing information about
all potential cross reference endpoints in a document.
This parameter determines whether the collection process is run when the document is processed by the stylesheet. The default value is  <literal>no</literal>, which means the data file is not generated during processing. The other choices are <literal>yes</literal>, which means the data file is created and the document is processed for output, and <literal>only</literal>, which means the data file is created but the document is not processed for output.
See also <parameter>targets.filename</parameter>.
</para> 
</refsection> 
</doc:refentry>
<xsl:param name="collect.xref.targets">no</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="column.count.back">
<refmeta>
<refentrytitle>column.count.back</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv>
<refname>column.count.back</refname>
<refpurpose>Number of columns on back matter pages</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Number of columns on back matter (appendix, glossary, etc.) pages.</para>

</refsection>
</doc:refentry>
<xsl:param name="column.count.back" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="column.count.body">
<refmeta>
<refentrytitle>column.count.body</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv>
<refname>column.count.body</refname>
<refpurpose>Number of columns on body pages</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Number of columns on body pages.</para>

</refsection>
</doc:refentry>
<xsl:param name="column.count.body" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="column.count.front">
<refmeta>
<refentrytitle>column.count.front</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv>
<refname>column.count.front</refname>
<refpurpose>Number of columns on front matter pages</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Number of columns on front matter (dedication, preface, etc.) pages.</para>

</refsection>
</doc:refentry>
<xsl:param name="column.count.front" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="column.count.index">
<refmeta>
<refentrytitle>column.count.index</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv>
<refname>column.count.index</refname>
<refpurpose>Number of columns on index pages</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Number of columns on index pages.</para>

</refsection>
</doc:refentry>
<xsl:param name="column.count.index">2</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="column.count.lot">
<refmeta>
<refentrytitle>column.count.lot</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv>
<refname>column.count.lot</refname>
<refpurpose>Number of columns on a 'List-of-Titles' page</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Number of columns on a page sequence containing the Table of Contents,
List of Figures, etc.</para>

</refsection>
</doc:refentry>
<xsl:param name="column.count.lot" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="column.count.titlepage">
<refmeta>
<refentrytitle>column.count.titlepage</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv>
<refname>column.count.titlepage</refname>
<refpurpose>Number of columns on a title page</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Number of columns on a title page</para>

</refsection>
</doc:refentry>
<xsl:param name="column.count.titlepage" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="column.gap.back">
<refmeta>
<refentrytitle>column.gap.back</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>column.gap.back</refname>
<refpurpose>Gap between columns in back matter</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies the gap between columns in back matter (if
<parameter>column.count.back</parameter> is greater than one).</para>

</refsection>
</doc:refentry>
<xsl:param name="column.gap.back">12pt</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="column.gap.body">
<refmeta>
<refentrytitle>column.gap.body</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>column.gap.body</refname>
<refpurpose>Gap between columns in the body</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies the gap between columns in body matter (if
<parameter>column.count.body</parameter> is greater than one).</para>

</refsection>
</doc:refentry>
<xsl:param name="column.gap.body">12pt</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="column.gap.front">
<refmeta>
<refentrytitle>column.gap.front</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>column.gap.front</refname>
<refpurpose>Gap between columns in the front matter</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies the gap between columns in front matter (if
<parameter>column.count.front</parameter> is greater than one).</para>

</refsection>
</doc:refentry>
<xsl:param name="column.gap.front">12pt</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="column.gap.index">
<refmeta>
<refentrytitle>column.gap.index</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>column.gap.index</refname>
<refpurpose>Gap between columns in the index</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies the gap between columns in indexes (if
<parameter>column.count.index</parameter> is greater than one).</para>

</refsection>
</doc:refentry>
<xsl:param name="column.gap.index">12pt</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="column.gap.lot">
<refmeta>
<refentrytitle>column.gap.lot</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>column.gap.lot</refname>
<refpurpose>Gap between columns on a 'List-of-Titles' page</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies the gap between columns on 'List-of-Titles' pages (if
<parameter>column.count.lot</parameter> is greater than one).</para>

</refsection>
</doc:refentry>
<xsl:param name="column.gap.lot">12pt</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="column.gap.titlepage">
<refmeta>
<refentrytitle>column.gap.titlepage</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>column.gap.titlepage</refname>
<refpurpose>Gap between columns on title pages</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies the gap between columns on title pages (if
<parameter>column.count.titlepage</parameter> is greater than one).</para>


</refsection>
</doc:refentry>
<xsl:param name="column.gap.titlepage">12pt</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="compact.list.item.spacing">
<refmeta>
<refentrytitle>compact.list.item.spacing</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>  
<refnamediv>
<refname>compact.list.item.spacing</refname>
<refpurpose>What space do you want between list items (when spacing="compact")?</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>Specify what spacing you want between each list item when
<tag class="attribute">spacing</tag> is
<quote><literal>compact</literal></quote>.</para>
</refsection>
</doc:refentry>
<xsl:attribute-set name="compact.list.item.spacing">
  <xsl:attribute name="space-before.optimum">0em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0.2em</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="component.label.includes.part.label">
<refmeta>
<refentrytitle>component.label.includes.part.label</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>component.label.includes.part.label</refname>
<refpurpose>Do component labels include the part label?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, number labels for <tag>chapter</tag>,
<tag>appendix</tag>, and other component elements are prefixed with
the label of the part element that contains them.  So you might see
Chapter II.3 instead of Chapter 3.  Also, the labels for formal
elements such as <tag>table</tag> and <tag>figure</tag> will include
the part label.  If there is no part element container, then no prefix
is generated.
</para>
<para>
This feature is most useful when the
<parameter>label.from.part</parameter> parameter is turned on.
In that case, there would be more than one <tag>chapter</tag>
<quote>1</quote>, and the extra part label prefix will identify
each chapter unambiguously.
</para>

</refsection>
</doc:refentry>
<xsl:param name="component.label.includes.part.label" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="component.title.properties">
<refmeta>
<refentrytitle>component.title.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>component.title.properties</refname>
<refpurpose>Properties for component titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties common to all component titles.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="component.title.properties">
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  <xsl:attribute name="space-before.optimum"><xsl:value-of select="concat($body.font.master, 'pt')"/></xsl:attribute>
  <xsl:attribute name="space-before.minimum"><xsl:value-of select="concat($body.font.master, 'pt * 0.8')"/></xsl:attribute>
  <xsl:attribute name="space-before.maximum"><xsl:value-of select="concat($body.font.master, 'pt * 1.2')"/></xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="text-align">
    <xsl:choose>
      <xsl:when test="((parent::d:article | parent::d:articleinfo | parent::d:info/parent::d:article) and not(ancestor::d:book) and not(self::d:bibliography))         or (parent::d:slides | parent::d:slidesinfo)">center</xsl:when>
      <xsl:otherwise>start</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
  <xsl:attribute name="start-indent"><xsl:value-of select="$title.margin.left"/></xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="component.titlepage.properties">
<refmeta>
<refentrytitle>component.titlepage.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>component.titlepage.properties</refname>
<refpurpose>Properties for component titlepages</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties that are applied to the outer block containing
all the component title page information. 
Its main use is to set a <literal>span="all"</literal>
property on the block that is a direct child of the flow.</para>

<para>This attribute-set also applies to index titlepages. It is empty by default.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="component.titlepage.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="crop.marks">
<refmeta>
<refentrytitle>crop.marks</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>crop.marks</refname>
<refpurpose>Output crop marks?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, crop marks will be added to each page. Currently this
works only with XEP if you have <parameter>xep.extensions</parameter> set.</para>

</refsection>
</doc:refentry>
<xsl:param name="crop.marks" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="crop.mark.width">
<refmeta>
<refentrytitle>crop.mark.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>crop.mark.width</refname>
<refpurpose>Width of crop marks.</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Width of crop marks. Crop marks are controlled by
<parameter>crop.marks</parameter> parameter.</para>

</refsection>
</doc:refentry>
<xsl:param name="crop.mark.width">0.5pt</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="crop.mark.offset">
<refmeta>
<refentrytitle>crop.mark.offset</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>crop.mark.offset</refname>
<refpurpose>Length of crop marks.</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Length of crop marks. Crop marks are controlled by
<parameter>crop.marks</parameter> parameter.</para>

</refsection>
</doc:refentry>
<xsl:param name="crop.mark.offset">24pt</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="crop.mark.bleed">
<refmeta>
<refentrytitle>crop.mark.bleed</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>crop.mark.bleed</refname>
<refpurpose>Length of invisible part of crop marks.</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Length of invisible part of crop marks. Crop marks are controlled by
<parameter>crop.marks</parameter> parameter.</para>

</refsection>
</doc:refentry>
<xsl:param name="crop.mark.bleed">6pt</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="current.docid"> 
<refmeta> 
<refentrytitle>current.docid</refentrytitle> 
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo> 
</refmeta> 
<refnamediv> 
<refname>current.docid</refname> 
<refpurpose>targetdoc identifier for the document being
processed</refpurpose> 
</refnamediv> 
 
<refsection><info><title>Description</title></info> 
 
<para>When olinks between documents are resolved for HTML output, the stylesheet can compute the relative path between the current document and the target document. The stylesheet needs to know the <literal>targetdoc</literal> identifiers for both documents, as they appear in the <parameter>target.database.document</parameter> database file. This parameter passes to the stylesheet
the targetdoc identifier of the current document, since that
identifier does not appear in the document itself. </para>
<para>This parameter can also be used for print output. If an olink's  <literal>targetdoc</literal>  id differs from the <literal>current.docid</literal>, then the stylesheet can append the target document's title to the generated olink text. That identifies to the reader that the link is to a different document, not the current document. See also <parameter>olink.doctitle</parameter> to enable that feature.</para> 
</refsection> 
</doc:refentry>
<xsl:param name="current.docid"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="default.float.class">
<refmeta>
<refentrytitle>default.float.class</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>default.float.class</refname>
<refpurpose>Specifies the default float class</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Selects the direction in which a float should be placed. for
xsl-fo this is before, for html it is left. For Western texts, the
before direction is the top of the page.</para>

</refsection>
</doc:refentry>
<xsl:param name="default.float.class">
  <xsl:choose>
    <xsl:when test="contains($stylesheet.result.type,'html')">left</xsl:when>
    <xsl:otherwise>before</xsl:otherwise>
  </xsl:choose>
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="default.image.width">
<refmeta>
<refentrytitle>default.image.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>default.image.width</refname>
<refpurpose>The default width of images</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If specified, this value will be used for the
<tag class="attribute">width</tag> attribute on
images that do not specify any
<link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://docbook.org/tdg/en/html/imagedata.html#viewport.area">viewport
dimensions</link>.</para>

</refsection>
</doc:refentry>
<xsl:param name="default.image.width"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="default.table.width">
<refmeta>
<refentrytitle>default.table.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>default.table.width</refname>
<refpurpose>The default width of tables</refpurpose>
</refnamediv>

<refsection><info><title>Description</title></info>
<para>If non-zero, this value will be used for the
<literal>width</literal> attribute on <tag>table</tag>s that do not specify an
alternate width (with the <tag class="xmlpi">dbhtml table-width</tag> or 
<tag class="xmlpi">dbfo table-width</tag> processing instruction).</para>
</refsection>
</doc:refentry>
<xsl:param name="default.table.width"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="default.table.frame">
<refmeta>
<refentrytitle>default.table.frame</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>default.table.frame</refname>
<refpurpose>The default framing of tables</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This value will be used when there is no frame attribute on the
table. </para>

</refsection>
</doc:refentry>
<xsl:param name="default.table.frame">all</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="default.table.rules">
<refmeta>
<refentrytitle>default.table.rules</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>default.table.rules</refname>
<refpurpose>The default column and row rules for tables using HTML markup</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Tables using HTML markup elements can use an attribute
named <tag class="attribute">rules</tag> on the <tag>table</tag> or
<tag>informaltable</tag> element
to specify whether column and row border rules should be 
displayed. This parameter lets you specify a global default
style for all HTML tables that don't otherwise have
that attribute.</para>
<para>These are the supported values:</para>

<variablelist>
<varlistentry><term>all</term>
<listitem>
<para>Rules will appear between all rows and columns.</para>
</listitem>
</varlistentry>

<varlistentry><term>rows</term>
<listitem>
<para>Rules will appear between rows only.</para>
</listitem>
</varlistentry>

<varlistentry><term>cols</term>
<listitem>
<para>Rules will appear between columns only.</para>
</listitem>
</varlistentry>

<varlistentry><term>groups</term>
<listitem>
<para>Rules will appear between row groups (thead, tfoot, tbody).
No support for rules between column groups yet.
</para>
</listitem>
</varlistentry>

<varlistentry><term>none</term>
<listitem>
<para>No rules.  This is the default value.
</para>
</listitem>
</varlistentry>

</variablelist>

<para>The border after the last row and the border after
the last column are not affected by
this setting. Those borders are controlled by
the <tag class="attribute">frame</tag> attribute on the table element.
</para>

</refsection>
</doc:refentry>
<xsl:param name="default.table.rules">none</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="default.units">
<refmeta>
<refentrytitle>default.units</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="value">cm</refmiscinfo>
<refmiscinfo class="other" otherclass="value">mm</refmiscinfo>
<refmiscinfo class="other" otherclass="value">in</refmiscinfo>
<refmiscinfo class="other" otherclass="value">pt</refmiscinfo>
<refmiscinfo class="other" otherclass="value">pc</refmiscinfo>
<refmiscinfo class="other" otherclass="value">px</refmiscinfo>
<refmiscinfo class="other" otherclass="value">em</refmiscinfo>
</refmeta>
<refnamediv>
<refname>default.units</refname>
<refpurpose>Default units for an unqualified dimension</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If an unqualified dimension is encountered (for example, in a
graphic width), the <parameter>default.units</parameter> will be used for the
units. Unqualified dimensions are not allowed in XSL Formatting Objects.
</para>

</refsection>
</doc:refentry>
<xsl:param name="default.units">pt</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="dingbat.font.family">
<refmeta>
<refentrytitle>dingbat.font.family</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="list-type">open</refmiscinfo>
<refmiscinfo class="other" otherclass="value">serif</refmiscinfo>
<refmiscinfo class="other" otherclass="value">sans-serif</refmiscinfo>
<refmiscinfo class="other" otherclass="value">monospace</refmiscinfo>
</refmeta>
<refnamediv>
<refname>dingbat.font.family</refname>
<refpurpose>The font family for copyright, quotes, and other symbols</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The dingbat font family is used for dingbats. If it is defined
as the empty string, no font change is effected around dingbats.
</para>

</refsection>
</doc:refentry>
<xsl:param name="dingbat.font.family">serif</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="double.sided">
<refmeta>
<refentrytitle>double.sided</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>double.sided</refname>
<refpurpose>Is the document to be printed double sided?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Double-sided documents are printed with a slightly wider margin
on the binding edge of the page.
</para>
<para>FIXME: The current set of parameters does not take writing direction
into account.</para>

</refsection>
</doc:refentry>
<xsl:param name="double.sided" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="draft.mode">
<refmeta>
<refentrytitle>draft.mode</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="value">no</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">yes</refmiscinfo>
<refmiscinfo class="other" otherclass="value">maybe</refmiscinfo>
</refmeta>
<refnamediv>
<refname>draft.mode</refname>
<refpurpose>Select draft mode</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Selects draft mode. If <parameter>draft.mode</parameter> is
<quote><literal>yes</literal></quote>, the entire document will be treated
as a draft. If it is <quote><literal>no</literal></quote>, the entire document
will be treated as a final copy. If it is <quote><literal>maybe</literal></quote>,
individual sections will be treated as draft or final independently, depending
on how their <literal>status</literal> attribute is set.
</para>

</refsection>
</doc:refentry>
<xsl:param name="draft.mode">maybe</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="draft.watermark.image">
<refmeta>
<refentrytitle>draft.watermark.image</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">uri</refmiscinfo>
</refmeta>
<refnamediv>
<refname>draft.watermark.image</refname>
<refpurpose>The URI of the image to be used for draft watermarks</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The image to be used for draft watermarks.</para>

</refsection>
</doc:refentry>
<xsl:param name="draft.watermark.image">http://docbook.sourceforge.net/release/images/draft.png</xsl:param>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="ebnf.assignment">
<refmeta>
<refentrytitle>ebnf.assignment</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">rtf</refmiscinfo>
</refmeta>
<refnamediv>
<refname>ebnf.assignment</refname>
<refpurpose>The EBNF production assignment operator</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The <parameter>ebnf.assignment</parameter> parameter determines what
text is used to show <quote>assignment</quote> in <tag>production</tag>s
in <tag>productionset</tag>s.</para>

<para>While <quote><literal>::=</literal></quote> is common, so are several
other operators.</para>

</refsection>
</doc:refentry>
<xsl:param name="ebnf.assignment">
  <fo:inline xmlns:fo="http://www.w3.org/1999/XSL/Format" font-family="{$monospace.font.family}">
    <xsl:text>::=</xsl:text>
  </fo:inline>
</xsl:param>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="ebnf.statement.terminator">
<refmeta>
<refentrytitle>ebnf.statement.terminator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">rtf</refmiscinfo>
</refmeta>
<refnamediv>
<refname>ebnf.statement.terminator</refname>
<refpurpose>Punctuation that ends an EBNF statement.</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The <parameter>ebnf.statement.terminator</parameter> parameter determines what
text is used to terminate each <tag>production</tag>
in <tag>productionset</tag>.</para>

<para>Some notations end each statement with a period.</para>

</refsection>
</doc:refentry>
<xsl:param name="ebnf.statement.terminator"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="email.delimiters.enabled">
<refmeta>
<refentrytitle>email.delimiters.enabled</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>email.delimiters.enabled</refname>
<refpurpose>Generate delimiters around email addresses?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, delimiters

<footnote><para>For delimiters, the
stylesheets are currently hard-coded to output angle
brackets.</para></footnote> 

are generated around e-mail addresses
(the output of the <tag>email</tag> element).</para>

</refsection>
</doc:refentry>
<xsl:param name="email.delimiters.enabled" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="email.mailto.enabled">
<refmeta>
<refentrytitle>email.mailto.enabled</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>email.mailto.enabled</refname>
<refpurpose>Generate mailto: links for email addresses?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero the generated output for the <tag>email</tag> element
will be a clickable mailto: link that brings up the default mail client
on the system.</para>

</refsection>
</doc:refentry>
<xsl:param name="email.mailto.enabled" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="equation.properties">
<refmeta>
<refentrytitle>equation.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>equation.properties</refname>
<refpurpose>Properties associated with a equation</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The styling for equations.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="equation.properties" use-attribute-sets="formal.object.properties"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="example.properties">
<refmeta>
<refentrytitle>example.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>example.properties</refname>
<refpurpose>Properties associated with a example</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The styling for examples.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="example.properties" use-attribute-sets="formal.object.properties"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="exsl.node.set.available">
<refmeta>
<refentrytitle>exsl.node.set.available</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>exsl.node.set.available</refname>
<refpurpose>Is the test function-available('exsl:node-set') true?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero,
then the exsl:node-set() function is available to be used in
the stylesheet.
If zero, then the function is not available.
This param automatically detects the presence of
the function and does not normally need to be set manually.</para>

<para>This param was created to handle a long-standing
bug in the Xalan processor that fails to detect the
function even though it is available.</para>

</refsection>
</doc:refentry>
<xsl:param name="exsl.node.set.available"> 
  <xsl:choose>
    <xsl:when xmlns:exsl="http://exslt.org/common" exsl:foo="" test="function-available('exsl:node-set') or                        contains(system-property('xsl:vendor'),                          'Apache Software Foundation')">1</xsl:when>
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="figure.properties">
<refmeta>
<refentrytitle>figure.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>  
<refnamediv>
<refname>figure.properties</refname>
<refpurpose>Properties associated with a figure</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The styling for figures.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="figure.properties" use-attribute-sets="formal.object.properties"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="firstterm.only.link">
<refmeta>
<refentrytitle>firstterm.only.link</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>firstterm.only.link</refname>
<refpurpose>Does automatic glossterm linking only apply to firstterms?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, only <tag>firstterm</tag>s will be automatically linked
to the glossary. If glossary linking is not enabled, this parameter
has no effect.</para>

</refsection>
</doc:refentry>
<xsl:param name="firstterm.only.link" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="footer.content.properties">
<refmeta>
<refentrytitle>footer.content.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>footer.content.properties</refname>
<refpurpose>Properties of page footer content</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Properties of page footer content.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="footer.content.properties">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$body.fontset"/>
  </xsl:attribute>
  <xsl:attribute name="margin-left">
    <xsl:value-of select="$title.margin.left"/>
  </xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="footer.rule">
<refmeta>
<refentrytitle>footer.rule</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>footer.rule</refname>
<refpurpose>Rule over footers?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, a rule will be drawn above the page footers.</para>

</refsection>
</doc:refentry>
<xsl:param name="footer.rule" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="footer.column.widths">
<refmeta>
<refentrytitle>footer.column.widths</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>footer.column.widths</refname>
<refpurpose>Specify relative widths of footer areas</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Page footers in print output use a three column table
to position text at the left, center, and right side of
the footer on the page.
This parameter lets you specify the relative sizes of the
three columns.  The default value is
"1 1 1".</para>

<para>The parameter value must be three numbers, separated
by white space. The first number represents the relative
width of the inside footer for
double-sided output.  The second number is the relative
width of the center footer.  The third number is the
relative width of the outside footer for
double-sided output.
</para>
<para>For single-sided output, the first number is the
relative width of left footer for left-to-right
text direction, or the right footer for right-to-left
text direction.  
The third number is the
relative width of right footer for left-to-right
text direction, or the left footer for right-to-left
text direction.</para>

<para>The numbers are used to specify the column widths
for the table that makes up the footer area.
In the FO output, this looks like:
</para>

<programlisting>
&lt;fo:table-column column-number="1" 
    column-width="proportional-column-width(1)"/&gt;
</programlisting>

<para>
The <literal>proportional-column-width()</literal>
function computes a column width by dividing its
argument by the total of the arguments for all the columns, and
then multiplying the result by the width of the whole table
(assuming all the column specs use the function).
Its argument can be any positive integer or floating point number.
Zero is an acceptable value, although some FO processors
may warn about it, in which case using a very small number might
be more satisfactory.
</para>

<para>For example, the value "1 2 1" means the center
footer should have twice the width of the other areas.
A value of "0 0 1" means the entire footer area
is reserved for the right (or outside) footer text.
Note that to keep the center area centered on
the page, the left and right values must be
the same. A specification like "1 2 3" means the
center area is no longer centered on the page
since the right area is three times the width of the left area.
</para>

</refsection>
</doc:refentry>
<xsl:param name="footer.column.widths">1 1 1</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="footer.table.height">
<refmeta>
<refentrytitle>footer.table.height</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>footer.table.height</refname>
<refpurpose>Specify the minimum height of the table containing the running page footers</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Page footers in print output use a three column table
to position text at the left, center, and right side of
the footer on the page.
This parameter lets you specify the minimum height 
of the single row in the table.  
Since this specifies only the minimum height,
the table should automatically grow to fit taller content.
The default value is "14pt".</para>

</refsection>
</doc:refentry>
<xsl:param name="footer.table.height">14pt</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="footer.table.properties">
<refmeta>
<refentrytitle>footer.table.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>footer.table.properties</refname>
<refpurpose>Apply properties to the footer layout table</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Properties applied to the table that lays out the page footer.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="footer.table.properties">
  <xsl:attribute name="table-layout">fixed</xsl:attribute>
  <xsl:attribute name="width">100%</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="footers.on.blank.pages">
<refmeta>
<refentrytitle>footers.on.blank.pages</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>footers.on.blank.pages</refname>
<refpurpose>Put footers on blank pages?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, footers will be placed on blank pages.</para>

</refsection>
</doc:refentry>
<xsl:param name="footers.on.blank.pages" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="footnote.font.size">
<refmeta>
<refentrytitle>footnote.font.size</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>footnote.font.size</refname>
<refpurpose>The font size for footnotes</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The footnote font size is used for...footnotes!
</para>

</refsection>
</doc:refentry>
<xsl:param name="footnote.font.size">
 <xsl:value-of select="$body.font.master * 0.8"/><xsl:text>pt</xsl:text>
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="footnote.number.format">
<refmeta>
<refentrytitle>footnote.number.format</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">1<alt>1,2,3...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A<alt>A,B,C...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">a<alt>a,b,c...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">i<alt>i,ii,iii...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">I<alt>I,II,III...</alt></refmiscinfo>
</refmeta>
<refnamediv>
<refname>footnote.number.format</refname>
<refpurpose>Identifies the format used for footnote numbers</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The <parameter>footnote.number.format</parameter> specifies the format
to use for footnote numeration (1, i, I, a, or A).</para>

</refsection>
</doc:refentry>
<xsl:param name="footnote.number.format">1</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="footnote.number.symbols">
<refmeta>
<refentrytitle>footnote.number.symbols</refentrytitle>
<refmiscinfo class="other" otherclass="datatype"/>
</refmeta>
<refnamediv>
<refname>footnote.number.symbols</refname>
<refpurpose>Special characters to use as footnote markers</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If <parameter>footnote.number.symbols</parameter> is not the empty string,
footnotes will use the characters it contains as footnote symbols. For example,
<quote>*&amp;#x2020;&amp;#x2021;&amp;#x25CA;&amp;#x2720;</quote> will identify
footnotes with <quote>*</quote>, <quote>†</quote>, <quote>‡</quote>,
<quote>◊</quote>, and <quote>✠</quote>. If there are more footnotes
than symbols, the stylesheets will fall back to numbered footnotes using
<parameter>footnote.number.format</parameter>.</para>

<para>The use of symbols for footnotes depends on the ability of your
processor (or browser) to render the symbols you select. Not all systems are
capable of displaying the full range of Unicode characters. If the quoted characters
in the preceding paragraph are not displayed properly, that's a good indicator
that you may have trouble using those symbols for footnotes.</para>

</refsection>
</doc:refentry>
<xsl:param name="footnote.number.symbols"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="footnote.mark.properties">
<refmeta>
<refentrytitle>footnote.mark.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>  
<refnamediv>
<refname>footnote.mark.properties</refname>
<refpurpose>Properties applied to each footnote mark
</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This attribute set is applied to the footnote mark used
for each footnote.
It should contain only inline properties.
</para>

<para>The property to make the mark a superscript is contained in the
footnote template itself, because the current version of FOP reports
an error if baseline-shift is used.
</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="footnote.mark.properties">
  <xsl:attribute name="font-family"><xsl:value-of select="$body.fontset"/></xsl:attribute>
  <xsl:attribute name="font-size">75%</xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-style">normal</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="footnote.properties">
<refmeta>
<refentrytitle>footnote.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>  
<refnamediv>
<refname>footnote.properties</refname>
<refpurpose>Properties applied to each footnote body
</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This attribute set is applied to the footnote-block 
for each footnote.
It can be used to set the
font-size, font-family, and other inheritable properties that will be
applied to all footnotes.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="footnote.properties">
  <xsl:attribute name="font-family"><xsl:value-of select="$body.fontset"/></xsl:attribute>
  <xsl:attribute name="font-size"><xsl:value-of select="$footnote.font.size"/></xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-style">normal</xsl:attribute>
  <xsl:attribute name="text-align"><xsl:value-of select="$alignment"/></xsl:attribute>
  <xsl:attribute name="start-indent">0pt</xsl:attribute>
  <xsl:attribute name="text-indent">0pt</xsl:attribute>
  <xsl:attribute name="hyphenate"><xsl:value-of select="$hyphenate"/></xsl:attribute>
  <xsl:attribute name="wrap-option">wrap</xsl:attribute>
  <xsl:attribute name="linefeed-treatment">treat-as-space</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="footnote.sep.leader.properties">
<refmeta>
<refentrytitle>footnote.sep.leader.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>footnote.sep.leader.properties</refname>
<refpurpose>Properties associated with footnote separators</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The styling for the rule line that separates the
footnotes from the body text.
These are properties applied to the fo:leader used as
the separator.
</para>
<para>If you want to do more than just set properties on
the leader element, then you can customize the template
named <literal>footnote.separator</literal> in 
<filename>fo/pagesetup.xsl</filename>.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="footnote.sep.leader.properties">
  <xsl:attribute name="color">black</xsl:attribute>
  <xsl:attribute name="leader-pattern">rule</xsl:attribute>
  <xsl:attribute name="leader-length">1in</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="fop.extensions">
<refmeta>
<refentrytitle>fop.extensions</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>fop.extensions</refname>
<refpurpose>Enable extensions for FOP version 0.20.5 and earlier</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, extensions intended for
<link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://xml.apache.org/fop/">FOP</link>
version 0.20.5 and earlier will be used.
At present, this consists of PDF bookmarks.
</para>

<para>This parameter can also affect which graphics file formats
are supported.</para>

<para>If you are using a version of FOP beyond
version 0.20.5, then use the <parameter>fop1.extensions</parameter> parameter
instead.
</para>
</refsection>
</doc:refentry>
<xsl:param name="fop.extensions" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="fop1.extensions">
<refmeta>
<refentrytitle>fop1.extensions</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>fop1.extensions</refname>
<refpurpose>Enable extensions for FOP version 0.90 and later</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, extensions for 
<link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://xml.apache.org/fop/">FOP</link>
version 0.90 and later will be used.
</para>

<para>This parameter can also affect which graphics file formats
are supported.</para>

<para>The original <parameter>fop.extensions</parameter> parameter
should still be used for FOP version 0.20.5 and earlier.
</para>
</refsection>
</doc:refentry>
<xsl:param name="fop1.extensions" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="formal.object.properties">
<refmeta>
<refentrytitle>formal.object.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>formal.object.properties</refname>
<refpurpose>Properties associated with a formal object such as a figure, or other component that has a title</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The styling for formal objects in docbook. Specify the spacing
before and after the object.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="formal.object.properties">
  <xsl:attribute name="space-before.minimum">0.5em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">2em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.5em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">2em</xsl:attribute>
  <xsl:attribute name="keep-together.within-column">always</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="formal.procedures">
<refmeta>
<refentrytitle>formal.procedures</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>formal.procedures</refname>
<refpurpose>Selects formal or informal procedures</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Formal procedures are numbered and always have a title.
</para>

</refsection>
</doc:refentry>
<xsl:param name="formal.procedures" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="formal.title.placement">
<refmeta>
<refentrytitle>formal.title.placement</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">table</refmiscinfo>
</refmeta>
<refnamediv>
<refname>formal.title.placement</refname>
<refpurpose>Specifies where formal object titles should occur</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies where formal object titles should occur. For each formal object
type (<tag>figure</tag>,
<tag>example</tag>,
<tag>equation</tag>,
<tag>table</tag>, and <tag>procedure</tag>)
you can specify either the keyword
<quote><literal>before</literal></quote> or
<quote><literal>after</literal></quote>.</para>

</refsection>
</doc:refentry>
<xsl:param name="formal.title.placement">
figure before
example before
equation before
table before
procedure before
task before
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="formal.title.properties">
<refmeta>
<refentrytitle>formal.title.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>formal.title.properties</refname>
<refpurpose>Style the title element of formal object such as a figure.</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>Specify how the title should be styled. Specify the font size and weight of the title of the formal object.</para>
</refsection>
</doc:refentry>
<xsl:attribute-set name="formal.title.properties" use-attribute-sets="normal.para.spacing">
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.2"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.6em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.8em</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="funcsynopsis.decoration">
<refmeta>
<refentrytitle>funcsynopsis.decoration</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>funcsynopsis.decoration</refname>
<refpurpose>Decorate elements of a <tag>funcsynopsis</tag>?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, elements of the <tag>funcsynopsis</tag> will be
decorated (e.g. rendered as bold or italic text). The decoration is controlled by
templates that can be redefined in a customization layer.
</para>

</refsection>
</doc:refentry>
<xsl:param name="funcsynopsis.decoration" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="funcsynopsis.style">
<refmeta>
<refentrytitle>funcsynopsis.style</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="value">ansi</refmiscinfo>
<refmiscinfo class="other" otherclass="value">kr</refmiscinfo>
</refmeta>
<refnamediv>
<refname>funcsynopsis.style</refname>
<refpurpose>What style of <tag>funcsynopsis</tag> should be generated?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If <parameter>funcsynopsis.style</parameter> is <literal>ansi</literal>,
ANSI-style function synopses are generated for a
<tag>funcsynopsis</tag>, otherwise K&amp;R-style
function synopses are generated.
</para>

</refsection>
</doc:refentry>
<xsl:param name="funcsynopsis.style">kr</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="function.parens">
<refmeta>
<refentrytitle>function.parens</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>function.parens</refname>
<refpurpose>Generate parens after a function?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, the formatting of a <tag>function</tag> element
will include generated parentheses.
</para>

</refsection>
</doc:refentry>
<xsl:param name="function.parens" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="generate.index">
<refmeta>
<refentrytitle>generate.index</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>generate.index</refname>
<refpurpose>Do you want an index?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specify if an index should be generated. </para>

</refsection>
</doc:refentry>
<xsl:param name="generate.index" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="generate.section.toc.level">
<refmeta>
<refentrytitle>generate.section.toc.level</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv>
<refname>generate.section.toc.level</refname>
<refpurpose>Control depth of TOC generation in sections</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The <parameter>generate.section.toc.level</parameter> parameter
controls the depth of <tag>section</tag> in which TOCs will be generated. Note
that this is related to, but not the same as
<parameter>toc.section.depth</parameter>, which controls the depth to
which TOC entries will be generated in a given TOC.</para>
<para>If, for example, <parameter>generate.section.toc.level</parameter>
is <literal>3</literal>, TOCs will be generated in first, second, and third
level sections, but not in fourth level sections.
</para>

</refsection>
</doc:refentry>
<xsl:param name="generate.section.toc.level" select="0"/>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="generate.toc">
<refmeta>
<refentrytitle>generate.toc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">table</refmiscinfo>
</refmeta>
<refnamediv>
<refname>generate.toc</refname>
<refpurpose>Control generation of ToCs and LoTs</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This parameter has a structured value. It is a table of space-delimited
path/value pairs. Each path identifies some element in the source document
using a restricted subset of XPath (only the implicit child axis, no wildcards,
no predicates). Paths can be either relative or absolute.</para>

<para>When processing a particular element, the stylesheets consult this table to
determine if a ToC (or LoT(s)) should be generated.</para>

<para>For example, consider the entry:</para>

<screen>book toc,figure</screen>

<para>This indicates that whenever a <tag>book</tag> is formatted, a
Table Of Contents and a List of Figures should be generated. Similarly,</para>

<screen>/chapter toc</screen>

<para>indicates that whenever a document <emphasis>that has a root
of</emphasis> <tag>chapter</tag> is formatted, a Table of
Contents should be generated. The entry <literal>chapter</literal> would match
all chapters, but <literal>/chapter</literal> matches only <tag>chapter</tag>
document elements.</para>

<para>Generally, the longest match wins. So, for example, if you want to distinguish
articles in books from articles in parts, you could use these two entries:</para>

<screen>book/article toc,figure
part/article toc</screen>

<para>Note that an article in a part can never match a <literal>book/article</literal>,
so if you want nothing to be generated for articles in parts, you can simply leave
that rule out.</para>

<para>If you want to leave the rule in, to make it explicit that you're turning
something off, use the value <quote>nop</quote>. For example, the following
entry disables ToCs and LoTs for articles:</para>

<screen>article nop</screen>

<para>Do not simply leave the word <quote>article</quote> in the file
without a matching value. That'd be just begging the silly little
path/value parser to get confused.</para>

<para>Section ToCs are further controlled by the
<parameter>generate.section.toc.level</parameter> parameter.
For a given section level to have a ToC, it must have both an entry in 
<parameter>generate.toc</parameter> and be within the range enabled by
<parameter>generate.section.toc.level</parameter>.</para>
</refsection>
</doc:refentry>
<xsl:param name="generate.toc">
/appendix toc,title
article/appendix  nop
/article  toc,title
book      toc,title,figure,table,example,equation
/chapter  toc,title
part      toc,title
/preface  toc,title
reference toc,title
/sect1    toc
/sect2    toc
/sect3    toc
/sect4    toc
/sect5    toc
/section  toc
set       toc,title
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="glossary.as.blocks">
<refmeta>
<refentrytitle>glossary.as.blocks</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>glossary.as.blocks</refname>
<refpurpose>Present glossarys using blocks instead of lists?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, <tag>glossary</tag>s will be formatted as
blocks.</para>

<para>If you have long <tag>glossterm</tag>s, proper list
markup in the FO case may produce unattractive lists. By setting this
parameter, you can force the stylesheets to produce block markup
instead of proper lists.</para>

<para>You can override this setting with a processing instruction as the
child of <tag>glossary</tag>: <tag class="xmlpi">dbfo
glossary-presentation="blocks"</tag> or <tag class="xmlpi">dbfo
glossary-presentation="list"</tag></para>

</refsection>
</doc:refentry>
<xsl:param name="glossary.as.blocks" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="glossary.collection">
<refmeta>
<refentrytitle>glossary.collection</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>glossary.collection</refname>
<refpurpose>Name of the glossary collection file</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Glossaries maintained independently across a set of documents
are likely to become inconsistent unless considerable effort is
expended to keep them in sync. It makes much more sense, usually, to
store all of the glossary entries in a single place and simply
<quote>extract</quote> the ones you need in each document.</para>

<para>That's the purpose of the
<parameter>glossary.collection</parameter> parameter. To setup a global
glossary <quote>database</quote>, follow these steps:</para>

<refsection><info><title>Setting Up the Glossary Database</title></info>

<para>First, create a stand-alone glossary document that contains all of
the entries that you wish to reference. Make sure that each glossary
entry has an ID.</para>

<para>Here's an example glossary:</para>

<informalexample>
<programlisting>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;!DOCTYPE glossary
  PUBLIC "-//OASIS//DTD DocBook XML V4.1.2//EN"
  "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"&gt;
&lt;glossary&gt;
&lt;glossaryinfo&gt;
&lt;editor&gt;&lt;firstname&gt;Eric&lt;/firstname&gt;&lt;surname&gt;Raymond&lt;/surname&gt;&lt;/editor&gt;
&lt;title&gt;Jargon File 4.2.3 (abridged)&lt;/title&gt;
&lt;releaseinfo&gt;Just some test data&lt;/releaseinfo&gt;
&lt;/glossaryinfo&gt;

&lt;glossdiv&gt;&lt;title&gt;0&lt;/title&gt;

&lt;glossentry&gt;
&lt;glossterm&gt;0&lt;/glossterm&gt;
&lt;glossdef&gt;
&lt;para&gt;Numeric zero, as opposed to the letter `O' (the 15th letter of
the English alphabet). In their unmodified forms they look a lot
alike, and various kluges invented to make them visually distinct have
compounded the confusion. If your zero is center-dotted and letter-O
is not, or if letter-O looks almost rectangular but zero looks more
like an American football stood on end (or the reverse), you're
probably looking at a modern character display (though the dotted zero
seems to have originated as an option on IBM 3270 controllers). If
your zero is slashed but letter-O is not, you're probably looking at
an old-style ASCII graphic set descended from the default typewheel on
the venerable ASR-33 Teletype (Scandinavians, for whom /O is a letter,
curse this arrangement). (Interestingly, the slashed zero long
predates computers; Florian Cajori's monumental "A History of
Mathematical Notations" notes that it was used in the twelfth and
thirteenth centuries.) If letter-O has a slash across it and the zero
does not, your display is tuned for a very old convention used at IBM
and a few other early mainframe makers (Scandinavians curse &lt;emphasis&gt;this&lt;/emphasis&gt;
arrangement even more, because it means two of their letters collide).
Some Burroughs/Unisys equipment displays a zero with a &lt;emphasis&gt;reversed&lt;/emphasis&gt;
slash. Old CDC computers rendered letter O as an unbroken oval and 0
as an oval broken at upper right and lower left. And yet another
convention common on early line printers left zero unornamented but
added a tail or hook to the letter-O so that it resembled an inverted
Q or cursive capital letter-O (this was endorsed by a draft ANSI
standard for how to draw ASCII characters, but the final standard
changed the distinguisher to a tick-mark in the upper-left corner).
Are we sufficiently confused yet?&lt;/para&gt;
&lt;/glossdef&gt;
&lt;/glossentry&gt;

&lt;glossentry&gt;
&lt;glossterm&gt;1TBS&lt;/glossterm&gt;
&lt;glossdef&gt;
&lt;para role="accidence"&gt;
&lt;phrase role="pronounce"&gt;&lt;/phrase&gt;
&lt;phrase role="partsofspeach"&gt;n&lt;/phrase&gt;
&lt;/para&gt;
&lt;para&gt;The "One True Brace Style"&lt;/para&gt;
&lt;glossseealso&gt;indent style&lt;/glossseealso&gt;
&lt;/glossdef&gt;
&lt;/glossentry&gt;

&lt;!-- ... --&gt;

&lt;/glossdiv&gt;

&lt;!-- ... --&gt;

&lt;/glossary&gt;</programlisting>
</informalexample>

</refsection>

<refsection><info><title>Marking Up Glossary Terms</title></info>

<para>That takes care of the glossary database, now you have to get the entries
into your document. Unlike bibliography entries, which can be empty, creating
<quote>placeholder</quote> glossary entries would be very tedious. So instead,
support for <parameter>glossary.collection</parameter> relies on implicit linking.</para>

<para>In your source document, simply use <tag>firstterm</tag> and
<tag>glossterm</tag> to identify the terms you wish to have included
in the glossary. The stylesheets assume that you will either set the
<tag class="attribute">baseform</tag> attribute correctly, or that the
content of the element exactly matches a term in your glossary.</para>

<para>If you're using a <parameter>glossary.collection</parameter>, don't
make explicit links on the terms in your document.</para>

<para>So, in your document, you might write things like this:</para>

<informalexample>
<programlisting>&lt;para&gt;This is dummy text, without any real meaning.
The point is simply to reference glossary terms like &lt;glossterm&gt;0&lt;/glossterm&gt;
and the &lt;firstterm baseform="1TBS"&gt;One True Brace Style (1TBS)&lt;/firstterm&gt;.
The &lt;glossterm&gt;1TBS&lt;/glossterm&gt;, as you can probably imagine, is a nearly
religious issue.&lt;/para&gt;</programlisting>
</informalexample>

<para>If you set the <parameter>firstterm.only.link</parameter> parameter,
only the terms marked with <tag>firstterm</tag> will be links.
Otherwise, all the terms will be linked.</para>

</refsection>

<refsection><info><title>Marking Up the Glossary</title></info>

<para>The glossary itself has to be identified for the stylesheets. For lack
of a better choice, the <tag class="attribute">role</tag> is used.
To identify the glossary as the target for automatic processing, set
the role to <quote><literal>auto</literal></quote>. The title of this
glossary (and any other information from the <tag>glossaryinfo</tag>
that's rendered by your stylesheet) will be displayed, but the entries will
come from the database.
</para>

<para>Unfortunately, the glossary can't be empty, so you must put in
at least one <tag>glossentry</tag>. The content of this entry
is irrelevant, it will not be rendered:</para>

<informalexample>
<programlisting>&lt;glossary role="auto"&gt;
&lt;glossentry&gt;
&lt;glossterm&gt;Irrelevant&lt;/glossterm&gt;
&lt;glossdef&gt;
&lt;para&gt;If you can see this, the document was processed incorrectly. Use
the &lt;parameter&gt;glossary.collection&lt;/parameter&gt; parameter.&lt;/para&gt;
&lt;/glossdef&gt;
&lt;/glossentry&gt;
&lt;/glossary&gt;</programlisting>
</informalexample>

<para>What about glossary divisions? If your glossary database has glossary
divisions <emphasis>and</emphasis> your automatic glossary contains at least
one <tag>glossdiv</tag>, the automic glossary will have divisions.
If the <tag>glossdiv</tag> is missing from either location, no divisions
will be rendered.</para>

<para>Glossary entries (and divisions, if appropriate) in the glossary will
occur in precisely the order they occur in your database.</para>

</refsection>

<refsection><info><title>Formatting the Document</title></info>

<para>Finally, when you are ready to format your document, simply set the
<parameter>glossary.collection</parameter> parameter (in either a
customization layer or directly through your processor's interface) to
point to your global glossary.</para>

<para>The stylesheets will format the glossary in your document as if
all of the entries implicilty referenced appeared there literally.</para>
</refsection>

<refsection><info><title>Limitations</title></info>

<para>Glossary cross-references <emphasis>within the glossary</emphasis> are
not supported. For example, this <emphasis>will not</emphasis> work:</para>

<informalexample>
<programlisting>&lt;glossentry&gt;
&lt;glossterm&gt;gloss-1&lt;/glossterm&gt;
&lt;glossdef&gt;&lt;para&gt;A description that references &lt;glossterm&gt;gloss-2&lt;/glossterm&gt;.&lt;/para&gt;
&lt;glossseealso&gt;gloss-2&lt;/glossseealso&gt;
&lt;/glossdef&gt;
&lt;/glossentry&gt;</programlisting>
</informalexample>

<para>If you put glossary cross-references in your glossary that way,
you'll get the cryptic error: <computeroutput>Warning:
glossary.collection specified, but there are 0 automatic
glossaries</computeroutput>.</para>

<para>Instead, you must do two things:</para>

<orderedlist>
<listitem>
<para>Markup your glossary using <tag>glossseealso</tag>:</para>

<informalexample>
<programlisting>&lt;glossentry&gt;
&lt;glossterm&gt;gloss-1&lt;/glossterm&gt;
&lt;glossdef&gt;&lt;para&gt;A description that references &lt;glossterm&gt;gloss-2&lt;/glossterm&gt;.&lt;/para&gt;
&lt;glossseealso&gt;gloss-2&lt;/glossseealso&gt;
&lt;/glossdef&gt;
&lt;/glossentry&gt;</programlisting>
</informalexample>
</listitem>

<listitem>
<para>Make sure there is at least one <tag>glossterm</tag> reference to
<glossterm>gloss-2</glossterm> <emphasis>in your document</emphasis>. The
easiest way to do that is probably within a <tag>remark</tag> in your
automatic glossary:</para>

<informalexample>
<programlisting>&lt;glossary role="auto"&gt;
&lt;remark&gt;Make sure there's a reference to &lt;glossterm&gt;gloss-2&lt;/glossterm&gt;.&lt;/remark&gt;
&lt;glossentry&gt;
&lt;glossterm&gt;Irrelevant&lt;/glossterm&gt;
&lt;glossdef&gt;
&lt;para&gt;If you can see this, the document was processed incorrectly. Use
the &lt;parameter&gt;glossary.collection&lt;/parameter&gt; parameter.&lt;/para&gt;
&lt;/glossdef&gt;
&lt;/glossentry&gt;
&lt;/glossary&gt;</programlisting>
</informalexample>
</listitem>
</orderedlist>
</refsection>

</refsection>
</doc:refentry>
<xsl:param name="glossary.collection"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="glossary.sort">
<refmeta>
<refentrytitle>glossary.sort</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>glossary.sort</refname>
<refpurpose>Sort glossentry elements?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, then the glossentry elements within a
glossary, glossdiv, or glosslist are sorted on the glossterm, using
the current lang setting.  If zero (the default), then
glossentry elements are not sorted and are presented
in document order.
</para>

</refsection>
</doc:refentry>
<xsl:param name="glossary.sort" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="glossentry.show.acronym">
<refmeta>
<refentrytitle>glossentry.show.acronym</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="value">no</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">yes</refmiscinfo>
<refmiscinfo class="other" otherclass="value">primary</refmiscinfo>
</refmeta>
<refnamediv>
<refname>glossentry.show.acronym</refname>
<refpurpose>Display <tag>glossentry</tag> acronyms?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>A setting of <quote>yes</quote> means they should be displayed;
<quote>no</quote> means they shouldn't. If <quote>primary</quote> is used,
then they are shown as the primary text for the entry.</para>

<note>
<para>This setting controls both <tag>acronym</tag> and
<tag>abbrev</tag> elements in the <tag>glossentry</tag>.</para>
</note>

</refsection>
</doc:refentry>
<xsl:param name="glossentry.show.acronym">no</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="glosslist.as.blocks">
<refmeta>
<refentrytitle>glosslist.as.blocks</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>glosslist.as.blocks</refname>
<refpurpose>Use blocks for glosslists?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>See <parameter>glossary.as.blocks</parameter>.</para>

</refsection>
</doc:refentry>
<xsl:param name="glosslist.as.blocks" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="glossterm.auto.link">
<refmeta>
<refentrytitle>glossterm.auto.link</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>glossterm.auto.link</refname>
<refpurpose>Generate links from glossterm to glossentry automatically?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, links from inline <tag>glossterm</tag>s to the corresponding 
<tag>glossentry</tag> elements in a <tag>glossary</tag> or <tag>glosslist</tag> 
will be automatically generated. This is useful when your glossterms are consistent 
and you don't want to add links manually.</para>

<para>The automatic link generation feature is not used on <tag>glossterm</tag> elements
that have a <tag class="attribute">linkend</tag> attribute.</para>

</refsection>
</doc:refentry>
<xsl:param name="glossterm.auto.link" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="glossterm.separation">
<refmeta>
<refentrytitle>glossterm.separation</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>glossterm.separation</refname>
<refpurpose>Separation between glossary terms and descriptions in list mode</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies the miminum horizontal
separation between glossary terms and descriptions when
they are presented side-by-side using lists
when the <parameter>glossary.as.blocks</parameter>
is zero.</para>

</refsection>
</doc:refentry>
<xsl:param name="glossterm.separation">0.25in</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="glossterm.width">
<refmeta>
<refentrytitle>glossterm.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>glossterm.width</refname>
<refpurpose>Width of glossterm in list presentation mode</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This parameter specifies the width reserved for glossary terms when
a list presentation is used.</para>

</refsection>
</doc:refentry>
<xsl:param name="glossterm.width">2in</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="glossentry.list.item.properties">
<refmeta>
<refentrytitle>glossentry.list.item.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>glossentry.list.item.properties</refname>
<refpurpose>To add properties to each glossentry in a list.</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>These properties are added to the fo:list-item containing a
glossentry in a glossary when the <parameter>glossary.as.blocks</parameter> parameter
is zero.
Use this attribute-set to set
spacing between entries, for example.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="glossentry.list.item.properties">
  <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="glossterm.list.properties">
<refmeta>
<refentrytitle>glossterm.list.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>glossterm.list.properties</refname>
<refpurpose>To add properties to the glossterm in a list.</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>These properties are added to the block containing a
glossary term in a glossary when the <parameter>glossary.as.blocks</parameter> parameter
is zero.
Use this attribute-set to set
font properties, for example.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="glossterm.list.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="glossterm.block.properties">
<refmeta>
<refentrytitle>glossterm.block.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>glossterm.block.properties</refname>
<refpurpose>To add properties to the block of a glossentry's glossterm.</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>These properties are added to the block containing a
glossary term in a glossary when the <parameter>glossary.as.blocks</parameter> parameter
is non-zero.
Use this attribute-set to set the space above and below,
font properties,
and any indent for the glossary term.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="glossterm.block.properties">
  <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  <xsl:attribute name="keep-together.within-column">always</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="glossdef.list.properties">
<refmeta>
<refentrytitle>glossdef.list.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>glossdef.list.properties</refname>
<refpurpose>To add properties to the glossary definition in a list.</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>These properties are added to the block containing a
glossary definition in a glossary when
the <parameter>glossary.as.blocks</parameter> parameter
is zero.
Use this attribute-set to set font properties, for example.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="glossdef.list.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="glossdef.block.properties">
<refmeta>
<refentrytitle>glossdef.block.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>glossdef.block.properties</refname>
<refpurpose>To add properties to the block of a glossary definition.</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>These properties are added to the block containing a
glossary definition in a glossary when
the <parameter>glossary.as.blocks</parameter> parameter
is non-zero.
Use this attribute-set to set the space above and below,
any font properties,
and any indent for the glossary definition.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="glossdef.block.properties">
  <xsl:attribute name="margin-{$direction.align.start}">.25in</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="graphic.default.extension">
<refmeta>
<refentrytitle>graphic.default.extension</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>graphic.default.extension</refname>
<refpurpose>Default extension for graphic filenames</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If a <tag>graphic</tag> or <tag>mediaobject</tag>
includes a reference to a filename that does not include an extension,
and the <tag class="attribute">format</tag> attribute is
<emphasis>unspecified</emphasis>, the default extension will be used.
</para>

</refsection>
</doc:refentry>
<xsl:param name="graphic.default.extension"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="header.content.properties">
<refmeta>
<refentrytitle>header.content.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>header.content.properties</refname>
<refpurpose>Properties of page header content</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Properties of page header content.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="header.content.properties">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$body.fontset"/>
  </xsl:attribute>
  <xsl:attribute name="margin-left">
    <xsl:value-of select="$title.margin.left"/>
  </xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="header.rule">
<refmeta>
<refentrytitle>header.rule</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>header.rule</refname>
<refpurpose>Rule under headers?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, a rule will be drawn below the page headers.</para>

</refsection>
</doc:refentry>
<xsl:param name="header.rule" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="header.column.widths">
<refmeta>
<refentrytitle>header.column.widths</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>header.column.widths</refname>
<refpurpose>Specify relative widths of header areas</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Page headers in print output use a three column table
to position text at the left, center, and right side of
the header on the page.
This parameter lets you specify the relative sizes of the
three columns.  The default value is
"1 1 1".</para>

<para>The parameter value must be three numbers, separated
by white space. The first number represents the relative
width of the inside header for
double-sided output.  The second number is the relative
width of the center header.  The third number is the
relative width of the outside header for
double-sided output.
</para>
<para>For single-sided output, the first number is the
relative width of left header for left-to-right
text direction, or the right header for right-to-left
text direction.  
The third number is the
relative width of right header for left-to-right
text direction, or the left header for right-to-left
text direction.</para>

<para>The numbers are used to specify the column widths
for the table that makes up the header area.
In the FO output, this looks like:
</para>

<programlisting>
&lt;fo:table-column column-number="1" 
    column-width="proportional-column-width(1)"/&gt;
</programlisting>

<para>
The <literal>proportional-column-width()</literal>
function computes a column width by dividing its
argument by the total of the arguments for all the columns, and
then multiplying the result by the width of the whole table
(assuming all the column specs use the function).
Its argument can be any positive integer or floating point number.
Zero is an acceptable value, although some FO processors
may warn about it, in which case using a very small number might
be more satisfactory.
</para>

<para>For example, the value "1 2 1" means the center
header should have twice the width of the other areas.
A value of "0 0 1" means the entire header area
is reserved for the right (or outside) header text.
Note that to keep the center area centered on
the page, the left and right values must be
the same. A specification like "1 2 3" means the
center area is no longer centered on the page
since the right area is three times the width of the left area.
</para>

</refsection>
</doc:refentry>
<xsl:param name="header.column.widths">1 1 1</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="header.table.height">
<refmeta>
<refentrytitle>header.table.height</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>header.table.height</refname>
<refpurpose>Specify the minimum height of the table containing the running page headers</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Page headers in print output use a three column table
to position text at the left, center, and right side of
the header on the page.
This parameter lets you specify the minimum height 
of the single row in the table.  
Since this specifies only the minimum height,
the table should automatically grow to fit taller content.
The default value is "14pt".</para>

</refsection>
</doc:refentry>
<xsl:param name="header.table.height">14pt</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="header.table.properties">
<refmeta>
<refentrytitle>header.table.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>header.table.properties</refname>
<refpurpose>Apply properties to the header layout table</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Properties applied to the table that lays out the page header.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="header.table.properties">
  <xsl:attribute name="table-layout">fixed</xsl:attribute>
  <xsl:attribute name="width">100%</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="headers.on.blank.pages">
<refmeta>
<refentrytitle>headers.on.blank.pages</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>headers.on.blank.pages</refname>
<refpurpose>Put headers on blank pages?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, headers will be placed on blank pages.</para>

</refsection>
</doc:refentry>
<xsl:param name="headers.on.blank.pages" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="highlight.default.language">
<refmeta>
<refentrytitle>highlight.default.language</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>highlight.default.language</refname>
<refpurpose>Default language of programlisting</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This language is used when there is no language attribute on programlisting.</para>

</refsection>
</doc:refentry>
<xsl:param name="highlight.default.language"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="highlight.source">
<refmeta>
<refentrytitle>highlight.source</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>highlight.source</refname>
<refpurpose>Should the content of <tag>programlisting</tag>
be syntactically highlighted?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>When this parameter is non-zero, the stylesheets will try to do syntax highlighting of the 
content of <tag>programlisting</tag> elements. You specify the language for each programlisting 
by using the <tag class="attribute">language</tag> attribute. The <parameter>highlight.default.language</parameter> 
parameter can be used to specify the language for programlistings without a <tag class="attribute">language</tag> 
attribute. Syntax highlighting also works for <tag>screen</tag> and <tag>synopsis</tag> elements.</para>

<para>The actual highlighting work is done by the XSLTHL extension module. This is an external Java library that has to be 
downloaded separately (see below).</para>

<itemizedlist>
<para>In order to use this extension, you must</para> 

<listitem><para>add <filename>xslthl-2.x.x.jar</filename> to your Java classpath. The latest version is available
from <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://sourceforge.net/projects/xslthl">the XSLT syntax highlighting project</link> 
at SourceForge.</para>
</listitem>
<listitem>
<para>use a customization layer in which you import one of the following stylesheet modules: 
<itemizedlist>
  <listitem>
    <para><filename>html/highlight.xsl</filename>
    </para>
  </listitem>
<listitem>
    <para><filename>xhtml/highlight.xsl</filename>
    </para>
  </listitem>
<listitem>
    <para><filename>xhtml-1_1/highlight.xsl</filename>
    </para>
  </listitem>
<listitem>
    <para><filename>fo/highlight.xsl</filename>
    </para>
</listitem>
</itemizedlist>
</para>
</listitem>
<listitem><para>let either the <literal>xslthl.config</literal> Java system property or the
<parameter>highlight.xslthl.config</parameter> parameter point to the configuration file for syntax 
highlighting (using URL syntax). DocBook XSL comes with a ready-to-use configuration file, 
<filename>highlighting/xslthl-config.xml</filename>.</para>
</listitem>
</itemizedlist>

<para>The extension works with Saxon 6.5.x and Xalan-J. (Saxon 8.5 or later is also supported, but since it is 
an XSLT 2.0 processor it is not guaranteed to work with DocBook XSL in all circumstances.)</para>

<para>The following is an example of a Saxon 6 command adapted for syntax highlighting, to be used on Windows:</para>

<informalexample>
<para><command>java -cp c:/Java/saxon.jar;c:/Java/xslthl-2.0.1.jar 
-Dxslthl.config=file:///c:/docbook-xsl/highlighting/xslthl-config.xml com.icl.saxon.StyleSheet 
-o test.html test.xml myhtml.xsl</command></para>
</informalexample>

</refsection>
</doc:refentry>
<xsl:param name="highlight.source" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="highlight.xslthl.config">
<refmeta>
<refentrytitle>highlight.xslthl.config</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">uri</refmiscinfo>
</refmeta>
<refnamediv>
<refname>highlight.xslthl.config</refname>
<refpurpose>Location of XSLTHL configuration file</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This location has precedence over the corresponding Java property.</para>

</refsection>
</doc:refentry>
<xsl:param name="highlight.xslthl.config"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="hyphenate">
<refmeta>
<refentrytitle>hyphenate</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="list-type">closed</refmiscinfo>
<refmiscinfo class="other" otherclass="value">true</refmiscinfo>
<refmiscinfo class="other" otherclass="value">false</refmiscinfo>
</refmeta>
<refnamediv>
<refname>hyphenate</refname>
<refpurpose>Specify hyphenation behavior</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If true, words may be hyphenated. Otherwise, they may not.
</para>

</refsection>
</doc:refentry>
<xsl:param name="hyphenate">true</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="hyphenate.verbatim">
<refmeta>
<refentrytitle>hyphenate.verbatim</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>hyphenate.verbatim</refname>
<refpurpose>Should verbatim environments be hyphenated on space characters?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If the lines of program listing are too long to fit into one
line it is quite common to split them at space and indicite by hook
arrow that code continues on the next line. You can turn on this
behaviour for <tag>programlisting</tag>,
<tag>screen</tag> and <tag>synopsis</tag> elements by
using this parameter.</para>

<para>Note that you must also enable line wrapping for verbatim environments and
select appropriate hyphenation character (e.g. hook arrow). This can
be done using <parameter>monospace.verbatim.properties</parameter>
attribute set:</para>

<programlisting>&lt;xsl:attribute-set name="monospace.verbatim.properties" 
                   use-attribute-sets="verbatim.properties monospace.properties"&gt;
  &lt;xsl:attribute name="wrap-option"&gt;wrap&lt;/xsl:attribute&gt;
  &lt;xsl:attribute name="hyphenation-character"&gt;&amp;#x25BA;&lt;/xsl:attribute&gt;
&lt;/xsl:attribute-set&gt;</programlisting>

<para>For a list of arrows available in Unicode see <uri xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.unicode.org/charts/PDF/U2190.pdf">http://www.unicode.org/charts/PDF/U2190.pdf</uri> and <uri xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.unicode.org/charts/PDF/U2900.pdf">http://www.unicode.org/charts/PDF/U2900.pdf</uri> and make sure that
selected character is available in the font you are using for verbatim
environments.</para>

</refsection>
</doc:refentry>
<xsl:param name="hyphenate.verbatim" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="hyphenate.verbatim.characters">
<refmeta>
<refentrytitle>hyphenate.verbatim.characters</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>hyphenate.verbatim.characters</refname>
<refpurpose>List of characters after which a line break can occur in listings</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If you enable <parameter>hyphenate.verbatim</parameter> line
breaks are allowed only on space characters. If this is not enough for
your document, you can specify list of additional characters after
which line break is allowed in this parameter.</para>

</refsection>
</doc:refentry>
<xsl:param name="hyphenate.verbatim.characters"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="ignore.image.scaling">
<refmeta>
<refentrytitle>ignore.image.scaling</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>ignore.image.scaling</refname>
<refpurpose>Tell the stylesheets to ignore the author's image scaling attributes</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, the scaling attributes on graphics and media objects are
ignored.</para>

</refsection>
</doc:refentry>
<xsl:param name="ignore.image.scaling" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="img.src.path">
<refmeta>
<refentrytitle>img.src.path</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>img.src.path</refname>
<refpurpose>Path to HTML/FO image files</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Add a path prefix to the value of the <tag class="attribute">fileref</tag> 
attribute of <tag>graphic</tag>, <tag>inlinegraphic</tag>, and <tag>imagedata</tag> elements. The resulting 
compound path is used in the output as the value of the <tag class="attribute">src</tag> 
attribute of <tag class="element">img</tag> (HTML) or <tag class="element">external-graphic</tag> (FO).
</para>

<para>
The path given by <literal>img.src.path</literal> could be relative to the directory where the HTML/FO
files are created, or it could be an absolute URI.
The default value is empty.
Be sure to include a trailing slash if needed.
</para>

<para>This prefix is not applied to any filerefs that start
with "/" or contain "//:".
</para>

</refsection>
</doc:refentry>
<xsl:param name="img.src.path"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="index.method">
<refmeta>
<refentrytitle>index.method</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="value">basic</refmiscinfo>
<refmiscinfo class="other" otherclass="value">kosek</refmiscinfo>
<refmiscinfo class="other" otherclass="value">kimber</refmiscinfo>
</refmeta>
<refnamediv>
<refname>index.method</refname>
<refpurpose>Select method used to group index entries in an index</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This parameter lets you select which method to use for sorting and grouping
 index entries in an index.
Indexes in Latin-based languages that have accented characters typically
sort together accented words and unaccented words.
Thus <quote>Á</quote> (U+00C1 LATIN CAPITAL LETTER A WITH ACUTE) would sort together
with <quote>A</quote> (U+0041 LATIN CAPITAL LETTER A), so both would appear in the <quote>A</quote>
section of the index.
Languages using other alphabets (such as Russian,  which is written in the Cyrillic alphabet)
and languages using ideographic chararacters (such as Japanese)
require grouping specific to the languages and alphabets.
</para>

<para>The default indexing method is limited.
It can group accented characters in Latin-based languages only.
It cannot handle non-Latin alphabets or ideographic languages.
The other indexing methods require extensions of one type or
another, and do not work with
all XSLT processors, which is why they are not used by default.</para>

<para>The three choices for indexing method are:</para>
<variablelist>
<varlistentry>
<term><literal>basic</literal></term>
<listitem>
<para>
(default)  Sort and groups words based only on the Latin alphabet.
Words with accented Latin letters will group and sort with
their respective primary letter, but
words in non-Latin alphabets will be
put in the <quote>Symbols</quote> section of the index.
</para>
</listitem>
</varlistentry>
<varlistentry>
<term><literal>kosek</literal></term>
<listitem>
<para>
This method sorts and groups words based on letter groups configured in
the DocBook locale file for the given language.
See, for example, the French locale file <filename>common/fr.xml</filename>.
This method requires that the XSLT processor
supports the EXSLT extensions (most do).
It also requires support for using 
user-defined functions in xsl:key (xsltproc does not).
</para>
<para>This method is suitable for any language for which you can
list all the individual characters that should appear
in each letter group in an index.
It is probably not practical to use it for ideographic languages
such as Chinese that have hundreds or thousands of characters.
</para>

<para>To use the kosek method, you must:</para>

<orderedlist>
<listitem>
<para>Use a processor that supports its extensions, such as
Saxon 6 or Xalan (xsltproc and Saxon 8 do not).
</para>
</listitem>
<listitem>
<para>Set the index.method parameter's value to <quote>kosek</quote>.
</para>
</listitem>
<listitem>
<para>Import the appropriate index extensions stylesheet module
<filename>fo/autoidx-kosek.xsl</filename> or 
<filename>html/autoidx-kosek.xsl</filename> into your
customization.
</para>
</listitem>
</orderedlist>

</listitem>
</varlistentry>
<varlistentry>
<term><literal>kimber</literal></term>
<listitem>
<para>
This method uses extensions to the Saxon processor to implement
sophisticated indexing processes. It uses its own 
configuration file, which can include information for any number of
languages. Each language's configuration can group
words using one of two processes. In the
enumerated process similar to that used in the kosek method,
you indicate the groupings character-by-character.
In the between-key process, you specify the
break-points in the sort order that should start a new group.
The latter configuration is useful for ideographic languages
such as Chinese, Japanese, and Korean.
You can also define your own collation algorithms and how you
want mixed Latin-alphabet words sorted.</para>
<itemizedlist>
<listitem>
<para>For a whitepaper describing the extensions, see:
<link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.innodata-isogen.com/knowledge_center/white_papers/back_of_book_for_xsl_fo.pdf">http://www.innodata-isogen.com/knowledge_center/white_papers/back_of_book_for_xsl_fo.pdf</link>.
</para>
</listitem>
<listitem>
<para>To download the extension library, see
<link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.innodata-isogen.com/knowledge_center/tools_downloads/i18nsupport">http://www.innodata-isogen.com/knowledge_center/tools_downloads/i18nsupport</link>.
</para>
</listitem>
</itemizedlist>

<para>To use the kimber method, you must:</para>

<orderedlist>
<listitem>
<para>Use Saxon (version 6 or 8) as your XSLT processor.
</para>
</listitem>
<listitem>
<para>Install and configure the Innodata Isogen library, using
the documentation that comes with it.
</para>
</listitem>
<listitem>
<para>Set the index.method parameter's value to <quote>kimber</quote>.
</para>
</listitem>
<listitem>
<para>Import the appropriate index extensions stylesheet module
<filename>fo/autoidx-kimber.xsl</filename> or 
<filename>html/autoidx-kimber.xsl</filename> into your
customization.
</para>
</listitem>
</orderedlist>

</listitem>
</varlistentry>
</variablelist>

</refsection>
</doc:refentry>
<xsl:param name="index.method">basic</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="index.on.role">
<refmeta>
<refentrytitle>index.on.role</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>index.on.role</refname>
<refpurpose>Select indexterms based on <tag class="attribute">role</tag> value</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>
If non-zero, 
then an <tag>index</tag> element that has a
<tag class="attribute">role</tag> attribute
value will contain only those <tag>indexterm</tag>
elements with a matching role value.
If an <tag>index</tag> has no <tag class="attribute">role</tag>
attribute or it is blank, then the index will contain
all <tag>indexterm</tag>s in the current scope.
</para>
<para>
If <literal>index.on.role</literal> is zero, then the
<tag class="attribute">role</tag> attribute has no effect
on selecting indexterms for an index.
</para>

<para>If you are using DocBook version 4.3 or later, you should
use the <tag class="attribute">type</tag> attribute instead of <tag class="attribute">role</tag>
on <tag>indexterm</tag> and <tag>index</tag>,
and set the <parameter>index.on.type</parameter> to a nonzero
value.
</para>

</refsection>
</doc:refentry>
<xsl:param name="index.on.role" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="index.on.type">
<refmeta>
<refentrytitle>index.on.type</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>index.on.type</refname>
<refpurpose>Select indexterms based on <tag class="attribute">type</tag>
attribute value</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>
If non-zero, 
then an <tag>index</tag> element that has a
<tag class="attribute">type</tag> attribute
value will contain only those <tag>indexterm</tag>
elements with a matching <tag class="attribute">type</tag> attribute value.
If an <tag>index</tag> has no <tag class="attribute">type</tag>
attribute or it is blank, then the index will contain
all <tag>indexterm</tag>s in the current scope.
</para>

<para>
If <literal>index.on.type</literal> is zero, then the
<tag class="attribute">type</tag> attribute has no effect
on selecting indexterms for an index.
</para>

<para>For those using DocBook version 4.2 or earlier,
the <tag class="attribute">type</tag> attribute is not available
for index terms.  However, you can achieve the same
effect by using the <tag class="attribute">role</tag> attribute
in the same manner on <tag>indexterm</tag>
and <tag>index</tag>, and setting the stylesheet parameter 
<parameter>index.on.role</parameter> to a nonzero value.
</para>

</refsection>
</doc:refentry>
<xsl:param name="index.on.type" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="index.page.number.properties">
<refmeta>
<refentrytitle>index.page.number.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>index.page.number.properties</refname>
<refpurpose>Properties associated with index page numbers</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Properties associated with page numbers in indexes. 
Changing color to indicate the page number is a link is
one possibility.
</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="index.page.number.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="informalequation.properties">
<refmeta>
<refentrytitle>informalequation.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>informalequation.properties</refname>
<refpurpose>Properties associated with an informalequation</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The styling for informalequations.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="informalequation.properties" use-attribute-sets="informal.object.properties"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="informalexample.properties">
<refmeta>
<refentrytitle>informalexample.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>informalexample.properties</refname>
<refpurpose>Properties associated with an informalexample</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The styling for informalexamples.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="informalexample.properties" use-attribute-sets="informal.object.properties"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="informalfigure.properties">
<refmeta>
<refentrytitle>informalfigure.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>informalfigure.properties</refname>
<refpurpose>Properties associated with an informalfigure</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The styling for informalfigures.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="informalfigure.properties" use-attribute-sets="informal.object.properties"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="informal.object.properties">
<refmeta>
<refentrytitle>informal.object.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>informal.object.properties</refname>
<refpurpose>Properties associated with an informal (untitled) object, such as an informalfigure</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>The styling for informal objects in docbook. Specify the spacing before and after the object.</para>
</refsection>
</doc:refentry>
<xsl:attribute-set name="informal.object.properties">
  <xsl:attribute name="space-before.minimum">0.5em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">2em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.5em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">2em</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="informaltable.properties">
<refmeta>
<refentrytitle>informaltable.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>informaltable.properties</refname>
<refpurpose>Properties associated with the block surrounding an informaltable</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Block styling properties for informaltables. This parameter should really
have been called <literal>informaltable.block.properties</literal> or something
like that, but we’re leaving it to avoid backwards-compatibility
problems.</para>

<para>See also <parameter>table.table.properties</parameter>.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="informaltable.properties" use-attribute-sets="informal.object.properties"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="index.preferred.page.properties">
<refmeta>
<refentrytitle>index.preferred.page.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>index.preferred.page.properties</refname>
<refpurpose>Properties used to emphasize page number references for
significant index terms</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Properties used to emphasize page number references for
significant index terms (<tag class="attribute">significance</tag>=<tag class="attvalue">preferred</tag>). Currently works only with
XEP.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="index.preferred.page.properties">
  <xsl:attribute name="font-weight">bold</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="index.div.title.properties">
<refmeta>
<refentrytitle>index.div.title.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>index.div.title.properties</refname>
<refpurpose>Properties associated with the letter headings in an
index</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This attribute set is used on the letter headings that separate
the divisions in an index.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="index.div.title.properties">
  <xsl:attribute name="margin-{$direction.align.start}">0pt</xsl:attribute>
  <xsl:attribute name="font-size">14.4pt</xsl:attribute>
  <xsl:attribute name="font-family"><xsl:value-of select="$title.fontset"/></xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  <xsl:attribute name="space-before.optimum"><xsl:value-of select="concat($body.font.master,'pt')"/></xsl:attribute>
  <xsl:attribute name="space-before.minimum"><xsl:value-of select="concat($body.font.master,'pt * 0.8')"/></xsl:attribute>
  <xsl:attribute name="space-before.maximum"><xsl:value-of select="concat($body.font.master,'pt * 1.2')"/></xsl:attribute>
  <xsl:attribute name="start-indent">0pt</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="index.entry.properties">
<refmeta>
<refentrytitle>index.entry.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>index.entry.properties</refname>
<refpurpose>Properties applied to the formatted entries
in an index</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This attribute set is applied to the block containing
the entries in a letter division in an index.  It can be used to set the
font-size, font-family, and other inheritable properties that will be
applied to all index entries.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="index.entry.properties">
  <xsl:attribute name="start-indent">0pt</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="index.number.separator">
<refmeta>
<refentrytitle>index.number.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>index.number.separator</refname>
<refpurpose>Override for punctuation separating page numbers in index</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This parameter permits you to override the text to insert between
page references in a formatted index entry.  Typically 
that would be a comma and a space.
</para>

<para>Because this text may be locale dependent,
this parameter's value is normally taken from a gentext
template named 'number-separator' in the
context 'index' in the stylesheet
locale file for the language
of the current document.
This parameter can be used to override the gentext string,
and would typically be used on the command line.
This parameter would apply to all languages.
</para>

<para>So this text string can be customized in two ways.
You can reset the default gentext string using
the <parameter>local.l10n.xml</parameter> parameter, or you can
override the gentext with the content of this parameter.
The content can be a simple string, or it can be
something more complex such as a call-template.
</para>

<para>In HTML index output, section title references are used instead of
page number references.  This punctuation appears between
such section titles in an HTML index.
</para>

</refsection>
</doc:refentry>
<xsl:param name="index.number.separator"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="index.range.separator">
<refmeta>
<refentrytitle>index.range.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>index.range.separator</refname>
<refpurpose>Override for punctuation separating the two numbers
in a page range in index</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This parameter permits you
to override the text to insert between
the two numbers of a page range in an index.
This parameter is only used by those XSL-FO processors
that support an extension for generating such page ranges
(such as XEP).</para>

<para>Because this text may be locale dependent,
this parameter's value is normally taken from a gentext
template named 'range-separator' in the
context 'index' in the stylesheet
locale file for the language
of the current document.
This parameter can be used to override the gentext string,
and would typically be used on the command line.
This parameter would apply to all languages.
</para>

<para>So this text string can be customized in two ways.
You can reset the default gentext string using
the <parameter>local.l10n.xml</parameter> parameter, or you can
override the gentext with the content of this parameter.
The content can be a simple string, or it can be
something more complex such as a call-template.
</para>

<para>In HTML index output, section title references are used instead of
page number references. So there are no page ranges
and this parameter has no effect.
</para>

</refsection>
</doc:refentry>
<xsl:param name="index.range.separator"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="index.term.separator">
<refmeta>
<refentrytitle>index.term.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>index.term.separator</refname>
<refpurpose>Override for punctuation separating an index term 
from its list of page references in an index</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This parameter permits you to override
the text to insert between
the end of an index term and its list of page references.
Typically that might be a comma and a space.
</para>

<para>Because this text may be locale dependent,
this parameter's value is normally taken from a gentext
template named 'term-separator' in the
context 'index' in the stylesheet
locale file for the language
of the current document.
This parameter can be used to override the gentext string,
and would typically be used on the command line.
This parameter would apply to all languages.
</para>

<para>So this text string can be customized in two ways.
You can reset the default gentext string using
the <parameter>local.l10n.xml</parameter> parameter, or you can
fill in the content for this normally empty 
override parameter.
The content can be a simple string, or it can be
something more complex such as a call-template.
For fo output, it could be an <tag>fo:leader</tag>
element to provide space of a specific length, or a dot leader.
</para>

</refsection>
</doc:refentry>
<xsl:param name="index.term.separator"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="insert.link.page.number">
<refmeta>
<refentrytitle>insert.link.page.number</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">no</refmiscinfo>
<refmiscinfo class="other" otherclass="value">yes</refmiscinfo>
<refmiscinfo class="other" otherclass="value">maybe</refmiscinfo>
</refmeta>
<refnamediv>
<refname>insert.link.page.number</refname>
<refpurpose>Turns page numbers in link elements on and off</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The value of this parameter determines if
cross references using the <tag>link</tag> element in
printed output will
include standard page number citations.
It has three possible values.
</para>
<variablelist>
<varlistentry>
<term>no</term>
<listitem><para>No page number references will be generated.
</para></listitem>
</varlistentry>
<varlistentry>
<term>yes</term>
<listitem><para>Page number references will be generated
for all <tag>link</tag> elements.
The style of page reference may be changed
if an <tag class="attribute">xrefstyle</tag>
attribute is used.
</para></listitem>
</varlistentry>
<varlistentry>
<term>maybe</term>
<listitem><para>Page number references will not be generated
for a <tag>link</tag> element unless 
it has an
<tag class="attribute">xrefstyle</tag>
attribute whose value specifies a page reference.
</para></listitem>
</varlistentry>
</variablelist>

<para>Although the <tag>xrefstyle</tag> attribute
can be used to turn the page reference on or off, it cannot be
used to control the formatting of the page number as it
can in <tag>xref</tag>.
In <tag>link</tag> it will always format with
the style established by the
gentext template with <literal>name="page.citation"</literal>
in the <literal>l:context name="xref"</literal>.
</para>
</refsection>
</doc:refentry>
<xsl:param name="insert.link.page.number">no</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="insert.xref.page.number">
<refmeta>
<refentrytitle>insert.xref.page.number</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">no</refmiscinfo>
<refmiscinfo class="other" otherclass="value">yes</refmiscinfo>
<refmiscinfo class="other" otherclass="value">maybe</refmiscinfo>
</refmeta>
<refnamediv>
<refname>insert.xref.page.number</refname>
<refpurpose>Turns page numbers in xrefs on and off</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The value of this parameter determines if
cross references (<tag>xref</tag>s) in
printed output will
include page number citations.
It has three possible values.
</para>
<variablelist>
<varlistentry>
<term>no</term>
<listitem><para>No page number references will be generated.
</para></listitem>
</varlistentry>
<varlistentry>
<term>yes</term>
<listitem><para>Page number references will be generated
for all <tag>xref</tag> elements.
The style of page reference may be changed
if an <tag class="attribute">xrefstyle</tag>
attribute is used.
</para></listitem>
</varlistentry>
<varlistentry>
<term>maybe</term>
<listitem><para>Page number references will not be generated
for an <tag>xref</tag> element unless 
it has an
<tag class="attribute">xrefstyle</tag>
attribute whose value specifies a page reference.
</para></listitem>
</varlistentry>
</variablelist>

</refsection>
</doc:refentry>
<xsl:param name="insert.xref.page.number">no</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="itemizedlist.properties">
<refmeta>
<refentrytitle>itemizedlist.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>itemizedlist.properties</refname>
<refpurpose>Properties that apply to each list-block generated by itemizedlist.</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>Properties that apply to each fo:list-block generated by itemizedlist.</para>
</refsection>
</doc:refentry>
<xsl:attribute-set name="itemizedlist.properties" use-attribute-sets="list.block.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="itemizedlist.label.properties">
<refmeta>
<refentrytitle>itemizedlist.label.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>itemizedlist.label.properties</refname>
<refpurpose>Properties that apply to each label inside itemized list.</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>Properties that apply to each label inside itemized list. E.g.:</para>
<programlisting>&lt;xsl:attribute-set name="itemizedlist.label.properties"&gt;
  &lt;xsl:attribute name="text-align"&gt;right&lt;/xsl:attribute&gt;
&lt;/xsl:attribute-set&gt;</programlisting>
</refsection>
</doc:refentry>
<xsl:attribute-set name="itemizedlist.label.properties">
</xsl:attribute-set>
    
<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="itemizedlist.label.width">
<refmeta>
<refentrytitle>itemizedlist.label.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
  <refname>itemizedlist.label.width</refname>
<refpurpose>The default width of the label (bullet) in an itemized list.</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>
<para>Specifies the default width of the label (usually a bullet or other
symbol) in an itemized list. You can override the default value on any
particular list with the “dbfo” processing instruction using the
“label-width” pseudoattribute.</para>
</refsection>
</doc:refentry>
<xsl:param name="itemizedlist.label.width">1.0em</xsl:param>
  


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="keep.relative.image.uris">
<refmeta>
<refentrytitle>keep.relative.image.uris</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>keep.relative.image.uris</refname>
<refpurpose>Should image URIs be resolved against xml:base?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, relative URIs (in, for example
<literal>fileref</literal> attributes) will be used in the generated
output. Otherwise, the URIs will be made absolute with respect to the
base URI.</para>

<para>Note that the stylesheets calculate (and use) the absolute form
for some purposes, this only applies to the resulting output.</para>

</refsection>
</doc:refentry>
<xsl:param name="keep.relative.image.uris" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="l10n.gentext.default.language">
  <refmeta>
    <refentrytitle>l10n.gentext.default.language</refentrytitle>
    <refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
  </refmeta>
  <refnamediv>
    <refname>l10n.gentext.default.language</refname>
    <refpurpose>Sets the default language for generated text</refpurpose>
  </refnamediv>

  

<refsection><info><title>Description</title></info>

<para>The value of the <parameter>l10n.gentext.default.language</parameter>
parameter is used as the language for generated text if no setting is provided
in the source document.</para>

</refsection>
</doc:refentry>
<xsl:param name="l10n.gentext.default.language">en</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="l10n.gentext.language">
<refmeta>
<refentrytitle>l10n.gentext.language</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>l10n.gentext.language</refname>
<refpurpose>Sets the gentext language</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If this parameter is set to any value other than the empty string, its
value will be used as the value for the language when generating text. Setting
<parameter>l10n.gentext.language</parameter> overrides any settings within the
document being formatted.</para>

<para>It's much more likely that you might want to set the
<parameter>l10n.gentext.default.language</parameter> parameter.</para>

</refsection>
</doc:refentry>
<xsl:param name="l10n.gentext.language"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="l10n.gentext.use.xref.language">
<refmeta>
<refentrytitle>l10n.gentext.use.xref.language</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>l10n.gentext.use.xref.language</refname>
<refpurpose>Use the language of target when generating cross-reference text?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, the language of the target will be used when
generating cross reference text. Usually, the <quote>current</quote>
language is used when generating text (that is, the language of the
element that contains the cross-reference element). But setting this parameter
allows the language of the element <emphasis>pointed to</emphasis> to control
the generated text.</para>

<para>Consider the following example:</para>

<informalexample>
<programlisting>&lt;para lang="en"&gt;See also &lt;xref linkend="chap3"/&gt;.&lt;/para&gt;
</programlisting>
</informalexample>

<para>Suppose that Chapter 3 happens to be written in German.
If <parameter>l10n.gentext.use.xref.language</parameter> is non-zero, the
resulting text will be something like this:</para>

<blockquote>
<para>See also Kapital 3.</para>
</blockquote>

<para>Where the more traditional rendering would be:</para>

<blockquote>
<para>See also Chapter 3.</para>
</blockquote>

</refsection>
</doc:refentry>
<xsl:param name="l10n.gentext.use.xref.language" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="l10n.lang.value.rfc.compliant">
<refmeta>
<refentrytitle>l10n.lang.value.rfc.compliant</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>l10n.lang.value.rfc.compliant</refname>
<refpurpose>Make value of lang attribute RFC compliant?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, ensure that the values for all <tag class="attribute">lang</tag> attributes in HTML output are RFC
compliant<footnote><para>Section 8.1.1, <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.w3.org/TR/REC-html40/struct/dirlang.html#h-8.1.1">Language Codes</link>, in the HTML 4.0 Recommendation states that:

<blockquote><para>[RFC1766] defines and explains the language codes
that must be used in HTML documents.</para>
<para>Briefly, language codes consist of a primary code and a possibly
empty series of subcodes:

<literallayout class="monospaced">language-code = primary-code ( "-" subcode )*</literallayout>
</para>
<para>And in RFC 1766, <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.ietf.org/rfc/rfc1766.txt">Tags for the Identification
of Languages</link>, the EBNF for "language tag" is given as:

<literallayout class="monospaced">Language-Tag = Primary-tag *( "-" Subtag )
Primary-tag = 1*8ALPHA
Subtag = 1*8ALPHA</literallayout>
</para>
</blockquote>
</para></footnote>.

by taking any underscore characters in any <tag class="attribute">lang</tag> values found in source documents, and
replacing them with hyphen characters in output HTML files. For
example, <literal>zh_CN</literal> in a source document becomes
<literal>zh-CN</literal> in the HTML output form that source.

<note>
<para>This parameter does not cause any case change in <tag class="attribute">lang</tag> values, because RFC 1766
explicitly states that all "language tags" (as it calls them) "are
to be treated as case insensitive".</para>
</note>
</para>

</refsection>
</doc:refentry>
<xsl:param name="l10n.lang.value.rfc.compliant" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="label.from.part">
<refmeta>
<refentrytitle>label.from.part</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>label.from.part</refname>
<refpurpose>Renumber components in each part?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If <parameter>label.from.part</parameter> is non-zero, then
  numbering of components — <tag>preface</tag>,
  <tag>chapter</tag>, <tag>appendix</tag>, and
  <tag>reference</tag> (when <tag>reference</tag> occurs at the
  component level) — is re-started within each
  <tag>part</tag>.</para>
<para>If <parameter>label.from.part</parameter> is zero (the
  default), numbering of components is <emphasis>not</emphasis>
  re-started within each <tag>part</tag>; instead, components are
  numbered sequentially throughout each <tag>book</tag>,
  regardless of whether or not they occur within <tag>part</tag>
  instances.</para>

</refsection>
</doc:refentry>
<xsl:param name="label.from.part" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="line-height">
<refmeta>
<refentrytitle>line-height</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>line-height</refname>
<refpurpose>Specify the line-height property</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Sets the line-height property.</para>

</refsection>
</doc:refentry>
<xsl:param name="line-height">normal</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="linenumbering.everyNth">
<refmeta>
<refentrytitle>linenumbering.everyNth</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv>
<refname>linenumbering.everyNth</refname>
<refpurpose>Indicate which lines should be numbered</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If line numbering is enabled, everyNth line will be
numbered. Note that numbering is one based, not zero based.
</para>

</refsection>
</doc:refentry>
<xsl:param name="linenumbering.everyNth">5</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="linenumbering.extension">
<refmeta>
<refentrytitle>linenumbering.extension</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>linenumbering.extension</refname>
<refpurpose>Enable the line numbering extension</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, verbatim environments (<tag>address</tag>, <tag>literallayout</tag>,
<tag>programlisting</tag>, <tag>screen</tag>, <tag>synopsis</tag>) that specify line numbering will
have line numbers.
</para>

</refsection>
</doc:refentry>
<xsl:param name="linenumbering.extension" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="linenumbering.separator">
<refmeta>
<refentrytitle>linenumbering.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>linenumbering.separator</refname>
<refpurpose>Specify a separator between line numbers and lines</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The separator is inserted between line numbers and lines in the
verbatim environment. The default value is a single white space.
 Note the interaction with <parameter>linenumbering.width</parameter>
</para>

</refsection>
</doc:refentry>
<xsl:param name="linenumbering.separator"><xsl:text> </xsl:text></xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="linenumbering.width">
<refmeta>
<refentrytitle>linenumbering.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv>
<refname>linenumbering.width</refname>
<refpurpose>Indicates the width of line numbers</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If line numbering is enabled, line numbers will appear right
justified in a field "width" characters wide.
</para>

</refsection>
</doc:refentry>
<xsl:param name="linenumbering.width">3</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="list.block.properties">
<refmeta>
<refentrytitle>list.block.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>list.block.properties</refname>
<refpurpose>Properties that apply to each list-block generated by list.</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>Properties that apply to each fo:list-block generated by itemizedlist/orderedlist.</para>
</refsection>
</doc:refentry>
<xsl:attribute-set name="list.block.properties">
  <xsl:attribute name="provisional-label-separation">0.2em</xsl:attribute>
  <xsl:attribute name="provisional-distance-between-starts">1.5em</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="list.block.spacing">
<refmeta>
<refentrytitle>list.block.spacing</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>list.block.spacing</refname>
<refpurpose>What spacing do you want before and after lists?</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>Specify the spacing required before and after a list. It is necessary to specify the space after a list block because lists can come inside of paras.  </para>
</refsection>
</doc:refentry>
<xsl:attribute-set name="list.block.spacing">
  <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">1.2em</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="list.item.spacing">
<refmeta>
<refentrytitle>list.item.spacing</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>list.item.spacing</refname>
<refpurpose>What space do you want between list items?</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>Specify what spacing you want between each list item.</para>
</refsection>
</doc:refentry>
<xsl:attribute-set name="list.item.spacing">
  <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="make.index.markup">
<refmeta>
<refentrytitle>make.index.markup</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>make.index.markup</refname>
<refpurpose>Generate XML index markup in the index?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This parameter enables a very neat trick for getting properly
merged, collated back-of-the-book indexes. G. Ken Holman suggested
this trick at Extreme Markup Languages 2002 and I'm indebted to him
for it.</para>

<para>Jeni Tennison's excellent code in
<filename>autoidx.xsl</filename> does a great job of merging and
sorting <tag>indexterm</tag>s in the document and building a
back-of-the-book index. However, there's one thing that it cannot
reasonably be expected to do: merge page numbers into ranges. (I would
not have thought that it could collate and suppress duplicate page
numbers, but in fact it appears to manage that task somehow.)</para>

<para>Ken's trick is to produce a document in which the index at the
back of the book is <quote>displayed</quote> in XML. Because the index
is generated by the FO processor, all of the page numbers have been resolved.
It's a bit hard to explain, but what it boils down to is that instead of having
an index at the back of the book that looks like this:</para>

<blockquote>
<formalpara><info><title>A</title></info>
<para>ap1, 1, 2, 3</para>
</formalpara>
</blockquote>

<para>you get one that looks like this:</para>

<blockquote>
<programlisting>&lt;indexdiv&gt;A&lt;/indexdiv&gt;
&lt;indexentry&gt;
&lt;primaryie&gt;ap1&lt;/primaryie&gt;,
&lt;phrase role="pageno"&gt;1&lt;/phrase&gt;,
&lt;phrase role="pageno"&gt;2&lt;/phrase&gt;,
&lt;phrase role="pageno"&gt;3&lt;/phrase&gt;
&lt;/indexentry&gt;</programlisting>
</blockquote>

<para>After building a PDF file with this sort of odd-looking index, you can
extract the text from the PDF file and the result is a proper index expressed in
XML.</para>

<para>Now you have data that's amenable to processing and a simple Perl script
(such as <filename>fo/pdf2index</filename>) can
merge page ranges and generate a proper index.</para>

<para>Finally, reformat your original document using this literal index instead of
an automatically generated one and <quote>bingo</quote>!</para>

</refsection>
</doc:refentry>
<xsl:param name="make.index.markup" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="make.single.year.ranges">
<refmeta>
<refentrytitle>make.single.year.ranges</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>make.single.year.ranges</refname>
<refpurpose>Print single-year ranges (e.g., 1998-1999)</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, year ranges that span a single year will be printed
in range notation (1998-1999) instead of discrete notation
(1998, 1999).</para>

</refsection>
</doc:refentry>
<xsl:param name="make.single.year.ranges" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="make.year.ranges">
<refmeta>
<refentrytitle>make.year.ranges</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>make.year.ranges</refname>
<refpurpose>Collate copyright years into ranges?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, multiple copyright <tag>year</tag> elements will be
collated into ranges.
This works only if each year number is put into a separate
year element.  The copyright element permits multiple
year elements. If a year element contains a dash or
a comma, then that year element will not be merged into
any range.
</para>

</refsection>
</doc:refentry>
<xsl:param name="make.year.ranges" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="margin.note.properties">
<refmeta>
<refentrytitle>margin.note.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>margin.note.properties</refname>
<refpurpose>Attribute set for margin.note properties</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The styling for margin notes.
By default, margin notes are not implemented for any
element. A stylesheet customization is needed to make
use of this attribute-set.</para>

<para>You can use a template named <quote>floater</quote>
to create the customization.
That template can create side floats by specifying the
content and characteristics as template parameters.
</para>

<para>For example:</para>
<programlisting>&lt;xsl:template match="para[@role='marginnote']"&gt;
  &lt;xsl:call-template name="floater"&gt;
    &lt;xsl:with-param name="position"&gt;
      &lt;xsl:value-of select="$margin.note.float.type"/&gt;
    &lt;/xsl:with-param&gt;
    &lt;xsl:with-param name="width"&gt;
      &lt;xsl:value-of select="$margin.note.width"/&gt;
    &lt;/xsl:with-param&gt;
    &lt;xsl:with-param name="content"&gt;
      &lt;xsl:apply-imports/&gt;
    &lt;/xsl:with-param&gt;
  &lt;/xsl:call-template&gt;
&lt;/xsl:template&gt;</programlisting>

</refsection>
</doc:refentry>
<xsl:attribute-set name="margin.note.properties">
  <xsl:attribute name="font-size">90%</xsl:attribute>
  <xsl:attribute name="text-align">start</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="margin.note.title.properties">
<refmeta>
<refentrytitle>margin.note.title.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>margin.note.title.properties</refname>
<refpurpose>Attribute set for margin note titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The styling for margin note titles.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="margin.note.title.properties">
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="text-align">start</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="margin.note.float.type">
<refmeta>
<refentrytitle>margin.note.float.type</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="value">none</refmiscinfo>
<refmiscinfo class="other" otherclass="value">before</refmiscinfo>
<refmiscinfo class="other" otherclass="value">left</refmiscinfo>
<refmiscinfo class="other" otherclass="value">start</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">right</refmiscinfo>
<refmiscinfo class="other" otherclass="value">end</refmiscinfo>     
<refmiscinfo class="other" otherclass="value">inside</refmiscinfo>
<refmiscinfo class="other" otherclass="value">outside</refmiscinfo> 
</refmeta>
<refnamediv>
<refname>margin.note.float.type</refname>
<refpurpose>Select type of float for margin note customizations</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Selects the type of float for margin notes.
DocBook does not define a margin note element, so this
feature must be implemented as a customization of the stylesheet.
See <parameter>margin.note.properties</parameter> for
an example.
</para>
<itemizedlist>
<listitem>
<para>If <parameter>margin.note.float.type</parameter> is
<quote><literal>none</literal></quote>, then 
no float is used.
</para>
</listitem>
<listitem>
<para>If <parameter>margin.note.float.type</parameter> is
<quote><literal>before</literal></quote>, then 
the float appears at the top of the page.  On some processors,
that may be the next page rather than the current page.
</para>
</listitem>
<listitem>
<para>If <parameter>margin.note.float.type</parameter> is
<quote><literal>left</literal></quote> or
<quote><literal>start</literal></quote>, then 
a left side float is used.
</para>
</listitem>
<listitem>
<para>If <parameter>margin.note.float.type</parameter> is
<quote><literal>right</literal></quote> or
<quote><literal>end</literal></quote>, then 
a right side float is used.
</para>
</listitem>
<listitem>
<para>If your XSL-FO processor supports floats positioned on the
<quote><literal>inside</literal></quote> or
<quote><literal>outside</literal></quote>
of double-sided pages, then you have those two 
options for side floats as well.
</para>
</listitem>
</itemizedlist>

</refsection>
</doc:refentry>
<xsl:param name="margin.note.float.type">none</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="margin.note.width">
<refmeta>
<refentrytitle>margin.note.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>margin.note.width</refname>
<refpurpose>Set the default width for margin notes</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Sets the default width for margin notes when used as a side
float.  The width determines the degree to which the margin note block
intrudes into the text area.
</para>
<para>If <parameter>margin.note.float.type</parameter> is
<quote><literal>before</literal></quote> or 
<quote><literal>none</literal></quote>, then 
this parameter is ignored.
</para>

</refsection>
</doc:refentry>
<xsl:param name="margin.note.width">1in</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="marker.section.level">
<refmeta>
<refentrytitle>marker.section.level</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv>
<refname>marker.section.level</refname>
<refpurpose>Control depth of sections shown in running headers or footers</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The <parameter>marker.section.level</parameter> parameter
controls the depth of section levels that may be displayed
in running headers and footers.  For example, if the value
is 2 (the default), then titles from <tag>sect1</tag> and 
<tag>sect2</tag> or equivalent <tag>section</tag>
elements are candidates for use in running headers and
footers.
</para>
<para>Each candidate title is marked in the FO output with a
<tag>&lt;fo:marker marker-class-name="section.head.marker"&gt;</tag>
element.
</para>
<para>In order for such titles to appear in headers
or footers, the <literal>header.content</literal>
or <literal>footer.content</literal> template
must be customized to retrieve the marker using
an output element such as:
</para>
<programlisting>
&lt;fo:retrieve-marker retrieve-class-name="section.head.marker"
                       retrieve-position="first-including-carryover"
                       retrieve-boundary="page-sequence"/&gt;
</programlisting>


</refsection>
</doc:refentry>
<xsl:param name="marker.section.level">2</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="menuchoice.menu.separator">
<refmeta>
<refentrytitle>menuchoice.menu.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>menuchoice.menu.separator</refname>
<refpurpose>Separator between items of a <tag>menuchoice</tag>
with <tag>guimenuitem</tag> or
<tag>guisubmenu</tag></refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Separator used to connect items of a <tag>menuchoice</tag> with
<tag>guimenuitem</tag> or <tag>guisubmenu</tag>. Other elements
are linked with <parameter>menuchoice.separator</parameter>.
</para>
<para>The default value is &amp;#x2192;, which is the
&amp;rarr; (right arrow) character entity.  
The current FOP (0.20.5) requires setting the font-family
explicitly.
</para>
<para>The default value also includes spaces around the arrow,
which will allow a line to break.  Replace the spaces with
&amp;#xA0; (nonbreaking space) if you don't want those
spaces to break.
</para>

</refsection>
</doc:refentry>
<xsl:param name="menuchoice.menu.separator"> → </xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="menuchoice.separator">
<refmeta>
<refentrytitle>menuchoice.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>menuchoice.separator</refname>
<refpurpose>Separator between items of a <tag>menuchoice</tag>
other than <tag>guimenuitem</tag> and
<tag>guisubmenu</tag></refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Separator used to connect items of a <tag>menuchoice</tag> other
than <tag>guimenuitem</tag> and <tag>guisubmenu</tag>. The latter
elements are linked with <parameter>menuchoice.menu.separator</parameter>.
</para>

</refsection>
</doc:refentry>
<xsl:param name="menuchoice.separator">+</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="monospace.font.family">
<refmeta>
<refentrytitle>monospace.font.family</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>monospace.font.family</refname>
<refpurpose>The default font family for monospace environments</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The monospace font family is used for verbatim environments
(program listings, screens, etc.).
</para>

</refsection>
</doc:refentry>
<xsl:param name="monospace.font.family">monospace</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="monospace.properties">
<refmeta>
<refentrytitle>monospace.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>monospace.properties</refname>
<refpurpose>Properties of monospaced content</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies the font name for monospaced output. This property set
used to set the font-size as well, but that doesn't work very well
when different fonts are used (as they are in titles and paragraphs,
for example).</para>

<para>If you want to set the font-size in a customization layer, it's
probably going to be more appropriate to set font-size-adjust, if your
formatter supports it.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="monospace.properties">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$monospace.font.family"/>
  </xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="monospace.verbatim.properties">
<refmeta>
<refentrytitle>monospace.verbatim.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>monospace.verbatim.properties</refname>
<refpurpose>What font and size do you want for monospaced content?</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>Specify the font name and size you want for monospaced output</para>
</refsection>
</doc:refentry>
<xsl:attribute-set name="monospace.verbatim.properties" use-attribute-sets="verbatim.properties monospace.properties">
  <xsl:attribute name="text-align">start</xsl:attribute>
  <xsl:attribute name="wrap-option">no-wrap</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="monospace.verbatim.font.width">
<refmeta>
<refentrytitle>monospace.verbatim.font.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>monospace.verbatim.font.width</refname>
<refpurpose>Width of a single monospace font character</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies with em units the width of a single character
of the monospace font. The default value is <literal>0.6em</literal>.</para>

<para>This parameter is only used when a <tag>screen</tag>
or <tag>programlisting</tag> element has a 
<tag class="attribute">width</tag> attribute, which is
expressed as a plain integer to indicate the maximum character count
of each line.
To convert this character count to an actual maximum width
measurement, the width of the font characters must be provided.
Different monospace fonts have different character width,
so this parameter should be adjusted to fit the 
monospace font being used.
</para>

</refsection>
</doc:refentry>
<xsl:param name="monospace.verbatim.font.width">0.60em</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="nominal.table.width">
<refmeta>
<refentrytitle>nominal.table.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>nominal.table.width</refname>
<refpurpose>The (absolute) nominal width of tables</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>In order to convert CALS column widths into HTML column widths, it
is sometimes necessary to have an absolute table width to use for conversion
of mixed absolute and relative widths. This value must be an absolute
length (not a percentage).</para>

</refsection>
</doc:refentry>
<xsl:param name="nominal.table.width">6in</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="normal.para.spacing">
<refmeta>
<refentrytitle>normal.para.spacing</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>normal.para.spacing</refname>
<refpurpose>What space do you want between normal paragraphs</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>Specify the spacing required between normal paragraphs</para>
</refsection>
</doc:refentry>
<xsl:attribute-set name="normal.para.spacing">
  <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="olink.doctitle"> 
<refmeta> 
<refentrytitle>olink.doctitle</refentrytitle> 
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">no</refmiscinfo>
<refmiscinfo class="other" otherclass="value">yes</refmiscinfo>
<refmiscinfo class="other" otherclass="value">maybe</refmiscinfo>
</refmeta> 
<refnamediv> 
<refname>olink.doctitle</refname> 
<refpurpose>show the document title for external olinks?</refpurpose>

</refnamediv> 
 
<refsection><info><title>Description</title></info> 
 
<para>When olinks between documents are resolved, the generated text
may not make it clear that the reference is to another document.
It is possible for the stylesheets to append the other document's
title to external olinks. For this to happen, two parameters must
be set.</para>
<itemizedlist>
<listitem>
<para>This <parameter>olink.doctitle</parameter> parameter
should be set to either <literal>yes</literal> or <literal>maybe</literal>
to enable this feature.
</para>
</listitem>
<listitem>
<para>And you should also set the <parameter>current.docid</parameter>
parameter to the document id for the  document currently
being processed for output.
</para>
</listitem>
</itemizedlist>

<para>
Then if an olink's  <literal>targetdoc</literal> id differs from
the <literal>current.docid</literal> value, the stylesheet knows
that it is a reference to another document and can
append the target document's
title to the generated olink text. </para> 

<para>The text for the target document's title is copied from the
olink database from the <tag>ttl</tag> element
of the top-level <tag>div</tag> for that document.
If that <tag>ttl</tag> element is missing or empty,
no title is output.
</para>

<para>The supported values for <parameter>olink.doctitle</parameter> are:
</para>
<variablelist>
<varlistentry>
<term><literal>yes</literal></term>
<listitem>
<para>
Always insert the title to the target document if it is not
the current document.
</para>
</listitem>
</varlistentry>
<varlistentry>
<term><literal>no</literal></term>
<listitem>
<para>
Never insert the title to the target document, even if requested
in an <tag class="attribute">xrefstyle</tag> attribute.
</para>
</listitem>
</varlistentry>
<varlistentry>
<term><literal>maybe</literal></term>
<listitem>
<para>
Only insert the title to the target document, if requested
in an <tag class="attribute">xrefstyle</tag> attribute.
</para>
</listitem>
</varlistentry>
</variablelist>
<para>An <tag class="attribute">xrefstyle</tag> attribute
may override the global setting for individual olinks.
The following values are supported in an
<tag class="attribute">xrefstyle</tag>
attribute using the <literal>select:</literal> syntax:
</para>

<variablelist>
<varlistentry>
<term><literal>docname</literal></term>
<listitem>
<para>
Insert the target document name for this olink using the
<literal>docname</literal> gentext template, but only
if the value of <parameter>olink.doctitle</parameter>
is not <literal>no</literal>.
</para>
</listitem>
</varlistentry>
<varlistentry>
<term><literal>docnamelong</literal></term>
<listitem>
<para>
Insert the target document name for this olink using the
<literal>docnamelong</literal> gentext template, but only
if the value of <parameter>olink.doctitle</parameter>
is not <literal>no</literal>.
</para>
</listitem>
</varlistentry>
<varlistentry>
<term><literal>nodocname</literal></term>
<listitem>
<para>
Omit the target document name even if
the value of <parameter>olink.doctitle</parameter>
is <literal>yes</literal>.
</para>
</listitem>
</varlistentry>
</variablelist>
<para>Another way of inserting the target document name 
for a single olink is to employ an
<tag class="attribute">xrefstyle</tag>
attribute using the <literal>template:</literal> syntax.
The <literal>%o</literal> placeholder (the letter o, not zero)
in such a template
will be filled in with the target document's title when it is processed.
This will occur regardless of 
the value of <parameter>olink.doctitle</parameter>.
</para>
<para>Note that prior to version 1.66 of the XSL stylesheets,
the allowed values for this parameter were 0 and 1.  Those
values are still supported and mapped to 'no' and 'yes', respectively.
</para>
</refsection> 
</doc:refentry>
<xsl:param name="olink.doctitle">no</xsl:param> 

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="olink.base.uri"> 
<refmeta> 
<refentrytitle>olink.base.uri</refentrytitle> 
<refmiscinfo class="other" otherclass="datatype">uri</refmiscinfo> 
</refmeta> 
<refnamediv> 
<refname>olink.base.uri</refname> 
<refpurpose>Base URI used in olink hrefs</refpurpose> 
</refnamediv> 
 
<refsection><info><title>Description</title></info> 
 
<para>When cross reference data is collected for resolving olinks, it
may be necessary to prepend a base URI to each target's href. This
parameter lets you set that base URI when cross reference data is
collected. This feature is needed when you want to link to a document
that is processed without chunking. The output filename for such a
document is not known to the XSL stylesheet; the only target
information consists of fragment identifiers such as
<literal>#idref</literal>. To enable the resolution of olinks between
documents, you should pass the name of the HTML output file as the
value of this parameter. Then the hrefs recorded in the cross
reference data collection look like
<literal>outfile.html#idref</literal>, which can be reached as links
from other documents.</para>
</refsection> 
</doc:refentry>
<xsl:param name="olink.base.uri"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="olink.debug">
<refmeta>
<refentrytitle>olink.debug</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>olink.debug</refname>
<refpurpose>Turn on debugging messages for olinks</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, then each olink will generate several
messages about how it is being resolved during processing.
This is useful when an olink does not resolve properly
and the standard error messages are not sufficient to
find the problem. 
</para>

<para>You may need to read through the olink XSL templates
to understand the context for some of the debug messages.
</para>

</refsection>
</doc:refentry>
<xsl:param name="olink.debug" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="olink.properties">
<refmeta>
<refentrytitle>olink.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>olink.properties</refname>
<refpurpose>Properties associated with the cross-reference 
text of an olink.</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This <literal>attribute set</literal> is applied to the
<literal>fo:basic-link</literal> element of an olink. It is not applied to the
optional page number or optional title of the external
document.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="olink.properties">
  <xsl:attribute name="show-destination">replace</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="olink.lang.fallback.sequence"> 
<refmeta> 
<refentrytitle>olink.lang.fallback.sequence</refentrytitle> 
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo> 
</refmeta> 
<refnamediv> 
<refname>olink.lang.fallback.sequence</refname> 
<refpurpose>look up translated documents if olink not found?</refpurpose>

</refnamediv> 
 
<refsection><info><title>Description</title></info> 
 

<para>This parameter defines a list of lang values
to search among to resolve olinks.
</para>

<para>Normally an olink tries to resolve to a document in the same
language as the olink itself.  The language of an olink
is determined by its nearest ancestor element with a
<tag class="attribute">lang</tag> attribute, otherwise the
value of the <parameter>l10n.gentext.default.lang</parameter>
parameter.
</para>

<para>An olink database can contain target data for the same
document in multiple languages.  Each set of data has the
same value for the <tag>targetdoc</tag> attribute in
the <tag>document</tag> element in the database, but with a 
different <tag>lang</tag> attribute value.
</para>

<para>When an olink is being resolved, the target is first
sought in the document with the same language as the olink.
If no match is found there, then this parameter is consulted
for additional languages to try.</para>

<para>The <parameter>olink.lang.fallback.sequence</parameter>
must be a whitespace separated list of lang values to
try.  The first one with a match in the olink database is used.
The default value is empty.</para>

<para>For example, a document might be written in German
and contain an olink with
<literal>targetdoc="adminguide"</literal>.
When the document is processed, the processor
first looks for a target dataset in the
olink database starting with:</para>

<literallayout><literal>&lt;document targetdoc="adminguide" lang="de"&gt;</literal>.
</literallayout>

<para>If there is no such element, then the
<parameter>olink.lang.fallback.sequence</parameter> 
parameter is consulted.
If its value is, for example, <quote>fr en</quote>, then the processor next
looks for <literal>targetdoc="adminguide" lang="fr"</literal>, and
then for <literal>targetdoc="adminguide" lang="en"</literal>.
If there is still no match, it looks for
<literal>targetdoc="adminguide"</literal> with no
lang attribute.
</para>

<para>This parameter is useful when a set of documents is only
partially translated, or is in the process of being translated.  
If a target of an olink has not yet been translated, then this
parameter permits the processor to look for the document in
other languages.  This assumes the reader would rather have
a link to a document in a different language than to have
a broken link.
</para>

</refsection> 
</doc:refentry>
<xsl:param name="olink.lang.fallback.sequence"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="orderedlist.properties">
<refmeta>
<refentrytitle>orderedlist.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>orderedlist.properties</refname>
<refpurpose>Properties that apply to each list-block generated by orderedlist.</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>Properties that apply to each fo:list-block generated by orderedlist.</para>
</refsection>
</doc:refentry>
<xsl:attribute-set name="orderedlist.properties" use-attribute-sets="list.block.properties">
  <xsl:attribute name="provisional-distance-between-starts">2em</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="orderedlist.label.properties">
<refmeta>
<refentrytitle>orderedlist.label.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>orderedlist.label.properties</refname>
<refpurpose>Properties that apply to each label inside ordered list.</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>Properties that apply to each label inside ordered list. E.g.:</para>
<programlisting>&lt;xsl:attribute-set name="orderedlist.label.properties"&gt;
  &lt;xsl:attribute name="text-align"&gt;right&lt;/xsl:attribute&gt;
&lt;/xsl:attribute-set&gt;</programlisting>
</refsection>
</doc:refentry>
<xsl:attribute-set name="orderedlist.label.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="orderedlist.label.width">
<refmeta>
<refentrytitle>orderedlist.label.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>orderedlist.label.width</refname>
<refpurpose>The default width of the label (number) in an ordered list.</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>
<para>Specifies the default width of the label (usually a number or
sequence of numbers) in an ordered list. You can override the default
value on any particular list with the “dbfo” processing instruction
using the “label-width” pseudoattribute.</para>
</refsection>
</doc:refentry>
<xsl:param name="orderedlist.label.width">1.2em</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="prefer.internal.olink">
<refmeta>
<refentrytitle>prefer.internal.olink</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>prefer.internal.olink</refname>
<refpurpose>Prefer a local olink reference to an external reference</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If you are re-using XML content modules in multiple documents,
you may want to redirect some of your olinks.  This parameter
permits you to redirect an olink to the current document.
</para>

<para>For example: you are writing documentation for a  product, 
which includes 3 manuals: a little installation
booklet (booklet.xml), a user 
guide (user.xml), and a reference manual (reference.xml).
All 3 documents begin with the same introduction section (intro.xml) that 
contains a reference to the customization section (custom.xml) which is 
included in both user.xml and reference.xml documents.
</para>

<para>How do you write the link to custom.xml in intro.xml
so that it is interpreted correctly in all 3 documents?</para>
<itemizedlist>
<listitem><para>If you use xref, it will fail in user.xml.</para>
</listitem>
<listitem><para>If you use olink (pointing to reference.xml),
the reference in user.xml  
will point to the customization section of the reference manual, while it is 
actually available in user.xml.</para>
</listitem>
</itemizedlist>

<para>If you set the <parameter>prefer.internal.olink</parameter>
parameter to a non-zero value, then the processor will
first look in the olink database
for the olink's <tag>targetptr</tag> attribute value
in document matching the <parameter>current.docid</parameter>
parameter value.  If it isn't found there, then
it tries the document in the database
with the <tag>targetdoc</tag>
value that matches the olink's <tag>targetdoc</tag>
attribute.
</para>

<para>This feature permits an olink reference to resolve to
the current document if there is an element
with an id matching the olink's <tag>targetptr</tag>
value.  The current document's olink data must be
included in the target database for this to work.</para>

<caution>
<para>There is a potential for incorrect links if
the same <tag>id</tag> attribute value is used for different
content in different documents.
Some of your olinks may be redirected to the current document
when they shouldn't be.  It is not possible to control
individual olink instances.</para>
</caution>

</refsection>
</doc:refentry>
<xsl:param name="prefer.internal.olink" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="insert.olink.page.number">
<refmeta>
<refentrytitle>insert.olink.page.number</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">no</refmiscinfo>
<refmiscinfo class="other" otherclass="value">yes</refmiscinfo>
<refmiscinfo class="other" otherclass="value">maybe</refmiscinfo>
</refmeta>
<refnamediv>
<refname>insert.olink.page.number</refname>
<refpurpose>Turns page numbers in olinks on and off</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The value of this parameter determines if
cross references made between documents with
<tag>olink</tag> will 
include page number citations.
In most cases this is only applicable to references in printed output.
</para>
<para>The parameter has three possible values.
</para>
<variablelist>
<varlistentry>
<term>no</term>
<listitem><para>No page number references will be generated for olinks.
</para></listitem>
</varlistentry>
<varlistentry>
<term>yes</term>
<listitem><para>Page number references will be generated
for all <tag>olink</tag> references.
The style of page reference may be changed
if an <tag class="attribute">xrefstyle</tag>
attribute is used.
</para></listitem>
</varlistentry>
<varlistentry>
<term>maybe</term>
<listitem><para>Page number references will not be generated
for an <tag>olink</tag> element unless 
it has an
<tag class="attribute">xrefstyle</tag>
attribute whose value specifies a page reference.
</para></listitem>
</varlistentry>
</variablelist>
<para>Olinks that point to targets within the same document
are treated as <tag>xref</tag>s, and controlled by
the <parameter>insert.xref.page.number</parameter> parameter.
</para>

<para>Page number references for olinks to
external documents can only be inserted if the 
information exists in the olink database. 
This means each olink target element 
(<tag>div</tag> or <tag>obj</tag>)
must have a <tag class="attribute">page</tag> attribute
whose value is its page number in the target document.
The XSL stylesheets are not able to extract that information
during processing because pages have not yet been created in
XSLT transformation.  Only the XSL-FO processor knows what
page each element is placed on.
Therefore some postprocessing must take place to populate
page numbers in the olink database.
</para>



</refsection>
</doc:refentry>
<xsl:param name="insert.olink.page.number">no</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="insert.olink.pdf.frag">
<refmeta>
<refentrytitle>insert.olink.pdf.frag</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>insert.olink.pdf.frag</refname>
<refpurpose>Add fragment identifiers for links into PDF files</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The value of this parameter determines whether
the cross reference URIs to PDF documents made with
<tag>olink</tag> will 
include fragment identifiers.
</para>

<para>When forming a URI to link to a PDF document,
a fragment identifier (typically a '#' followed by an
id value) appended to the PDF filename can be used by
the PDF viewer to open
the PDF file to a location within the document instead of
the first page.
However, not all PDF files have id
values embedded in them, and not all PDF viewers can
handle fragment identifiers. 
</para>

<para>If <parameter>insert.olink.pdf.frag</parameter> is set
to a non-zero value, then any olink targeting a
PDF file will have the fragment identifier appended to the URI.
The URI is formed by concatenating the value of the
<parameter>olink.base.uri</parameter> parameter, the
value of the <tag class="attribute">baseuri</tag>
attribute from the <tag class="element">document</tag>
element in the olink database with the matching
<tag class="attribute">targetdoc</tag> value,
and the value of the <tag class="attribute">href</tag>
attribute for the targeted element in the olink database.
The <tag class="attribute">href</tag> attribute
contains the fragment identifier.
</para>

<para>If <parameter>insert.olink.pdf.frag</parameter> is set
to zero (the default value), then 
the <tag class="attribute">href</tag> attribute
from the olink database
is not appended to PDF olinks, so the fragment identifier is left off.
A PDF olink is any olink for which the
<tag class="attribute">baseuri</tag> attribute
from the matching <tag class="element">document</tag>
element in the olink database ends with '.pdf'.
Any other olinks will still have the fragment identifier added.
</para>
</refsection>
</doc:refentry>
<xsl:param name="insert.olink.pdf.frag" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="page.height">
<refmeta>
<refentrytitle>page.height</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>page.height</refname>
<refpurpose>The height of the physical page</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The page height is generally calculated from the
<parameter>paper.type</parameter> and
<parameter>page.orientation</parameter> parameters.
</para>

</refsection>
</doc:refentry>
<xsl:param name="page.height">
  <xsl:choose>
    <xsl:when test="$page.orientation = 'portrait'">
      <xsl:value-of select="$page.height.portrait"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$page.width.portrait"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="page.height.portrait">
<refmeta>
<refentrytitle>page.height.portrait</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>page.height.portrait</refname>
<refpurpose>Specify the physical size of the long edge of the page</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The portrait page height is the length of the long
edge of the physical page.
</para>

</refsection>
</doc:refentry>
<xsl:param name="page.height.portrait">
  <xsl:choose>
    <xsl:when test="$paper.type = 'A4landscape'">210mm</xsl:when>
    <xsl:when test="$paper.type = 'USletter'">11in</xsl:when>
    <xsl:when test="$paper.type = 'USlandscape'">8.5in</xsl:when>
    <xsl:when test="$paper.type = '4A0'">2378mm</xsl:when>
    <xsl:when test="$paper.type = '2A0'">1682mm</xsl:when>
    <xsl:when test="$paper.type = 'A0'">1189mm</xsl:when>
    <xsl:when test="$paper.type = 'A1'">841mm</xsl:when>
    <xsl:when test="$paper.type = 'A2'">594mm</xsl:when>
    <xsl:when test="$paper.type = 'A3'">420mm</xsl:when>
    <xsl:when test="$paper.type = 'A4'">297mm</xsl:when>
    <xsl:when test="$paper.type = 'A5'">210mm</xsl:when>
    <xsl:when test="$paper.type = 'A6'">148mm</xsl:when>
    <xsl:when test="$paper.type = 'A7'">105mm</xsl:when>
    <xsl:when test="$paper.type = 'A8'">74mm</xsl:when>
    <xsl:when test="$paper.type = 'A9'">52mm</xsl:when>
    <xsl:when test="$paper.type = 'A10'">37mm</xsl:when>
    <xsl:when test="$paper.type = 'B0'">1414mm</xsl:when>
    <xsl:when test="$paper.type = 'B1'">1000mm</xsl:when>
    <xsl:when test="$paper.type = 'B2'">707mm</xsl:when>
    <xsl:when test="$paper.type = 'B3'">500mm</xsl:when>
    <xsl:when test="$paper.type = 'B4'">353mm</xsl:when>
    <xsl:when test="$paper.type = 'B5'">250mm</xsl:when>
    <xsl:when test="$paper.type = 'B6'">176mm</xsl:when>
    <xsl:when test="$paper.type = 'B7'">125mm</xsl:when>
    <xsl:when test="$paper.type = 'B8'">88mm</xsl:when>
    <xsl:when test="$paper.type = 'B9'">62mm</xsl:when>
    <xsl:when test="$paper.type = 'B10'">44mm</xsl:when>
    <xsl:when test="$paper.type = 'C0'">1297mm</xsl:when>
    <xsl:when test="$paper.type = 'C1'">917mm</xsl:when>
    <xsl:when test="$paper.type = 'C2'">648mm</xsl:when>
    <xsl:when test="$paper.type = 'C3'">458mm</xsl:when>
    <xsl:when test="$paper.type = 'C4'">324mm</xsl:when>
    <xsl:when test="$paper.type = 'C5'">229mm</xsl:when>
    <xsl:when test="$paper.type = 'C6'">162mm</xsl:when>
    <xsl:when test="$paper.type = 'C7'">114mm</xsl:when>
    <xsl:when test="$paper.type = 'C8'">81mm</xsl:when>
    <xsl:when test="$paper.type = 'C9'">57mm</xsl:when>
    <xsl:when test="$paper.type = 'C10'">40mm</xsl:when>
    <xsl:otherwise>11in</xsl:otherwise>
  </xsl:choose>
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="page.margin.bottom">
<refmeta>
<refentrytitle>page.margin.bottom</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>page.margin.bottom</refname>
<refpurpose>The bottom margin of the page</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The bottom page margin is the distance from the bottom of the region-after
to the physical bottom of the page.
</para>

</refsection>
</doc:refentry>
<xsl:param name="page.margin.bottom">0.5in</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="page.margin.inner">
<refmeta>
<refentrytitle>page.margin.inner</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>page.margin.inner</refname>
<refpurpose>The inner page margin</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The inner page margin is the distance from bound edge of the
page to the first column of text. </para>

<para>The inner page margin is the distance from bound edge of the
page to the outer edge of the first column of text.</para>

<para>In left-to-right text direction,
this is the left margin of recto (front side) pages.
For single-sided output, it is the left margin
of all pages.</para>

<para>In right-to-left text direction,
this is the right margin of recto pages.
For single-sided output, this is the
right margin of all pages.</para>

<note>
<para>Current versions (at least as of version 4.13)
of the XEP XSL-FO processor do not
correctly handle these margin settings for documents
with right-to-left text direction.
The workaround in that situation is to reverse
the values for <parameter>page.margin.inner</parameter>
and <parameter>page.margin.outer</parameter>, until
this bug is fixed by RenderX.  It does not affect documents
with left-to-right text direction.</para>
</note>

</refsection>
</doc:refentry>
<xsl:param name="page.margin.inner">
  <xsl:choose>
    <xsl:when test="$double.sided != 0">1.25in</xsl:when>
    <xsl:otherwise>1in</xsl:otherwise>
  </xsl:choose>
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="page.margin.outer">
<refmeta>
<refentrytitle>page.margin.outer</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>page.margin.outer</refname>
<refpurpose>The outer page margin</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The outer page margin is the distance from non-bound edge of the
page to the outer edge of the last column of text.</para>

<para>In left-to-right text direction,
this is the right margin of recto (front side) pages.
For single-sided output, it is the right margin
of all pages.</para>

<para>In right-to-left text direction,
this is the left margin of recto pages.
For single-sided output, this is the
left margin of all pages.</para>

<note>
<para>Current versions (at least as of version 4.13)
of the XEP XSL-FO processor do not
correctly handle these margin settings for documents
with right-to-left text direction.
The workaround in that situation is to reverse
the values for <parameter>page.margin.inner</parameter>
and <parameter>page.margin.outer</parameter>, until
this bug is fixed by RenderX.  It does not affect documents
with left-to-right text direction.</para>
</note>

</refsection>
</doc:refentry>
<xsl:param name="page.margin.outer">
  <xsl:choose>
    <xsl:when test="$double.sided != 0">0.75in</xsl:when>
    <xsl:otherwise>1in</xsl:otherwise>
  </xsl:choose>
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="page.margin.top">
<refmeta>
<refentrytitle>page.margin.top</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>page.margin.top</refname>
<refpurpose>The top margin of the page</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The top page margin is the distance from the physical top of the
page to the top of the region-before.</para>

</refsection>
</doc:refentry>
<xsl:param name="page.margin.top">0.5in</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="page.orientation">
<refmeta>
<refentrytitle>page.orientation</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="value">portrait</refmiscinfo>
<refmiscinfo class="other" otherclass="value">landscape</refmiscinfo>
</refmeta>
<refnamediv>
<refname>page.orientation</refname>
<refpurpose>Select the page orientation</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para> Select one from portrait or landscape.
In portrait orientation, the short edge is horizontal; in
landscape orientation, it is vertical.
</para>

</refsection>
</doc:refentry>
<xsl:param name="page.orientation">portrait</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="page.width">
<refmeta>
<refentrytitle>page.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>page.width</refname>
<refpurpose>The width of the physical page</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The page width is generally calculated from the
<parameter>paper.type</parameter> and 
<parameter>page.orientation</parameter> parameters.</para>

</refsection>
</doc:refentry>
<xsl:param name="page.width">
  <xsl:choose>
    <xsl:when test="$page.orientation = 'portrait'">
      <xsl:value-of select="$page.width.portrait"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$page.height.portrait"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="page.width.portrait">
<refmeta>
<refentrytitle>page.width.portrait</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>page.width.portrait</refname>
<refpurpose>Specify the physical size of the short edge of the page</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The portrait page width is the length of the short
edge of the physical page.
</para>

</refsection>
</doc:refentry>
<xsl:param name="page.width.portrait">
  <xsl:choose>
    <xsl:when test="$paper.type = 'USletter'">8.5in</xsl:when>
    <xsl:when test="$paper.type = '4A0'">1682mm</xsl:when>
    <xsl:when test="$paper.type = '2A0'">1189mm</xsl:when>
    <xsl:when test="$paper.type = 'A0'">841mm</xsl:when>
    <xsl:when test="$paper.type = 'A1'">594mm</xsl:when>
    <xsl:when test="$paper.type = 'A2'">420mm</xsl:when>
    <xsl:when test="$paper.type = 'A3'">297mm</xsl:when>
    <xsl:when test="$paper.type = 'A4'">210mm</xsl:when>
    <xsl:when test="$paper.type = 'A5'">148mm</xsl:when>
    <xsl:when test="$paper.type = 'A6'">105mm</xsl:when>
    <xsl:when test="$paper.type = 'A7'">74mm</xsl:when>
    <xsl:when test="$paper.type = 'A8'">52mm</xsl:when>
    <xsl:when test="$paper.type = 'A9'">37mm</xsl:when>
    <xsl:when test="$paper.type = 'A10'">26mm</xsl:when>
    <xsl:when test="$paper.type = 'B0'">1000mm</xsl:when>
    <xsl:when test="$paper.type = 'B1'">707mm</xsl:when>
    <xsl:when test="$paper.type = 'B2'">500mm</xsl:when>
    <xsl:when test="$paper.type = 'B3'">353mm</xsl:when>
    <xsl:when test="$paper.type = 'B4'">250mm</xsl:when>
    <xsl:when test="$paper.type = 'B5'">176mm</xsl:when>
    <xsl:when test="$paper.type = 'B6'">125mm</xsl:when>
    <xsl:when test="$paper.type = 'B7'">88mm</xsl:when>
    <xsl:when test="$paper.type = 'B8'">62mm</xsl:when>
    <xsl:when test="$paper.type = 'B9'">44mm</xsl:when>
    <xsl:when test="$paper.type = 'B10'">31mm</xsl:when>
    <xsl:when test="$paper.type = 'C0'">917mm</xsl:when>
    <xsl:when test="$paper.type = 'C1'">648mm</xsl:when>
    <xsl:when test="$paper.type = 'C2'">458mm</xsl:when>
    <xsl:when test="$paper.type = 'C3'">324mm</xsl:when>
    <xsl:when test="$paper.type = 'C4'">229mm</xsl:when>
    <xsl:when test="$paper.type = 'C5'">162mm</xsl:when>
    <xsl:when test="$paper.type = 'C6'">114mm</xsl:when>
    <xsl:when test="$paper.type = 'C7'">81mm</xsl:when>
    <xsl:when test="$paper.type = 'C8'">57mm</xsl:when>
    <xsl:when test="$paper.type = 'C9'">40mm</xsl:when>
    <xsl:when test="$paper.type = 'C10'">28mm</xsl:when>
    <xsl:otherwise>8.5in</xsl:otherwise>
  </xsl:choose>
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="paper.type">
<refmeta>
<refentrytitle>paper.type</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="list-type">open</refmiscinfo>
<refmiscinfo class="other" otherclass="list-type">open</refmiscinfo>
<refmiscinfo class="other" otherclass="value">USletter<alt>8.5x11in</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">USlandscape<alt>11x8.5in</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">4A0<alt>2378x1682mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">2A0<alt>1682x1189mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A0<alt>1189x841mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A1<alt>841x594mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A2<alt>594x420mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A3<alt>420x297mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A4<alt>297x210mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A5<alt>210x148mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A6<alt>148x105mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A7<alt>105x74mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A8<alt>74x52mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A9<alt>52x37mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A10<alt>37x26mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">B0<alt>1414x1000mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">B1<alt>1000x707mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">B2<alt>707x500mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">B3<alt>500x353mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">B4<alt>353x250mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">B5<alt>250x176mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">B6<alt>176x125mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">B7<alt>125x88mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">B8<alt>88x62mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">B9<alt>62x44mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">B10<alt>44x31mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">C0<alt>1297x917mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">C1<alt>917x648mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">C2<alt>648x458mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">C3<alt>458x324mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">C4<alt>324x229mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">C5<alt>229x162mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">C6<alt>162x114mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">C7<alt>114x81mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">C8<alt>81x57mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">C9<alt>57x40mm</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">C10<alt>40x28mm</alt></refmiscinfo>
</refmeta>
<refnamediv>
<refname>paper.type</refname>
<refpurpose>Select the paper type</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The paper type is a convenient way to specify the paper size.
The list of known paper sizes includes USletter and most of the A,
B, and C sizes. See <parameter>page.width.portrait</parameter>, for example.


</para>

</refsection>
</doc:refentry>
<xsl:param name="paper.type">USletter</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="part.autolabel">
<refmeta>
<refentrytitle>part.autolabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">0<alt>none</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">1<alt>1,2,3...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A<alt>A,B,C...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">a<alt>a,b,c...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">i<alt>i,ii,iii...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">I<alt>I,II,III...</alt></refmiscinfo>
</refmeta>
<refnamediv>
<refname>part.autolabel</refname>
<refpurpose>Specifies the labeling format for Part titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, then parts will be numbered using the parameter
value as the number format if the value matches one of the following:
</para>

<variablelist>
  <varlistentry>
    <term>1 or arabic</term>
    <listitem>
      <para>Arabic numeration (1, 2, 3 ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>A or upperalpha</term>
    <listitem>
      <para>Uppercase letter numeration (A, B, C ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>a or loweralpha</term>
    <listitem>
      <para>Lowercase letter numeration (a, b, c ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>I or upperroman</term>
    <listitem>
      <para>Uppercase roman numeration (I, II, III ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>i or lowerroman</term>
    <listitem>
      <para>Lowercase roman letter numeration (i, ii, iii ...).</para>
    </listitem>
  </varlistentry>
</variablelist>

<para>Any nonzero value other than the above will generate
the default number format (upperroman).
</para>


</refsection>
</doc:refentry>
<xsl:param name="part.autolabel">I</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="passivetex.extensions">
<refmeta>
<refentrytitle>passivetex.extensions</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>passivetex.extensions</refname>
<refpurpose>Enable PassiveTeX extensions?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero,
<link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.tei-c.org.uk/Software/passivetex/">PassiveTeX</link>
extensions will be used. At present, this consists of PDF bookmarks
and sorted index terms.
</para>

<para>This parameter can also affect which graphics file formats
are supported</para>

<note>
  <para>PassiveTeX is incomplete and development has ceased. In most cases, 
another XSL-FO engine is probably a better choice.</para>
</note>

</refsection>
</doc:refentry>
<xsl:param name="passivetex.extensions" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="pgwide.properties">
<refmeta>
<refentrytitle>pgwide.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>pgwide.properties</refname>
<refpurpose>Properties to make a figure or table page wide.
</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This attribute set is used to set the properties
that make a figure or table "page wide" in fo output.
It comes into effect when an attribute <literal>pgwide="1"</literal>
is used.
</para>

<para>
By default, it sets <parameter>start-indent</parameter>
to <literal>0pt</literal>.
In a stylesheet that sets the parameter
<parameter>body.start.indent</parameter>
to a non-zero value in order to indent body text,
this attribute set can be used to outdent pgwide
figures to the start margin.
</para>

<para>If a document uses a multi-column page layout,
then this attribute set could try setting <parameter>span</parameter>
to a value of <literal>all</literal>.  However, this may
not work with some processors because a span property must be on an
fo:block that is a direct child of fo:flow.  It may work in
some processors anyway.
</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="pgwide.properties">
  <xsl:attribute name="start-indent">0pt</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="preface.autolabel">
<refmeta>
<refentrytitle>preface.autolabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">0<alt>none</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">1<alt>1,2,3...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A<alt>A,B,C...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">a<alt>a,b,c...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">i<alt>i,ii,iii...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">I<alt>I,II,III...</alt></refmiscinfo>
</refmeta>
<refnamediv>
<refname>preface.autolabel</refname>
<refpurpose>Specifices the labeling format for Preface titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero then prefaces will be numbered using the parameter
value as the number format if the value matches one of the following:
</para>

<variablelist>
  <varlistentry>
    <term>1 or arabic</term>
    <listitem>
      <para>Arabic numeration (1, 2, 3 ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>A or upperalpha</term>
    <listitem>
      <para>Uppercase letter numeration (A, B, C ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>a or loweralpha</term>
    <listitem>
      <para>Lowercase letter numeration (a, b, c ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>I or upperroman</term>
    <listitem>
      <para>Uppercase roman numeration (I, II, III ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>i or lowerroman</term>
    <listitem>
      <para>Lowercase roman letter numeration (i, ii, iii ...).</para>
    </listitem>
  </varlistentry>
</variablelist>

<para>Any nonzero value other than the above will generate
the default number format (arabic).
</para>


</refsection>
</doc:refentry>
<xsl:param name="preface.autolabel" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="preferred.mediaobject.role">
<refmeta>
<refentrytitle>preferred.mediaobject.role</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>preferred.mediaobject.role</refname>
<refpurpose>Select which mediaobject to use based on
this value of an object's <tag class="attribute">role</tag> attribute.
</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>A mediaobject may contain several objects such as imageobjects.
If the parameter <parameter>use.role.for.mediaobject</parameter> is
non-zero, then the <literal>role</literal> attribute on
<tag>imageobject</tag>s and other objects within a
<tag>mediaobject</tag> container will be used to select which object
will be used.  If one of the objects has a role value that matches the
<parameter>preferred.mediaobject.role</parameter> parameter, then it
has first priority for selection.  If more than one has such a role
value, the first one is used.
</para>
<para>
See the <parameter>use.role.for.mediaobject</parameter> parameter
for the sequence of selection.</para>
</refsection>
</doc:refentry>
<xsl:param name="preferred.mediaobject.role"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="procedure.properties">
<refmeta>
<refentrytitle>procedure.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>procedure.properties</refname>
<refpurpose>Properties associated with a procedure</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The styling for procedures.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="procedure.properties" use-attribute-sets="formal.object.properties">
  <xsl:attribute name="keep-together.within-column">auto</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="process.empty.source.toc">
<refmeta>
<refentrytitle>process.empty.source.toc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>process.empty.source.toc</refname>
<refpurpose>Generate automated TOC if <tag>toc</tag> element occurs in a source document?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies that if an empty <tag>toc</tag> element is found in a
source document, an automated TOC is generated at this point in the
document.
<note>
  <para>Depending on what the value of the
  <parameter>generate.toc</parameter> parameter is, setting this
  parameter to <literal>1</literal> could result in generation of
  duplicate automated TOCs. So the
  <parameter>process.empty.source.toc</parameter> is primarily useful
  as an "override": by placing an empty <tag>toc</tag> in your
  document and setting this parameter to <literal>1</literal>, you can
  force a TOC to be generated even if <tag>generate.toc</tag>
  says not to.</para>
</note>
</para>

</refsection>
</doc:refentry>
<xsl:param name="process.empty.source.toc" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="process.source.toc">
<refmeta>
<refentrytitle>process.source.toc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>process.source.toc</refname>
<refpurpose>Process a non-empty <tag>toc</tag> element if it occurs in a source document?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies that the contents of a non-empty "hard-coded"
<tag>toc</tag> element in a source document are processed to
generate a TOC in output.
<note>
  <para>This parameter has no effect on automated generation of
  TOCs. An automated TOC may still be generated along with the
  "hard-coded" TOC. To suppress automated TOC generation, adjust the
  value of the <parameter>generate.toc</parameter> paramameter.</para>

  <para>The <tag>process.source.toc</tag> parameter also has
  no effect if the <tag>toc</tag> element is empty; handling
  for empty <tag>toc</tag> is controlled by the
  <parameter>process.empty.source.toc</parameter> parameter.</para>
</note>
</para>

</refsection>
</doc:refentry>
<xsl:param name="process.source.toc" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.arch">
<refmeta>
<refentrytitle>profile.arch</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>profile.arch</refname>
<refpurpose>Target profile for <tag class="attribute">arch</tag>
attribute</refpurpose>
</refnamediv>




<refsection><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.arch"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.audience">
<refmeta>
<refentrytitle>profile.audience</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>profile.audience</refname>
<refpurpose>Target profile for <tag class="attribute">audience</tag>
attribute</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.audience"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.attribute">
<refmeta>
<refentrytitle>profile.attribute</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>profile.attribute</refname>
<refpurpose>Name of user-specified profiling attribute</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This parameter is used in conjuction with
<parameter>profile.value</parameter>.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.attribute"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.condition">
<refmeta>
<refentrytitle>profile.condition</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>profile.condition</refname>
<refpurpose>Target profile for <tag class="attribute">condition</tag>
attribute</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.condition"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.conformance">
<refmeta>
<refentrytitle>profile.conformance</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>profile.conformance</refname>
<refpurpose>Target profile for <tag class="attribute">conformance</tag>
attribute</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.conformance"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.lang">
<refmeta>
<refentrytitle>profile.lang</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>profile.lang</refname>
<refpurpose>Target profile for <tag class="attribute">lang</tag>
attribute</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.lang"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.os">
<refmeta>
<refentrytitle>profile.os</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>profile.os</refname>
<refpurpose>Target profile for <tag class="attribute">os</tag>
attribute</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.os"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.revision">
<refmeta>
<refentrytitle>profile.revision</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>profile.revision</refname>
<refpurpose>Target profile for <tag class="attribute">revision</tag>
attribute</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.revision"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.revisionflag">
<refmeta>
<refentrytitle>profile.revisionflag</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>profile.revisionflag</refname>
<refpurpose>Target profile for <tag class="attribute">revisionflag</tag>
attribute</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.revisionflag"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.role">
<refmeta>
<refentrytitle>profile.role</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>profile.role</refname>
<refpurpose>Target profile for <tag class="attribute">role</tag>
attribute</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

<warning>
<para>Note that <tag class="attribute">role</tag> is often
used for other purposes than profiling. For example it is commonly
used to get emphasize in bold font:</para>

<programlisting>&lt;emphasis role="bold"&gt;very important&lt;/emphasis&gt;</programlisting>

<para>If you are using <tag class="attribute">role</tag> for
these purposes do not forget to add values like <literal>bold</literal> to
value of this parameter. If you forgot you will get document with
small pieces missing which are very hard to track.</para>

<para>For this reason it is not recommended to use <tag class="attribute">role</tag> attribute for profiling. You should
rather use profiling specific attributes like <tag class="attribute">userlevel</tag>, <tag class="attribute">os</tag>, <tag class="attribute">arch</tag>, <tag class="attribute">condition</tag>, etc.</para>
</warning>

</refsection>
</doc:refentry>
<xsl:param name="profile.role"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.security">
<refmeta>
<refentrytitle>profile.security</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>profile.security</refname>
<refpurpose>Target profile for <tag class="attribute">security</tag>
attribute</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.security"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.separator">
<refmeta>
<refentrytitle>profile.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>profile.separator</refname>
<refpurpose>Separator character for compound profile values</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Separator character used for compound profile values. See <parameter>profile.arch</parameter></para>

</refsection>
</doc:refentry>
<xsl:param name="profile.separator">;</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.status">
<refmeta>
<refentrytitle>profile.status</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>profile.status</refname>
<refpurpose>Target profile for <tag class="attribute">status</tag>
attribute</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.status"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.userlevel">
<refmeta>
<refentrytitle>profile.userlevel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>profile.userlevel</refname>
<refpurpose>Target profile for <tag class="attribute">userlevel</tag>
attribute</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.userlevel"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.value">
<refmeta>
<refentrytitle>profile.value</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>profile.value</refname>
<refpurpose>Target profile for user-specified attribute</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>When you are using this parameter you must also specify name of
profiling attribute with parameter
<parameter>profile.attribute</parameter>.</para>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.value"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.vendor">
<refmeta>
<refentrytitle>profile.vendor</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>profile.vendor</refname>
<refpurpose>Target profile for <tag class="attribute">vendor</tag>
attribute</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.vendor"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.wordsize">
<refmeta>
<refentrytitle>profile.wordsize</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>profile.wordsize</refname>
<refpurpose>Target profile for <tag class="attribute">wordsize</tag>
attribute</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.wordsize"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="punct.honorific">
<refmeta>
<refentrytitle>punct.honorific</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>punct.honorific</refname>
<refpurpose>Punctuation after an honorific in a personal name.</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This parameter specifies the punctuation that should be added after an
honorific in a personal name.</para>

</refsection>
</doc:refentry>
<xsl:param name="punct.honorific">.</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="qanda.defaultlabel">
<refmeta>
<refentrytitle>qanda.defaultlabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">number</refmiscinfo>
<refmiscinfo class="other" otherclass="value">qanda</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">none</refmiscinfo>
</refmeta>
<refnamediv>
<refname>qanda.defaultlabel</refname>
<refpurpose>Sets the default for defaultlabel on QandASet.</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If no <literal>defaultlabel</literal> attribute is specified on
a <tag>qandaset</tag>, this value is used. It is generally one of the legal
values for the defaultlabel attribute (<literal>none</literal>, 
<literal>number</literal> or
<literal>qanda</literal>), or one of the additional stylesheet-specific values
(<literal>qnumber</literal> or <literal>qnumberanda</literal>).
The default value is 'number'.
</para>
<para>The values are rendered as follows:</para>
<variablelist>
<varlistentry><term><literal>qanda</literal></term>
<listitem>
<para><tag>question</tag>s are labeled "Q:" and
<tag>answer</tag>s are labeled "A:". </para>
</listitem>
</varlistentry>

<varlistentry><term><literal>number</literal></term>
<listitem>
<para>The questions are enumerated and the answers
are not labeled. </para>
</listitem>
</varlistentry>

<varlistentry><term><literal>qnumber</literal></term>
<listitem>
<para>The questions are labeled "Q:" followed by a number, and answers are not 
labeled. 
When sections are numbered, adding a label
to the number distinguishes the question numbers
from the section numbers.
This value is not allowed in the
<tag class="attribute">defaultlabel</tag> attribute
of a <tag>qandaset</tag> element.</para>
</listitem>
</varlistentry>

<varlistentry><term><literal>qnumberanda</literal></term>
<listitem>
<para>The questions are labeled "Q:" followed by a number, and
the answers are labeled "A:". 
When sections are numbered, adding a label
to the number distinguishes the question numbers
from the section numbers.
This value is not allowed in the
<tag class="attribute">defaultlabel</tag> attribute
of a <tag>qandaset</tag> element.</para>
</listitem>
</varlistentry>

<varlistentry><term><literal>none</literal></term>
<listitem>
<para>No distinguishing label precedes Questions or Answers. 
</para>
</listitem>
</varlistentry>
</variablelist>

</refsection>
</doc:refentry>
<xsl:param name="qanda.defaultlabel">number</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="qanda.in.toc">
<refmeta>
<refentrytitle>qanda.in.toc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>qanda.in.toc</refname>
<refpurpose>Should qandaentry questions appear in 
the document table of contents?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If true (non-zero), then the generated table of contents
for a document will include <tag>qandaset</tag> titles, 
<tag>qandadiv</tag> titles,
and <tag>question</tag> elements.  The default value (zero) excludes
them from the TOC.
</para>
<para>This parameter does not affect any tables of contents
that may be generated inside a qandaset or qandadiv.
</para>

</refsection>
</doc:refentry>
<xsl:param name="qanda.in.toc" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="qanda.nested.in.toc">
<refmeta>
<refentrytitle>qanda.nested.in.toc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>qanda.nested.in.toc</refname>
<refpurpose>Should nested answer/qandaentry instances appear in TOC?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, instances of <tag>qandaentry</tag>
that are children of <tag>answer</tag> elements are shown in
the TOC.</para>

</refsection>
</doc:refentry>
<xsl:param name="qanda.nested.in.toc" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="qanda.inherit.numeration">
<refmeta>
<refentrytitle>qanda.inherit.numeration</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>qanda.inherit.numeration</refname>
<refpurpose>Does enumeration of QandASet components inherit the numeration of parent elements?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, numbered <tag>qandadiv</tag> elements and
<tag>question</tag> and <tag>answer</tag> inherit the enumeration of
the ancestors of the <tag>qandaset</tag>.
</para>

</refsection>
</doc:refentry>
<xsl:param name="qanda.inherit.numeration" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="qandadiv.autolabel">
<refmeta>
<refentrytitle>qandadiv.autolabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>qandadiv.autolabel</refname>
<refpurpose>Are divisions in QAndASets enumerated?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, unlabeled qandadivs will be enumerated.
</para>

</refsection>
</doc:refentry>
<xsl:param name="qandadiv.autolabel" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="qanda.title.level1.properties">
<refmeta>
<refentrytitle>qanda.title.level1.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>qanda.title.level1.properties</refname>
<refpurpose>Properties for level-1 qanda set titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties of level-1 qanda set titles.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="qanda.title.level1.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 2.0736"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="qanda.title.level2.properties">
<refmeta>
<refentrytitle>qanda.title.level2.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>qanda.title.level2.properties</refname>
<refpurpose>Properties for level-2 qanda set titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties of level-2 qanda set titles.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="qanda.title.level2.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.728"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="qanda.title.level3.properties">
<refmeta>
<refentrytitle>qanda.title.level3.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>qanda.title.level3.properties</refname>
<refpurpose>Properties for level-3 qanda set titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties of level-3 qanda set titles.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="qanda.title.level3.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.44"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="qanda.title.level4.properties">
<refmeta>
<refentrytitle>qanda.title.level4.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>qanda.title.level4.properties</refname>
<refpurpose>Properties for level-4 qanda set titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties of level-4 qanda set titles.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="qanda.title.level4.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.2"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="qanda.title.level5.properties">
<refmeta>
<refentrytitle>qanda.title.level5.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>qanda.title.level5.properties</refname>
<refpurpose>Properties for level-5 qanda set titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties of level-5 qanda set titles.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="qanda.title.level5.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="qanda.title.level6.properties">
<refmeta>
<refentrytitle>qanda.title.level6.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>qanda.title.level6.properties</refname>
<refpurpose>Properties for level-6 qanda set titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties of level-6 qanda set titles.
This property set is actually
used for all titles below level 5.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="qanda.title.level6.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="qanda.title.properties">
<refmeta>
<refentrytitle>qanda.title.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>qanda.title.properties</refname>
<refpurpose>Properties for qanda set titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties common to all qanda set titles.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="qanda.title.properties">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$title.font.family"/>
  </xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <!-- font size is calculated dynamically by qanda.heading template -->
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">1.0em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="refentry.generate.name">
<refmeta>
<refentrytitle>refentry.generate.name</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>refentry.generate.name</refname>
<refpurpose>Output NAME header before <tag>refname</tag>s?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, a "NAME" section title is output before the list
of <tag>refname</tag>s. This parameter and
<parameter>refentry.generate.title</parameter> are mutually
exclusive. This means that if you change this parameter to zero, you
should set <parameter>refentry.generate.title</parameter> to non-zero unless
you want get quite strange output.
</para>

</refsection>
</doc:refentry>
<xsl:param name="refentry.generate.name" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="refentry.generate.title">
<refmeta>
<refentrytitle>refentry.generate.title</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>refentry.generate.title</refname>
<refpurpose>Output title before <tag>refname</tag>s?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, the reference page title or first name is
output before the list of <tag>refname</tag>s. This parameter and
<parameter>refentry.generate.name</parameter> are mutually exclusive.
This means that if you change this parameter to non-zero, you
should set <parameter>refentry.generate.name</parameter> to zero unless
you want get quite strange output.</para>


</refsection>
</doc:refentry>
<xsl:param name="refentry.generate.title" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="refentry.pagebreak">
<refmeta>
<refentrytitle>refentry.pagebreak</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>refentry.pagebreak</refname>
<refpurpose>Start each refentry on a new page</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero (the default), each <tag>refentry</tag>
element will start on a new page.  If zero, a page
break will not be generated between <tag>refentry</tag> elements.
The exception is when the <tag>refentry</tag> elements are children of
a <tag>part</tag> element, in which case the page breaks are always
retained.  That is because a <tag>part</tag> element does not generate
a page-sequence for its children, so each <tag>refentry</tag> must
start its own page-sequence.
</para>

</refsection>
</doc:refentry>
<xsl:param name="refentry.pagebreak" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="refentry.title.properties">
<refmeta>
<refentrytitle>refentry.title.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>refentry.title.properties</refname>
<refpurpose>Title properties for a refentry title</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Formatting properties applied to the title generated for the
<tag>refnamediv</tag> part of output for
<tag>refentry</tag> when the value of the
<parameter>refentry.generate.title</parameter> parameter is
non-zero. The font size is supplied by the appropriate <parameter>section.level<replaceable>X</replaceable>.title.properties</parameter>
attribute-set, computed from the location of the
<tag>refentry</tag> in the section hierarchy.</para>

<note>
  <para>This parameter has no effect on the the title generated for
  the <tag>refnamediv</tag> part of output for
  <tag>refentry</tag> when the value of the
  <parameter>refentry.generate.name</parameter> parameter is
  non-zero. By default, that title is formatted with the same
  properties as the titles for all other first-level children of
  <tag>refentry</tag>.</para>
</note>

</refsection>
</doc:refentry>
<xsl:attribute-set name="refentry.title.properties">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$title.font.family"/>
  </xsl:attribute>
  <xsl:attribute name="font-size">18pt</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="space-after">1em</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">1.0em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.5em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.6em</xsl:attribute>
  <xsl:attribute name="start-indent"><xsl:value-of select="$title.margin.left"/></xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="refentry.xref.manvolnum">
<refmeta>
<refentrytitle>refentry.xref.manvolnum</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>refentry.xref.manvolnum</refname>
<refpurpose>Output <tag>manvolnum</tag> as part of 
<tag>refentry</tag> cross-reference?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>if non-zero, the <tag>manvolnum</tag> is used when cross-referencing
<tag>refentry</tag>s, either with <tag>xref</tag>
or <tag>citerefentry</tag>.
</para>

</refsection>
</doc:refentry>
<xsl:param name="refentry.xref.manvolnum" select="1"/>
  
<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="reference.autolabel">
<refmeta>
<refentrytitle>reference.autolabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">0<alt>none</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">1<alt>1,2,3...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A<alt>A,B,C...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">a<alt>a,b,c...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">i<alt>i,ii,iii...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">I<alt>I,II,III...</alt></refmiscinfo>
</refmeta>
<refnamediv>
<refname>reference.autolabel</refname>
<refpurpose>Specifies the labeling format for Reference titles</refpurpose>
</refnamediv>

<refsection><info><title>Description</title></info>
<para>If non-zero, references will be numbered using the parameter
  value as the number format if the value matches one of the
  following:
</para>
<variablelist>
  <varlistentry>
    <term>1 or arabic</term>
    <listitem>
      <para>Arabic numeration (1, 2, 3 ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>A or upperalpha</term>
    <listitem>
      <para>Uppercase letter numeration (A, B, C ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>a or loweralpha</term>
    <listitem>
      <para>Lowercase letter numeration (a, b, c ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>I or upperroman</term>
    <listitem>
      <para>Uppercase roman numeration (I, II, III ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>i or lowerroman</term>
    <listitem>
      <para>Lowercase roman letter numeration (i, ii, iii ...).</para>
    </listitem>
  </varlistentry>
</variablelist>
<para>Any non-zero value other than the above will generate
the default number format (upperroman).
</para>
</refsection>
</doc:refentry>
<xsl:param name="reference.autolabel">I</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="refclass.suppress">
<refmeta>
<refentrytitle>refclass.suppress</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>refclass.suppress</refname>
<refpurpose>Suppress display of refclass contents?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If the value of <parameter>refclass.suppress</parameter> is
non-zero, then display of <tag>refclass</tag> contents is
suppressed in output.</para>

</refsection>
</doc:refentry>
<xsl:param name="refclass.suppress" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="region.after.extent">
<refmeta>
<refentrytitle>region.after.extent</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>region.after.extent</refname>
<refpurpose>Specifies the height of the footer.</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The region after extent is the height of the area where footers
are printed.
</para>

</refsection>
</doc:refentry>
<xsl:param name="region.after.extent">0.4in</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="region.before.extent">
<refmeta>
<refentrytitle>region.before.extent</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>region.before.extent</refname>
<refpurpose>Specifies the height of the header</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The region before extent is the height of the area where headers
are printed.
</para>

</refsection>
</doc:refentry>
<xsl:param name="region.before.extent">0.4in</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="revhistory.table.properties">
<refmeta>
<refentrytitle>revhistory.table.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>revhistory.table.properties</refname>
<refpurpose>The properties of table used for formatting revhistory</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This property set defines appearance of revhistory table.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="revhistory.table.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="revhistory.table.cell.properties">
<refmeta>
<refentrytitle>revhistory.table.cell.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>revhistory.table.cell.properties</refname>
<refpurpose>The properties of table cells used for formatting revhistory</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This property set defines appearance of individual cells in revhistory table.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="revhistory.table.cell.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="revhistory.title.properties">
<refmeta>
<refentrytitle>revhistory.title.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>revhistory.title.properties</refname>
<refpurpose>The properties of revhistory title</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This property set defines appearance of revhistory title.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="revhistory.title.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="root.properties">
<refmeta>
<refentrytitle>root.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>root.properties</refname>
<refpurpose>The properties of the fo:root element</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This property set is used on the <tag>fo:root</tag> element of
an FO file. It defines a set of default, global parameters.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="root.properties">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$body.fontset"/>
  </xsl:attribute>
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.size"/>
  </xsl:attribute>
  <xsl:attribute name="text-align">
    <xsl:value-of select="$alignment"/>
  </xsl:attribute>
  <xsl:attribute name="line-height">
    <xsl:value-of select="$line-height"/>
  </xsl:attribute>
  <xsl:attribute name="font-selection-strategy">character-by-character</xsl:attribute>
  <xsl:attribute name="line-height-shift-adjustment">disregard-shifts</xsl:attribute>
  <xsl:attribute name="writing-mode">
    <xsl:value-of select="$direction.mode"/>
  </xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="rootid">
<refmeta>
<refentrytitle>rootid</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>rootid</refname>
<refpurpose>Specify the root element to format</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If <parameter>rootid</parameter> is not empty, it must be the
value of an ID that occurs in the document being formatted. The entire
document will be loaded and parsed, but formatting will begin at the
element identified, rather than at the root. For example, this allows
you to process only <tag>chapter</tag> 4 of a <tag>book</tag>.</para>
<para>Because the entire document is available to the processor, automatic
numbering, cross references, and other dependencies are correctly
resolved.</para>

</refsection>
</doc:refentry>
<xsl:param name="rootid"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="runinhead.default.title.end.punct">
<refmeta>
<refentrytitle>runinhead.default.title.end.punct</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>runinhead.default.title.end.punct</refname>
<refpurpose>Default punctuation character on a run-in-head</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, For a <tag>formalpara</tag>, use the specified
string as the separator between the title and following text. The period is the default value.</para>

</refsection>
</doc:refentry>
<xsl:param name="runinhead.default.title.end.punct">.</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="runinhead.title.end.punct">
<refmeta>
<refentrytitle>runinhead.title.end.punct</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>runinhead.title.end.punct</refname>
<refpurpose>Characters that count as punctuation on a run-in-head</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specify which characters are to be counted as punctuation. These
characters are checked for a match with the last character of the
title. If no match is found, the
<parameter>runinhead.default.title.end.punct</parameter> contents are
inserted. This is to avoid duplicated punctuation in the output.
</para>

</refsection>
</doc:refentry>
<xsl:param name="runinhead.title.end.punct">.!?:</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="sans.font.family">
<refmeta>
<refentrytitle>sans.font.family</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>sans.font.family</refname>
<refpurpose>The default sans-serif font family</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The default sans-serif font family. At the present, this isn't
actually used by the stylesheets.
</para>

</refsection>
</doc:refentry>
<xsl:param name="sans.font.family">sans-serif</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.autolabel">
<refmeta>
<refentrytitle>section.autolabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.autolabel</refname>
<refpurpose>Are sections enumerated?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If true (non-zero), unlabeled sections will be enumerated.
</para>

</refsection>
</doc:refentry>
<xsl:param name="section.autolabel" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.autolabel.max.depth">
<refmeta>
<refentrytitle>section.autolabel.max.depth</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.autolabel.max.depth</refname>
<refpurpose>The deepest level of sections that are numbered.</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>When section numbering is turned on by the
<parameter>section.autolabel</parameter> parameter, then this
parameter controls the depth of <tag>section</tag> nesting that is
numbered.  Sections nested to a level deeper than this value will not
be numbered.
</para>

</refsection>
</doc:refentry>
<xsl:param name="section.autolabel.max.depth">8</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.container.element">
<refmeta>
<refentrytitle>section.container.element</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="value">block</refmiscinfo>
<refmiscinfo class="other" otherclass="value">wrapper</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.container.element</refname>
<refpurpose>Select XSL-FO element name to contain sections</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Selects the element name for outer container of
each section. The choices are <literal>block</literal> (default)
or <literal>wrapper</literal>.
The <literal>fo:</literal> namespace prefix is added
by the stylesheet to form the full element name.
</para>

<para>This element receives the section <literal>id</literal>
attribute and the appropriate section level attribute-set.
</para>

<para>Changing this parameter to <literal>wrapper</literal>
is only necessary when producing multi-column output
that contains page-wide spans.  Using <literal>fo:wrapper</literal>
avoids the nesting of <literal>fo:block</literal>
elements that prevents spans from working (the standard says
a span must be on a block that is a direct child of 
<literal>fo:flow</literal>).
</para>

<para>If set to <literal>wrapper</literal>, the
section attribute-sets only support properties
that are inheritable.  That's because there is no
block to apply them to.  Properties such as
font-family are inheritable, but properties such as
border are not.
</para>

<para>Only some XSL-FO processors need to use this parameter.
The Antenna House processor, for example, will handle 
spans in nested blocks without changing the element name.
The RenderX XEP product and FOP follow the XSL-FO standard 
and need to use <literal>wrapper</literal>.
</para>

</refsection>
</doc:refentry>
<xsl:param name="section.container.element">block</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.label.includes.component.label">
<refmeta>
<refentrytitle>section.label.includes.component.label</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.label.includes.component.label</refname>
<refpurpose>Do section labels include the component label?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, section labels are prefixed with the label of the
component that contains them.
</para>

</refsection>
</doc:refentry>
<xsl:param name="section.label.includes.component.label" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.title.level1.properties">
<refmeta>
<refentrytitle>section.title.level1.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.title.level1.properties</refname>
<refpurpose>Properties for level-1 section titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties of level-1 section titles.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="section.title.level1.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 2.0736"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.title.level2.properties">
<refmeta>
<refentrytitle>section.title.level2.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.title.level2.properties</refname>
<refpurpose>Properties for level-2 section titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties of level-2 section titles.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="section.title.level2.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.728"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.title.level3.properties">
<refmeta>
<refentrytitle>section.title.level3.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.title.level3.properties</refname>
<refpurpose>Properties for level-3 section titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties of level-3 section titles.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="section.title.level3.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.44"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.title.level4.properties">
<refmeta>
<refentrytitle>section.title.level4.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.title.level4.properties</refname>
<refpurpose>Properties for level-4 section titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties of level-4 section titles.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="section.title.level4.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.2"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.title.level5.properties">
<refmeta>
<refentrytitle>section.title.level5.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.title.level5.properties</refname>
<refpurpose>Properties for level-5 section titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties of level-5 section titles.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="section.title.level5.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.title.level6.properties">
<refmeta>
<refentrytitle>section.title.level6.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.title.level6.properties</refname>
<refpurpose>Properties for level-6 section titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties of level-6 section titles. This property set is actually
used for all titles below level 5.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="section.title.level6.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.title.properties">
<refmeta>
<refentrytitle>section.title.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.title.properties</refname>
<refpurpose>Properties for section titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties common to all section titles.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="section.title.properties">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$title.font.family"/>
  </xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <!-- font size is calculated dynamically by section.heading template -->
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">1.0em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
  <xsl:attribute name="text-align">start</xsl:attribute>
  <xsl:attribute name="start-indent"><xsl:value-of select="$title.margin.left"/></xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.level1.properties">
<refmeta>
<refentrytitle>section.level1.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.level1.properties</refname>
<refpurpose>Properties for level-1 sections</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties that apply to the containing
block of a level-1 section, and therefore apply to
the whole section.  This includes <tag>sect1</tag>
elements and <tag>section</tag> elements at level 1.
</para>

<para>For example, you could start each level-1 section on
a new page by using:</para>
<programlisting>&lt;xsl:attribute-set name="section.level1.properties"&gt;
  &lt;xsl:attribute name="break-before"&gt;page&lt;/xsl:attribute&gt;
&lt;/xsl:attribute-set&gt;
</programlisting>

<para>This attribute set inherits attributes from the
general <tag>section.properties</tag> attribute set.
</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="section.level1.properties" use-attribute-sets="section.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.level2.properties">
<refmeta>
<refentrytitle>section.level2.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.level2.properties</refname>
<refpurpose>Properties for level-2 sections</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties that apply to the containing
block of a level-2 section, and therefore apply to
the whole section.  This includes <tag>sect2</tag>
elements and <tag>section</tag> elements at level 2.
</para>

<para>For example, you could start each level-2 section on
a new page by using:</para>
<programlisting>&lt;xsl:attribute-set name="section.level2.properties"&gt;
  &lt;xsl:attribute name="break-before"&gt;page&lt;/xsl:attribute&gt;
&lt;/xsl:attribute-set&gt;
</programlisting>

<para>This attribute set inherits attributes from the
general <tag>section.properties</tag> attribute set.
</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="section.level2.properties" use-attribute-sets="section.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.level3.properties">
<refmeta>
<refentrytitle>section.level3.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.level3.properties</refname>
<refpurpose>Properties for level-3 sections</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties that apply to the containing
block of a level-3 section, and therefore apply to
the whole section.  This includes <tag>sect3</tag>
elements and <tag>section</tag> elements at level 3.
</para>

<para>For example, you could start each level-3 section on
a new page by using:</para>
<programlisting>&lt;xsl:attribute-set name="section.level3.properties"&gt;
  &lt;xsl:attribute name="break-before"&gt;page&lt;/xsl:attribute&gt;
&lt;/xsl:attribute-set&gt;
</programlisting>

<para>This attribute set inherits attributes from the
general <tag>section.properties</tag> attribute set.
</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="section.level3.properties" use-attribute-sets="section.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.level4.properties">
<refmeta>
<refentrytitle>section.level4.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.level4.properties</refname>
<refpurpose>Properties for level-4 sections</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties that apply to the containing
block of a level-4 section, and therefore apply to
the whole section.  This includes <tag>sect4</tag>
elements and <tag>section</tag> elements at level 4.
</para>

<para>For example, you could start each level-4 section on
a new page by using:</para>
<programlisting>&lt;xsl:attribute-set name="section.level4.properties"&gt;
  &lt;xsl:attribute name="break-before"&gt;page&lt;/xsl:attribute&gt;
&lt;/xsl:attribute-set&gt;
</programlisting>

<para>This attribute set inherits attributes from the
general <tag>section.properties</tag> attribute set.
</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="section.level4.properties" use-attribute-sets="section.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.level5.properties">
<refmeta>
<refentrytitle>section.level5.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.level5.properties</refname>
<refpurpose>Properties for level-5 sections</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties that apply to the containing
block of a level-5 section, and therefore apply to
the whole section.  This includes <tag>sect5</tag>
elements and <tag>section</tag> elements at level 5.
</para>

<para>For example, you could start each level-5 section on
a new page by using:</para>
<programlisting>&lt;xsl:attribute-set name="section.level5.properties"&gt;
  &lt;xsl:attribute name="break-before"&gt;page&lt;/xsl:attribute&gt;
&lt;/xsl:attribute-set&gt;
</programlisting>

<para>This attribute set inherits attributes from the
general <tag>section.properties</tag> attribute set.
</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="section.level5.properties" use-attribute-sets="section.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.level6.properties">
<refmeta>
<refentrytitle>section.level6.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.level6.properties</refname>
<refpurpose>Properties for level-6 sections</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties that apply to the containing
block of a level 6 or lower section, and therefore apply to
the whole section.  This includes 
<tag>section</tag> elements at level 6 and lower.
</para>

<para>For example, you could start each level-6 section on
a new page by using:</para>
<programlisting>&lt;xsl:attribute-set name="section.level6.properties"&gt;
  &lt;xsl:attribute name="break-before"&gt;page&lt;/xsl:attribute&gt;
&lt;/xsl:attribute-set&gt;
</programlisting>

<para>This attribute set inherits attributes from the
general <tag>section.properties</tag> attribute set.
</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="section.level6.properties" use-attribute-sets="section.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.properties">
<refmeta>
<refentrytitle>section.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>section.properties</refname>
<refpurpose>Properties for all section levels</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The properties that apply to the containing
block of all section levels, and therefore apply to
the whole section.  
This attribute set is inherited by the
more specific attribute sets such as
<tag>section.level1.properties</tag>.
The default is empty.
</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="section.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="segmentedlist.as.table">
<refmeta>
<refentrytitle>segmentedlist.as.table</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>segmentedlist.as.table</refname>
<refpurpose>Format segmented lists as tables?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, <tag>segmentedlist</tag>s will be formatted as
tables.</para>

</refsection>
</doc:refentry>
<xsl:param name="segmentedlist.as.table" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="shade.verbatim">
<refmeta>
<refentrytitle>shade.verbatim</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>shade.verbatim</refname>
<refpurpose>Should verbatim environments be shaded?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>In the FO stylesheet, if this parameter is non-zero then the
<property>shade.verbatim.style</property> properties will be applied
to verbatim environments.</para>

<para>In the HTML stylesheet, this parameter is now deprecated. Use
CSS instead.</para>

</refsection>
</doc:refentry>
<xsl:param name="shade.verbatim" select="0"/>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="shade.verbatim.style">
<refmeta>
<refentrytitle>shade.verbatim.style</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>shade.verbatim.style</refname>
<refpurpose>Properties that specify the style of shaded verbatim listings</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Properties that specify the style of shaded verbatim listings. The
parameters specified (the border and background color) are added to
the styling of the xsl-fo output. A border might be specified as "thin
black solid" for example. See <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.w3.org/TR/2004/WD-xsl11-20041216/#border">xsl-fo</link></para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="shade.verbatim.style">
  <xsl:attribute name="background-color">#E0E0E0</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="show.comments">
<refmeta>
<refentrytitle>show.comments</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>show.comments</refname>
<refpurpose>Display <tag>remark</tag> elements?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, comments will be displayed, otherwise they
are suppressed.  Comments here refers to the <tag>remark</tag> element
(which was called <literal>comment</literal> prior to DocBook
4.0), not XML comments (&lt;-- like this --&gt;) which are
unavailable.
</para>

</refsection>
</doc:refentry>
<xsl:param name="show.comments" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="sidebar.properties">
<refmeta>
<refentrytitle>sidebar.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>sidebar.properties</refname>
<refpurpose>Attribute set for sidebar properties</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The styling for sidebars.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="sidebar.properties" use-attribute-sets="formal.object.properties">
  <xsl:attribute name="border-style">solid</xsl:attribute>
  <xsl:attribute name="border-width">1pt</xsl:attribute>
  <xsl:attribute name="border-color">black</xsl:attribute>
  <xsl:attribute name="background-color">#DDDDDD</xsl:attribute>
  <xsl:attribute name="padding-start">12pt</xsl:attribute>
  <xsl:attribute name="padding-end">12pt</xsl:attribute>
  <xsl:attribute name="padding-top">6pt</xsl:attribute>
  <xsl:attribute name="padding-bottom">6pt</xsl:attribute>
  <xsl:attribute name="margin-{$direction.align.start}">0pt</xsl:attribute>
  <xsl:attribute name="margin-{$direction.align.end}">0pt</xsl:attribute>
<!--
  <xsl:attribute name="margin-top">6pt</xsl:attribute>
  <xsl:attribute name="margin-bottom">6pt</xsl:attribute>
-->
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="sidebar.title.properties">
<refmeta>
<refentrytitle>sidebar.title.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>sidebar.title.properties</refname>
<refpurpose>Attribute set for sidebar titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The styling for sidebars titles.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="sidebar.title.properties">
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="text-align">start</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="sidebar.float.type">
<refmeta>
<refentrytitle>sidebar.float.type</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="value">none</refmiscinfo>
<refmiscinfo class="other" otherclass="value">before</refmiscinfo>
<refmiscinfo class="other" otherclass="value">left</refmiscinfo>
<refmiscinfo class="other" otherclass="value">start</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">right</refmiscinfo>
<refmiscinfo class="other" otherclass="value">end</refmiscinfo>     
<refmiscinfo class="other" otherclass="value">inside</refmiscinfo>
<refmiscinfo class="other" otherclass="value">outside</refmiscinfo> 
</refmeta>
<refnamediv>
<refname>sidebar.float.type</refname>
<refpurpose>Select type of float for sidebar elements</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Selects the type of float for sidebar elements.
</para>
<itemizedlist>
<listitem>
<para>If <parameter>sidebar.float.type</parameter> is
<quote><literal>none</literal></quote>, then 
no float is used.
</para>
</listitem>
<listitem>
<para>If <parameter>sidebar.float.type</parameter> is
<quote><literal>before</literal></quote>, then 
the float appears at the top of the page.  On some processors,
that may be the next page rather than the current page.
</para>
</listitem>

<listitem>
<para>If <parameter>sidebar.float.type</parameter> is
<quote><literal>left</literal></quote>,
then a left side float is used.
</para>
</listitem>

<listitem>
<para>If <parameter>sidebar.float.type</parameter> is
<quote><literal>start</literal></quote>,
then when the text direction is left-to-right a left side float is used.
When the text direction is right-to-left, a right side float is used.
</para>
</listitem>

<listitem>
<para>If <parameter>sidebar.float.type</parameter> is
<quote><literal>right</literal></quote>,
then a right side float is used.
</para>
</listitem>

<listitem>
<para>If <parameter>sidebar.float.type</parameter> is
<quote><literal>end</literal></quote>,
then when the text direction is left-to-right a right side float is used.
When the text direction is right-to-left, a left side float is used.
</para>
</listitem>

<listitem>
<para>If your XSL-FO processor supports floats positioned on the
<quote><literal>inside</literal></quote> or
<quote><literal>outside</literal></quote>
of double-sided pages, then you have those two 
options for side floats as well.
</para>
</listitem>
</itemizedlist>

</refsection>
</doc:refentry>
<xsl:param name="sidebar.float.type">none</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="sidebar.float.width">
<refmeta>
<refentrytitle>sidebar.float.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>sidebar.float.width</refname>
<refpurpose>Set the default width for sidebars</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Sets the default width for sidebars when used as a side float.
The width determines the degree to which the sidebar block intrudes into
the text area.
</para>
<para>If <parameter>sidebar.float.type</parameter> is
<quote><literal>before</literal></quote> or 
<quote><literal>none</literal></quote>, then 
this parameter is ignored.
</para>

</refsection>
</doc:refentry>
<xsl:param name="sidebar.float.width">1in</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="simplesect.in.toc">
<refmeta>
<refentrytitle>simplesect.in.toc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>simplesect.in.toc</refname>
<refpurpose>Should <tag>simplesect</tag> elements appear in the TOC?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, <tag>simplesect</tag>s will be included in the TOC.
</para>

</refsection>
</doc:refentry>
<xsl:param name="simplesect.in.toc" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="subscript.properties">
<refmeta>
<refentrytitle>subscript.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>subscript.properties</refname>
<refpurpose>Properties associated with subscripts</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies styling properties for subscripts.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="subscript.properties">
  <xsl:attribute name="font-size">75%</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="superscript.properties">
<refmeta>
<refentrytitle>superscript.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>superscript.properties</refname>
<refpurpose>Properties associated with superscripts</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies styling properties for superscripts.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="superscript.properties">
  <xsl:attribute name="font-size">75%</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="symbol.font.family">
<refmeta>
<refentrytitle>symbol.font.family</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="list-type">open</refmiscinfo>
<refmiscinfo class="other" otherclass="value">serif</refmiscinfo>
<refmiscinfo class="other" otherclass="value">sans-serif</refmiscinfo>
<refmiscinfo class="other" otherclass="value">monospace</refmiscinfo>
</refmeta>
<refnamediv>
<refname>symbol.font.family</refname>
<refpurpose>The font families to be searched for symbols outside
    of the body font</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>A typical body or title font does not contain all
the character glyphs that DocBook supports.  This parameter
specifies additional fonts that should be searched for
special characters not in the normal font.
These symbol font names are automatically appended
to the body or title font family name when fonts
are specified in a 
<tag class="attribute">font-family</tag>
property in the FO output.
</para>
<para>The symbol font names should be entered as a
comma-separated list.  The default value is
<literal>Symbol,ZapfDingbats</literal>.
</para>

</refsection>
</doc:refentry>
<xsl:param name="symbol.font.family">Symbol,ZapfDingbats</xsl:param>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.cell.border.color">
<refmeta>
<refentrytitle>table.cell.border.color</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">color</refmiscinfo>
</refmeta>
<refnamediv>
<refname>table.cell.border.color</refname>
<refpurpose>Specifies the border color of table cells</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Set the color of table cell borders. If non-zero, the value is used
for the border coloration. See <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.w3.org/TR/CSS21/syndata.html#value-def-color">CSS</link>. A
<literal>color</literal> is either a keyword or a numerical RGB specification.
Keywords are aqua, black, blue, fuchsia, gray, green, lime, maroon,
navy, olive, orange, purple, red, silver, teal, white, and
yellow.</para>

<note>
  <para>To control properties of cell borders in HTML output, you must also turn on the 
  <parameter>table.borders.with.css</parameter> parameter.</para>
</note>

</refsection>
</doc:refentry>
<xsl:param name="table.cell.border.color">black</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.cell.border.style">
<refmeta>
<refentrytitle>table.cell.border.style</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">none</refmiscinfo>
<refmiscinfo class="other" otherclass="value">solid</refmiscinfo>
<refmiscinfo class="other" otherclass="value">dotted</refmiscinfo>
<refmiscinfo class="other" otherclass="value">dashed</refmiscinfo>
<refmiscinfo class="other" otherclass="value">double</refmiscinfo>
<refmiscinfo class="other" otherclass="value">groove</refmiscinfo>                       
<refmiscinfo class="other" otherclass="value">ridge</refmiscinfo>
<refmiscinfo class="other" otherclass="value">inset</refmiscinfo>
<refmiscinfo class="other" otherclass="value">outset</refmiscinfo>          
<refmiscinfo class="other" otherclass="value">solid</refmiscinfo>
</refmeta>
<refnamediv>
<refname>table.cell.border.style</refname>
<refpurpose>Specifies the border style of table cells</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies the border style of table cells.</para>

<note>
  <para>To control properties of cell borders in HTML output, you must also turn on the 
  <parameter>table.borders.with.css</parameter> parameter.</para>
</note>

</refsection>
</doc:refentry>
<xsl:param name="table.cell.border.style">solid</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.cell.border.thickness">
<refmeta>
<refentrytitle>table.cell.border.thickness</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>table.cell.border.thickness</refname>
<refpurpose>Specifies the thickness of table cell borders</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, specifies the thickness of borders on table
cells. The units are points. See <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.w3.org/TR/CSS21/box.html#border-width-properties">
CSS</link></para>

<note>
  <para>To control properties of cell borders in HTML output, you must also turn on the 
  <parameter>table.borders.with.css</parameter> parameter.</para>
</note>

</refsection>
</doc:refentry>
<xsl:param name="table.cell.border.thickness">0.5pt</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.cell.padding">
<refmeta>
<refentrytitle>table.cell.padding</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>table.cell.padding</refname>
<refpurpose>Specifies the padding of table cells</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies the padding of table cells.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="table.cell.padding">
  <xsl:attribute name="padding-start">2pt</xsl:attribute>
  <xsl:attribute name="padding-end">2pt</xsl:attribute>
  <xsl:attribute name="padding-top">2pt</xsl:attribute>
  <xsl:attribute name="padding-bottom">2pt</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.footnote.number.format">
<refmeta>
<refentrytitle>table.footnote.number.format</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">1<alt>1,2,3...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A<alt>A,B,C...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">a<alt>a,b,c...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">i<alt>i,ii,iii...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">I<alt>I,II,III...</alt></refmiscinfo>
</refmeta>
<refnamediv>
<refname>table.footnote.number.format</refname>
<refpurpose>Identifies the format used for footnote numbers in tables</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The <parameter>table.footnote.number.format</parameter> specifies the format
to use for footnote numeration (1, i, I, a, or A) in tables.</para>

</refsection>
</doc:refentry>
<xsl:param name="table.footnote.number.format">a</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.footnote.number.symbols">
<refmeta>
<refentrytitle>table.footnote.number.symbols</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>table.footnote.number.symbols</refname>
<refpurpose>Special characters to use a footnote markers in tables</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If <parameter>table.footnote.number.symbols</parameter> is not the empty string,
table footnotes will use the characters it contains as footnote symbols. For example,
<quote>*&amp;#x2020;&amp;#x2021;&amp;#x25CA;&amp;#x2720;</quote> will identify
footnotes with <quote>*</quote>, <quote>†</quote>, <quote>‡</quote>,
<quote>◊</quote>, and <quote>✠</quote>. If there are more footnotes
than symbols, the stylesheets will fall back to numbered footnotes using
<parameter>table.footnote.number.format</parameter>.</para>

<para>The use of symbols for footnotes depends on the ability of your
processor (or browser) to render the symbols you select. Not all systems are
capable of displaying the full range of Unicode characters. If the quoted characters
in the preceding paragraph are not displayed properly, that's a good indicator
that you may have trouble using those symbols for footnotes.</para>

</refsection>
</doc:refentry>
<xsl:param name="table.footnote.number.symbols"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.footnote.properties">
<refmeta>
<refentrytitle>table.footnote.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>table.footnote.properties</refname>
<refpurpose>Properties applied to each table footnote body
</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This attribute set is applied to the footnote-block 
for each table footnote.
It can be used to set the
font-size, font-family, and other inheritable properties that will be
applied to all table footnotes.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="table.footnote.properties">
  <xsl:attribute name="font-family"><xsl:value-of select="$body.fontset"/></xsl:attribute>
  <xsl:attribute name="font-size"><xsl:value-of select="$footnote.font.size"/></xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-style">normal</xsl:attribute>
  <xsl:attribute name="space-before">2pt</xsl:attribute>
  <xsl:attribute name="text-align"><xsl:value-of select="$alignment"/></xsl:attribute>
</xsl:attribute-set>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.frame.border.color">
<refmeta>
<refentrytitle>table.frame.border.color</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">color</refmiscinfo>
</refmeta>
<refnamediv>
<refname>table.frame.border.color</refname>
<refpurpose>Specifies the border color of table frames</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies the border color of table frames.</para>

</refsection>
</doc:refentry>
<xsl:param name="table.frame.border.color">black</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.frame.border.style">
<refmeta>
<refentrytitle>table.frame.border.style</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">none</refmiscinfo>
<refmiscinfo class="other" otherclass="value">solid</refmiscinfo>
<refmiscinfo class="other" otherclass="value">dotted</refmiscinfo>
<refmiscinfo class="other" otherclass="value">dashed</refmiscinfo>
<refmiscinfo class="other" otherclass="value">double</refmiscinfo>
<refmiscinfo class="other" otherclass="value">groove</refmiscinfo>                       
<refmiscinfo class="other" otherclass="value">ridge</refmiscinfo>
<refmiscinfo class="other" otherclass="value">inset</refmiscinfo>
<refmiscinfo class="other" otherclass="value">outset</refmiscinfo>          
<refmiscinfo class="other" otherclass="value">solid</refmiscinfo>
</refmeta>
<refnamediv>
<refname>table.frame.border.style</refname>
<refpurpose>Specifies the border style of table frames</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies the border style of table frames.</para>

</refsection>
</doc:refentry>
<xsl:param name="table.frame.border.style">solid</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.frame.border.thickness">
<refmeta>
<refentrytitle>table.frame.border.thickness</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>table.frame.border.thickness</refname>
<refpurpose>Specifies the thickness of the frame border</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies the thickness of the border on the table's frame.</para>

</refsection>
</doc:refentry>
<xsl:param name="table.frame.border.thickness">0.5pt</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.properties">
<refmeta>
<refentrytitle>table.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>table.properties</refname>
<refpurpose>Properties associated with the block surrounding a table</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Block styling properties for tables. This parameter should really
have been called <literal>table.block.properties</literal> or something
like that, but we’re leaving it to avoid backwards-compatibility
problems.</para>

<para>See also <parameter>table.table.properties</parameter>.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="table.properties" use-attribute-sets="formal.object.properties">
  <xsl:attribute name="keep-together.within-column">auto</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="tablecolumns.extension">
<refmeta>
<refentrytitle>tablecolumns.extension</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>tablecolumns.extension</refname>
<refpurpose>Enable the table columns extension function</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The table columns extension function adjusts the widths of table
columns in the HTML result to more accurately reflect the specifications
in the CALS table.
</para>

</refsection>
</doc:refentry>
<xsl:param name="tablecolumns.extension" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.table.properties">
<refmeta>
<refentrytitle>table.table.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>table.table.properties</refname>
<refpurpose>Properties associated with a table</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The styling for tables. This parameter should really
have been called <literal>table.properties</literal>, but that parameter
name was inadvertently established for the block-level properties
of the table as a whole.
</para>

<para>See also <parameter>table.properties</parameter>.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="table.table.properties">
  <xsl:attribute name="border-before-width.conditionality">retain</xsl:attribute>
  <xsl:attribute name="border-collapse">collapse</xsl:attribute>
</xsl:attribute-set>
 
<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="target.database.document"> 
<refmeta> 
<refentrytitle>target.database.document</refentrytitle> 
<refmiscinfo class="other" otherclass="datatype">uri</refmiscinfo> 
</refmeta> 
<refnamediv> 
<refname>target.database.document</refname> 
<refpurpose>Name of master database file for resolving
olinks</refpurpose> 
</refnamediv> 
 
<refsection><info><title>Description</title></info>
 
<para>
To resolve olinks between documents, the stylesheets use a master
database document that identifies the target datafiles for all the
documents within the scope of the olinks. This parameter value is the
URI of the master document to be read during processing to resolve
olinks.  The default value is <filename>olinkdb.xml</filename>.</para>

<para>The data structure of the file is defined in the
<filename>targetdatabase.dtd</filename> DTD.  The database file
provides the high level elements to record the identifiers, locations,
and relationships of documents. The cross reference data for
individual documents is generally pulled into the database using
system entity references or XIncludes. See also
<parameter>targets.filename</parameter>.  </para> </refsection>
</doc:refentry>
<xsl:param name="target.database.document">olinkdb.xml</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="targets.filename"> 
<refmeta> 
<refentrytitle>targets.filename</refentrytitle> 
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo> 
</refmeta> 
<refnamediv> 
<refname>targets.filename</refname> 
<refpurpose>Name of cross reference targets data file</refpurpose> 
</refnamediv> 
 
<refsection><info><title>Description</title></info>
 
<para>
In order to resolve olinks efficiently, the stylesheets can
generate an external data file containing information about
all potential cross reference endpoints in a document.
This parameter lets you change the name of the generated
file from the default name <filename>target.db</filename>.
The name must agree with that used in the target database
used to resolve olinks during processing.
See also <parameter>target.database.document</parameter>.
</para> 
</refsection> 
</doc:refentry>
<xsl:param name="targets.filename">target.db</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="textdata.default.encoding">
<refmeta>
<refentrytitle>textdata.default.encoding</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>textdata.default.encoding</refname>
<refpurpose>Default encoding of external text files which are included
using textdata element</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies the encoding of any external text files included using
<tag>textdata</tag> element. This value is used only when you do
not specify encoding by the appropriate attribute 
directly on textdata. An empty string is interpreted as the system
default encoding.</para>

</refsection>
</doc:refentry>
<xsl:param name="textdata.default.encoding"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="tex.math.delims">
<refmeta>
<refentrytitle>tex.math.delims</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>tex.math.delims</refname>
<refpurpose>Should equations output for processing by TeX be
surrounded by math mode delimiters?</refpurpose>
</refnamediv> 



<refsection><info><title>Description</title></info>

<para>For compatibility with DSSSL based DBTeXMath from Allin Cottrell
you should set this parameter to 0.</para>

</refsection>
<refsection><info><title>Related Parameters</title></info>
  <para><parameter>tex.math.in.alt</parameter>,
    <parameter>passivetex.extensions</parameter></para>
</refsection>

<refsection><info><title>See Also</title></info>
  <para>You can also use the <tag class="xmlpi">dbtex delims</tag> processing
    instruction to control whether delimiters are output.</para>
</refsection>
<refsection><info><title>More information</title></info>
  <para>For how-to documentation on embedding TeX equations and
    generating output from them, see
    <link xmlns:xlink="http://www.w3.org/1999/xlink" role="tcg" xlink:href="TexMath.html">DBTeXMath</link>.</para>
</refsection>
</doc:refentry>
<xsl:param name="tex.math.delims" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="tex.math.in.alt">
<refmeta>
<refentrytitle>tex.math.in.alt</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">plain</refmiscinfo>
<refmiscinfo class="other" otherclass="value">latex</refmiscinfo>
</refmeta>
<refnamediv>
<refname>tex.math.in.alt</refname>
<refpurpose>TeX notation used for equations</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If you want type math directly in TeX notation in equations,
this parameter specifies notation used. Currently are supported two
values -- <literal>plain</literal> and <literal>latex</literal>. Empty
value means that you are not using TeX math at all.</para>

<para>Preferred way for including TeX alternative of math is inside of
<tag>textobject</tag> element. Eg.:</para>

<programlisting>&lt;inlineequation&gt;
&lt;inlinemediaobject&gt;
&lt;imageobject&gt;
&lt;imagedata fileref="eq1.gif"/&gt;
&lt;/imageobject&gt;
&lt;textobject&gt;&lt;phrase&gt;E=mc squared&lt;/phrase&gt;&lt;/textobject&gt;
&lt;textobject role="tex"&gt;&lt;phrase&gt;E=mc^2&lt;/phrase&gt;&lt;/textobject&gt;
&lt;/inlinemediaobject&gt;
&lt;/inlineequation&gt;</programlisting>

<para>If you are using <tag>graphic</tag> element, you can
store TeX inside <tag>alt</tag> element:</para>

<programlisting>&lt;inlineequation&gt;
&lt;alt role="tex"&gt;a^2+b^2=c^2&lt;/alt&gt;
&lt;graphic fileref="a2b2c2.gif"/&gt;  
&lt;/inlineequation&gt;</programlisting>

<para>If you want use this feature, you should process your FO with
PassiveTeX, which only supports TeX math notation. When calling
stylsheet, don't forget to specify also
passivetex.extensions=1.</para>

<para>If you want equations in HTML, just process generated file
<filename>tex-math-equations.tex</filename> by TeX or LaTeX. Then run
dvi2bitmap program on result DVI file. You will get images for
equations in your document.</para>

<warning>
  <para>This feature is useful for print/PDF output only if you
    use the obsolete and now unsupported PassiveTeX XSL-FO
    engine.</para>
</warning>

</refsection>

<refsection><info><title>Related Parameters</title></info>
  <para><parameter>tex.math.delims</parameter>,
    <parameter>passivetex.extensions</parameter>,
    <parameter>tex.math.file</parameter></para>
</refsection>
<refsection><info><title>More information</title></info>
  <para>For how-to documentation on embedding TeX equations and
    generating output from them, see
    <link xmlns:xlink="http://www.w3.org/1999/xlink" role="tcg" xlink:href="TexMath.html">DBTeXMath</link>.</para>
</refsection>
</doc:refentry>
<xsl:param name="tex.math.in.alt"/>
  
<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="textinsert.extension">
  <refmeta>
    <refentrytitle>textinsert.extension</refentrytitle>
    <refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
  </refmeta>
  <refnamediv>
    <refname>textinsert.extension</refname>
    <refpurpose>Enables the textinsert extension element</refpurpose>
  </refnamediv>
  
  <refsection><info><title>Description</title></info>
    <para>The textinsert extension element inserts the contents of
      a file into the result tree (as text).</para>
    <note>
      <para>To use the textinsert extension element, you must use
        either Saxon or Xalan as your XSLT processor (it doesn’t
        work with xsltproc), along with either the DocBook Saxon
        extensions or DocBook Xalan extensions (for more
        information about those extensions, see <link xmlns:xlink="http://www.w3.org/1999/xlink" role="tcg" xlink:href="InstallingAProcessor.html#SaxonExtensions">DocBook Saxon Extensions</link> and <link xmlns:xlink="http://www.w3.org/1999/xlink" role="tcg" xlink:href="InstallingAProcessor.html#XalanExtensions">DocBook Xalan Extensions</link>), and you must set both
        the <parameter>use.extensions</parameter> and
        <parameter>textinsert.extension</parameter> parameters to
        <literal>1</literal>.</para>
      <para>As an alternative to using the textinsert element,
        consider using an Xinclude element with the
        <literal>parse="text"</literal> attribute and value
        specified, as detailed in <link xmlns:xlink="http://www.w3.org/1999/xlink" role="tcg" xlink:href="ExternalCode.html#XIncludeCode">Using XInclude for text inclusions</link>.</para>
    </note>
  </refsection>
  <refsection><info><title>See Also</title></info>
    <para>You can also use the <tag class="xmlpi">dbhtml-include href</tag> processing
      instruction to insert external files — both files containing
      plain text and files with markup content (including HTML
      content).</para>
  </refsection>
  <refsection><info><title>More information</title></info>
    <para>For how-to documentation on inserting contents of
      external code files and other text files into output, see
      <link xmlns:xlink="http://www.w3.org/1999/xlink" role="tcg" xlink:href="ExternalCode.html">External code files</link>.</para>
    <para>For guidelines on inserting contents of
      HTML files into output, see <link xmlns:xlink="http://www.w3.org/1999/xlink" role="tcg" xlink:href="InsertExtHtml.html">Inserting external HTML code</link>.</para>
  </refsection>
</doc:refentry>
<xsl:param name="textinsert.extension" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="title.font.family">
<refmeta>
<refentrytitle>title.font.family</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="list-type">open</refmiscinfo>
<refmiscinfo class="other" otherclass="value">serif</refmiscinfo>
<refmiscinfo class="other" otherclass="value">sans-serif</refmiscinfo>
<refmiscinfo class="other" otherclass="value">monospace</refmiscinfo>
</refmeta>
<refnamediv>
<refname>title.font.family</refname>
<refpurpose>The default font family for titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>The title font family is used for titles (chapter, section, figure,
etc.)
</para>

</refsection>
</doc:refentry>
<xsl:param name="title.font.family">sans-serif</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="title.margin.left">
<refmeta>
<refentrytitle>title.margin.left</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv>
<refname>title.margin.left</refname>
<refpurpose>Adjust the left margin for titles</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This parameter provides
the means of adjusting the left margin for titles
when the XSL-FO processor being used is
an old version of FOP (0.25 and earlier).
It is only useful when the <parameter>fop.extensions</parameter>
is nonzero.</para>

<para>The left margin of the body region
is calculated to include this space,
and titles are outdented to the left outside
the body region by this amount,
effectively leaving titles at the intended left margin
and the body text indented.
Currently this method is only used for old FOP because
it cannot properly use the <parameter>body.start.indent</parameter>
parameter.
</para>
<para>
The default value when the <parameter>fop.extensions</parameter>
parameter is nonzero is -4pc, which means the
body text is indented 4 picas relative to
the titles.
The default value when the <parameter>fop.extensions</parameter>
parameter equals zero is 0pt, and
the body indent should instead be specified
using the <parameter>body.start.indent</parameter>
parameter.
</para>
<para>
If you set the value to zero, be sure to still include
a unit indicator such as <literal>0pt</literal>, or
the FO processor will report errors.
</para>

</refsection>
</doc:refentry>
<xsl:param name="title.margin.left">
  <xsl:choose>
    <xsl:when test="$fop.extensions != 0">-4pc</xsl:when>
    <xsl:when test="$passivetex.extensions != 0">0pt</xsl:when>
    <xsl:otherwise>0pt</xsl:otherwise>
  </xsl:choose>
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="toc.indent.width">
<refmeta>
<refentrytitle>toc.indent.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">float</refmiscinfo>
</refmeta>
<refnamediv>
<refname>toc.indent.width</refname>
<refpurpose>Amount of indentation for TOC entries</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies, in points, the distance by which each level of the
TOC is indented from its parent.</para>

<para>This value is expressed in points, without
a unit (in other words, it is a bare number). Using a bare number allows the stylesheet
to perform calculations that would otherwise have to be performed by the FO processor
because not all processors support expressions.</para>

</refsection>
</doc:refentry>
<xsl:param name="toc.indent.width">24</xsl:param>
<!-- inconsistant point specification? -->

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="toc.line.properties">
<refmeta>
<refentrytitle>toc.line.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>toc.line.properties</refname>
<refpurpose>Properties for lines in ToC and LoTs</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Properties which are applied to every line in ToC (or LoT). You can
modify them in order to change appearance of all, or some lines. For
example in order to make lines for chapters in bold specify the
following in your customization layer.</para>

<programlisting>&lt;xsl:attribute-set name="toc.line.properties"&gt;
  &lt;xsl:attribute name="font-weight"&gt;
    &lt;xsl:when test="self::chapter | self::preface | self::appendix"&gt;bold&lt;/xsl:when&gt;
    &lt;xsl:otherwise&gt;normal&lt;/xsl:otherwise&gt;
  &lt;/xsl:attribute&gt;
&lt;/xsl:attribute-set&gt;</programlisting>

</refsection>
</doc:refentry>
<xsl:attribute-set name="toc.line.properties">
  <xsl:attribute name="text-align-last">justify</xsl:attribute>
  <xsl:attribute name="text-align">start</xsl:attribute>
  <xsl:attribute name="end-indent"><xsl:value-of select="concat($toc.indent.width, 'pt')"/></xsl:attribute>
  <xsl:attribute name="last-line-end-indent"><xsl:value-of select="concat('-', $toc.indent.width, 'pt')"/></xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="toc.margin.properties">
<refmeta>
<refentrytitle>toc.margin.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>toc.margin.properties</refname>
<refpurpose>Margin properties used on Tables of Contents</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>
<para>This attribute set is used on Tables of Contents. These attributes are set
on the wrapper that surrounds the ToC block, not on each individual lines.</para>
</refsection>
</doc:refentry>
<xsl:attribute-set name="toc.margin.properties">
  <xsl:attribute name="space-before.minimum">0.5em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">2em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.5em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">2em</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="toc.max.depth">
<refmeta>
<refentrytitle>toc.max.depth</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv>
<refname>toc.max.depth</refname>
<refpurpose>How many levels should be created for each TOC?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies the maximal depth of TOC on all levels.</para>

</refsection>
</doc:refentry>
<xsl:param name="toc.max.depth">8</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="toc.section.depth">
<refmeta>
<refentrytitle>toc.section.depth</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv>
<refname>toc.section.depth</refname>
<refpurpose>How deep should recursive <tag>section</tag>s appear
in the TOC?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Specifies the depth to which recursive sections should appear in the
TOC.
</para>

</refsection>
</doc:refentry>
<xsl:param name="toc.section.depth">2</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="ulink.footnotes">
<refmeta>
<refentrytitle>ulink.footnotes</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>ulink.footnotes</refname>
<refpurpose>Generate footnotes for <tag>ulink</tag>s?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, and if <parameter>ulink.show</parameter> also is non-zero,
the URL of each <tag>ulink</tag> will appear as a footnote.</para>

<note><para>DocBook 5 does not have an <tag>ulink</tag> element. When processing 
DocBoook 5 documents, <parameter>ulink.footnotes</parameter> applies to all inline 
elements that are marked up with <tag class="attribute">xlink:href</tag> attributes 
that point to external resources.</para>
</note>

</refsection>
</doc:refentry>
<xsl:param name="ulink.footnotes" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="ulink.hyphenate">
<refmeta>
<refentrytitle>ulink.hyphenate</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>ulink.hyphenate</refname>
<refpurpose>Allow URLs to be automatically hyphenated</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If not empty, the specified character (or more generally, content) is
added to URLs after every character included in the string
in the <parameter>ulink.hyphenate.chars</parameter> parameter (default
is <quote>/</quote>). If the character in this parameter is a
Unicode soft hyphen (0x00AD) or Unicode zero-width space (0x200B), some FO
processors will be able to reasonably hyphenate long URLs.</para>

<para>As of 28 Jan 2002, discretionary hyphens are more widely and correctly
supported than zero-width spaces for this purpose.</para>

</refsection>
</doc:refentry>
<xsl:param name="ulink.hyphenate"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="ulink.hyphenate.chars">
<refmeta>
<refentrytitle>ulink.hyphenate.chars</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>ulink.hyphenate.chars</refname>
<refpurpose>List of characters to allow ulink URLs to be automatically hyphenated on</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If the <parameter>ulink.hyphenate</parameter> is not empty, then 
hyphenation of ulinks is turned on, and any
character contained in this parameter is treated as an allowable
hyphenation point.</para>

<para>The default value is <quote>/</quote>, but the parameter
could be customized
to contain other URL characters, as for example:</para>
<programlisting>
&lt;xsl:param name="ulink.hyphenate.chars"&gt;:/@&amp;?.#&lt;/xsl:param&gt;
</programlisting>

</refsection>
</doc:refentry>
<xsl:param name="ulink.hyphenate.chars">/</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="ulink.show">
<refmeta>
<refentrytitle>ulink.show</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>ulink.show</refname>
<refpurpose>Display URLs after <tag>ulink</tag>s?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, the URL of each <tag>ulink</tag> will
appear after the text of the link. If the text of the link and the URL
are identical, the URL is suppressed. </para>

<para>See also <parameter>ulink.footnotes</parameter>.</para>

<note><para>DocBook 5 does not have an <tag>ulink</tag> element. When processing 
DocBoook 5 documents, <parameter>ulink.show</parameter> applies to all inline 
elements that are marked up with <tag class="attribute">xlink:href</tag> attributes 
that point to external resources.</para>
</note>

</refsection>
</doc:refentry>
<xsl:param name="ulink.show" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="use.extensions">
<refmeta>
<refentrytitle>use.extensions</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>use.extensions</refname>
<refpurpose>Enable extensions</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, extensions may be used. Each extension is
further controlled by its own parameter. But if
<parameter>use.extensions</parameter> is zero, no extensions will
be used.
</para>

</refsection>
</doc:refentry>
<xsl:param name="use.extensions" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="use.local.olink.style"> 
<refmeta> 
<refentrytitle>use.local.olink.style</refentrytitle> 
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo> 
</refmeta> 
<refnamediv> 
<refname>use.local.olink.style</refname> 
<refpurpose>Process olinks using xref style of current
document</refpurpose> 
</refnamediv> 
 
<refsection><info><title>Description</title></info> 
 
<para>When cross reference data is collected for use by olinks, the data for each potential target includes one field containing a completely assembled cross reference string, as if it were an xref generated in that document. Other fields record the separate title, number, and element name of each target. When an olink is formed to a target from another document, the olink resolves to that preassembled string by default. If the <parameter>use.local.olink.style</parameter> parameter is set to non-zero, then instead the cross
reference string is formed again from the target title, number, and
element name, using the stylesheet processing the targeting document.
Then olinks will match the xref style in the targeting document
rather than in the target document. If  both documents are processed
with the same stylesheet, then the results will be the same.</para> 
</refsection> 
</doc:refentry>
<xsl:param name="use.local.olink.style" select="0"/> 

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="use.role.as.xrefstyle">
<refmeta>
<refentrytitle>use.role.as.xrefstyle</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>use.role.as.xrefstyle</refname>
<refpurpose>Use <tag class="attribute">role</tag> attribute for
<tag class="attribute">xrefstyle</tag> on <tag>xref</tag>?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>In DocBook documents that conform to a schema older than V4.3, this parameter allows 
<tag class="attribute">role</tag> to serve the purpose of specifying the cross reference style.</para>

<para>If non-zero, the <tag class="attribute">role</tag> attribute on
<tag>xref</tag> will be used to select the cross reference style.
In DocBook V4.3, the <tag class="attribute">xrefstyle</tag> attribute was added for this purpose.
If the <tag class="attribute">xrefstyle</tag> attribute is present, 
<tag class="attribute">role</tag> will be ignored, regardless of the setting
of this parameter.</para>

</refsection>

<refsection><info><title>Example</title></info>

<para>The following small stylesheet shows how to configure the
stylesheets to make use of the cross reference style:</para>

<programlisting>&lt;?xml version="1.0"?&gt;
&lt;xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"&gt;

&lt;xsl:import href="../xsl/html/docbook.xsl"/&gt;

&lt;xsl:output method="html"/&gt;

&lt;xsl:param name="local.l10n.xml" select="document('')"/&gt;
&lt;l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"&gt;
  &lt;l:l10n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" language="en"&gt;
   &lt;l:context name="xref"&gt;
      &lt;l:template name="chapter" style="title" text="Chapter %n, %t"/&gt;
      &lt;l:template name="chapter" text="Chapter %n"/&gt;
    &lt;/l:context&gt;
  &lt;/l:l10n&gt;
&lt;/l:i18n&gt;

&lt;/xsl:stylesheet&gt;</programlisting>

<para>With this stylesheet, the cross references in the following document:</para>

<programlisting>&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
                  "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"&gt;
&lt;book id="book"&gt;&lt;title&gt;Book&lt;/title&gt;

&lt;preface&gt;
&lt;title&gt;Preface&lt;/title&gt;

&lt;para&gt;Normal: &lt;xref linkend="ch1"/&gt;.&lt;/para&gt;
&lt;para&gt;Title: &lt;xref xrefstyle="title" linkend="ch1"/&gt;.&lt;/para&gt;

&lt;/preface&gt;

&lt;chapter id="ch1"&gt;
&lt;title&gt;First Chapter&lt;/title&gt;

&lt;para&gt;Irrelevant.&lt;/para&gt;

&lt;/chapter&gt;
&lt;/book&gt;</programlisting>

<para>will appear as:</para>

<informalexample>
<para>Normal: Chapter 1.</para>
<para>Title: Chapter 1, <emphasis>First Chapter</emphasis>.</para>
</informalexample>
</refsection>

</doc:refentry>
<xsl:param name="use.role.as.xrefstyle" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="use.role.for.mediaobject">
<refmeta>
<refentrytitle>use.role.for.mediaobject</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>use.role.for.mediaobject</refname>
<refpurpose>Use <tag class="attribute">role</tag> attribute 
value for selecting which of several objects within a mediaobject to use.
</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, the <tag class="attribute">role</tag> attribute on
<tag>imageobject</tag>s or other objects within a <tag>mediaobject</tag> container will be used to select which object will be
used.
</para>
<para>
The order of selection when then parameter is non-zero is:
</para>
<orderedlist>
<listitem>
    <para>If the stylesheet parameter <parameter>preferred.mediaobject.role</parameter> has a value, then the object whose role equals that value is selected.</para>
</listitem>
<listitem>
<para>Else if an object's role attribute has a value of
<literal>html</literal> for HTML processing or
<literal>fo</literal> for FO output, then the first
of such objects is selected.
</para>
</listitem>
<listitem>
<para>Else the first suitable object is selected.</para>
</listitem>
</orderedlist>
<para>
If the value of 
<parameter>use.role.for.mediaobject</parameter>
is zero, then role attributes are not considered
and the first suitable object
with or without a role value is used.
</para>
</refsection>
</doc:refentry>
<xsl:param name="use.role.for.mediaobject" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="use.svg">
<refmeta>
<refentrytitle>use.svg</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>use.svg</refname>
<refpurpose>Allow SVG in the result tree?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, SVG will be considered an acceptable image format. SVG
is passed through to the result tree, so correct rendering of the resulting
diagram depends on the formatter (FO processor or web browser) that is used
to process the output from the stylesheet.</para>

</refsection>
</doc:refentry>
<xsl:param name="use.svg" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="variablelist.as.blocks">
<refmeta>
<refentrytitle>variablelist.as.blocks</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>variablelist.as.blocks</refname>
<refpurpose>Format <tag>variablelist</tag>s lists as blocks?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero, <tag>variablelist</tag>s will be formatted as
blocks.</para>

<para>If you have long terms, proper list markup in the FO case may produce
unattractive lists. By setting this parameter, you can force the stylesheets
to produce block markup instead of proper lists.</para>

<para>You can override this setting with a processing instruction as the
child of <tag>variablelist</tag>: <tag class="xmlpi">dbfo
list-presentation="blocks"</tag> or <tag class="xmlpi">dbfo
list-presentation="list"</tag>.</para>

<para>When using <literal>list-presentation="list"</literal>,
you can also control the amount of space used for the <tag>term</tag>s with 
the <tag class="xmlpi">dbfo term-width=".25in"</tag> processing instruction,
the <tag class="attribute">termlength</tag> attribute on <tag>variablelist</tag>,
or allow the stylesheets to attempt to calculate the amount of space to leave based on the 
number of letters in the longest term.  
</para>

<programlisting>  &lt;variablelist&gt;
        &lt;?dbfo list-presentation="list"?&gt;
        &lt;?dbfo term-width="1.5in"?&gt;
        &lt;?dbhtml list-presentation="table"?&gt;
        &lt;?dbhtml term-width="1.5in"?&gt;
        &lt;varlistentry&gt;
          &lt;term&gt;list&lt;/term&gt;
          &lt;listitem&gt;
                &lt;para&gt;
                  Formatted as a list even if variablelist.as.blocks is set to 1.
                &lt;/para&gt;
          &lt;/listitem&gt;
        &lt;/varlistentry&gt;
  &lt;/variablelist&gt;</programlisting>


</refsection>

</doc:refentry>
<xsl:param name="variablelist.as.blocks" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="variablelist.max.termlength">
<refmeta>
<refentrytitle>variablelist.max.termlength</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">number</refmiscinfo>
</refmeta>
<refnamediv>
<refname>variablelist.max.termlength</refname>
<refpurpose>Specifies the longest term in variablelists</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>In variablelists, the <tag>listitem</tag>
is indented to leave room for the 
<tag>term</tag> elements. That indent may be computed
if it is not specified with a <tag class="attribute">termlength</tag>
attribute on the <tag>variablelist</tag> element.
</para>
<para>
The computation counts characters in the 
<tag>term</tag> elements in the list
to find the longest term.  However, some terms are very long
and would produce extreme indents.  This parameter lets you
set a maximum character count.  Any terms longer than the maximum
would line wrap.  The default value is 24.
</para>
<para>
The character counts are converted to physical widths
by multiplying by 0.50em. There will be some variability
in how many actual characters fit in the space
since some characters are wider than others.
</para>

</refsection>
</doc:refentry>
<xsl:param name="variablelist.max.termlength">24</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="variablelist.term.separator">
<refmeta>
<refentrytitle>variablelist.term.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>variablelist.term.separator</refname>
<refpurpose>Text to separate <tag>term</tag>s within a multi-term
<tag>varlistentry</tag></refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>When a <tag>varlistentry</tag> contains multiple <tag>term</tag>
elements, the string specified in the value of the
<parameter>variablelist.term.separator</parameter> parameter is placed
after each <tag>term</tag> except the last.</para>

<note>
  <para>To generate a line break between multiple <tag>term</tag>s in
  a <tag>varlistentry</tag>, set a non-zero value for the
  <parameter>variablelist.term.break.after</parameter> parameter. If
  you do so, you may also want to set the value of the
  <parameter>variablelist.term.separator</parameter> parameter to an
  empty string (to suppress rendering of the default comma and space
  after each <tag>term</tag>).</para>
</note>

</refsection>
</doc:refentry>
<xsl:param name="variablelist.term.separator">, </xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="variablelist.term.properties">
<refmeta>
<refentrytitle>variablelist.term.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>variablelist.term.properties</refname>
<refpurpose>To add properties to the term elements in a variablelist.</refpurpose>
</refnamediv>


<refsection><info><title>Description</title></info>
<para>These properties are added to the block containing a
term in a variablelist.
Use this attribute-set to set
font properties or alignment, for example.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="variablelist.term.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="variablelist.term.break.after">
<refmeta>
<refentrytitle>variablelist.term.break.after</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>variablelist.term.break.after</refname>
<refpurpose>Generate line break after each <tag>term</tag> within a
multi-term <tag>varlistentry</tag>?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Set a non-zero value for the
<parameter>variablelist.term.break.after</parameter> parameter to
generate a line break between <tag>term</tag>s in a
multi-term <tag>varlistentry</tag>.</para>

<note>
<para>If you set a non-zero value for
<parameter>variablelist.term.break.after</parameter>, you may also
want to set the value of the
<parameter>variablelist.term.separator</parameter> parameter to an
empty string (to suppress rendering of the default comma and space
after each <tag>term</tag>).</para>
</note>

</refsection>
</doc:refentry>
<xsl:param name="variablelist.term.break.after">0</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="verbatim.properties">
<refmeta>
<refentrytitle>verbatim.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>verbatim.properties</refname>
<refpurpose>Properties associated with verbatim text</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>
<para>This attribute set is used on all verbatim environments.</para>
</refsection>

</doc:refentry>
<xsl:attribute-set name="verbatim.properties">
  <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">1.2em</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="wrap-option">no-wrap</xsl:attribute>
  <xsl:attribute name="white-space-collapse">false</xsl:attribute>
  <xsl:attribute name="white-space-treatment">preserve</xsl:attribute>
  <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
  <xsl:attribute name="text-align">start</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="writing.mode">
<refmeta>
<refentrytitle>writing.mode</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>writing.mode</refname>
<refpurpose>Direction of text flow based on locale</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Sets direction of text flow and text alignment based on locale.
The value is normally taken from the gentext file for the 
lang attribute of the document's root element, using the 
key name 'writing-mode' to look it up in the gentext file.
But the param can also be
set on the command line to override that gentext value.
</para>
<para>Accepted values are:
<variablelist>
  <varlistentry>
    <term>lr-tb</term>
    <listitem>
      <para>Left-to-right text flow in each line, lines stack top to bottom.</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>rl-tb</term>
    <listitem>
      <para>Right-to-left text flow in each line, lines stack top to bottom.</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>tb-rl</term>
    <listitem>
      <para>Top-to-bottom text flow in each vertical line, lines stack right to left.
      Supported by only a few XSL-FO processors. Not supported in HTML output.</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>lr</term>
    <listitem>
      <para>Shorthand for lr-tb.</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>rl</term>
    <listitem>
      <para>Shorthand for rl-tb.</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>tb</term>
    <listitem>
      <para>Shorthand for tb-rl.</para>
    </listitem>
  </varlistentry>
</variablelist>
</para>

</refsection>
</doc:refentry>
<xsl:param name="writing.mode">
  <xsl:call-template name="gentext">
    <xsl:with-param name="key">writing-mode</xsl:with-param>
    <xsl:with-param name="lang">
      <xsl:call-template name="l10n.language">
        <xsl:with-param name="target" select="/*[1]"/>
      </xsl:call-template>
    </xsl:with-param>
  </xsl:call-template>
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="xep.extensions">
<refmeta>
<refentrytitle>xep.extensions</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>xep.extensions</refname>
<refpurpose>Enable XEP extensions?</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>If non-zero,
<link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.renderx.com/">XEP</link>
extensions will be used. XEP extensions consists of PDF bookmarks,
document information and better index processing.
</para>

<para>This parameter can also affect which graphics file formats
are supported</para>
</refsection>
</doc:refentry>
<xsl:param name="xep.extensions" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="xep.index.item.properties">
<refmeta>
<refentrytitle>xep.index.item.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>xep.index.item.properties</refname>
<refpurpose>Properties associated with XEP index-items</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>Properties associated with XEP index-items, which generate
page numbers in an index processed by XEP. For more info see
the XEP documentation section "Indexes" in
<uri xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.renderx.com/reference.html#Indexes">http://www.renderx.com/reference.html#Indexes</uri>.</para>

<para>This attribute-set also adds by default any properties from the
<tag class="attribute">index.page.number.properties</tag>
attribute-set.</para>
</refsection>
</doc:refentry>
<xsl:attribute-set name="xep.index.item.properties" use-attribute-sets="index.page.number.properties">
  <xsl:attribute name="merge-subsequent-page-numbers">true</xsl:attribute>
  <xsl:attribute name="link-back">true</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="xref.label-page.separator">
<refmeta>
<refentrytitle>xref.label-page.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>xref.label-page.separator</refname>
<refpurpose>Punctuation or space separating label from page number in xref</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>
This parameter allows you to control the punctuation of certain
types of generated cross reference text.
When cross reference text is generated for an 
<tag class="element">xref</tag> or 
<tag class="element">olink</tag> element
using an <tag class="attribute">xrefstyle</tag> attribute
that makes use of the <literal>select:</literal> feature,
and the selected components include both label and page
but no title,
then the value of this parameter is inserted between
label and page number in the output.  
If a title is included, then other separators are used.
</para>

</refsection>
</doc:refentry>
<xsl:param name="xref.label-page.separator"><xsl:text> </xsl:text></xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="xref.label-title.separator">
<refmeta>
<refentrytitle>xref.label-title.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>xref.label-title.separator</refname>
<refpurpose>Punctuation or space separating label from title in xref</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>
This parameter allows you to control the punctuation of certain
types of generated cross reference text.
When cross reference text is generated for an 
<tag class="element">xref</tag> or 
<tag class="element">olink</tag> element
using an <tag class="attribute">xrefstyle</tag> attribute
that makes use of the <literal>select:</literal> feature,
and the selected components include both label and title,
then the value of this parameter is inserted between
label and title in the output.  
</para>

</refsection>
</doc:refentry>
<xsl:param name="xref.label-title.separator">: </xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="xref.properties">
<refmeta>
<refentrytitle>xref.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>xref.properties</refname>
<refpurpose>Properties associated with cross-reference text</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>This attribute set is used to set properties
on cross reference text.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="xref.properties">
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="xref.title-page.separator">
<refmeta>
<refentrytitle>xref.title-page.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv>
<refname>xref.title-page.separator</refname>
<refpurpose>Punctuation or space separating title from page number in xref</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>
This parameter allows you to control the punctuation of certain
types of generated cross reference text.
When cross reference text is generated for an 
<tag class="element">xref</tag> or 
<tag class="element">olink</tag> element
using an <tag class="attribute">xrefstyle</tag> attribute
that makes use of the <literal>select:</literal> feature,
and the selected components include both title and page number,
then the value of this parameter is inserted between
title and page number in the output.  
</para>

</refsection>
</doc:refentry>
<xsl:param name="xref.title-page.separator"><xsl:text> </xsl:text></xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="xref.with.number.and.title">
<refmeta>
<refentrytitle>xref.with.number.and.title</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv>
<refname>xref.with.number.and.title</refname>
<refpurpose>Use number and title in cross references</refpurpose>
</refnamediv>



<refsection><info><title>Description</title></info>

<para>A cross reference may include the number (for example, the number of
an example or figure) and the <tag>title</tag> which is a required child of some
targets. This parameter inserts both the relevant number as well as
the title into the link. </para>

</refsection>
</doc:refentry>
<xsl:param name="xref.with.number.and.title" select="1"/>

</xsl:stylesheet>