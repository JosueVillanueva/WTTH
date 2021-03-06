<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name= "username"/>
	<xsl:param name= "password"/>
	<xsl:param name= "MEName_value"/>
	<!--xsl:param name= "husername"/-->
	<xsl:param name= "telephone_WO_c"/>
	<xsl:param name= "pwd_value"/>
	<!--xsl:param name= "sub_id"/-->
	<xsl:param name= "telephone_full"/>
	<xsl:param name= "which_xml"/>
	<xsl:param name= "LP_value"/>
	<xsl:param name= "CSC_value"/>
	<!--xsl:param name= "UNAME_value"/-->
	<xsl:param name= "LCT_value"/>
	<xsl:param name= "NTT_value"/>
	<xsl:param name= "ITT_value"/>
	<xsl:param name= "CCO1_value"/>
	<xsl:param name= "CCO5_value"/>
	<xsl:param name= "COP_value"/>
	<xsl:param name= "authurl"/>
	<xsl:param name= "telephone"/>
	<xsl:param name= "ciy_code"/>
	<xsl:param name= "country_code"/>


	<xsl:template match="/">
		<xsl:import href="create_body.xsl"/>
		<S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/">
			<S:Header>
				<Authentication xmlns="http://www.huawei.com/SPG">
					<ResendFlag>?</ResendFlag>
					<Username><xsl:value-of select="$username"/></Username>
					<Password><xsl:value-of select="$password"/></Password>
					<MessageID>?</MessageID>
				</Authentication>
			</S:Header>
			<S:Body>
				<xsl:choose>
					<xsl:when test="$which_xml='ADD_SBR'">
						<xsl:call-template name="add_sbr">
							<xsl:with-param name="telephone_full" select="$telephone_full"/>
							<xsl:with-param name="authurl" select="$authurl"/>
							<xsl:with-param name="LP_value" select="$LP_value"/>
							<xsl:with-param name="CSC_value" select="$CSC_value"/>
							<xsl:with-param name="LCT_value" select="$LCT_value"/>
							<xsl:with-param name="NTT_value" select="$NTT_value"/>
							<xsl:with-param name="ITT_value" select="$ITT_value"/>
							<xsl:with-param name="CCO1_value" select="$CCO1_value"/>
							<xsl:with-param name="CCO5_value" select="$CCO5_value"/>
							<xsl:with-param name="COP_value" select="$COP_value"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$which_xml='AddNAPTRRecord'">
						<xsl:call-template name="add_naptrrecord">
							<xsl:with-param name="telephone_WO_c" select="$telephone_WO_c"/>
							<xsl:with-param name="authurl" select="$authurl"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$which_xml='AddIMSSub'">
						<xsl:call-template name="add_imssub">
							<xsl:with-param name="telephone" select="$telephone"/>
							<xsl:with-param name="ciy_code" select="$ciy_code"/>
							<xsl:with-param name="country_code" select="$country_code"/>
							<xsl:with-param name="authurl" select="$authurl"/>
							<xsl:with-param name="pwd_value" select="$pwd_value"/>
							<xsl:with-param name="telephone_full" select="$telephone_full"/>
						</xsl:call-template>
					</xsl:when>
				</xsl:choose>
			</S:Body>
		</S:Envelope>
		<!--xsl:choose>
			<xsl:when test="$which_xml='ADD_SBR'">
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
						<xsl:call-template name="add_sbr">
							<xsl:with-param name="LP_value" select="$LP_value"/>
							<xsl:with-param name="CSC_value" select="$CSC_value"/>
							<xsl:with-param name="UNAME_value" select="$UNAME_value"/>
							<xsl:with-param name="LCT_value" select="$LCT_value"/>
							<xsl:with-param name="NTT_value" select="$NTT_value"/>
							<xsl:with-param name="ITT_value" select="$ITT_value"/>
							<xsl:with-param name="CCO1_value" select="$CCO1_value"/>
							<xsl:with-param name="CCO5_value" select="$CCO5_value"/>
							<xsl:with-param name="COP_value" select="$COP_value"/>
						</xsl:call-template>
					</soapenv:Body>
				</soapenv:Envelope>
			</xsl:when>
			<xsl:when test="$which_xml='REG_COMSS'">
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
						<xsl:call-template name="reg_comss">
							<xsl:with-param name="telephone_full" select="$telephone_full"/>
						</xsl:call-template>
					</soapenv:Body>
				</soapenv:Envelope>
			</xsl:when-->
			<!--xsl:when test="$which_xml='ADD_DNAPTRREC'">
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
						<xsl:call-template name="add_dnaptrrec">
							<xsl:with-param name="telephone_full" select="$telephone_full"/>
							<xsl:with-param name="telephone_WO_c" select="$telephone_WO_c"/>
						</xsl:call-template>
					</soapenv:Body>
				</soapenv:Envelope>
			</xsl:when-->
			<!--xsl:otherwise>
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
							<xsl:when test="$which_xml='ADD_HHDAINF'">
								<xsl:call-template name="add_hhdainf">
									<xsl:with-param name="telephone_full" select="$telephone_full"/>
									<xsl:with-param name="husername" select="$husername"/>
									<xsl:with-param name="pwd_value" select="$pwd_value"/>
									<xsl:with-param name="authurl" select="$authurl"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="$which_xml='ADD_HSUB'">
								<xsl:call-template name="add_hsub">
									<xsl:with-param name="sub_id" select="$sub_id"/>
									<xsl:with-param name="telephone_full" select="$telephone_full"/>
									<xsl:with-param name="authurl" select="$authurl"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="$which_xml='SET_HVNTPLID'">
								<xsl:call-template name="set_hvntplid">
									<xsl:with-param name="telephone_full" select="$telephone_full"/>
									<xsl:with-param name="authurl" select="$authurl"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="$which_xml='SET_HREGAUTH'">
								<xsl:call-template name="set_hregauth">
									<xsl:with-param name="telephone_full" select="$telephone_full"/>
									<xsl:with-param name="authurl" select="$authurl"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="$which_xml='ADD_HIMPU'">
								<xsl:call-template name="add_himpu">
									<xsl:with-param name="telephone_full" select="$telephone_full"/>
									<xsl:with-param name="authurl" select="$authurl"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="$which_xml='SET_HIRS'">
								<xsl:call-template name="set_hirs">
									<xsl:with-param name="telephone_full" select="$telephone_full"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="$which_xml='SET_HSPSHARE'">
								<xsl:call-template name="set_hspshare">
									<xsl:with-param name="telephone_full" select="$telephone_full"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="$which_xml='SET_HALIASPU'">
								<xsl:call-template name="set_haliaspu">
									<xsl:with-param name="telephone_full" select="$telephone_full"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="$which_xml='ADD_HSIFC'">
								<xsl:call-template name="add_hsifc">
									<xsl:with-param name="telephone_full" select="$telephone_full"/>
									<xsl:with-param name="telephone_full" select="$telephone_full"/>
								</xsl:call-template>
							</xsl:when>
						</xsl:choose>
					</soapenv:Body>
				</soapenv:Envelope>
			</xsl:otherwis>
		</xsl:choose-->
	</xsl:template>
</xsl:stylesheet>