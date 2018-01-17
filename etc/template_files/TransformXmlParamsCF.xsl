<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="no" method="xml" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<msg>
			<header>
				<xsl:for-each select="/msg/header/attribute">
					<xsl:element name="{name}">
						<xsl:value-of select="value"/>
					</xsl:element>
				</xsl:for-each>
			</header>
			<body>
				<xsl:for-each select="/msg/body/features/feature">
					<feature>
						<xsl:for-each select="attribute">
							<xsl:element name="{name}">
								<xsl:value-of select="new_value"/>
							</xsl:element>
						</xsl:for-each>
					</feature>
				</xsl:for-each>
			</body>
		</msg>
	</xsl:template>
</xsl:stylesheet>