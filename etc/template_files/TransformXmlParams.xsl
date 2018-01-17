<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" omit-xml-declaration="yes" indent="no"/>
	<xsl:template match="/">
		<msg>
			<header>
				<xsl:for-each select="/msg/header/attribute">
					<xsl:element  name="{name}">
						<xsl:value-of select="value" />
					</xsl:element>
				</xsl:for-each>
			</header>		
			<body>
				<service>
				<xsl:for-each select="/msg/body/voice/telephone/attribute">
					<xsl:element  name="{name}">
						<new_value>
							<xsl:value-of select="new_value" />
						</new_value>
						<old_value>
							<xsl:value-of select="old_value" />
						</old_value>
					</xsl:element>
				</xsl:for-each>
				</service>
			</body>
		</msg>
	</xsl:template>
</xsl:stylesheet>