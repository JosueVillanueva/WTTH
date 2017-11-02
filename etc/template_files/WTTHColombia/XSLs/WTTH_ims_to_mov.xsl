<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes" xalan:indent-amount="2" xmlns:xalan="http://xml.apache.org/xslt"/>
	<xsl:template match="/">
	<!--?xml version="1.0" encoding="UTF-8" standalone="yes"?-->
	<localRoutes xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
		<route>
	  		<user type="E164">17554000</user>
	  		<next type="regex">!sip:573142002020@mgcfims!</next>
	 	</route>
	 	<route>
	  		<user type="E164">17554001</user>
	  		<next type="regex">!sip:573142002021@mgcfims!</next>
	 	</route>
	</localRoutes>
	</xsl:template>
</xsl:stylesheet>