<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes" xalan:indent-amount="2" xmlns:xalan="http://xml.apache.org/xslt"/>


	<!-- ############################################# -->
	<!-- ## Declaracion de variables parametrizadas ## -->
	<!-- ############################################# -->
	<xsl:param name= "method"/>
	<xsl:param name= "username"/>
	<xsl:param name= "password"/>	
	<xsl:param name= "IMPU_value"/>
	<xsl:param name= "SIMPU_value"/>
	<xsl:param name= "PATTERN_value"/>
	<xsl:param name= "CWPATTERN_value"/>

	
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
					<spg:NSDSTR>1</spg:NSDSTR>					
				  </spg:MOD_SBR>
			   </soapenv:Body>
			</soapenv:Envelope>
		</xsl:if>		
	
		<!-- ################################# -->
		<!-- ########  METODO REG_DSTR ####### -->
		<!-- ################################# -->	
		<xsl:if test="$method = 'REG_DSTR' ">		
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
				  <spg:REG_DSTR>
					 <spg:IMPU><xsl:value-of select="$IMPU_value"/></spg:IMPU>
					 <spg:PATTERN><xsl:value-of select="$PATTERN_value"/></spg:PATTERN>
					 <spg:CWPATTERN><xsl:value-of select="$CWPATTERN_value"/></spg:CWPATTERN>
					 <spg:SIMPU><xsl:value-of select="$SIMPU_value"/></spg:SIMPU>
				  </spg:REG_DSTR>
			   </soapenv:Body>
			</soapenv:Envelope>
		</xsl:if>		

	</xsl:template>
</xsl:stylesheet>
