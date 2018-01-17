<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name= "feature_code"/>
	<xsl:param name= "username"/>
	<xsl:param name= "password"/>	
	<xsl:param name= "telephone_number"/>
	<xsl:param name= "AGCFName_value"/>
	<xsl:param name= "PUI_value"/>


	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$feature_code='CfPINV'">
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
			</xsl:when>
			<xsl:otherwise>
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
						<xsl:choose>
							<xsl:when test="$feature_code='CALL_BARRING'">
								<spg:RPL_CBA>
									<spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								</spg:RPL_CBA>
							</xsl:when>
							<xsl:when test="$feature_code='CfAC'">
								<spg:RPL_SS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:CCBS>0</spg:CCBS>
								</spg:RPL_SS>
							</xsl:when>
							<xsl:when test="$feature_code='CfACR'">
								<spg:RPL_SS>
									<spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
									<spg:ACR>0</spg:ACR>
								</spg:RPL_SS>
							</xsl:when>
							<xsl:when test="$feature_code='CFBVM'">
								<spg:RPL_SS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:CFBVM>0</spg:CFBVM>
								</spg:RPL_SS>
							</xsl:when>
							<xsl:when test="$feature_code='CfCFBL'">
								<spg:RPL_CFB>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								</spg:RPL_CFB>
							</xsl:when>
							<xsl:when test="$feature_code='CfCFDA'">
								<spg:RPL_CFNR>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								</spg:RPL_CFNR>
							</xsl:when>
							<xsl:when test="$feature_code='CfCFV'">
								<spg:RPL_CFU>
									<spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								</spg:RPL_CFU>
							</xsl:when>
							<xsl:when test="$feature_code='CfCIDB'">
								<spg:RPL_CLIR>
									<spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								</spg:RPL_CLIR>
							</xsl:when>
							<xsl:when test="$feature_code='CfCIDCW'">
								<spg:RPL_SS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:CIDCW>0</spg:CIDCW>
								</spg:RPL_SS>
							</xsl:when>
							<xsl:when test="$feature_code='CfCLI'">
								<spg:RPL_COLR>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								</spg:RPL_COLR>
							</xsl:when>
							<xsl:when test="$feature_code='CfCND'">
								<spg:RPL_SS>
									 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
									 <spg:CLIP>0</spg:CLIP>
								</spg:RPL_SS>
							</xsl:when>
							<xsl:when test="$feature_code='CfCNIR'">
								<spg:RPL_SS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:CNIR>0</spg:CNIR>
								</spg:RPL_SS>
							</xsl:when>
							<xsl:when test="$feature_code='CfCW'">
								<spg:RPL_SS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:CW>0</spg:CW>
								</spg:RPL_SS>
							</xsl:when>
							<xsl:when test="$feature_code='CfDRCW'">
								<spg:RPL_DSTR>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								</spg:RPL_DSTR>
							</xsl:when>
							<xsl:when test="$feature_code='CfMC'">
								<spg:RPL_SS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:NPTY>0</spg:NPTY>
								</spg:RPL_SS>
							</xsl:when>
							<xsl:when test="$feature_code='CFNRVM'">
								<spg:RPL_SS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:CFNRVM>0</spg:CFNRVM>
								</spg:RPL_SS>
							</xsl:when>
							<xsl:when test="$feature_code='CfSCA'">
								<spg:RPL_SIC>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:SICIDX><xsl:value-of select="$SICIDX_value"/></spg:SICIDX>
								</spg:RPL_SIC>
							</xsl:when>
							<xsl:when test="$feature_code='CfSCF'">
								<spg:RPL_CFS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								</spg:RPL_CFS>
							</xsl:when>
							<xsl:when test="$feature_code='CfSCR'">
								<spg:RPL_SIC>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:SICIDX><xsl:value-of select="$SICIDX_value"/></spg:SICIDX>
								</spg:RPL_SIC>
							</xsl:when>
							<xsl:when test="$feature_code='CfSCT'">
								<spg:RPL_SS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:CRBT>0</spg:CRBT>
								</spg:RPL_SS>
							</xsl:when>
							<xsl:when test="$feature_code='CfSPCALL'">
								<spg:RPL_SPEED_DIAL>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								</spg:RPL_SPEED_DIAL>
							</xsl:when>
							<xsl:when test="$feature_code='CfTWC'">
								<spg:RPL_SS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:TPTY>0</spg:TPTY>
								</spg:RPL_SS>
							</xsl:when>
							<xsl:when test="$feature_code='CFUVM'">
								<spg:RPL_SS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:CFUVM>0</spg:CFUVM>
								</spg:RPL_SS>
							</xsl:when>
							<xsl:when test="$feature_code='CfWL'">
								<spg:RPL_HOTLINE>
									<spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								</spg:RPL_HOTLINE>
							</xsl:when>
						</xsl:choose>					
				   </soapenv:Body>
				</soapenv:Envelope>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>