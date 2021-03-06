## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language it
== Pagine XML & Elaborazione XSLT ==

Se il modulo [http://4suite.org/ Python4Suite] è installato sul sistema, è possibile
salvare documenti XML come pagine. E' importante che la pagina inizi
con una dichiarazione XML "{{{<?xml ...>}}}" nella sua prima
riga. Deve anche specificare lo stylesheet che deve essere usato per
trasformare il documento XML in un HTML. Questo puo' essere fatto
utilizzando uno [http://www.w3.org/TR/xml-stylesheet/ "xml-stylesheet"
standard], specificando il nome di una pagina contenente lo stylesheet
nel parametro "{{{href}}}".

Vedi l'esempio che segue per i dettagli, che puoi trovare anche nella
pagina XsltVersion.

=== Esempio ===
{{{
<?xml version="1.0" encoding="ISO-8859-1"?>

<?xml-stylesheet href="XsltVersion" type="text/xml"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output method="html" omit-xml-declaration="yes" indent="no"/>

   <xsl:template match="/">
     This Wiki is running an XSLT engine by
     <xsl:value-of select="system-property('xsl:vendor')"/>
     (<a href="{system-property('xsl:vendor-url')}"><xsl:value-of select="system-property('xsl:vendor-url')"/></a>)
     implementing XSLT v<xsl:value-of select="system-property('xsl:version')"/>
   </xsl:template>

</xsl:stylesheet>
}}} 

=== Display ===
<<Include(XsltVersion)>>
