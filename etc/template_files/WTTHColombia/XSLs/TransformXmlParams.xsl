<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" omit-xml-declaration="yes" indent="no"/>
	<xsl:template match="/">
		<msg>
			<header>
				<xsl:for-each select="/msg/header/params">

					<xsl:element  name="{name}">
						<xsl:value-of select="value" />
					</xsl:element>
				</xsl:for-each>
			</header>
			<body>
				<service>
					<xsl:apply-templates select="/msg/body/service/*"/>
				</service>
			</body>
		</msg>
	</xsl:template>
	<xsl:template match="*">
		<xsl:choose>
			<xsl:when test="name()!='params'">
				<xsl:element  name="{name()}">
					<xsl:apply-templates select="*"/>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element  name="{name}">
					<xsl:value-of select="value" />
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template> 
</xsl:stylesheet>