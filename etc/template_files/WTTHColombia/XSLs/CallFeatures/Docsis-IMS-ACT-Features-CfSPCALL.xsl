<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes" xalan:indent-amount="2" xmlns:xalan="http://xml.apache.org/xslt"/>


	<!-- ############################################# -->
	<!-- ## Declaracion de variables parametrizadas ## -->
	<!-- ############################################# -->
	<xsl:param name= "method"/>
	<xsl:param name= "username"/>
	<xsl:param name= "password"/>	
	<xsl:param name= "IMPU_value"/>
	<xsl:param name= "ABBRNUMBER_value"/>
	<xsl:param name= "DESTIMPU_value"/>
	

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
					<spg:NSSD1D>1</spg:NSSD1D>					
					<spg:NSSD2D>1</spg:NSSD2D>							
				  </spg:MOD_SBR>
			   </soapenv:Body>
			</soapenv:Envelope>
		</xsl:if>		
	
	<!-- ##################################### -->
	<!-- ######  METODO REG_SPEED_DIAL ####### -->
	<!-- ##################################### -->	

		<xsl:if test="$method = 'REG_SPEED_DIAL' ">				
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
				  <spg:REG_SPEED_DIAL>
					 <spg:IMPU><xsl:value-of select="$IMPU_value"/></spg:IMPU>
					 <spg:ABBRNUMBER><xsl:value-of select="$ABBRNUMBER_value"/></spg:ABBRNUMBER>
					 <spg:DESTIMPU><xsl:value-of select="$DESTIMPU_value"/></spg:DESTIMPU>
				  </spg:REG_SPEED_DIAL>
			   </soapenv:Body>
			</soapenv:Envelope>
		</xsl:if>

	</xsl:template>
</xsl:stylesheet>
