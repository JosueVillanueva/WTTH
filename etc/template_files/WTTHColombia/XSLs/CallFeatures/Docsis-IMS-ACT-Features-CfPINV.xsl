<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes" xalan:indent-amount="2" xmlns:xalan="http://xml.apache.org/xslt"/>


	<!-- ############################################# -->
	<!-- ## Declaracion de variables parametrizadas ## -->
	<!-- ############################################# -->
	<xsl:param name= "method"/>
	<xsl:param name= "username"/>
	<xsl:param name= "password"/>	
	<xsl:param name= "AGCFName_value"/>	
	<xsl:param name= "IMPU_value"/>
	<xsl:param name= "PUI_value"/>	
	

	<!-- ############################################# -->
	<!-- ##  Validacion de Metodos (microcomandos)  ## -->
	<!-- ############################################# -->	
	<xsl:template match="/">

		<!-- ################################### -->
		<!-- ########  METODO MOD_SBR ######## -->
		<!-- ################################### -->		
		<xsl:if test="$method = 'MOD_SBR' ">	
			<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:spg="http://www.huawei.com/SPG">
			   <soapenv:Header>
				  <spg:ResendFlag>0</spg:ResendFlag>
				  <spg:Authentication>
					 <spg:Username><xsl:value-of select="$username"/></spg:Username>
					 <spg:Password><xsl:value-of select="$password"/></spg:Password>
				  </spg:Authentication>
				  <spg:MessageID>0</spg:MessageID>
			   </soapenv:Header>
			   <soapenv:Body>
				  <spg:MOD_SBR>
					 <spg:IMPU><xsl:value-of select="$IMPU_value"/></spg:IMPU>
					 <spg:CPC>3</spg:CPC>
					 <spg:PCHG>0</spg:PCHG>
					 <spg:TFPT>2</spg:TFPT>
				  </spg:MOD_SBR>
			   </soapenv:Body>
			</soapenv:Envelope>	  
		</xsl:if>
		
		<!-- ################################# -->
		<!-- ########  METODO MOD_ASBR ######## -->
		<!-- ################################# -->		
		<xsl:if test="$method = 'MOD_ASBR' ">		
			<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:agc="http://www.huawei.com/IMS/AGCFV100R002C00SPC200/">
				<soapenv:Header>
					<agc:MessageID>?</agc:MessageID>
					<agc:MEName><xsl:value-of select="$AGCFName_value"/></agc:MEName>
					<agc:Authentication>
						<agc:Username><xsl:value-of select="$username"/></agc:Username>
						<agc:Password><xsl:value-of select="$password"/></agc:Password>
					</agc:Authentication>
				</soapenv:Header>
				<soapenv:Body>
					<agc:MOD_ASBR>
						<agc:PUI><xsl:value-of select="$PUI_value"/></agc:PUI>
						<agc:TET>1</agc:TET>
					</agc:MOD_ASBR>
				</soapenv:Body>
			</soapenv:Envelope>	
		</xsl:if>	
	
	</xsl:template>
</xsl:stylesheet>
