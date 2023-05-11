<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:template match="/">
                <html>
                        <head>
                                <title>VCS: Multiplayer</title>
                                <link rel="stylesheet" type="text/css" href="style.css" />
                                <link rel="icon" href="favicon.ico" type="image/x-icon" />
                                <meta http-equiv="refresh" content="120" />
                        </head>
                        <body>
                                <div class="headline">
                                        <xsl:value-of select="./prometheus/@usercount" /> Users are currently playing <a href="https://vcsmp.github.io/Mobile/">VCS: Multiplayer</a>!
                                </div>
                                <div class="navigation">
                                        <a class="netlink" href="https://vcsmp.github.io/Mobile/">Client Download</a>
                                        <a class="donatelink" href=""></a>
                                </div>
                                <xsl:for-each select="./prometheus/game">
                                        <xsl:sort select="./@name"/>
                                        <div class="gametitle">
                                                <table class="splitter">
                                                        <tr>
                                                                <td class="left">
                                                                        <xsl:value-of select="./@name" />
                                                                </td>
                                                                <td class="right">
                                                                        <span class="usercount">
                                                                                <span class="good"><xsl:value-of select="./@usercount" /> Total</span> 
                                                                                <span class="bad">
                                                                                        <xsl:choose>
                                                                                                <xsl:when test="./group[@name='Groupless']">
                                                                                                        <xsl:value-of select="./group[@name='Groupless']/@usercount" />
                                                                                                </xsl:when>
                                                                                                <xsl:otherwise></xsl:otherwise>
                                                                                        </xsl:choose> 
                                                                                </span>
                                                                        </span>
                                                                </td>
                                                        </tr>
                                                        <tr class="bottom">
                                                                <td>
                                                                        <table class="groups">
                                                                                <tr>
                                                                                        <th>Group</th>
                                                                                        <th>User Count</th>
                                                                                        <th>Players</th>
                                                                                </tr>
                                                                                <xsl:for-each select="./group">
                                                                                        <tr>
                                                                                                <td><xsl:value-of select="./@name" /></td>
                                                                                                <td><xsl:value-of select="./@usercount" /></td>
                                                                                                <td>
                                                                                                        <xsl:for-each select="./user">
                                                                                                                <xsl:value-of select="."/>
                                                                                                                <xsl:if test="position() != last()">
                                                                                                                    <xsl:text>, </xsl:text>
                                                                                                                </xsl:if>
                                                                                                        </xsl:for-each>
                                                                                                </td>
                                                                                        </tr>
                                                                                </xsl:for-each>
                                                                        </table>
                                                                </td>
                                                        </tr>
                                                </table>
                                        </div>
                                </xsl:for-each>
                                <div class="footer">
                                        © Adiru Network
                                </div>
                        </body>
                </html>
        </xsl:template>
</xsl:stylesheet>
