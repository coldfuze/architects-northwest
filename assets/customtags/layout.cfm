<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<cfparam name="Attributes.Title" default="Stock Home Plans for Every Style - CornerStone Designs">
<cfif CGI.SERVER_NAME CONTAINS "architectsnw.com">
<cfparam name="Attributes.Description" default="House plans, award winning custom & spec residential architecture since 1989. Street of Dreams Best in Show, affordable stock plans, customizable home designs.">
<cfparam name="Attributes.Keywords" default="House Plans,Stock House Plans,Architects Northwest,Woodinville Architects,Seattle Eastside Architect,Seattle Architect">
<cfelse>
<cfparam name="Attributes.Description" default="House plans, award winning custom & spec residential architecture since 1989. Street of Dreams Best in Show, affordable stock plans, customizable home designs.">
<cfparam name="Attributes.Keywords" default="House Plans,Stock House Plans,CornerstoneDesigns">
</cfif>
<cfparam name="Attributes.RecentlyViewedPlans" default="">
<cfparam name="Attributes.ScrollSimilarPlans" default=0>
<cfparam name="Attributes.SimilarPlansToDisplay" default=0>
<cfparam name="Attributes.TotalSimilarPlans" default=0>
<cfparam name="Attributes.PlanId" default=0>
<cfparam name="Attributes.minHeight" default=500>
<cfparam name="Attributes.cannedSearch" default="0">
<cfparam name="Attributes.alertMessage" default="">
<cfparam name="Attributes.advancedPlanSearch" default="0">
<cfparam name="Attributes.isMySavedPlansPage" default="0">

<cfscript>
	if (ListLen(Attributes.RecentlyViewedPlans) LTE 5) {
		VARIABLES.RecentlyViewedPlansToDisplay = ListLen(Attributes.RecentlyViewedPlans);
		VARIABLES.ScrollRecentlyViewedPlans = 0;
	}
	else {
		VARIABLES.RecentlyViewedPlansToDisplay = 5;
		VARIABLES.ScrollRecentlyViewedPlans = 1;
	}
	if (ListLen(Attributes.RecentlyViewedPlans) GT 0) {
		VARIABLES.RecentlyViewedPlansArray = ListToArray(Attributes.RecentlyViewedPlans);
		VARIABLES.RecentlyViewedPlanInfo = Application.PlanService.getRecentlyViewedPlans(VARIABLES.RecentlyViewedPlansArray);
	}	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.favIcon = "https://www.cornerstonedesigns.com/cdfavicon.ico";
	}
	else {
		VARIABLES.favIcon = "https://www.architectsnw.com/favicon.ico";	
	}
</cfscript>

<cfif thisTag.ExecutionMode EQ "Start">
<cfheader name="Access-Control-Allow-Origin" value="*">
<html xmlns="http://www.w3.org/1999/xhtml">
	<cfoutput>
	<head>
		<title>#Attributes.Title#</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link rev="made" href="mailto:webmaster@architectsnw.com"/>
        <meta name="title" content="#Attributes.Title#"/>
        <meta name="Keywords" content="#Attributes.Keywords#"/>
        <meta name="Description" content="#Attributes.Description#"/>
        <meta name="author" content="Jeffrey deRoulet - Architects Northwest"/>
        <meta name="creator" content="Jeffrey deRoulet - Architects Northwest"/> 
		<link rel="stylesheet" type="text/css" media="screen" href="#Application.CSSPath#style.css"/>
        <link rel="stylesheet" type="text/css" href="/assets/skins/tango/skin2.css" />
        <cfoutput><link rel="shortcut icon" href="#VARIABLES.favIcon#"/></cfoutput>
        <script type="text/javascript" src="/assets/js/script.js"></script>
        <!---<script
		  src="https://code.jquery.com/jquery-3.6.3.min.js"
		  integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
		  crossorigin="anonymous"></script>
		<script
		  src="https://code.jquery.com/jquery-migrate-3.4.0.min.js"
		  integrity="sha256-mBCu5+bVfYzOqpYyK4jm30ZxAZRomuErKEFJFIyrwvM="
		  crossorigin="anonymous"></script>--->
		<script type="text/javascript" src="/assets/js/jquery-1.12.4.min.js"></script>
        <script type="text/javascript" src="/assets/js/jquery.jshowoff.min.js"></script>
		<script type="text/javascript" src="/assets/js/jquery.jcarousel.min.js"></script>
        <script type="text/javascript" src="/assets/js/jquery.equal-height-columns.js"></script>
		
		<cfif Attributes.isMySavedPlansPage EQ 1>
			<script type="text/javascript" src="/assets/js/quicksearch.js"></script>
		</cfif>
    
        <cfif Attributes.PlanId NEQ 0>
			<script>
                jQuery(document).ready(function() {										
                    jQuery('.carousel').jcarousel({
                        scroll: #Attributes.ScrollSimilarPlans#,
                        visible: #Attributes.SimilarPlansToDisplay#,
                        size: #Attributes.TotalSimilarPlans#,
                        animation: 'fast',
                        auto: 0,
                        wrap: 'circular',
                        itemFallbackDimension: 175});
                    
                    jQuery('.recentlyViewedPlansCarousel2').jcarousel({
                        scroll: #VARIABLES.ScrollRecentlyViewedPlans#,
                        visible: #VARIABLES.recentlyViewedPlansToDisplay#,
                        size: #ListLen(Attributes.RecentlyViewedPlans)#,
                        animation: 'fast',
                        auto: 0,
                        wrap: 'circular',
                        itemFallbackDimension: 165});
                });
            </script>
        <cfelseif CGI.SCRIPT_NAME CONTAINS "planSearchResults">
        	<script>
                jQuery(document).ready(function() {
                    // Initialize the carousel by class selector.                    
                    jQuery('.recentlyViewedPlansCarousel2').jcarousel({
                        scroll: #VARIABLES.ScrollRecentlyViewedPlans#,
                        visible: #VARIABLES.recentlyViewedPlansToDisplay#,
                        size: #VARIABLES.recentlyViewedPlansToDisplay#,
                        animation: 'fast',
                        auto: 4,
                        wrap: 'circular',
                        itemFallbackDimension: 165});
					
					$('##planSearchResultsLeftColumn, ##planSearchResultsCenterColumn, ##planSearchResultsRightColumn').equalHeightColumns({minHeight:#ATTRIBUTES.minHeight#});
                
				});
            </script>
        <cfelseif Attributes.cannedSearch EQ 1>
        	<script>
                jQuery(document).ready(function() {
                    // Initialize the carousel by class selector.                    
                    jQuery('.recentlyViewedPlansCarousel2').jcarousel({
                        scroll: #VARIABLES.ScrollRecentlyViewedPlans#,
                        visible: #VARIABLES.recentlyViewedPlansToDisplay#,
                        size: #VARIABLES.recentlyViewedPlansToDisplay#,
                        animation: 'fast',
                        auto: 4,
                        wrap: 'circular',
                        itemFallbackDimension: 165});
					
					$('##planSearchResultsLeftColumn, ##planSearchResultsCenterColumn, ##planSearchResultsRightColumn').equalHeightColumns({minHeight:#ATTRIBUTES.minHeight#});
                
				});
            </script>
        <cfelseif CGI.SCRIPT_NAME CONTAINS "mySavedPlans" OR CGI.SCRIPT_NAME CONTAINS "quickSearchResults" OR CGI.SCRIPT_NAME CONTAINS "advancedSearchResults">
			<script>
                jQuery(document).ready(function() {
                    // Initialize the carousel by class selector.                    
                    jQuery('.recentlyViewedPlansCarousel2').jcarousel({
                        scroll: #VARIABLES.ScrollRecentlyViewedPlans#,
                        visible: #VARIABLES.recentlyViewedPlansToDisplay#,
                        size: #VARIABLES.recentlyViewedPlansToDisplay#,
                        animation: 'fast',
                        auto: 4,
                        wrap: 'circular',
                        itemFallbackDimension: 165});
					
					$('##planSearchResultsLeftColumn, ##planSearchResultsCenterColumn, ##planSearchResultsRightColumn').equalHeightColumns({minHeight:#ATTRIBUTES.minHeight#});
                
				});
            </script>
        <cfelseif CGI.SCRIPT_NAME CONTAINS "allPlans">
        	<script>
                jQuery(document).ready(function() {
                    // Initialize the carousel by class selector.                    
                    jQuery('.recentlyViewedPlansCarousel2').jcarousel({
                        scroll: #VARIABLES.ScrollRecentlyViewedPlans#,
                        visible: #VARIABLES.recentlyViewedPlansToDisplay#,
                        size: #VARIABLES.recentlyViewedPlansToDisplay#,
                        animation: 'fast',
                        auto: 4,
                        wrap: 'circular',
                        itemFallbackDimension: 165});
					
					$('##planSearchResultsLeftColumn, ##planSearchResultsCenterColumn, ##planSearchResultsRightColumn').equalHeightColumns({minHeight:#ATTRIBUTES.minHeight#});
                
				});
            </script>
        <cfelseif CGI.PATH_INFO IS "/default.cfm">
       		<script type="text/javascript">		
				$(document).ready(function(){ $('##animation').jshowoff({ 
					links: false,
					speed: 5000,
					controls: false,
					effect: 'fade',
					cssClass: 'basicFeatures',
					hoverPause: true
				});
				 // Initialize the carousel by class selector.                    
				jQuery('.recentlyViewedPlansCarousel2').jcarousel({
					scroll: #VARIABLES.ScrollRecentlyViewedPlans#,
					visible: #VARIABLES.recentlyViewedPlansToDisplay#,
					size: #VARIABLES.recentlyViewedPlansToDisplay#,
					animation: 'fast',
					auto: 4,
					wrap: 'circular',
					itemFallbackDimension: 165});
				});
			</script>
        <cfelse>
        	<script>
                jQuery(document).ready(function() {
                    // Initialize the carousel by class selector.                    
                    jQuery('.recentlyViewedPlansCarousel2').jcarousel({
                        scroll: #VARIABLES.ScrollRecentlyViewedPlans#,
                        visible: #VARIABLES.recentlyViewedPlansToDisplay#,
                        size: #VARIABLES.recentlyViewedPlansToDisplay#,
                        animation: 'fast',
                        auto: 4,
                        wrap: 'circular',
                        itemFallbackDimension: 165});
                });
            </script>
        </cfif>
	</head>
	</cfoutput>
	<body>
        <!---<script type="text/javascript">var MenuLinkedBy="AllWebMenus [4]",awmMenuName="cornerstone",awmBN="858";awmAltUrl="";</script><script charset="UTF-8" src="/assets/js/cornerstone.js" type="text/javascript"></script><script type="text/javascript">awmBuildMenu();</script>--->
		<!-- DO NOT MOVE! The following AllWebMenus linking code section must always be placed right AFTER the BODY tag-->
<!-- ******** BEGIN ALLWEBMENUS CODE FOR architectsnw ******** -->
<script type="text/javascript">var MenuLinkedBy="AllWebMenus [4]",awmMenuName="architectsnw",awmBN="940";</script><script charset="UTF-8" src="/assets/js/architectsnwSP.js" type="text/javascript"></script><script type="text/javascript">awmBuildMenu();</script>
<!-- ******** END ALLWEBMENUS CODE FOR architectsnw ******** -->
        <div id="topSpacer"></div>
        <div id="bannerNavContainer">
            <div id="banner">
                <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                   <img name="CornerStoneDesignsHeader" src="/assets/pageHeaders/CornerStoneDesignsPageHeader.jpg" width="941" height="140" border="0" id="CornerStoneDesignsHeader" usemap="#mapCornerStoneDesignsHeader" alt="CornerStone Designs" />
                    <map name="mapCornerStoneDesignsHeader" id="m_CornerStoneDesignsHeader">
						<area shape="rect" coords="892,8,925,39" href="http://www.youtube.com/user/ArchitectsNW?feature=mhum#p/a" target="_blank" title="Click to view our YouTube page" alt="Click to view our YouTube page" />
						<area shape="rect" coords="852,7,888,38" href="http://twitter.com/ArchitectsNW" target="_blank" title="Click to view our Twitter page" alt="Click to view our Twitter page" />
						<area shape="rect" coords="814,8,849,39" href="http://www.facebook.com/ArchitectsNW?v=info" target="_blank" title="Click to view our Facebook page" alt="Click to view our Facebook page" />
						<area shape="rect" coords="15,23,410,140" href="/default.cfm" title="Architects Northwest" alt="Architects Northwest" />
						<area shape="rect" coords="707,85,933,120" href="tel:1-888-272-4100" title="1-888-272-4100" alt="1-888-272-4100" />
						<area shape="rect" coords="688,120,933,140" href="mailto:Info@ArchitectsNW.com" title="Info@ArchitectsNW.com" alt="Info@ArchitectsNW.com" />
						<area shape="rect" coords="773,7,807,43" href="http://www.houzz.com/pro/architectsnorthwest/architects-northwestcornerstone-designs" title="Click to view our page on Houzz" target="_blank" />
						 <area shape="rect" coords="730,8,768,44" href="https://www.instagram.com/architectsnorthwestinc/" alt="Click to view our Instagram page" target="_blank">
					</map>
                <cfelse>
                    <img name="ArchitectsNorthwestHeader" src="/assets/pageHeaders/ArchitectsNorthwestPageHeader.jpg" width="941" height="140" border="0" id="ArchitectsNorthwestHeader" usemap="#mapArchitectsNorthwestHeader" alt="Architects Northwest" />
                    <map name="mapArchitectsNorthwestHeader" id="m_ArchitectsNorthwestHeader">
                    	<area shape="rect" coords="892,8,925,39" href="http://www.youtube.com/user/ArchitectsNW?feature=mhum#p/a" target="_blank" title="Click to view our YouTube page" alt="Click to view our YouTube page" />
						<area shape="rect" coords="852,7,888,38" href="http://twitter.com/ArchitectsNW" target="_blank" title="Click to view our Twitter page" alt="Click to view our Twitter page" />
						<area shape="rect" coords="814,8,849,39" href="http://www.facebook.com/ArchitectsNW?v=info" target="_blank" title="Click to view our Facebook page" alt="Click to view our Facebook page" />
						<area shape="rect" coords="15,23,410,140" href="/default.cfm" title="Architects Northwest" alt="Architects Northwest" />
						<area shape="rect" coords="707,85,933,120" href="tel:1-888-272-4100" title="1-888-272-4100" alt="1-888-272-4100" />
						<area shape="rect" coords="688,120,933,140" href="mailto:Info@ArchitectsNW.com" title="Info@ArchitectsNW.com" alt="Info@ArchitectsNW.com" />
                      	<area shape="rect" coords="773,7,807,43" href="http://www.houzz.com/pro/architectsnorthwest/architects-northwestcornerstone-designs" title="Click to view our page on Houzz" target="_blank" />
						<area shape="rect" coords="730,8,768,44" href="https://www.instagram.com/architectsnorthwestinc/" target="_blank">
                    </map>
                </cfif>
            </div>
            <div id="nav"></div>
        </div>
</cfif>
<cfif thisTag.ExecutionMode EQ "End">
	<!---<cfif IsDefined("VARIABLES.RecentlyViewedPlanInfo")>
    	<cfif VARIABLES.RecentlyViewedPlanInfo.recordCount GT 0>
        <div id="recentlyViewedPlansContainer2">
            <div id="recentlyViewedPlansBar">
                <div id="planViewHistory">
                    Your Plan View History
                </div>
                <div id="recentlyViewedPlans">
                    RECENTLY VIEWED PLANS
                </div>
                <div id="clearList">
                    <cfoutput><a class="greenBarBold" href="#CGI.SCRIPT_NAME#?clearList" title="This Clears the Recently Viewed Plans List">Clear List</a></cfoutput>
                </div>
            </div>

            <div id="recentlyViewedPlansContentContainer2">
                <cfif VARIABLES.ScrollRecentlyViewedPlans EQ 1><div id="second-carousel" class="recentlyViewedPlansCarousel2 jcarousel-skin-tango"><cfelse><div align="center"><div id="first-carousel" class="recentlyViewedPlansCarousel2 jcarousel-skin-tangoNN"></cfif>
                    <ul>
                    <cfoutput query="VARIABLES.RecentlyViewedPlanInfo">
                    	<li style="width:165px;height:300px;font-size:14px;">
                        <div class="thisRecentlyViewedPlanContainer">
                    	<div style="text-align:center;font-weight:bold;text-transform:uppercase;vertical-align:text-bottom;height:30px;line-height:15px;padding-bottom:5px;">
                            <a class="brownLink" href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#&nps=1">#PlanTitle#</a>
                        </div>
                        <a href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#&nps=1"><img src="/assets/planImages/#PlanId#/planthu/#ImageFile#" width="165" height="121" border="0" alt="#PlanTitle#" /></a>
                        <div style="text-align:center;font-size:13px;font-weight:bold;text-transform:uppercase;padding-top:5px;padding-bottom:20px;">
                            <a class="brownLink" href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#&nps=1">#PlanNumber#</a>
                        </div>
                        <div class="planSpecItemContainer2">
                            <div style="float:left;padding-left:10px;">Total Area:</div>
                            <div style="float:right;">#TotalSF# sq. ft.</div>
                            <div class="clearFloat"></div>
                        </div>
                        <div class="planSpecItemContainer2">
                            <div style="float:left;padding-left:10px;">Stories:</div>
                            <div style="float:right;">#Stories#</div>
                            <div class="clearFloat"></div>
                        </div>
                        <cfif IsNumeric(Bedroom)>
                            <div class="planSpecItemContainer2">
                                <div style="float:left;padding-left:10px;">Bedrooms:</div>
                                <div style="float:right;">#Bedroom#</div>
                                <div class="clearFloat"></div>
                            </div>
                            <cfif IsNumeric(FullBathroom)>
                                <div class="planSpecItemContainer2">
                                    <div style="float:left;padding-left:10px;">Full Baths:</div>
                                    <div style="float:right;">#FullBathroom#</div>
                                    <div class="clearFloat"></div>
                                </div>
                            <cfelse>
                            	<div class="planSpecItemContainer2">
                                    &nbsp;
                                </div>
                            </cfif>
                        <cfelseif IsNumeric(FullBathroom)>
                            <div class="planSpecItemContainer2">
                                <div style="float:left;padding-left:10px;">Full Baths:</div>
                                <div style="float:right;">#FullBathroom#</div>
                                <div class="clearFloat"></div>
                            </div>
                            <div class="planSpecItemContainer2">
                                &nbsp;
                            </div>
                        <cfelse>
                        	<div class="planSpecItemContainer2">
                                &nbsp;
                            </div>
                            <div class="planSpecItemContainer2">
                                &nbsp;
                            </div>
                        </cfif>
                        <div class="planSpecViewPlan">
                        	<div style="text-align:center;">
                            <a class="planSpec" href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#&nps=1">View Floor Plan</a>
                            </div>
                        </div>
                     </div>
                    </li>
					</cfoutput>
                    </ul>
                    <cfif VARIABLES.ScrollRecentlyViewedPlans NEQ 1></div></cfif>
                </div>
            </div>
        </div>
        </cfif>
    </cfif>--->
    <div id="creditsContainer">
        <div id="creditsBar">
            <div id="copyright">
                &copy <cfoutput>#Year(Now())#</cfoutput> <cfif CGI.HTTP_HOST CONTAINS "CornerStone"><a class="greenBarBold" href="/">CornerStone Designs</a><cfelse><a class="greenBarBold" href="/">Architects Northwest</a></cfif><br />
                All Rights Reserved
            </div>
            <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
            <div id="email">
                E-Mail: <a class="greenBar" href="mailto:info@cornerstonedesigns.com">Info@CornerStoneDesigns.com</a>
            </div>
            <cfelse>
            <div id="emailANW">
                E-Mail: <a class="greenBar" href="mailto:Info@ArchitectsNW.com">Info@ArchitectsNW.com</a>
            </div>
            </cfif>
            <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
            <div id="parentCompany">
                Parent Company<br />
                <a class="greenBarBold" href="http://www.architectsnw.com">ArchitectsNW.com</a>
            </div>
            <cfelse>
            <div id="thisCompany">
                <br /><a class="greenBarBold" href="/">ArchitectsNW.com</a>
            </div>
            </cfif>
        </div>
    </div>
    <!---<div id="creditCardBar"><img src="/assets/images/creditCardBar.gif" width="960" height="68" border="0" usemap="#M_CreditCardBar" /></div>--->
    <div id="siteMapContainer">
        <div class="siteMap">
            <strong>Find a Plan</strong><br />
            <a href="/plans/" class="blackLink">Advanced Search</a><br />
            <a href="/plans/popularSearches.cfm" class="blackLink">Popular Search</a><br />
            <a href="/plans/architecturalStyles.cfm" class="blackLink">Architectural Styles</a><br />
            <a href="/plans/housePlanCollections.cfm" class="blackLink">House Plan Collections</a><br />
            <a href="/plans/planSearchResults.cfm?Id=6" class="blackLink">New Plans</a><br />
            <a href="/plans/planSearchResults.cfm?Id=7" class="blackLink">Plans Coming Soon</a>
        </div>
        <div class="siteMap">
            <strong>About Plans</strong><br />
            <a href="/aboutPlans/buildingCodes.cfm" class="blackLink">Building Codes</a><br />
            <a href="/aboutPlans/copyrightInformation.cfm" class="blackLink">Copyright Information</a><br />
            <a href="/aboutPlans/planModifications.cfm" class="blackLink">Plan Modifications</a><br />
            <a href="/aboutPlans/planPackages.cfm" class="blackLink">Plan Packages</a><br />
            <a href="/aboutPlans/planPackageContents.cfm" class="blackLink">Plan Package Contents</a>
        </div>
        <div class="siteMap">
            <strong>Design Services</strong><br />
            <a href="/designServices/customHomeDesigns.cfm" class="blackLink">Custom Home Designs</a><br />
            <a href="/designServices/multiFamilyDesigns.cfm" class="blackLink">Multi Family Designs</a><br />
            <a href="/designServices/neighborhoodDesigns.cfm" class="blackLink">Neighborhood Designs</a>
        </div>
        <div class="siteMap">
            <strong>Marketing Products</strong><br />
            <a href="/marketingProducts/planBooks.cfm" class="blackLink">Plan Books</a><br />
            <a href="/marketingProducts/realtorProducts.cfm" class="blackLink">Realtor Products</a><br />
            <a href="/marketingProducts/videoGallery.cfm" class="blackLink">Video Gallery</a><br />
            <a href="/marketingProducts/photoGallery.cfm" class="blackLink">Photo Gallery</a>
        </div>
        <div class="siteMap">
            <strong>Building Resources</strong><br />
            <a href="/buildingResources/builderDirectory.cfm" class="blackLink">Builder Directory</a><br />
            <a href="/buildingResources/buildingProducts.cfm" class="blackLink">Building Products</a><br />
            <a href="/buildingResources/engineersAndSurveyors.cfm" class="blackLink">Engineers &amp Surveyors</a><br />
            <a href="/buildingResources/professionalAssociations.cfm" class="blackLink">Professional Associations</a>
        </div>
    </div>
    <map name="m_SponsorLogos" id="m_SponsorLogos">
    <area shape="rect" coords="0,466,170,498" href="http://www.maytag.com" target="_blank" title="Click to go to the Maytag web site" alt="Click to go to the Maytag web site" />
    <area shape="rect" coords="3,410,174,440" href="http://www.guttergloveusa.net/" target="_blank" title="Click to go to the Gutterglove USA web site" alt="Click to go to the Gutterglove USA web site" />
    <area shape="rect" coords="6,325,169,376" href="http://www.jennair.com" target="_blank" title="Click to go to the Jenn Air web site" alt="Click to go to the Jenn Air web site" />
    <area shape="rect" coords="0,239,170,294" href="http://www.whirlpool.com/" target="_blank" title="Click to go to the Whirlpool web site" alt="Click to go to the Whirlpool web site" />
    <area shape="rect" coords="4,157,169,206" href="http://www.fireplacextrordinair.com/" target="_blank" title="Click to go to the fireplace extroedinair web site" alt="Click to go to the fireplace extroedinair web site" />
    <area shape="rect" coords="0,85,174,131" href="http://www.nanawall.com/" target="_blank" title="Click to go to the NanaWall web site" alt="Click to go to the NanaWall web site" />
    <area shape="rect" coords="7,8,167,61" href="http://www.veluxusa.com/" target="_blank" title="Click to go to the Velux USA web site" alt="Click to go to the Velux USA web site" />
    <area shape="rect" coords="2,523,172,586" href="http://www.gladiatorgarageworks.com/" target="_blank" title="Click to go to the Gladiator Garage Works web site" alt="Click to go to the Gladiator Garage Works web site" />
    </map>
    <map name="m_CreditCardBar" id="m_CreditCardBar">
        <area shape="rect" coords="273,6,432,63" href="http://www.geotrust.com" target="_blank" title="GeoTrust" alt="GeoTrust" />
        <area shape="rect" coords="769,5,951,65" href="http://www.nahb.com/" target="_blank" title="National Association of Home Builders" alt="National Association of Home Builders" />
        <area shape="rect" coords="640,5,767,65" href="http://www.thehpma.com/" target="_blank" title="House Plan Marketing Association" alt="House Plan Marketing Association" />
        <area shape="rect" coords="437,5,638,65" href="http://www.builtgreen.net/" target="_blank" title="Built Green" alt="Built Green" />
        <area shape="rect" coords="166,4,267,64" href="http://www.visa.com" target="_blank" title="Visa" alt="Visa" />
        <area shape="rect" coords="67,4,163,64" href="http://www.mastercard.com" target="_blank" title="MasterCard" alt="MasterCard" />
        <area shape="rect" coords="4,4,62,64" href="http://www.amex.com" target="_blank" title="American Express" alt="American Express" />
    </map>
	<div id="bottomSpacer"></div>
    <cfif LEN(ATTRIBUTES.alertMessage) GT 0>
		<cfoutput>
            #ATTRIBUTES.alertMessage#
        </cfoutput>
    </cfif>
	<cfif Attributes.advancedPlanSearch EQ 1>
		<script src="/assets/js/advancedplansearch.js"></script>			
	</cfif>
	</body>
</html>
</cfif>