<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes"  />
    <xsl:param name= "fixed_number"/>
    <xsl:param name= "mobile_number"/>
    <xsl:template match="/">
		<route>
			<user type="E164"><xsl:value-of select="$fixed_number" /></user>
			<next type="regex">!<xsl:value-of select="$mobile_number"/>+(^.*$)!sip:\1@sbcims!</next>
		</route>
		
	</xsl:template>
</xsl:stylesheet>

