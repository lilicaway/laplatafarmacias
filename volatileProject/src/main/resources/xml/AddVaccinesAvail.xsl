<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	exclude-result-prefixes="xsl xs">

	<xsl:output method="xml" version="1.0" encoding="UTF-8"
		indent="yes" />

	<!-- the identity template -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>

	<!-- template for the head section. Only needed if we want to change, delete 
		or add nodes. In our case we need it to add a link element pointing to an 
		external CSS stylesheet. <xsl:template match="xhtml:head"> <xsl:copy> <link 
		rel="StyleSheet" href="xhtml_test.css" type="text/css" /> <xsl:apply-templates 
		select="@*|node()" /> </xsl:copy> </xsl:template> -->

	<xsl:template match="title[contains(.,'1')]">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
		<hasVaccines>true</hasVaccines>
	</xsl:template>

	
</xsl:stylesheet>