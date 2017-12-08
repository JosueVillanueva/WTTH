<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name= "feature_code"/>
	<xsl:param name= "username"/>
	<xsl:param name= "password"/>	
	<xsl:param name= "telephone_number"/>
	<xsl:param name= "AGCFName_value"/>
	<xsl:param name= "PUI_value"/>
	<xsl:param name= "CBABLV_value"/>
	<xsl:param name= "COP_value"/>
	<xsl:param name= "DIMPU_value"/>
	<xsl:param name= "GMODE_value"/>
	<xsl:param name= "PATTERN_value"/>
	<xsl:param name= "CWPATTERN_value"/>
	<xsl:param name= "SIMPU_value"/>
	<xsl:param name= "SIIMPU_value"/>
	<xsl:param name= "CSIMPU_value"/>
	<xsl:param name= "FTIMPU_value"/>
	<xsl:param name= "ABBRNUMBER_value"/>
	<xsl:param name= "DESTIMPU_value"/>
	<xsl:param name= "TPTY_value"/>
	<xsl:param name= "HLIIMPU_value"/>


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
								<spg:REG_CBA>
									 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
									 <spg:CBABLV><xsl:value-of select="$CBABLV_value"/></spg:CBABLV>
									 <spg:COP><xsl:value-of select="$COP_value"/></spg:COP>					 
								</spg:REG_CBA>
							</xsl:when>
							<xsl:when test="$feature_code='CfAC'">
								<spg:REG_COMSS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:CCBS>1</spg:CCBS>					 
								</spg:REG_COMSS>
							</xsl:when>
							<xsl:when test="$feature_code='CfACR'">
								<spg:REG_COMSS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:ACR>1</spg:ACR>
								</spg:REG_COMSS>
							</xsl:when>
							<xsl:when test="$feature_code='CFBVM'">
								<spg:REG_COMSS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:CFBVM>1</spg:CFBVM>					 
								</spg:REG_COMSS>
							</xsl:when>
							<xsl:when test="$feature_code='CfCFBL'">
								<spg:REG_CFB>
									<spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
									<spg:DIMPU><xsl:value-of select="$DIMPU_value"/></spg:DIMPU>
								</spg:REG_CFB>
							</xsl:when>
							<xsl:when test="$feature_code='CfCFDA'">
								<spg:REG_CFNR>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:DIMPU><xsl:value-of select="$DIMPU_value"/></spg:DIMPU>
								</spg:REG_CFNR>
							</xsl:when>
							<xsl:when test="$feature_code='CfCFV'">
								<spg:REG_CFU>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:DIMPU><xsl:value-of select="$DIMPU_value"/></spg:DIMPU>
								</spg:REG_CFU>
							</xsl:when>
							<xsl:when test="$feature_code='CfCIDB'">
								<spg:REG_CLIR>
									 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
									 <spg:GMODE><xsl:value-of select="$GMODE_value"/></spg:GMODE>
								</spg:REG_CLIR>
							</xsl:when>
							<xsl:when test="$feature_code='CfCIDCW'">
								<spg:REG_COMSS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:CIDCW>1</spg:CIDCW>
								</spg:REG_COMSS>
							</xsl:when>
							<xsl:when test="$feature_code='CfCLI'">
								<spg:REG_COLR>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:STYPE>0</spg:STYPE>
								</spg:REG_COLR>
							</xsl:when>
							<xsl:when test="$feature_code='CfCND'">
								<spg:REG_COMSS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:CLIP>1</spg:CLIP>
								</spg:REG_COMSS>
							</xsl:when>
							<xsl:when test="$feature_code='CfCNIR'">
								<spg:REG_COMSS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:CNIR>1</spg:CNIR>
								</spg:REG_COMSS>
							</xsl:when>
							<xsl:when test="$feature_code='CfCW'">
								<spg:REG_COMSS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:CW>1</spg:CW>
								</spg:REG_COMSS>
							</xsl:when>
							<xsl:when test="$feature_code='CfDRCW'">
								<spg:REG_DSTR>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:PATTERN><xsl:value-of select="$PATTERN_value"/></spg:PATTERN>
								 <spg:CWPATTERN><xsl:value-of select="$CWPATTERN_value"/></spg:CWPATTERN>
								 <spg:SIMPU><xsl:value-of select="$SIMPU_value"/></spg:SIMPU>
								</spg:REG_DSTR>
							</xsl:when>
							<xsl:when test="$feature_code='CfMC'">
								<spg:REG_COMSS>
									<spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
									<spg:NPTY>1</spg:NPTY>						
								</spg:REG_COMSS>
							</xsl:when>
							<xsl:when test="$feature_code='CFNRVM'">
								<spg:REG_COMSS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:CFNRVM>1</spg:CFNRVM>					 
								</spg:REG_COMSS>
							</xsl:when>
							<xsl:when test="$feature_code='CfSCA'">
								<spg:REG_SIC>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:SIIMPU><xsl:value-of select="$SIIMPU_value"/></spg:SIIMPU>
								 <spg:SICPER>1</spg:SICPER>
								</spg:REG_SIC>
							</xsl:when>
							<xsl:when test="$feature_code='CfSCF'">
								<spg:REG_CFS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:CSIMPU><xsl:value-of select="$CSIMPU_value"/></spg:CSIMPU>
								 <spg:FTIMPU><xsl:value-of select="$FTIMPU_value"/></spg:FTIMPU>
								</spg:REG_CFS>
							</xsl:when>
							<xsl:when test="$feature_code='CfSCR'">
								<spg:REG_SIC>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:SIIMPU><xsl:value-of select="$SIIMPU_value"/></spg:SIIMPU>
								 <spg:SICPER>0</spg:SICPER>
								</spg:REG_SIC>
							</xsl:when>
							<xsl:when test="$feature_code='CfSCT'">
								<spg:REG_COMSS>
									<spg:CRBT>1</spg:CRBT>
									<spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								</spg:REG_COMSS>
							</xsl:when>
							<xsl:when test="$feature_code='CfSPCALL'">
								<spg:REG_SPEED_DIAL>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:ABBRNUMBER><xsl:value-of select="$ABBRNUMBER_value"/></spg:ABBRNUMBER>
								 <spg:DESTIMPU><xsl:value-of select="$DESTIMPU_value"/></spg:DESTIMPU>
								</spg:REG_SPEED_DIAL>
							</xsl:when>
							<xsl:when test="$feature_code='CfTWC'">
								<spg:REG_COMSS>
								 <spg:ACR>1</spg:ACR>
								 <spg:TPTY>tel:<xsl:value-of select="$telephone_number"/></spg:TPTY>
								</spg:REG_COMSS>
							</xsl:when>
							<xsl:when test="$feature_code='CFUVM'">
								<spg:REG_COMSS>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:CFUVM>1</spg:CFUVM>					 
								</spg:REG_COMSS>
							</xsl:when>
							<xsl:when test="$feature_code='CfWL'">
								<spg:REG_HOTLINE>
								 <spg:IMPU>tel:<xsl:value-of select="$telephone_number"/></spg:IMPU>
								 <spg:HLITYPE>0</spg:HLITYPE>
								 <spg:HLIIMPU><xsl:value-of select="$HLIIMPU_value"/></spg:HLIIMPU>
								</spg:REG_HOTLINE>
							</xsl:when>
						</xsl:choose>					
				   </soapenv:Body>
				</soapenv:Envelope>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>