<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name= "username"/>
	<xsl:param name= "password"/>
	<xsl:param name= "MEName_value"/>
	<!--xsl:param name= "husername"/-->
	<xsl:param name= "telephone_WO_c"/>
	<!--xsl:param name= "sub_id"/-->
	<xsl:param name= "telephone_full"/>
	<xsl:param name= "which_xml"/>
	<!--xsl:param name= "UNAME_value"/-->
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
					<Username><xsl:value-of select="$username" /></Username>
					<Password><xsl:value-of select="$password" /></Password>
					<MessageID>?</MessageID>
				</Authentication>
			</S:Header>
			<S:Body>
				<xsl:choose>
					<xsl:when test="$which_xml='RMV_SBR'">
						<xsl:call-template name="rmv_sbr">
							<xsl:with-param name="telephone_full" select="$telephone_full"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$which_xml='RmvNAPTRRecord'">
						<xsl:call-template name="rmv_dnaptrrec">
							<xsl:with-param name="telephone_WO_c" select="$telephone_WO_c"/>
							<xsl:with-param name="authurl" select="$authurl"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$which_xml='RmvIMSSub'">
						<xsl:call-template name="rmv_imssub">
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
	</xsl:template>
</xsl:stylesheet>