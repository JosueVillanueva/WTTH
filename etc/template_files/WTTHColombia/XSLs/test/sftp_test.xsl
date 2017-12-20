<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output doctype-system="CLIv4.dtd" method="xml" omit-xml-declaration="no" indent="yes"/>
   <xsl:param name="user_sftp" />
      <xsl:param name="pass_sftp" />
      <xsl:param name="port" />
      <xsl:param name="path_xml_mov_to_ims"/>
      
      
      <xsl:param name="action_sftp" />
      <xsl:param name="url_sftp" />
      <xsl:param name= "table_ims_to_mov"/>
      <xsl:param name= "table_mov_to_ims"/>
   <xsl:template match="/">
      <CLI dumpDialog="yes">
      	<Connect protocol="ssh" ssh.username="{$user_sftp}"  ssh.password="{$pass_sftp}" ssh.isEncrypted="no" ssh.known_hosts="c:/.ssh/known_hosts" ssh.identity="-" ssh.allow_host = "true">
    <Do description="Logging in" timeout="5">
     <Prompt>.*$</Prompt>
    </Do>
   </Connect>
      
      <Activate>
	      
	         <Action description="Update table ims to mov">
	            <Do>
	               <Command send_newline="yes">
	                   notify lrtd refresh <xsl:value-of select="$table_ims_to_mov"/>
	               </Command>
	            </Do>
	         </Action>
	         
	      	 <Action description="Update table mov to ims">
	            <Do>
	               <Command send_newline="yes">
	                   notify lrtd refresh <xsl:value-of select="$table_mov_to_ims"/>
	               </Command>
	            </Do>
	         </Action>
           <Action description="Exit">
	            <Do>
	               <Command send_newline="yes">
	                   exit
	               </Command>
	            </Do>
	         </Action>
           <Action description="Exit2">
	            <Do>
	               <Command send_newline="yes">
	                   exit
	               </Command>
	            </Do>
	         </Action>        
                   
                   
	  </Activate>
      </CLI>
   </xsl:template>
</xsl:stylesheet>