<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hss="http://www.huawei.com/HSS" xmlns:spg="http://www.huawei.com/SPG" xmlns:ens="http://www.huawei.com/ENS">
	<xsl:output method="xml" omit-xml-declaration="yes" indent="no"/>
	<xsl:param name= "impi_value"/>	
	<xsl:param name= "husername"/>
	<xsl:param name= "pwd_value"/>
	<xsl:param name= "sub_id"/>
	<xsl:param name= "impu_value"/>
	<xsl:param name= "LP_value"/>
	<xsl:param name= "CSC_value"/>
	<xsl:param name= "UNAME_value"/>
	<xsl:param name= "LCT_value"/>
	<xsl:param name= "NTT_value"/>
	<xsl:param name= "ITT_value"/>
	<xsl:param name= "CCO1_value"/>
	<xsl:param name= "CCO5_value"/>
	<xsl:param name= "COP_value"/>
	<xsl:param name= "E164NUM_value"/>


	<xsl:template match="/" name="add_hhdainf">
		<hss:ADD_HHDAINF xsl:exclude-result-prefixes="hss spg ens">
			<hss:IMPI>
				<xsl:value-of select="$impi_value"/>@ims.claro.com.co</hss:IMPI>
			<hss:HUSERNAME>
				<xsl:value-of select="$husername"/>@ims.claro.com.co</hss:HUSERNAME>
			<hss:PWD>
				<xsl:value-of select="$pwd_value"/>
			</hss:PWD>
		</hss:ADD_HHDAINF>
	</xsl:template>

	<xsl:template match="/" name="add_hsub">
		<hss:ADD_HSUB xsl:exclude-result-prefixes="hss spg ens">
			<hss:SUBID>
				<xsl:value-of select="$sub_id"/>@ims.claro.com.co</hss:SUBID>
			<hss:IMPI>
				<xsl:value-of select="$impi_value"/>@ims.claro.com.co</hss:IMPI>
			<hss:IMPU>sip:<xsl:value-of select="$impu_value"/>@ims.claro.com.co</hss:IMPU>
		</hss:ADD_HSUB>
	</xsl:template>

	<xsl:template match="/" name="set_hvntplid">
		<hss:SET_HVNTPLID xsl:exclude-result-prefixes="hss spg ens">
			<hss:IMPU>sip:<xsl:value-of select="$impu_value"/>@ims.claro.com.co</hss:IMPU>
			<hss:VNTPLID>1</hss:VNTPLID>      
		</hss:SET_HVNTPLID>
	</xsl:template>

	<xsl:template match="/" name="set_hregauth">
		<hss:SET_HREGAUTH xsl:exclude-result-prefixes="hss spg ens">
			<hss:IMPU>sip:<xsl:value-of select="$impu_value"/>@ims.claro.com.co</hss:IMPU>
			<hss:REGAUTH>1</hss:REGAUTH>
		</hss:SET_HREGAUTH>
	</xsl:template>

	<xsl:template match="/" name="add_himpu">
		<hss:ADD_HIMPU xsl:exclude-result-prefixes="hss spg ens">
			<hss:IMPI>
				<xsl:value-of select="$impi_value"/>@ims.claro.com.co</hss:IMPI>
			<hss:IMPU>tel:<xsl:value-of select="$impu_value"/>
			</hss:IMPU>
			<hss:IMPUTYPE>1</hss:IMPUTYPE>
		</hss:ADD_HIMPU>
	</xsl:template>

	<xsl:template match="/" name="set_hirs">
		<hss:SET_HIRS xsl:exclude-result-prefixes="hss spg ens">
			<hss:IRSID>1</hss:IRSID>
			<hss:IMPULIST>"sip:<xsl:value-of select="$impi_value"/>@ims.claro.com.co"&amp;"tel:<xsl:value-of select="$impi_value"/>"</hss:IMPULIST>
		</hss:SET_HIRS>
	</xsl:template>

	<xsl:template match="/" name="set_hspshare">
		<hss:SET_HSPSHARE xsl:exclude-result-prefixes="hss spg ens">
			<hss:BASEIMPU>sip:<xsl:value-of select="$impu_value"/>@ims.claro.com.co</hss:BASEIMPU>
			<hss:IMPU>tel:<xsl:value-of select="$impu_value"/>
			</hss:IMPU>
		</hss:SET_HSPSHARE>
	</xsl:template>

	<xsl:template match="/" name="set_haliaspu">
		<hss:SET_HALIASPU xsl:exclude-result-prefixes="hss spg ens">
			<hss:ALIASID>1</hss:ALIASID>
			<hss:IMPULIST>"sip:<xsl:value-of select="$impi_value"/>@ims.claro.com.co"&amp;"tel:<xsl:value-of select="$impi_value"/>"</hss:IMPULIST>
		</hss:SET_HALIASPU>
	</xsl:template>

	<xsl:template match="/" name="add_hsifc">
		<hss:ADD_HSIFC xsl:exclude-result-prefixes="hss spg ens">
			<hss:IMPU>sip:<xsl:value-of select="$impu_value"/>@ims.claro.com.co</hss:IMPU>
			<hss:SIFCID>0</hss:SIFCID>
		</hss:ADD_HSIFC>
	</xsl:template>

	<xsl:template match="/" name="add_sbr">
		<spg:ADD_SBR xsl:exclude-result-prefixes="hss spg ens">
			<spg:IMPU>sip:<xsl:value-of select="$impu_value"/>@ims.claro.com.co</spg:IMPU>
			<spg:TEMPLATEIDX>65535</spg:TEMPLATEIDX>
			<spg:DPSIDX>1</spg:DPSIDX>
			<spg:LP>
				<xsl:value-of select="$LP_value"/>
			</spg:LP>     
			<spg:CSC>
				<xsl:value-of select="$CSC_value"/>
			</spg:CSC>     
			<spg:UNAME>
				<xsl:value-of select="$UNAME_value"/>
			</spg:UNAME>
			<spg:LCT>
				<xsl:value-of select="$LCT_value"/>
			</spg:LCT>
			<spg:NTT>
				<xsl:value-of select="$NTT_value"/>
			</spg:NTT>
			<spg:ITT>
				<xsl:value-of select="$ITT_value"/>
			</spg:ITT>
			<spg:UTYPE>0</spg:UTYPE>
			<spg:LCO>1</spg:LCO>
			<spg:LC>1</spg:LC>
			<spg:ICTX>1</spg:ICTX>
			<spg:OCTX>1</spg:OCTX>
			<spg:INTT>1</spg:INTT>
			<spg:IITT>1</spg:IITT>
			<spg:ICLT>1</spg:ICLT>
			<spg:ICDDD>1</spg:ICDDD>
			<spg:ICIDD>1</spg:ICIDD>
			<spg:IOLT>1</spg:IOLT>
			<spg:TIDHLD>28</spg:TIDHLD>
			<spg:TIDCW>2</spg:TIDCW>
			<spg:IDDCI>1</spg:IDDCI>
			<spg:NTCI>1</spg:NTCI>
			<spg:LTCI>1</spg:LTCI>
			<spg:G711_64K_A_LAW>1</spg:G711_64K_A_LAW>
			<spg:G711_64K_U_LAW>1</spg:G711_64K_U_LAW>
			<spg:T38>1</spg:T38>
			<spg:CHT>0</spg:CHT>
			<spg:PREPAIDIDX>65535</spg:PREPAIDIDX>
			<spg:VMAIND>1</spg:VMAIND>
			<spg:NSPREPAID>0</spg:NSPREPAID>
			<spg:ATSDTMBUSY>1</spg:ATSDTMBUSY>
			<spg:NOAT>30</spg:NOAT>
			<spg:ICPI>255</spg:ICPI>
			<spg:NSCBA>1</spg:NSCBA>
			<spg:NSCCBS>1</spg:NSCCBS>     
			<spg:NSACRM>1</spg:NSACRM>
			<spg:NSCR>1</spg:NSCR>
			<spg:NSCFU>1</spg:NSCFU>
			<spg:NSCLIR>1</spg:NSCLIR>
			<spg:NSCCW>1</spg:NSCCW>
			<spg:NSCLIP>1</spg:NSCLIP>
			<spg:NSCW>1</spg:NSCW>
			<spg:NSDND>1</spg:NSDND>
			<spg:NSDSTR>1</spg:NSDSTR>
			<spg:NSMWI>1</spg:NSMWI>
			<spg:NSCFS>1</spg:NSCFS>
			<spg:NSSIC>1</spg:NSSIC>
			<spg:NSSD1D>1</spg:NSSD1D>
			<spg:NS3PTY>1</spg:NS3PTY>
			<spg:NSCFB>0</spg:NSCFB>
			<spg:NSCFNR>0</spg:NSCFNR>
			<spg:NSMWI>1</spg:NSMWI>
			<spg:NSCIDCW>0</spg:NSCIDCW>
			<spg:NSWAKE_UP>1</spg:NSWAKE_UP>
			<spg:NSDSTR>1</spg:NSDSTR>
			<spg:NSACRM>1</spg:NSACRM>
			<spg:NSHOTLINE>0</spg:NSHOTLINE>
			<spg:NSCFBVM>1</spg:NSCFBVM>
			<spg:NSCFNRVM>1</spg:NSCFNRVM>
			<spg:NSICPS>0</spg:NSICPS>
			<spg:NSCCBS>0</spg:NSCCBS>
			<spg:NSSD2D>1</spg:NSSD2D>
			<spg:NSCNIR>1</spg:NSCNIR>
			<spg:NSCNIP>1</spg:NSCNIP>
			<spg:NSRD>1</spg:NSRD>
			<spg:CCO1>
				<xsl:value-of select="$CCO1_value"/>
			</spg:CCO1>
			<spg:CCO5>
				<xsl:value-of select="$CCO5_value"/>
			</spg:CCO5>
			<spg:OUTRST>0</spg:OUTRST>
			<spg:COP>
				<xsl:value-of select="$COP_value"/>
			</spg:COP>
		</spg:ADD_SBR>
	</xsl:template>

	<xsl:template match="/" name="add_dnaptrrec">
		<ens:ADD_DNAPTRREC xsl:exclude-result-prefixes="hss spg ens">
			<ens:E164NUM>
				<xsl:value-of select="$E164NUM_value"/>
			</ens:E164NUM>
			<ens:ZONENAME>e164.arpa</ens:ZONENAME>
			<ens:ORDER>10</ens:ORDER>
			<ens:PREFERENCE>20</ens:PREFERENCE>
			<ens:FLAGS>U</ens:FLAGS>
			<ens:SERVICE>E2U+sip</ens:SERVICE>
			<ens:REGEXP>!(^.*)$!sip:<xsl:value-of select="$impu_value"/>@ims.claro.com.co!</ens:REGEXP>
		</ens:ADD_DNAPTRREC>
	</xsl:template>

	<xsl:template match="/" name="reg_comss">
		<spg:REG_COMSS xsl:exclude-result-prefixes="hss spg ens">
			<spg:IMPU>sip:<xsl:value-of select="$impu_value"/>@ims.claro.com.co</spg:IMPU>
			<spg:REGFLAG>1</spg:REGFLAG>
		</spg:REG_COMSS>
	</xsl:template>
	
	<xsl:template match="/" name="rmv_dnaptrrec">
		<ens:RMV_DNAPTRREC>
		 <!--Optional:-->
		 <ens:E164NUM><xsl:value-of select="$E164NUM_value"/></ens:E164NUM>
		 <!--Optional:-->
		 <ens:ZONENAME>e164.arpa</ens:ZONENAME>
		</ens:RMV_DNAPTRREC>
	</xsl:template>
	
	<xsl:template match="/" name="rmv_sbr">
		<spg:RMV_SBR>
		 <spg:IMPU>sip:<xsl:value-of select="$impu_value"/>@ims.claro.com.co</spg:IMPU>
		</spg:RMV_SBR>
	</xsl:template>
	
	<xsl:template match="/" name="rmv_himpu">
		<hss:RMV_HIMPU>
           <hss:IMPU>tel:<xsl:value-of select="$impu_value"/></hss:IMPU>
        </hss:RMV_HIMPU>
	</xsl:template>
	
	<xsl:template match="/" name="rmv_hsub">
		<hss:RMV_HSUB>
		 <hss:SUBID><xsl:value-of select="$sub_id"/>@ims.claro.com.co</hss:SUBID>
		</hss:RMV_HSUB>
	</xsl:template>
	
	<xsl:template match="/" name="rmv_hhdainf">
		<hss:RMV_HHDAINF>
		 <hss:IMPI><xsl:value-of select="$impi_value"/>@ims.claro.com.co</hss:IMPI>
		</hss:RMV_HHDAINF>
	</xsl:template>
</xsl:stylesheet>