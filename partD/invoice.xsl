<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Name: Maxwell Haley
    Date: 2017-10-11
-->
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" encoding="UTF-8" />
    <xsl:template match="/">
        <html>
            <head>
                <title>Invoice - <xsl:value-of select="//client/Client_Name" /></title>
                <link href="./invoice.css" rel="stylesheet" type="text/css" />
            </head>
            <body>
                <div id="header">
                    <h1>Happy Valley Programmers, Inc.</h1>
                    <p>Transactions for Invoice No. 
                        <xsl:value-of select="//info/@invoice_number" />
                    </p>
                    <p>Date: <xsl:value-of select="//info/invoice_date" /></p>
                </div>
                <div id="clientInformation">
                    <xsl:apply-templates select="//client" />
                </div>
                <hr />
                <table>
                    <tr>
                        <th>Date</th>
                        <th>Work Performed</th>
                        <th>Hours</th>
                    </tr>
                    <xsl:apply-templates select="//work_record" />
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="//client">
        <p>
            <span class="label">Client: </span>
            <xsl:value-of select="Client_Name" />
        </p>
        <p>
            <span class="label">Contact: </span>
            <xsl:value-of select="Contact_Firstname" />
            <xsl:text> </xsl:text> <!-- This field left blank. -->
            <xsl:value-of select="Contact_Lastname" />
        </p>
        <p>
            <span class="label">Address: </span>
            <xsl:value-of select="Client_Street" />
        </p>
        <p>
            <xsl:value-of select="Client_City" />
        </p>
        <p>
            <xsl:value-of select="Client_Postalcode" />
        </p>
    </xsl:template>

    <xsl:template match="//work_record">
        <tr>
            <td><xsl:value-of select="work_date" /></td>
            <td><xsl:value-of select="work_description" /></td>
            <td><xsl:value-of select="billed_hours" /></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>