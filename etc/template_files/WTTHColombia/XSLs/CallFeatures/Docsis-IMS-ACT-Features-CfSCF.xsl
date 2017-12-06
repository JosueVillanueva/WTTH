<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes" xalan:indent-amount="2" xmlns:xalan="http://xml.apache.org/xslt"/>


	<!-- ############################################# -->
	<!-- ## Declaracion de variables parametrizadas ## -->
	<!-- ############################################# -->
	<xsl:param name= "method"/>
	<xsl:param name= "username"/>
	<xsl:param name= "password"/>	
	<xsl:param name= "IMPU_value"/>
	<xsl:param name= "CSIMPU_value"/>
	<xsl:param name= "FTIMPU_value"/>	
	

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
					<spg:NSCFS>1</spg:NSCFS>					
				  </spg:MOD_SBR>
			   </soapenv:Body>
			</soapenv:Envelope>
		</xsl:if>		
	
		<!-- ################################# -->
		<!-- #########  METODO REG_CFS ####### -->
		<!-- ################################# -->	
		<xsl:if test="$method = 'REG_CFS' ">				
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
				  <spg:REG_CFS>
					 <spg:IMPU><xsl:value-of select="$IMPU_value"/></spg:IMPU>
					 <spg:CSIMPU><xsl:value-of select="$CSIMPU_value"/></spg:CSIMPU>
					 <spg:FTIMPU><xsl:value-of select="$FTIMPU_value"/></spg:FTIMPU>
				  </spg:REG_CFS>
			   </soapenv:Body>
			</soapenv:Envelope>		
		</xsl:if>	


	</xsl:template>
</xsl:stylesheet>
