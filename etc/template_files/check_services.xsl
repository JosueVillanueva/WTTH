<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="account_number" />
	<xsl:param name="wtth_result_code" />
	<xsl:param name="wtth_result_desc" />
	<xsl:param name="account_status" />
	<xsl:param name="controller_JOB_ID" />
	<xsl:param name="ssw_id" />
	<xsl:param name="fixed_telephone" />
	<xsl:param name="mobile_telephone" />
	<xsl:param name="service_type" />
	<xsl:param name="service_id" />
	<xsl:param name="geo_id" />
	<xsl:template match="/">
	<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
   	<soap:Body>
      <ns1:InquiryRequestResponse xmlns:ns1="http://docsis1.activator.hp.com/">
         <ReturnTypeInquiryRequest>
            <xml_outputmessage>
              <!--[CDATA[-->
                <msg>
                  <header>
                    <attribute>
                      <name>account_number</name>
                      <value><xsl:value-of select="$account_number" /></value>
                    </attribute>
                    
                    <attribute>
                      <name>code</name>
                      <value><xsl:value-of select="$wtth_result_code" /></value>
                    </attribute>
                    <attribute>
                      <name>description</name>
                      <value><xsl:value-of select="$wtth_result_desc" /></value>
                    </attribute>
                    <attribute>
                      <name>account_status</name>
                      <value><xsl:value-of select="$account_status" /></value>
                    </attribute>
                    <attribute>
                      <name>transaction_id</name>
                      <value><xsl:value-of select="$controller_JOB_ID" /></value>
                    </attribute>
                  </header>
                  <body>
                    <devices>
                      <voice>
                        <telephone>
                          <attribute>
                            <name>ssw_id</name>
                            <value><xsl:value-of select="$ssw_id" /></value>
                          </attribute>
                          <attribute>
                            <name>telephone_number</name>
                            <value><xsl:value-of select="$fixed_telephone" /></value>
                          </attribute>
                          <attribute>
                            <name>mobile_number</name>
                            <value><xsl:value-of select="$mobile_telephone" /></value>
                          </attribute>
                          
                          <attribute>
                            <name>service_id</name>
                            <value><xsl:value-of select="$service_id" /></value>
                          </attribute>
                          <attribute>
                            <name>geographical_location_id</name>
                            <value><xsl:value-of select="$geo_id" /></value>
                          </attribute>
                          <attribute>
                            <name>service_type</name>
                            <value><xsl:value-of select="$service_type" /></value>
                          </attribute>
                          <attribute>
                            <name>port</name>
                            <value>1</value>
                          </attribute>
                        </telephone>
                      </voice>
                    </devices>
                  </body>
                </msg>
              <!--]]>-->
  
</xml_outputmessage>
         </ReturnTypeInquiryRequest>
      </ns1:InquiryRequestResponse>
   </soap:Body>
</soap:Envelope>
	</xsl:template>
</xsl:stylesheet>