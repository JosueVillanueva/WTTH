<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name= "username"/>
	<xsl:param name= "password"/>
	<xsl:param name= "MEName_value"/>
	<xsl:param name= "impi_value"/>
	<xsl:param name= "sub_id"/>
	<xsl:param name= "impu_value"/>
	<xsl:param name= "which_xml"/>
	<xsl:param name= "E164NUM_value"/>


	<xsl:template match="/">
		<xsl:import href="create_body.xsl"/>
		<xsl:choose>
			<xsl:when test="$which_xml='RMV_SBR'">
				<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:spg="http://www.huawei.com/SPG">
					<soapenv:Header>
						<spg:ResendFlag>?</spg:ResendFlag>
						<spg:Authentication>
							<spg:Username>
								<xsl:value-of select="$username"/>
							</spg:Username>
							<spg:Password>
								<xsl:value-of select="$password"/>
							</spg:Password>
						</spg:Authentication>
						<spg:MessageID/>
					</soapenv:Header>
					<soapenv:Body>
						<xsl:call-template name="rmv_sbr">
							<xsl:with-param name="impu_value" select="$impu_value"/>
						</xsl:call-template>
					</soapenv:Body>
				</soapenv:Envelope>
			</xsl:when>
			<xsl:when test="$which_xml='RMW_DNAPTRREC'">
				<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ens="http://www.huawei.com/ENS">
					<soapenv:Header>
						<ens:MessageID>?</ens:MessageID>
						<ens:MEName>
							<xsl:value-of select="$MEName_value"/>
						</ens:MEName>
						<ens:Authentication>
							<ens:Username>
								<xsl:value-of select="$username"/>
							</ens:Username>
							<ens:Password>
								<xsl:value-of select="$password"/>
							</ens:Password>
						</ens:Authentication>
					</soapenv:Header>
					<soapenv:Body>
						<xsl:call-template name="rmv_dnaptrrec">
							<xsl:with-param name="E164NUM_value" select="$E164NUM_value"/>
						</xsl:call-template>
					</soapenv:Body>
				</soapenv:Envelope>
			</xsl:when>
			<xsl:otherwise>
				<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:hss="http://www.huawei.com/HSS">
					<soapenv:Header>
						<hss:MessageID>?</hss:MessageID>
						<hss:MEName>
							<xsl:value-of select="$MEName_value"/>
						</hss:MEName>
						<hss:Authentication>
							<hss:Username>
								<xsl:value-of select="$username"/>
							</hss:Username>
							<hss:Password>
								<xsl:value-of select="$password"/>
							</hss:Password>
						</hss:Authentication>
					</soapenv:Header>
					<soapenv:Body>
						<xsl:choose>
							<xsl:when test="$which_xml='RMV_HHDAINF'">
								<xsl:call-template name="rmv_hhdainf">
									<xsl:with-param name="impi_value" select="$impi_value"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="$which_xml='RMV_HSUB'">
								<xsl:call-template name="rmv_hsub">
									<xsl:with-param name="sub_id" select="$sub_id"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="$which_xml='RMV_HIMPU'">
								<xsl:call-template name="rmv_himpu">
									<xsl:with-param name="impu_value" select="$impu_value"/>
								</xsl:call-template>
							</xsl:when>
						</xsl:choose>
					</soapenv:Body>
				</soapenv:Envelope>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>