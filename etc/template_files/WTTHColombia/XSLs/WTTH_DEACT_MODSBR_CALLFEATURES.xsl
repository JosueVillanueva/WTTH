<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name= "feature_code"/>
	<xsl:param name= "username"/>
	<xsl:param name= "password"/>	
	<xsl:param name= "telephone_number"/>


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
				<xsl:choose>
					<xsl:when test="$feature_code='CALL_BARRING'">
						<spg:NSCBA>0</spg:NSCBA>
					</xsl:when>
					<xsl:when test="$feature_code='CfAC'">
						<spg:NSCCBS>0</spg:NSCCBS>					
						<spg:NSRD>0</spg:NSRD>
					</xsl:when>
					<xsl:when test="$feature_code='CfACR'">
						<spg:NSACRM>0</spg:NSACRM>
					</xsl:when>
					<xsl:when test="$feature_code='CfAR'">
						<spg:NSCR>0</spg:NSCR>
					</xsl:when>
					<xsl:when test="$feature_code='CFBVM'">
						<spg:NSCFBVM>0</spg:NSCFBVM>
					</xsl:when>
					<xsl:when test="$feature_code='CfCBI'">
						<spg:NSICB>0</spg:NSICB>
					</xsl:when>
					<xsl:when test="$feature_code='CfCFBL'">
						<spg:NSCFB>0</spg:NSCFB>
					</xsl:when>
					<xsl:when test="$feature_code='CfCFDA'">
						<spg:NSCFNR>0</spg:NSCFNR>
					</xsl:when>
					<xsl:when test="$feature_code='CfCFV'">
						<spg:NSCFU>0</spg:NSCFU>
					</xsl:when>
					<xsl:when test="$feature_code='CfCIDB'">
						<spg:NSCLIR>0</spg:NSCLIR>
					</xsl:when>
					<xsl:when test="$feature_code='CfCIDCW'">
						<spg:NSCIDCW>0</spg:NSCIDCW>
					</xsl:when>
					<xsl:when test="$feature_code='CfCLI'">
						<spg:NSCOLR>0</spg:NSCOLR>
					</xsl:when>
					<xsl:when test="$feature_code='CfCND'">
						<spg:NSCLIP>0</spg:NSCLIP>
					</xsl:when>
					<xsl:when test="$feature_code='CfCNIR'">
						<spg:NSCNIR>0</spg:NSCNIR>
					</xsl:when>
					<xsl:when test="$feature_code='CfCW'">
						<spg:NSCW>0</spg:NSCW>
						<spg:NSCCW>0</spg:NSCCW>
					</xsl:when>
					<xsl:when test="$feature_code='CfDND'">
						<spg:NSDND>0</spg:NSDND>
					</xsl:when>
					<xsl:when test="$feature_code='CfDRCW'">
						<spg:NSDSTR>0</spg:NSDSTR>
					</xsl:when>
					<xsl:when test="$feature_code='CfMC'">
						<spg:NSNPTY>0</spg:NSNPTY>
					</xsl:when>
					<xsl:when test="$feature_code='CfMWI'">
						<spg:NSMWI>0</spg:NSMWI>
					</xsl:when>
					<xsl:when test="$feature_code='CFNRVM'">
						<spg:NSCFNRVM>0</spg:NSCFNRVM>
					</xsl:when>
					<xsl:when test="$feature_code='CfPINV'">
						<spg:CPC>0</spg:CPC>
						<spg:TFPT>0</spg:TFPT>
					</xsl:when>
					<xsl:when test="$feature_code='CfSCA'">
						<spg:NSSIC>0</spg:NSSIC>
					</xsl:when>
					<xsl:when test="$feature_code='CfSCF'">
						<spg:NSCFS>0</spg:NSCFS>
					</xsl:when>
					<xsl:when test="$feature_code='CfSCR'">
						<spg:NSSIC>0</spg:NSSIC>
					</xsl:when>
					<xsl:when test="$feature_code='CfSCT'">
						<spg:NSCRBT>0</spg:NSCRBT>
					</xsl:when>
					<xsl:when test="$feature_code='CfSPCALL'">
						<spg:NSSD1D>0</spg:NSSD1D>					
						<spg:NSSD2D>0</spg:NSSD2D>
					</xsl:when>
					<xsl:when test="$feature_code='CfTWC'">
						<spg:NS3PTY>0</spg:NS3PTY>
					</xsl:when>
					<xsl:when test="$feature_code='CFUVM'">
						<spg:NSCFUVM>0</spg:NSCFUVM>
					</xsl:when>
					<xsl:when test="$feature_code='CfWL'">
						<spg:NSHOTLINE>0</spg:NSHOTLINE>
					</xsl:when>
				</xsl:choose>					
			  </spg:MOD_SBR>
		   </soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>