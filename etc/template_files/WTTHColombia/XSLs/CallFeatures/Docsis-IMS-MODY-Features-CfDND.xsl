<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes" xalan:indent-amount="2" xmlns:xalan="http://xml.apache.org/xslt"/>


	<!-- ############################################# -->
	<!-- ## Declaracion de variables parametrizadas ## -->
	<!-- ############################################# -->
	<xsl:param name= "method"/>
	<xsl:param name= "username"/>
	<xsl:param name= "password"/>	
	<xsl:param name= "IMPU_value"/>
	

	<!-- ############################################# -->
	<!-- ##  Validacion de Metodos (microcomandos)  ## -->
	<!-- ############################################# -->	
	<xsl:template match="/">


		<!-- ################################# -->
		<!-- ########  METODO REG_DND ######## -->
		<!-- ################################# -->		
		<xsl:if test="$method = 'REG_DND' ">
			
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
			  <spg:REG_DND>
				 <spg:IMPU><xsl:value-of select="$IMPU_value"/></spg:IMPU>
				 <spg:EMODE>4</spg:EMODE>
				 <spg:TREAT>1</spg:TREAT>
				 <spg:BTREAT>1</spg:BTREAT>
			  </spg:REG_DND>
		   </soapenv:Body>
		</soapenv:Envelope>
			
		</xsl:if>	


		<!-- ################################# -->
		<!-- ########  METODO RPL_DND ######## -->
		<!-- ################################# -->		
		<xsl:if test="$method = 'RPL_DND' ">
			
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
			  <spg:RPL_DND>
				 <spg:IMPU><xsl:value-of select="$IMPU_value"/></spg:IMPU>
			  </spg:RPL_DND>
		   </soapenv:Body>
		</soapenv:Envelope>
			
		</xsl:if>			
		
	</xsl:template>
</xsl:stylesheet>
