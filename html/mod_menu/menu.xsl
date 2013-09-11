<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<xsl:variable name="active_id">
<xsl:for-each select="root/parameters[1]">
	<xsl:value-of select="active_id" />
</xsl:for-each>
</xsl:variable>
  <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">Evangelishe Kerk Jefta
		  </a>
          <div class="nav-collapse collapse">
            <ul class="nav">

      <xsl:for-each select="root/rows/row">
	  
	  
	   <xsl:choose>
		 
        <xsl:when test="level=1 and deeper!=1">
		<li>
		<xsl:choose>
		 
        <xsl:when test="id=$active_id">
        
		   <xsl:attribute name="class">
    <xsl:value-of select="'active'" />
  </xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
            
        </xsl:otherwise>
		
    </xsl:choose>
	<a>
	<xsl:if test="flink != ''">
        <xsl:attribute name="href">
			<xsl:value-of select="flink" />
		</xsl:attribute>
    </xsl:if>
	<xsl:if test="note != ''">
		<i>
        <xsl:attribute name="class">
			<xsl:value-of select="note" />
		</xsl:attribute>
		<xsl:value-of select="' '"/>
		</i>
		<xsl:value-of select="' '"/>
    </xsl:if>
	
	<xsl:value-of select="title"/>
	</a></li>
	</xsl:when> 
	<xsl:when test="level=1 and deeper=1">
	<li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li class="nav-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
	</xsl:when>
		<xsl:otherwise> 
		
		</xsl:otherwise>
		</xsl:choose>
		</xsl:for-each>
	  
   </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
</xsl:template>
</xsl:stylesheet>

