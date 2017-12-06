<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes" xalan:indent-amount="2" xmlns:xalan="http://xml.apache.org/xslt"/>


	<!-- ############################################# -->
	<!-- ## Declaracion de variables parametrizadas ## -->
	<!-- ############################################# -->
	<xsl:param name= "method"/>
	<xsl:param name= "username"/>
	<xsl:param name= "password"/>	
	<xsl:param name= "IMPU_value"/>
	<xsl:param name= "DIMPU_value"/>
		

	<!-- ############################################# -->
	<!-- ##  Validacion de Metodos (microcomandos)  ## -->
	<!-- ############################################# -->	
	<xsl:template match="/">

		<!-- ################################# -->
		<!-- ########  METODO MOD_SBR ######## -->
		<!-- ################################# -->		
		<xsl:if test="$method = 'MOD_SBR' ">
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
					<spg:IMPU><xsl:value-of select="$IMPU_value"/></spg:IMPU>
					<spg:NSCFB>1</spg:NSCFB>					
				  </spg:MOD_SBR>
			   </soapenv:Body>
			</soapenv:Envelope>
		</xsl:if>		
	
		<!-- ################################# -->
		<!-- ########  METODO REG_CFB ######## -->
		<!-- ################################# -->	
		<xsl:if test="$method = 'REG_CFB' ">
			<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:spg="http://www.huawei.com/SPG">
			   <soapenv:Header>
				  <spg:ResendFlag>?</spg:ResendFlag>
				  <spg:Authentication>
					 <spg:Username><xsl:value-of select="$username"/></spg:Username>
					 <spg:Password><xsl:value-of select="$password"/></spg:Password>
				  </spg:Authentication>
				  <spg:MessageID>?</spg:MessageID>
			   </soapenv:Header>
			   <soapenv:Body>
				  <spg:REG_CFB>
					 <spg:IMPU><xsl:value-of select="$IMPU_value"/></spg:IMPU>
					 <spg:DIMPU><xsl:value-of select="$DIMPU_value"/></spg:DIMPU>
				  </spg:REG_CFB>
			   </soapenv:Body>
			</soapenv:Envelope>
		</xsl:if>				

	</xsl:template>
</xsl:stylesheet>
