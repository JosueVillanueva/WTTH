<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name= "username"/>
	<xsl:param name= "password"/>
	<xsl:param name= "telephone_full"/>
	<xsl:param name= "authurl"/>
	<xsl:param name= "OUTRST_value"/>


	<xsl:template match="/">
		<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:spg="http://www.huawei.com/SPG">
			<soapenv:Header>
			 <!--spg:ResendFlag>?</spg:ResendFlag-->
			 <spg:Authentication>
			  <spg:Username><xsl:value-of select="$username"/></spg:Username>
			  <spg:Password><xsl:value-of select="$password"/></spg:Password>
			 </spg:Authentication>
			 <!--spg:MessageID>?</spg:MessageID-->
			</soapenv:Header>
			<soapenv:Body>
			 <spg:MOD_SBR>
			  <spg:IMPU>sip:<xsl:value-of select="$telephone_full"/>@<xsl:value-of select="$authurl"/></spg:IMPU>
			  <spg:OUTRST><xsl:value-of select="$OUTRST_value"/></spg:OUTRST>
			 </spg:MOD_SBR>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>