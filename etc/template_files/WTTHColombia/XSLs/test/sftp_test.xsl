<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output doctype-system="CLIv4.dtd" method="xml" omit-xml-declaration="no" indent="no"/>
   <xsl:param name="user_sftp" />
      <xsl:param name="pass_sftp" />
      <xsl:param name="port" />
      <xsl:param name="path_xml_mov_to_ims" />
      <xsl:param name="path_xml_ims_to_mov" />
      <xsl:param name="action_sftp" />
      <xsl:param name="url_sftp" />
   <xsl:template match="/">
      <CLI dumpDialog="yes">
      	<Connect protocol="ssh" ssh.username="{$user_sftp}"  ssh.password="{$pass_sftp}" ssh.isEncrypted="no" ssh.known_hosts="c:/.ssh/known_hosts" ssh.identity="-" ssh.allow_host = "true">
    <Do description="Logging in" timeout="5">
     <Prompt>.*$</Prompt>
    </Do>
   </Connect>
      
      <Activate>
	      <xsl:if test=" $action_sftp = 'put'">
	         <Action description="Processing add command for file">
	            <Do>
	               <Command send_newline="yes">
	                   <!--put <xsl:value-of select="$path_xml_ims_to_mov" /-->
	                   ls
	               </Command>
	               
	            </Do>
	         </Action>
	         
	      </xsl:if>
	  </Activate>
      </CLI>
   </xsl:template>
</xsl:stylesheet>