<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name= "feature_code"/>
	<xsl:param name= "username"/>
	<xsl:param name= "password"/>	
	<xsl:param name= "telephone_number"/>
	<xsl:param name= "RINGCOUNT_value"/>


	<xsl:template match="/">
		<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:spg="http://www.huawei.com/SPG">
		   <soapenv:Header>
			  <spg:ResendFlag>?</spg:ResendFlag>
			  <spg:Authentication>
				 <spg:Username><xsl:value-of select="$username"/></spg:Username>
				 <spg:Password><xsl:value-of select="$password"/></spg:Password>
			  </spg:Authentication>
			  <spg:MessageID></spg:MessageID>
		   </soapenv:Header>
		   <soapenv:Body>
			  <spg:MOD_SBR>
				<spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
				<spg:RINGCOUNT><xsl:value-of select="$RINGCOUNT_value"/></spg:RINGCOUNT>					
			  </spg:MOD_SBR>
		   </soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>