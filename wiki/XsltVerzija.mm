## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:XsltVersion
##master-date:2004-03-17 20:50:25
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language sr

<?xml version="1.0" encoding="ISO-8859-1"?>

<?xml-stylesheet href="XsltVersion" type="text/xml"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

      <xsl:output method="html" omit-xml-declaration="yes" indent="no"/>

      <xsl:template match="/">
            This Wiki is running an XSLT engine by

            <xsl:value-of select="system-property('xsl:vendor')"/> (<a href="{system-property('xsl:vendor-url')}"><xsl:value-of select="system-property('xsl:vendor-url')"/></a>) implementing XSLT v<xsl:value-of select="system-property('xsl:version')"/>
      </xsl:template> 

</xsl:stylesheet>
