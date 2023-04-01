<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="recette">
<html>
    <head>
        <title><xsl:value-of select="nom"/></title>
        <link rel="stylesheet" href="recette.css" type="text/css"/>
    </head>
    <body>
      <div class="header">
      <h1 id="titre"><xsl:value-of select="nom"/></h1>
      </div>
        <div class="top">
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="image"/>
                </xsl:attribute>
            </xsl:element>
        </div>
        <div class="infos">
            <xsl:apply-templates select="informations"/>
            <p id="portions"><b>Portions</b> : <xsl:value-of select="informations/portions"/></p>
        </div>
        <div class="preparation">
           <xsl:apply-templates mode="preparation" select="/"/>
        </div>
    </body>
</html>
</xsl:template>

<xsl:template match="informations">
    <table>
        <xsl:for-each select="preparation">
            <tr>
                <td><b><xsl:value-of select="@etape"/></b> : <xsl:value-of select="."/></td>
            </tr>
        </xsl:for-each>
    </table>
</xsl:template>
<xsl:template mode="preparation" match="/">
    <xsl:for-each select="recette/partie">
        <h2 class="partie"><xsl:value-of select="nom"/></h2>
        <ul class="ingredients">
            <xsl:for-each select="ingredient[@type='quantitatif']">
                <li><xsl:value-of select="nom"/> :
                    <b>
                      <span class="metrique"><xsl:value-of select="quantite[@unite='metrique']"/>
                          <xsl:if test="not(quantite[@unite='metrique']/nombre = 1)">s</xsl:if>
                      </span>
                    </b>
                </li>
            </xsl:for-each>

            <xsl:for-each select="ingredient[@type='unitaire']">
                <li><xsl:value-of select="nom"/> :
                    <b><xsl:value-of select="nombre"/></b>
                </li>
            </xsl:for-each>

            <xsl:for-each select="ingredient[@type='cuillereThe']">
                <li><xsl:value-of select="nom"/> :
                    <b>
                        <span class="metrique"><xsl:value-of select="quantite[@unite='metrique']"/>
                            <xsl:if test="not(quantite[@unite='metrique']/nombre = 1)">s</xsl:if>
                        </span>
                    </b>
                </li>
            </xsl:for-each>

            <xsl:for-each select="ingredient[@type='cuillereSoupe']">
                <li><xsl:value-of select="nom"/> :
                    <b>
                        <span class="metrique"><xsl:value-of select="quantite[@unite='metrique']"/>
                            <xsl:if test="not(quantite[@unite='metrique']/nombre = 1)">s</xsl:if>
                        </span>
                    </b>
                </li>
            </xsl:for-each>
        </ul>
        <ol class="etapes">
            <xsl:for-each select="etape">
                <li><xsl:value-of select="."/></li>
            </xsl:for-each>
        </ol>
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
