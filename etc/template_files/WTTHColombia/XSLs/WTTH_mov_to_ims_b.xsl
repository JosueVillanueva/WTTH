<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name= "fixed_numbers"/>
    <xsl:param name= "mobile_numbers"/>
    <xsl:param name="separator"/>
    
    <xsl:include href="mov_to_ims_tmp_b.xsl"/>
    
    <xsl:template match="/">

        <localRoutes  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        <xsl:call-template name="split_routes">
                        <xsl:with-param name="fixed_numbers" select="$fixed_numbers"/>
                        <xsl:with-param name="mobile_numbers" select="$mobile_numbers"/>                    
                        <xsl:with-param name="separator" select="$separator"/>                    
        </xsl:call-template>    
        </localRoutes>
    </xsl:template>
</xsl:stylesheet>
