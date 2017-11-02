<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes" xalan:indent-amount="2" xmlns:xalan="http://xml.apache.org/xslt"/>
	<!--xsl:template match="/">
		<?xml version="1.0" encoding="UTF-8" standalone="yes"?-->
		
		<xsl:variable name="movil-array">
	        <Item>17554000</Item>
	        <Item>17554010</Item>
	        <Item>17554015</Item>
    	</xsl:variable>
    	<xsl:variable name="fixed-array">
	        <Item>573142002020</Item>
	        <Item>573142002025</Item>
	        <Item>573142002030</Item>
    	</xsl:variable>
		<xsl:param name="movil" select="document('')/*/xsl:variable[@name='movil-array']/*"/>
    	<xsl:param name="fixed" select="document('')/*/xsl:variable[@name='fixed-array']/*"/>
    	 <!--xsl:param name="movil" /> 
    	 <xsl:param name="fixed" /--> 
		<xsl:template match="/">
			<localRoutes xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
				<xsl:for-each select="$fixed">
		    		<xsl:variable name="count_movil" select="position()"></xsl:variable>
			    		<route>
			    			<user type="E164"><xsl:value-of select="." /></user>
			    			<next type="regex">!sip:<xsl:value-of select="$movil[$fixed]"/>@mgcfims!</next> 
			    		</route>
				</xsl:for-each>
			</localRoutes>
		</xsl:template>
</xsl:stylesheet>