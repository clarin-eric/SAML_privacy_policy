<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="about:local"
    exclude-result-prefixes="xs"
    version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:param
        name="entityID"/>
    <xsl:output
        method="xhtml"/>
    <!-- doctype-system="about:legacy-compat" -->
    <xsl:template
        match="text( )|@*"> </xsl:template>
    <xsl:template
        match="/">
        <html>
            <head>
                <title>Privacy policy (English)</title>
                <meta
                    name="viewport"
                    content="width=device-width, initial-scale=1"/>
                <title>Privacy policy (English)</title>
                <link
                    rel="stylesheet"
                    href="https://infra.clarin.eu/content/Centre_Registry/CLARIN_style/1.0/_.scss.css"/>
                <link
                    rel="shortcut icon"
                    href="https://infra.clarin.eu/content/Centre_Registry/CLARIN_style/1.0/CLARIN_favicon.gif"/>
            </head>
            <body>
                <div
                    id="header"
                    class="periphery"
                    role="navigation">
                    <div
                        id="brand">
                        <span>Privacy policy</span>
                    </div>
                    <div
                        id="menu"> </div>
                    <div
                        id="login"> </div>
                </div>
                <div
                    id="content">

                    <xsl:apply-templates/>
                </div>
                <div
                    id="footer"
                    class="periphery">
                    <span> </span>
                    <a
                        title="CLARIN ERIC"
                        href="https://www.clarin.eu/">
                        <img
                            src="https://infra.clarin.eu/content/Centre_Registry/CLARIN_style/1.0/CLARIN-Logo_4C14pure3_noextraneouscanvas.png"
                            alt="CLARIN ERIC logo"/>
                    </a>
                    <span> </span>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template
        xmlns="http://www.w3.org/1999/xhtml"
        match="//md:EntityDescriptor[@entityID=$entityID]"
        xmlns:md="urn:oasis:names:tc:SAML:2.0:metadata"
        xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion"
        xmlns:mdattr="urn:oasis:names:tc:SAML:metadata:attribute"
        xmlns:mdui="urn:oasis:names:tc:SAML:metadata:ui">
        <!-- A map of attribute FriendlyName to a description. Only attributes in the eduGAIN attribute profile, REFEDS R&S mentioned attributes and similarly elementary attributes are predefined here, but others can be added. -->
        <xsl:variable
            name="attribute_description"
            xmlns="">
            <entry
                key="displayName"
                url="http://software.internet2.edu/eduperson/internet2-mace-dir-eduperson-201310.html#displayName"
                description="your full name formatted for displaying"/>
            <entry
                key="cn"
                url="http://software.internet2.edu/eduperson/internet2-mace-dir-eduperson-201310.html#cn"
                description="typically your full name"/>
            <entry
                key="givenName"
                url="http://software.internet2.edu/eduperson/internet2-mace-dir-eduperson-201310.html#givenName"
                description="your given name"/>
            <entry
                key="eduPersonEntitlement"
                url="http://software.internet2.edu/eduperson/internet2-mace-dir-eduperson-201310.html#eduPersonEntitlement"
                description="a code that indicates your rights to specific classes of resources"/>
            <entry
                key="eduPersonPrincipalName"
                url="http://software.internet2.edu/eduperson/internet2-mace-dir-eduperson-201310.html#eduPersonPrincipalName"
                description="an e-mail-address-like code that identifies your name and the administrative domain you fall under at the institution"/>
            <entry
                key="sn"
                url="http://software.internet2.edu/eduperson/internet2-mace-dir-eduperson-201310.html#sn"
                description="your surname"/>
            <entry
                key="mail"
                url="http://software.internet2.edu/eduperson/internet2-mace-dir-eduperson-201310.html#mail"
                description="your e-mail address"/>
            <entry
                key="eduPersonAffiliation"
                url="http://software.internet2.edu/eduperson/internet2-mace-dir-eduperson-201310.html#eduPersonAffiliation"
                description="your relationship(s) to the institution in broad categories such as student, faculty, staff, alum, etc."/>
            <entry
                key="eduPersonScopedAffiliation"
                url="http://software.internet2.edu/eduperson/internet2-mace-dir-eduperson-201310.html#eduPersonScopedAffiliation"
                description="your relationship(s) to the institution in broad categories such as student, faculty, staff, alum, etc."/>
            <entry
                key="eduPersonTargetedID"
                url="http://software.internet2.edu/eduperson/internet2-mace-dir-eduperson-201310.html#eduPersonTargetedID"
                description="your permanent privacy-preserving (opaque) identity code at the institution"/>
            <entry
                key="schacHomeOrganization"
                url="https://wiki.refeds.org/display/STAN/schacHomeOrganization"
                description="your home organization"/>
        </xsl:variable>
        <xsl:variable
            name="entity"
            select="md:SPSSODescriptor | md:IDPSSODescriptor"/>
        <xsl:variable
            name="mdui"
            select="$entity/md:Extensions[1]/mdui:UIInfo[1]"/>
        <xsl:variable
            name="DisplayName"
            select="$mdui/mdui:DisplayName[@xml:lang='en'][1]/text()"
            as="xs:string"/>
        <xsl:variable
            name="Description"
            select="$mdui/mdui:Description[@xml:lang='en'][1]/text()"
            as="xs:string"/>
        <table>
            <thead/>
            <tbody>
                <tr>
                    <th>Name of the service</th>
                    <td>
                        <p>
                            <xsl:value-of
                                select="$DisplayName"/>
                        </p>
                        <small>Technically identifiable as entity ‘<kbd><xsl:value-of
                            select="$entityID"/></kbd>’.</small>
                    </td>
                </tr>
                <tr>
                    <th>Description of the service</th>
                    <td>
                        <xsl:value-of
                            select="$Description"/>
                    </td>
                </tr>
                <tr>
                    <th>Data controller and contact person</th>
                    <xsl:variable
                        name="administrative_contact"
                        select="./md:ContactPerson[@contactType='administrative']"/>
                    <xsl:variable
                        name="organization"
                        select="./md:Organization"/>
                    <td>Administered by <a
                            href="{$administrative_contact/md:EmailAddress/text()}"><xsl:value-of
                                select="concat($administrative_contact/md:GivenName/text(), ' ', $administrative_contact/md:SurName/text())"/></a> on behalf of 
                        <a
                            href="{$organization/md:OrganizationURL[@xml:lang='en']/text()}"><xsl:value-of
                                select="$organization/md:OrganizationDisplayName[@xml:lang='en']/text()"/> (<xsl:value-of
                                select="$organization/md:OrganizationName[@xml:lang='en']/text()"/>)</a>.</td>
                </tr>
                <tr>
                    <th>Jurisdiction</th>
                    <td>FILL IN</td>
                </tr>
                <tr>
                    <th>Personal data processed</th>
                    <td>
                        <xsl:choose>
                            <xsl:when
                                test="$entity=md:SPSSODescriptor">
                                <xsl:variable
                                    name="required_attributes"
                                    select='distinct-values($entity/md:AttributeConsumingService[1]/md:RequestedAttribute[@isRequired="true"]/@FriendlyName)'
                                    as="xs:string+"/>
                                <xsl:variable
                                    name="optional_attributes"
                                    select='distinct-values($entity/md:AttributeConsumingService[1]/md:RequestedAttribute[@isRequired="false"]/@FriendlyName)'
                                    as="xs:string*"/>
                                <p>Personal data is received in the form of attributes describing properties of you as a person. </p>
                                <p>The following attribute(s) is/are necessarily processed by this service: </p>
                                <ul>
                                    <xsl:for-each
                                        select="$required_attributes">
                                        <xsl:variable
                                            name="current_attribute"
                                            select="."/>
                                        <li>
                                            <a
                                                href="{$attribute_description/entry[@key=$current_attribute]/@url}"><kbd><xsl:value-of
                                                  select="."/></kbd></a>: <xsl:value-of
                                                select="$attribute_description/entry[@key=$current_attribute]/@description"/>.
                                        </li>
                                    </xsl:for-each>
                                </ul>
                                <xsl:if
                                    test="exists($optional_attributes)">
                                    <p>And additionally, not necessarily, and only if the institution releases them: </p>
                                    <ul>
                                        <xsl:for-each
                                            select="$optional_attributes">
                                            <xsl:variable
                                                name="current_attribute"
                                                select="."/>
                                            <li>
                                                <a
                                                  href="{$attribute_description/entry[@key=$current_attribute]/@url}"><kbd><xsl:value-of
                                                  select="."/></kbd></a>: <xsl:value-of
                                                  select="$attribute_description/entry[@key=$current_attribute]/@description"/>.
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when
                                test="$entity=md:IDPSSODescriptor">
                                <p>Personal data is stored and submitted in the form of attributes describing properties of you as a person. </p>
                                <p>The following attribute(s) is/are stored and submitted by this service: </p>
                                <ul>
                                    <li>FILL IN.</li>
                                </ul>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:message>BOTH SP AND IDP FOUND IN SAML METADATA. PLEASE PROVIDE ONLY ONE ENTITY TYPE. </xsl:message>
                            </xsl:otherwise>
                        </xsl:choose>

                    </td>
                </tr>
                <tr>
                    <th>Purpose of the processing of personal data</th>
                    <td>
                        <xsl:choose>
                            <xsl:when
                                test="$entity=md:SPSSODescriptor">
                                <xsl:variable
                                    name="required_attributes"
                                    select='distinct-values($entity/md:AttributeConsumingService[1]/md:RequestedAttribute[@isRequired="true"]/@FriendlyName)'
                                    as="xs:string+"/>
                                <xsl:variable
                                    name="optional_attributes"
                                    select='distinct-values($entity/md:AttributeConsumingService[1]/md:RequestedAttribute[@isRequired="false"]/@FriendlyName)'
                                    as="xs:string*"/>
                                <ul>
                                    <xsl:for-each
                                        select="($required_attributes, $optional_attributes)">
                                        <xsl:variable
                                            name="current_attribute"
                                            select="."/>
                                        <li>
                                            <a
                                                href="{$attribute_description/entry[@key=$current_attribute]/@url}"><kbd><xsl:value-of
                                                  select="."/></kbd></a>: FILL IN.
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </xsl:when>
                            <xsl:when
                                test="$entity=md:IDPSSODescriptor">
                                <ul>
                                    <li>FILL IN.</li>
                                </ul>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:message>BOTH SP AND IDP FOUND IN SAML METADATA. PLEASE PROVIDE ONLY ONE ENTITY TYPE. </xsl:message>
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>
                <tr>
                    <th>Third parties to whom personal data is disclosed</th>
                    <td>FILL IN</td>
                </tr>
                <tr>
                    <th>How to access, rectify and delete the personal data</th>
                    <td>FILL IN</td>
                </tr>
                <tr>
                    <th>Data retention</th>
                    <td>FILL IN</td>
                </tr>
                <xsl:if
                    test='some $attribute_value in $entity/../md:Extensions/mdattr:EntityAttributes/saml:Attribute/saml:AttributeValue/text() satisfies normalize-space("http://www.geant.net/uri/dataprotection-code-of-conduct/v1")=$attribute_value'>
                    <tr>
                        <th>Data Protection Code of Conduct</th>
                        <td>Personal data will be protected according to the <a
                                href="http://www.geant.net/uri/dataprotection-code-of-conduct/v1/Pages/default.aspx">GÉANT Data Protection Code of Conduct</a> for Service Providers, a common standard for the research and higher education sector to protect the user's privacy.</td>
                    </tr>
                </xsl:if>
            </tbody>
        </table>
    </xsl:template>
</xsl:stylesheet>
