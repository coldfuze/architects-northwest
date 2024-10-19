<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<cfparam name="Attributes.Title" default="Stock Home Plans for Every Style - CornerStone Designs">
<cfparam name="Attributes.Description" default="">
<cfparam name="Attributes.Keywords" default="">
<cfparam name="Attributes.RecentlyViewedPlans" default="">
<cfparam name="Attributes.ScrollSimilarPlans" default=0>
<cfparam name="Attributes.SimilarPlansToDisplay" default=0>
<cfparam name="Attributes.TotalSimilarPlans" default=0>
<cfparam name="Attributes.PlanId" default=0>
<cfparam name="Attributes.minHeight" default=500>
<cfparam name="Attributes.cannedSearch" default="0">
<cfparam name="Attributes.alertMessage" default="">

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
		VARIABLES.favIcon = "http://www.cornerstonedesigns.com/cdfavicon.ico";
	}
	else {
		VARIABLES.favIcon = "http://www.architectsnw.com/favicon.ico";	
	}
	
	// Architectural Style Links
	VARIABLES.ArchitecturalStyleLinks = Application.PlanSearchService.getSideBarLinks(1);
	
	// Popular Search Links
	VARIABLES.PopularSearchLinks = Application.PlanSearchService.getSideBarLinks(2);
	
	// Popular Search Links
	VARIABLES.HousePlanCollectionLinks = Application.PlanSearchService.getSideBarLinks(3);
	
	// Get a random new plan
	VARIABLES.NewPlan = Application.PlanService.getFeaturedPlanInfoForSearchSubGrouping(28);
</cfscript>

<!--- Get Quick Search Business Logic --->
<cfinclude template="/includes/quickSearchBusinessLogic.cfm">

<cfif thisTag.ExecutionMode EQ "Start">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<cfoutput>
		<title>#Attributes.Title#</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link rev="made" href="mailto:webmaster@architectsnw.com"/>
        <meta name="title" content="#Attributes.Title#"/>
        <meta name="Keywords" content="#Attributes.Keywords#"/>
        <meta name="Description" content="#Attributes.Description#"/>
        <meta name="author" content="Leon O'Daniel - O'Daniel Designs"/>
        <meta name="creator" content="Leon O'Daniel - O'Daniel Designs"/> 
		<link rel="stylesheet" type="text/css" href="/assets/css/styleAlt.css"/>
        <link rel="stylesheet" type="text/css" href="/assets/skins/tango/skin2.css" />
        <link rel="stylesheet" type="text/css" href="/assets/css/quickSearch.css"/>
        <link rel="shortcut icon" href="#VARIABLES.favIcon#"/>
        <script type="text/javascript" src="/assets/js/script.js"></script>
		<script
			  src="https://code.jquery.com/jquery-1.12.4.min.js"
			  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
			  crossorigin="anonymous"></script>
		<!---<script
		  src="https://code.jquery.com/jquery-3.6.3.min.js"
		  integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
		  crossorigin="anonymous"></script>
		<script
		  src="https://code.jquery.com/jquery-migrate-3.4.0.min.js"
		  integrity="sha256-mBCu5+bVfYzOqpYyK4jm30ZxAZRomuErKEFJFIyrwvM="
		  crossorigin="anonymous"></script>--->
		<!---<script type="text/javascript" src="/assets/js/jquery.jshowoff.min.js"></script>--->
		<script type="text/javascript" src="/assets/js/jquery.jcarousel.min.js"></script>
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
		<script src="/assets/js/quicksearch.js"></script>
		</cfoutput>
    </head>
    
    <body>
        <!---<cfif CGI.HTTP_USER_AGENT CONTAINS "MSIE 6">
            <script type="text/javascript">var MenuLinkedBy="AllWebMenus [4]",awmMenuName="cornerstone",awmBN="858";awmAltUrl="";</script><script charset="UTF-8" src="/assets/js/cornerstoneIE6.js" type="text/javascript"></script><script type="text/javascript">awmBuildMenu();</script>
        <cfelse>
            <script type="text/javascript">var MenuLinkedBy="AllWebMenus [4]",awmMenuName="cornerstone",awmBN="858";awmAltUrl="";</script><script charset="UTF-8" src="/assets/js/cornerstoneHP.js" type="text/javascript"></script><script type="text/javascript">awmBuildMenu();</script>
        </cfif>--->
		<!-- DO NOT MOVE! The following AllWebMenus linking code section must always be placed right AFTER the BODY tag-->
		<!-- ******** BEGIN ALLWEBMENUS CODE FOR architectsnw ******** -->
		<script type="text/javascript">var MenuLinkedBy="AllWebMenus [4]",awmMenuName="architectsnw",awmBN="940";</script><script charset="UTF-8" src="/assets/js/architectsnwSP.js" type="text/javascript"></script><script type="text/javascript">awmBuildMenu();</script>
		<!-- ******** END ALLWEBMENUS CODE FOR architectsnw ******** -->
        <div id="wrapper">
            <div id="banner">
                <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                    <img name="CornerStoneDesignsHeader" src="/assets/pageHeaders/CornerStoneDesignsPageHeader.jpg" width="941" height="140" border="0" id="CornerStoneDesignsHeader" usemap="#mapCornerStoneDesignsHeader" alt="CornerStone Designs" />
                    <map name="mapCornerStoneDesignsHeader" id="mapCornerStoneDesignsHeader">
                        <area shape="rect" coords="894,8,927,39" href="http://www.youtube.com/user/ArchitectsNW?feature=mhum#p/a" target="_blank" title="Click to view our YouTube page" alt="Click to view our YouTube page" />
                        <area shape="rect" coords="854,7,890,38" href="http://twitter.com/ArchitectsNW" target="_blank" title="Click to view our Twitter page" alt="Click to view our Twitter page" />
                        <area shape="rect" coords="816,8,851,39" href="http://www.facebook.com/ArchitectsNW?v=info" target="_blank" title="Click to view our Facebook page" alt="Click to view our Facebook page" />
                        <area shape="rect" coords="15,23,326,140" href="/default.cfm" title="CornerStone Designs" alt="CornerStone Designs" />
                        <area shape="rect" coords="707,85,933,120" href="tel:1-888-884-9488" title="1-888-884-9488" alt="1-888-884-9488" />
                        <area shape="rect" coords="688,120,933,140" href="mailto:Info@CornerStoneDesigns.com" title="Info@CornerStoneDesigns.com" alt="Info@CornerStoneDesigns.com" />
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
                    </map>
                </cfif>
            </div>
            <div id="nav" style="margin: 0 0 10px -10px;"></div>
        </div>
        <div id="contentWrapper">
            <div id="leftColumn">
                <div id="quickSearchContainer">
                    <div id="qsTop">
                        <a id="avs" href="/plans/"></a>
                    </div>
                    <div class="clearFloat">
                    <div id="qsContainer">
                        <h1 class="quickSearch">Search by Plan Name:</h1>
                        <form name="sbpn" action="/plans/detailedPlanInfo.cfm" method="get" style="margin:0 0 10px 0;white-space:nowrap;vertical-align:middle;">
                            <input type="hidden" name="nps" value="0">
                            <cfif CGI.HTTP_USER_AGENT CONTAINS "MSIE 6.0">
                                <input name="PlanTitle" type="text" autosuggest="#ValueList(planTitlePicklist.PlanTitle)#" style="margin-right:2px;color:black;font-size:12px;width:138px;" align="left" value="Enter a Plan Name" onClick="this.form.PlanTitle.value='';">
                            <cfelse>
                                <input name="PlanTitle" type="text" maxresultsdisplayed="20" style="margin-right:0px;color:black;font-size:12px;width:141px;" align="left" value="Enter a Plan Name" onClick="this.form.PlanTitle.value='';">
                            </cfif>
                            <input type="image" src="/assets/images/btn_Go.gif" name="submit" value="Go" style="display:inline-block;vertical-align:bottom;">
                        </form>
                        
                        <h1 class="quickSearch3">Search By Plan Number:</h1>
                        <form name="sbpno" action="/plans/detailedPlanInfo.cfm" method="get" style="margin:0 0 10px 0;white-space:nowrap;">
                            <input type="hidden" name="nps" value="0">
                            <select name="PlanId"  style="font-size:12px;width:173px;" onChange="this.form.submit();">
                                <option value="">Select a Plan Number</option>
								<cfoutput query="VARIABLES.planNumberPicklist">
								<option value="#EncodeForHTMLAttribute(PlanId)#">#EncodeForHTML(PlanNumber)#</option>
								</cfoutput>
                            </select>
                        </form>
                        
                        <h1 class="quickSearch3">Search By Plan Type:</h1>
                        <form name="sbpt" action="/plans/planSearchResults.cfm" method="get" style="margin:0 0 10px 0;white-space:nowrap;">
                            <select name="Id" style="font-size:12px;width:173px;" onChange="this.form.submit();">
                                <option value="8">Select a Plan Type</option>
                                <option value="8">Show All Plans</option>
                                <option value="34">1 Story House Plans</option>
                                <option value="35">1 Story House Plans With Basement</option>
                                <option value="36">2 Story House Plans</option>
                                <option value="37">2 Story House Plans With Basement</option>
                                <option value="38">3 Story House Plans</option>
                                <option value="39">3 Story House Plans With Basement</option>
                                <option value="3">Garage and Accessory Plans</option>
                                <option value="55">Split Level Plans</option>
                                <option value="56">Tri Level Plans</option>
                            </select>
                        </form>
                        
                        <h1 class="quickSearch2">Search By Plan Features:</h1>
                        <form name="sbps" id="sbps" style="margin:0;white-space:nowrap;">
                            <h1 class="quickSearch3">Plan Type:</h1>
                            <select id="qsPlanTypeId" name="PlanTypeId" value="PlanTypeId" style="font-size:12px;width:172px;">
                                <option value="0">Any</option>
								<cfloop query="VARIABLES.ptng">
									<cfif PlanTypeId EQ Session.qsPlanType>
										<cfoutput><option selected value="#EncodeForHTMLAttribute(PlanTypeId)#">#EncodeForHTML(PlanType)#</option></cfoutput>
									<cfelse>
										<cfoutput><option value="#EncodeForHTMLAttribute(PlanTypeId)#">#EncodeForHTML(PlanType)#</option></cfoutput>
									</cfif>
								</cfloop>
                            </select>
                            <h1 class="quickSearch3">Square Footage:</h1>
                           
                            <div class="quickSearchLeft">
                                <select id="qsSquareFootageLow" name="SquareFootageLow" style="font-size:12px;width:84px;">
                                    <option value="0">Min</option>
                                    <cfloop from="500" to="7000" step="500" index="i"><cfif i EQ Session.qsSquareFootageLow><cfoutput><option selected value="#i#">#i#</option></cfoutput><cfelse><cfoutput><option value="#i#">#i#</option></cfoutput></cfif></cfloop>
                                </select>
                            </div>
                            
                            <div class="quickSearchRight">
                                <select id="qsSquareFootageHigh" name="SquareFootageHigh" style="font-size:12px;width:84px;">
                                    <option value="11000">Max</option>
                                    <cfloop from="1000" to="7000" step="500" index="i"><cfif i EQ Session.qsSquareFootageHigh><cfoutput><option selected value="#i#">#i#</option></cfoutput><cfelse><cfoutput><option value="#i#">#i#</option></cfoutput></cfif></cfloop>
                                    <option value="11000">7500 +</option>
                                </select>
                            </div>
                            <div class="qsClearFloat"></div>
                            
                            <div class="quickSearchLeft">
                                <h1 class="quickSearch">Bedrooms:</h1>
                                <select id="qsBedrooms" name="Bedrooms" style="font-size:12px;width:84px;">
                                    <option value="100">Any</option>
									<cfloop query="VARIABLES.br">
										<cfoutput>#VARIABLES.br.currentrow#</cfoutput>
										<cfif BedroomId EQ Session.qsBedrooms>
											<cfoutput><option selected value="#EncodeForHTMLAttribute(BedroomId)#">#EncodeForHTML(Bedroom)#</option></cfoutput>
										<cfelse>
											<cfoutput><option value="#EncodeForHTMLAttribute(BedroomId)#">#EncodeForHTML(Bedroom)#</option></cfoutput>
										</cfif>
									</cfloop>
                                </select>
                            </div>
                            <div class="quickSearchRight">
                                <h1 class="quickSearch">Full Baths:</h1>
                                <select id="qsBathrooms" name="Bathrooms" style="font-size:12px;width:84px;">
                                    <option value="100">Any</option>
									<cfloop query="VARIABLES.fbr">
									<cfif FullBathroomId EQ Session.qsBathrooms>
										<cfoutput><option selected value="#EncodeForHTMLAttribute(FullBathroomId)#">#EncodeForHTML(FullBathroom)#</option></cfoutput>
									<cfelse>
										<cfoutput><option value="#EncodeForHTMLAttribute(FullBathroomId)#">#EncodeForHTML(FullBathroom)#</option></cfoutput>
									</cfif>
									</cfloop>	 
                                </select>
                            </div>
                            <div class="clearFloat"></div>
                        </form>
                        <br clear="all" />

						<div id="qsPlanCount"></div>
                    
                        <div id="qsPlanSearchSubmit">
                            <form name="qsSearch" action="/plans/QuickSearchResults.cfm" method="get">
                                <input type="hidden" name="so" value="1">
                                <input type="submit" name="quickSearch" value="Begin Search" style="margin-bottom:10px;font-weight:bold;">
                            </form>
                            <cfoutput><a href="#CGI.SCRIPT_NAME#?reset=1" onclick="javascript:document.getElementById('sbps').reset();" class="qs">Reset Search</a></cfoutput>
                        </div>
                        </div>
                    </div>
                </div>
                <div id="planStyles">
                    <cfoutput>#VARIABLES.PopularSearchLinks#</cfoutput>
                	<cfoutput>#VARIABLES.ArchitecturalStyleLinks#</cfoutput>
                	<cfoutput>#VARIABLES.HousePlanCollectionLinks#</cfoutput>
                </div>
            </div>
</cfif>
<cfif thisTag.ExecutionMode EQ "End">
			<div id="rightColumn">
            	<div id="newPlan">
                	<strong><a href="/plans/planSearchResults.cfm?Id=6" class="brownLink">NEW<br />PLANS</a></strong>
                	<br />
                	<cfoutput query="VARIABLES.NewPlan">
                    <a href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#&nps=0" title="Click to view #PlanTitle# - Plan #PlanNumber#"><img src="#PlanThumbnail#" width="165" height="121" border=0 style="padding-top:5px;padding-bottom:5px;" alt="Carberry" /></a>
                    <strong><a href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#&nps=0" title="Click to view The #PlanTitle# - Plan #PlanNumber#" class="brownLink">#PlanTitle#<br />#PlanNumber#</a></strong>
                    <div style="font-size:12px;position:relative;padding:5px 0 5px 5px;">
                        <div style="float:left;width:80px;text-align:left;margin:10px 0 10px 0;">
                            Total Area:<br />
                            Stories:<br />
                            Bedrooms:<br />
                            Full Baths:
                        </div>
                        <div style="float:left;width:85px;text-align:right;margin:10px 0 10px 0;">
                            #TotalSF# sq. ft.<br />
                            #Stories#<br />
                            #Bedroom#<br />
                            #FullBathroom#
                        </div>
                        <br clear="all" />
                        <strong><a class="planSpec" href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#&nps=0" title="Click to view #PlanTitle# - Plan #PlanNumber#">View Floor Plan</a></strong>
                        </cfoutput>
                    </div>
                 </div>
                
            	<div id="chat" style="width:179px;">
                    <img src="/assets/images/PayPal.gif" width="175" height="154" alt="Pay Pal Image"/>
                </div>
                
                <div id="whiteSpacer"></div>
                
                <div id="buildingProducts">
                	<strong>BUILDING<br />
                    PRODUCTS</strong>
                    <br />
                    <img src="/assets/images/SponsorLogos.jpg" width="174" height="592" border=0 usemap="#m_SponsorLogos">
                </div>
            </div>
        </div>
							
	<!---<cfif IsDefined("VARIABLES.RecentlyViewedPlanInfo") AND CGI.REMOTE_ADDR EQ "73.140.180.241">
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
                    <div id="rvp" data-slick='{"slidesToShow": 4, "slidesToScroll": 1}'>
                    <cfoutput query="VARIABLES.RecentlyViewedPlanInfo">
                    	<div style="width:165px;height:300px;font-size:14px;">
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
                    </div>
					</cfoutput>
                    </div>
                    <cfif VARIABLES.ScrollRecentlyViewedPlans NEQ 1></div></cfif>
                </div>
            </div>
        </div>
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
	</body>
</html>
</cfif>