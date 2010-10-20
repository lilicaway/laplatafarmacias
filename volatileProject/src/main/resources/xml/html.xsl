<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xhtml xsl xs">

    <xsl:output method="xhtml" version="1.0" encoding="UTF-8"
        doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
        indent="yes" cdata-section-elements="script" />

<!-- the identity template -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

<!-- template for the head section. Only needed if we want to change, delete or add nodes. 
In our case we need it to add a link element pointing to an external CSS stylesheet.
    <xsl:template match="xhtml:head">
        <xsl:copy>
            <link rel="StyleSheet" href="xhtml_test.css" type="text/css" />
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
 -->

    <xsl:template match="xhtml:script">
        <xsl:copy>
            <xsl:copy-of select="@*" />
            <xsl:comment>
                <xsl:apply-templates select="@*|node()" />
                //
            </xsl:comment>
        </xsl:copy>
    </xsl:template>

<!-- template for the body section. Only needed if we want to change, delete or add nodes. 
In our case we need it to add a div element containing a menu of navigation.

 -->
    <xsl:template match="xhtml:tr">
        <tr>
            <td colspan="2">Hola mundo, HERMOSAAAAAAA!</td>
        </tr>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
        <tr>
            <td colspan="2">
                <input type="button" value="Marcar casa!" onclick="marcarCasa()" />
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="xhtml:h3[contains(.,'Under Construction')]">
    </xsl:template>

    <xsl:template match="xhtml:body">
        <xsl:copy>
            <xsl:copy-of select="@*" />
            <xsl:apply-templates select="@*|node()" />
            <script type="text/javascript">
             <xsl:comment>
                function marcarCasa() {
                     var point = new GLatLng(-34.899527,-57.979456);
                     var marker = new GMarker(point);
                     map.addOverlay(marker);
                }
             </xsl:comment>
        </script>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>