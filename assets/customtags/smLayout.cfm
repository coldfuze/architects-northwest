<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<cfparam name="Attributes.Title" default="Stock Home Plans for Every Style - CornerStone Designs">
<cfparam name="Attributes.Description" default="Peak Sport and Spine Physical Therapy offers 7 convenient physical therapy clinic locations throught the greater Seattle and Seattle Eastside area.">
<cfparam name="Attributes.Keywords" default="Peak Sports and Spine Physical Therapy">

<cfif thisTag.ExecutionMode EQ "Start">
<html xmlns="http://www.w3.org/1999/xhtml">
	<cfoutput>
	<head>
		<title>#Attributes.Title#</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link rev="made" href="mailto:webmaster@architectsnw.com"/>
        <meta name="title" content="#Attributes.Title#"/>
        <meta name="Keywords" content="#Attributes.Keywords#"/>
        <meta name="Description" content="#Attributes.Description#"/>
        <meta name="author" content="Leon O'Daniel - O'Daniel Designs"/>
        <meta name="creator" content="Leon O'Daniel - O'Daniel Designs"/> 
		<cfif CGI.HTTP_USER_AGENT CONTAINS "MSIE 6"><link rel="stylesheet" type="text/css" media="screen" href="#Application.CSSPath#style.css"/><cfelseif CGI.HTTP_USER_AGENT CONTAINS "MSIE 7"><link rel="stylesheet" media="screen" type="text/css" href="#Application.CSSPath#style.css"/><cfelse><link media="screen" rel="stylesheet" type="text/css" href="#Application.CSSPath#style.css"/></cfif>
        <link rel="stylesheet" type="text/css" media="all" href="#Application.CSSPath#commonStyles.css"/>
        <link rel="shortcut icon" href="http://www.cornerstonedesigns.com/favicon.ico"/>
        <script type="text/javascript" src="/assets/js/script.js"></script>
	</head>
	</cfoutput>
	<body>
    	<cfif CGI.HTTP_USER_AGENT CONTAINS "MSIE 6">
        <script type="text/javascript">var MenuLinkedBy="AllWebMenus [4]",awmMenuName="cornerstone",awmBN="858";awmAltUrl="";</script><script charset="UTF-8" src="/assets/js/cornerstoneIE6.js" type="text/javascript"></script><script type="text/javascript">awmBuildMenu();</script>
        <cfelse>
        <script type="text/javascript">var MenuLinkedBy="AllWebMenus [4]",awmMenuName="cornerstone",awmBN="858";awmAltUrl="";</script><script charset="UTF-8" src="/assets/js/cornerstone.js" type="text/javascript"></script><script type="text/javascript">awmBuildMenu();</script>
        </cfif>
        <div id="topSpacer"></div>
        <div id="bannerNavContainer">
            <div id="banner">
                <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                   <img name="CornerStoneDesignsHeader" src="/assets/images/CornerStoneDesignsGrayHighlightHeader.jpg" width="941" height="140" border="0" id="CornerStoneDesignsHeader" usemap="#mapCornerStoneDesignsHeader" alt="CornerStone Designs" />
                    <map name="mapCornerStoneDesignsHeader" id="mapCornerStoneDesignsHeader">
                        <area shape="rect" coords="895,7,927,38" href="/rss.cfm" title="Sign Up for Our RSS Feed" alt="Sign Up for Our RSS Feed" />
                        <area shape="rect" coords="855,8,888,39" href="http://www.youtube.com/user/ArchitectsNW?feature=mhum#p/a" target="_blank" title="Click to view our YouTube page" alt="Click to view our YouTube page" />
                        <area shape="rect" coords="813,7,849,38" href="http://twitter.com/ArchitectsNW" target="_blank" title="Click to view our Twitter page" alt="Click to view our Twitter page" />
                        <area shape="rect" coords="776,8,811,39" href="http://www.facebook.com/ArchitectsNW?v=info" target="_blank" title="Click to view our Facebook page" alt="Click to view our Facebook page" />
                        <area shape="rect" coords="27,0,293,140" href="/default.cfm" title="CornerStone Designs" alt="CornerStone Designs" />
                        <area shape="rect" coords="707,85,933,120" href="tel:1-888-884-9488" title="1-888-884-9488" alt="1-888-884-9488" />
                        <area shape="rect" coords="688,120,933,140" href="mailto:Info@CornerStoneDesign.com" title="Info@CornerStoneDesign.com" alt="Info@CornerStoneDesign.com" />
                    </map>
                <cfelse>
                    <img name="ArchitectsNorthwestHeader" src="/assets/images/ArchitectsNorthwestHeader.jpg" width="941" height="140" border="0" id="ArchitectsNorthwestHeader" usemap="#mapArchitectsNorthwestHeader" alt="Architects Northwest" />
                    <map name="mapArchitectsNorthwestHeader" id="m_ArchitectsNorthwestHeader">
                    	<area shape="rect" coords="893,7,925,38" href="/rss.cfm" title="Sign Up for Our RSS Feed" alt="Sign Up for Our RSS Feed" />
                        <area shape="rect" coords="853,8,886,39" href="http://www.youtube.com/user/ArchitectsNW?feature=mhum#p/a" target="_blank" title="Click to view our YouTube page" alt="Click to view our YouTube page" />
                        <area shape="rect" coords="813,7,849,38" href="http://twitter.com/ArchitectsNW" target="_blank" title="Click to view our Twitter page" alt="Click to view our Twitter page" />
                        <area shape="rect" coords="775,8,810,39" href="http://www.facebook.com/ArchitectsNW?v=info" target="_blank" title="Click to view our Facebook page" alt="Click to view our Facebook page" />
                        <area shape="rect" coords="15,23,326,140" href="/default.cfm" title="Architects Northwest" alt="Architects Northwest" />
                        <area shape="rect" coords="707,85,933,120" href="tel:1-888-272-4100" title="1-888-272-4100" alt="1-888-272-4100" />
                        <area shape="rect" coords="688,120,933,140" href="mailto:Info@ArchitectsNW.com" title="Info@ArchitectsNW.com" alt="Info@ArchitectsNW.com" />
                    </map>
                </cfif>
            </div>
            <div id="nav"></div>
        </div>
</cfif>
<cfif thisTag.ExecutionMode EQ "End">
	</body>
</html>
</cfif>