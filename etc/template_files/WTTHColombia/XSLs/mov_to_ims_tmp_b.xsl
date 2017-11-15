<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="add_route">
    <xsl:param name= "fixed_number"/>
    <xsl:param name= "mobile_number"/>
            <route>
                <user type="E164"><xsl:value-of select="$fixed_number" /></user> 
                <next type="regex">!<xsl:value-of select="$mobile_number"/>+(^.*$)!sip:\1@sbcims!</next>
            </route>            
   </xsl:template>

  <xsl:template name="split_routes">
        <xsl:param name="fixed_numbers"/>
        <xsl:param name="mobile_numbers"/>
        <xsl:param name="separator"/>

        <xsl:choose>
            <xsl:when test="contains($fixed_numbers,$separator)">
                <xsl:variable name="current_fixed_number" select="substring-before($fixed_numbers, $separator)"/>
                <xsl:variable name="remaining_fixed_number" select="substring-after($fixed_numbers, $separator)"/>
                <xsl:variable name="current_mobile_number" select="substring-before($mobile_numbers, $separator)"/>
                <xsl:variable name="remaining_mobile_number" select="substring-after($mobile_numbers, $separator)"/>
                
                <xsl:call-template name="add_route">
                    <xsl:with-param name="fixed_number" select="$current_fixed_number"/>
                    <xsl:with-param name="mobile_number" select="$current_mobile_number"/>
                </xsl:call-template>
                <xsl:call-template name="split_routes">
                    <xsl:with-param name="fixed_numbers" select="$remaining_fixed_number"/>
                    <xsl:with-param name="mobile_numbers" select="$remaining_mobile_number"/>
                    <xsl:with-param name="separator" select="$separator"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="add_route">
                    <xsl:with-param name="fixed_number" select="$fixed_numbers"/>
                    <xsl:with-param name="mobile_number" select="$mobile_numbers"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    
</xsl:stylesheet>
