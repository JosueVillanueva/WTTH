<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="sftp_operation"/>
	<xsl:param name="local_file_path_sftp"/>
	<xsl:param name="remote_file_path_sftp"/>
	<xsl:param name="local_file_name_sftp"/>
	<xsl:param name="remote_file_name_sftp"/>
	<xsl:template match="/">
		<!-- START copying last commands from input XML -->
		<commands>
			<xsl:for-each select="commands/command">
				<command>
					<do>
						<operation><xsl:value-of select="do/operation" /></operation>
						<local_file_path><xsl:value-of select="do/local_file_path_sftp" /></local_file_path>
						<local_file_name><xsl:value-of select="do/local_file_name_sftp" /></local_file_name>
						<remote_file_path><xsl:value-of select="do/remote_file_path_sftp" /></remote_file_path>
						<remote_file_name><xsl:value-of select="do/remote_file_name_sftp" /></remote_file_name>
					</do>
					<undo>
						<operation><xsl:value-of select="undo/operation" /></operation>
						<local_file_path><xsl:value-of select="undo/local_file_path_sftp" /></local_file_path>
						<local_file_name><xsl:value-of select="undo/local_file_name_sftp" /></local_file_name>
						<remote_file_path><xsl:value-of select="undo/remote_file_path_sftp" /></remote_file_path>
						<remote_file_name><xsl:value-of select="do/remote_file_name_sftp" /></remote_file_name>
					</undo>
				</command>
			</xsl:for-each>
			<command>
				<do>
					<operation><xsl:value-of select="$sftp_operation" /></operation>
					<local_file_path><xsl:value-of select="$local_file_path_sftp" /></local_file_path>
					<local_file_name><xsl:value-of select="$local_file_name_sftp" /></local_file_name>
					<remote_file_path><xsl:value-of select="$remote_file_path_sftp" /></remote_file_path>
					<remote_file_name><xsl:value-of select="$remote_file_name_sftp" /></remote_file_name>
				</do>
				<undo>
					<operation>
						<xsl:choose>
							<xsl:when test="$sftp_operation = 'put'">delete</xsl:when>
							<xsl:otherwise>noundo</xsl:otherwise>
						</xsl:choose>
					</operation>
					<local_file_path><xsl:value-of select="$local_file_path_sftp"/></local_file_path>
					<local_file_name><xsl:value-of select="$local_file_name_sftp"/></local_file_name>
					<remote_file_path><xsl:value-of select="$remote_file_path_sftp"/></remote_file_path>
					<remote_file_name><xsl:value-of select="$remote_file_name_sftp" /></remote_file_name>
				</undo>
			</command>
		</commands>
	</xsl:template>
</xsl:stylesheet>