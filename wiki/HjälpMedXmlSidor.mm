## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##translated-by:Karolina Lindqvist, Shakti Wiki
##master-page:HelpOnXmlPages
##master-date:2002-03-05 10:00:33
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language sv
== XML-sidor och XSLT-processning ==
Om du har [http://4suite.org/ Python4Suite] installerat på ditt system så är det möjligt att spara XML-dokument som sidor. Det är viktigt att dessa sidor börjar med en XML-deklaration "{{{<?xml ...>}}}" på sidans allra första rad. Det "stylesheet" som ska användas måste också specificeras. Detta görs genom att använda ett [http://www.w3.org/TR/xml-stylesheet/ standard-xml-stilmall skript-instruktion], med namnet på sidan som innehåller stilmallen som parameter till "{{{href}}}".

Se följande exempel för detaljer. Det kan också ses på XsltVersion-sidan.

=== Example ===
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

=== Hur det ser ut ===
<<Include(XsltVersion)>>
