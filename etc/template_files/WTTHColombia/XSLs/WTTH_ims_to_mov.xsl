<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name= "route_concat_ims_to_mov"/>
    
    <xsl:template match="/">
    	<localRoutes >
	    	<xsl:value-of select="$route_concat_ims_to_mov"/>
    	</localRoutes>
    </xsl:template>
</xsl:stylesheet>

