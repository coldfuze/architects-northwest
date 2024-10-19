<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="CommonScripts.cfm">

<!--- Set the page title --->
	<cfscript>	
        if (CGI.HTTP_HOST CONTAINS "CornerStone") {
            VARIABLES.pageTitle = "Stock Home Plans for Every Style - CornerStone Designs";	
        }
        else {
            VARIABLES.pageTitle = "Your Family Architect - Architects Northwest";		
        }
    </cfscript>

<!--- Get Quick Search Business Logic --->
	<cfinclude template="includes/quickSearchBusinessLogic.cfm">

<!--- Random Range Functions to support image rotation --->
	<cfscript>
		// Set up Random Display of Architectural Style Plans (group 1)
		VARIABLES.thisASPlan = RandRange(1,8);
		
		// Set up Random Display of Architectural Style Plans (group 2)
		VARIABLES.thisASPlan2 = RandRange(9,16);
		
		// Set up Random Display of Architectural Style Plans (group 3)
		VARIABLES.thisASPlan3 = RandRange(17,24);
	</cfscript>
    
<!--- Get Random New Plan, Award Winning Plan and Best Selling Plan --->
	<cfscript>
		VARIABLES.NewPlan = Application.PlanService.getFeaturedPlanInfoForSearchSubGrouping(28);
		VARIABLES.AwardWinningPlan = Application.PlanService.getFeaturedPlanInfoForSearchSubGrouping(25);
		VARIABLES.BestSellingPlan = Application.PlanService.getFeaturedPlanInfoForSearchSubGrouping(26);
	</cfscript>
    
<cfmodule template="#Application.CTPath#hpLayout2019.cfm" title="#VARIABLES.pageTitle#" recentlyviewedplans="#VARIABLES.RecentlyViewedPlans#">	
            <div id="bodyWrapper">
            	<div id="quickSearch">
                	<div id="qsTop">
                        <a id="avs" href="/plans/"></a>
                    </div>
                    <div class="clearFloat"></div>
                    <div id="qsContainer">
                    	<h1 class="quickSearch">Search by Plan Name:</h1>
                        <cfform name="sbpn" action="/plans/detailedPlanInfo.cfm" method="get" style="margin:0 0 10px 0;padding:0;white-space:nowrap;vertical-align:middle;">
                            <cfinput type="hidden" name="nps" value="0">
                            <cfif CGI.HTTP_USER_AGENT CONTAINS "MSIE 6.0">
                                <cfinput name="PlanTitle" type="text" autosuggest="#ValueList(planTitlePicklist.PlanTitle)#" maxresultsdisplayed="20" style="margin-right:2px;color:black;font-size:12px;width:138px;" align="left" value="Enter a Plan Name" onClick="this.form.PlanTitle.value='';">
                            <cfelse>
                                <cfinput name="PlanTitle" type="text" autosuggest="#ValueList(planTitlePicklist.PlanTitle)#" maxresultsdisplayed="20" style="margin-right:2px;color:black;font-size:12px;width:141px;" align="left" value="Enter a Plan Name" onClick="this.form.PlanTitle.value='';">
                            </cfif>
                            <cfif CGI.HTTP_USER_AGENT CONTAINS "Chrome" OR CGI.HTTP_USER_AGENT CONTAINS "Safari">
                                <cfinput type="image" src="/assets/images/btn_Go.gif" name="submit" value="Go" style="display:inline-block;padding-top:2px;">
                            <cfelse>
                                <cfinput type="image" src="/assets/images/btn_Go.gif" name="submit" value="Go" style="display:inline-block;">
                            </cfif>
                        </cfform>
                        <h1 class="quickSearch3">Search By Plan Number:</h1>
                        <cfform name="sbpno" action="/plans/detailedPlanInfo.cfm" method="get" style="margin:0 0 10px 0;padding:0;white-space:nowrap;">
                            <cfinput type="hidden" name="nps" value="0">
                            <cfselect name="PlanId" query="VARIABLES.planNumberPicklist" display="PlanNumber" value="PlanId" queryPosition="below" style="font-size:12px;width:173px;" onChange="this.form.submit();">
                                <option value="">Select a Plan Number</option>
                            </cfselect>
                        </cfform>
                        
                        <h1 class="quickSearch3">Search By Plan Type:</h1>
                        <cfform name="sbpt" action="/plans/planSearchResults.cfm" method="get" style="margin:0 0 10px 0;padding:0;white-space:nowrap;">
                            <cfselect name="Id" style="font-size:12px;width:173px;" onChange="this.form.submit();">
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
                            </cfselect>
                        </cfform>
                        
                        <h1 class="quickSearch2">Search By Plan Features:</h1>
                        
                        <cfform name="sbps" id="sbps" style="margin:0;white-space:nowrap;">
                            <h1 class="quickSearch3">Plan Type:</h1>
                            <cfselect name="PlanTypeId" query="VARIABLES.ptng" display="PlanType" selected="#VARIABLES.PlanType#" queryPosition="below" value="PlanTypeId" style="font-size:12px;width:172px;">
                                <option value="0">Any</option>
                            </cfselect>
                            <h1 class="quickSearch3">Square Footage:</h1>
                           
                            <div class="quickSearchLeft">
                                <cfselect name="SquareFootageLow" style="font-size:12px;width:84px;">
                                    <option value="0">Min</option>
                                    <cfloop from="500" to="7000" step="500" index="i"><cfif i EQ VARIABLES.squareFootageLow><cfoutput><option selected value="#i#">#i#</option></cfoutput><cfelse><cfoutput><option value="#i#">#i#</option></cfoutput></cfif></cfloop>
                                </cfselect>
                            </div>
                            
                            <div class="quickSearchRight">
                                <cfselect name="SquareFootageHigh" style="font-size:12px;width:84px;">
                                    <option value="11000">Max</option>
                                    <cfloop from="1000" to="7000" step="500" index="i"><cfif i EQ VARIABLES.squareFootageHigh><cfoutput><option selected value="#i#">#i#</option></cfoutput><cfelse><cfoutput><option value="#i#">#i#</option></cfoutput></cfif></cfloop>
                                    <option value="11000">7500 +</option>
                                </cfselect>
                            </div>
                            <div class="qsClearFloat"></div>
                            
                            <div class="quickSearchLeft">
                                <h1 class="quickSearch">Bedrooms:</h1>
                                <cfselect name="Bedrooms" query="VARIABLES.br" display="Bedroom" value="BedroomId" selected="#VARIABLES.Bedrooms#" queryPosition="below" style="font-size:12px;width:84px;">
                                    <option value="100">Any</option>
                                </cfselect>
                            </div>
                            
                            <div class="quickSearchRight">
                                <h1 class="quickSearch">Full Baths:</h1>
                                <cfselect name="Bathrooms" query="VARIABLES.fbr" display="FullBathroom" value="FullBathroomId" selected="#VARIABLES.Bathrooms#" queryPosition="below" style="font-size:12px;width:84px;">
                                    <option value="100">Any</option>
                                </cfselect>
                            </div>
                            <div class="clearFloat"></div>
                        </cfform>
                        
                        <cfdiv id="qsPlanCount" bind="url:quickSearchPlans.cfm?PlanTypeId={PlanTypeId}&Bedrooms={Bedrooms}&Bathrooms={Bathrooms}&SquareFootageLow={SquareFootageLow}&SquareFootageHigh={SquareFootageHigh}" />
                                                
                        <div id="qsPlanSearchSubmit">
                            <cfform name="qsSearch" action="/plans/QuickSearchResults.cfm" method="get" style="margin:0;padding:0;">
                                <cfinput type="hidden" name="so" value="1">
                                <cfinput type="submit" name="thisQuickSearch" value="Begin Search" style="font-weight:bold;">
                            </cfform>
                        </div>
                        <div id="qsPlanSearchReset">
                            <cfoutput><a href="#CGI.SCRIPT_NAME#?reset=1" onClick="javascript:document.getElementById('sbps').reset();" class="qs">Reset Search</a></cfoutput>
                        </div>
                    </div>
                </div>
                <div id="hpAnimationWelcomeContainer">
                    <div id="animation">
                        <div id="slopingLotUpHillPlans" style="margin:0;padding:0;">
                            <a href="/plans/planSearchResults.cfm?Id=53"><img src="assets/animationImages/large/SlopingLotUphillPlans.jpg" width="538" height="302" alt="Click to view Sloping Lot Uphill Plans." border=0 /></a>
                        </div>
                        <div id="LuxuryHomeDesigns" style="margin:0;padding:0;">
                            <a href="/plans/planSearchResults.cfm?Id=48"><img src="assets/animationImages/large/LuxuryHomeDesigns.jpg" width="538" height="302" alt="Click to view Luxury Home Design Plans." border=0 /></a>
                        </div>
                        <div id="AwardWinningDesigns" style="margin:0;padding:0;">
                            <a href="/plans/planSearchResults.cfm?Id=1"><img src="assets/animationImages/large/AwardWinningDesigns.jpg" width="538" height="302" alt="Click to view Award Winning Design Plans." border=0 /></a>
                        </div>
                        <div id="CoveredPorchHouseDesigns" style="margin:0;padding:0;">
                            <a href="/plans/planSearchResults.cfm?Id=42"><img src="assets/animationImages/large/CoveredPorchHouseDesigns.jpg" width="538" height="302" alt="Click to view Covered Porch House Design Plans." border=0 /></a>
                        </div>
                        <div id="GreatRoomFloorPlans" style="margin:0;padding:0;">
                           <a href="/plans/planSearchResults.cfm?Id=47"> <img src="assets/animationImages/large/GreatRoomFloorPlans.jpg" width="538" height="302" alt="Click to view Great Room Floor Plans." border=0 /></a>
                        </div>
                        <div id="AffordableHomeDesigns" style="margin:0;padding:0;">
                            <a href="/plans/planSearchResults.cfm?Id=40"><img src="assets/animationImages/large/AffordableHomeDesigns.jpg" width="538" height="302" alt="Click to view our Affordable Home Design.jpg Plans." border=0 /></a>
                        </div>
                        <div id="NarrowLotHousePlans" style="margin:0;padding:0;">
                            <a href="/plans/planSearchResults.cfm?Id=50"><img src="assets/animationImages/large/NarrowLotHousePlans.jpg" width="538" height="302" alt="Click to view Narrow Lot House Plans." border=0 /></a>
                        </div>
                        <div id="GarageAndAccessoryPlans" style="margin:0;padding:0;">
                            <a href="/plans/planSearchResults.cfm?Id=3"><img src="assets/animationImages/large/GarageAndAccessoryPlans.jpg" width="538" height="302" alt="Click to view Garage and Accessory Plans." border=0 /></a>
                        </div>
                        <script type="text/javascript">		
							$(document).ready(function(){ $('#animation').jshowoff({ 
								links: false,
								speed: 5000,
								controls: false,
								effect: 'fade',
								cssClass: 'basicFeatures',
								hoverPause: true
							}); });
						</script>
                    </div>
                    <div id="welcome">
                        <img src="assets/images/welcome.gif" width="144" height="32" alt="Welcome" align="absbottom" />
                        <cfif CGI.HTTP_HOST Contains "Cornerstone">CornerStone Designs<cfelse>Architects Northwest</cfif> is an industry leader in custom and speculative residential designs, from efficient 
                        starter homes and carefully planned neighborhood developments to spectacular private estates.  We create 
                        <span style="white-space:nowrap;">eye-catching</span> designs with great curb appeal, documented by high-quality architectural drawings.  From our 
                        convenient web site, you can browse hundreds of <span style="white-space:nowrap;">state-of-the-art</span> home plans, order <span style="white-space:nowrap;">on-line</span>, or ask our 
                        experienced architects and designers how to make your dream house a reality.
                    </div>
                </div>
                <div id="newPlanChatContainer">
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
                        </div>
                        </cfoutput>
                    </div>
                    <div id="chat">
                        <img src="assets/images/PayPal.gif" width="175" height="154" alt="Pay Pal Image"/>
                    </div>
                </div>
                <div class="clearFloat"></div>
            </div>            
        	
            <div id="middleContent">
            	<div id="awardWinningBestSellingContainer">
                	<div id="awardWinningPlan">
                        <strong><a href="plans/planSearchResults.cfm?Id=1" class="brownLink">AWARD<br />WINNING DESIGNS</a></strong>
                        <br />
                        <cfoutput query="VARIABLES.AwardWinningPlan">
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
                    <div class="spacer"></div>
                    <div id="bestSellingPlan">
                        <strong><a href="plans/planSearchResults.cfm?Id=2" class="brownLink">BEST<br />SELLING PLANS</a></strong>
                        <br />
                        <cfoutput query="VARIABLES.BestSellingPlan">
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
                </div>
                <div id="featuredPlans">
                	<div id="architecturalStyles">
                        <div class="architecturalStyleContainer">
                            <cfif VARIABLES.thisASPlan EQ 1>
                            <strong><a href="plans/planSearchResults.cfm?Id=10" class="brownLink">ALPINE<br />HOUSE DESIGNS</a></strong>
                            <br />
                            <a href="plans/planSearchResults.cfm?Id=10"><img src="/assets/renderings/architecturalStyles/thumbnails/Alpine-House-Designs.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Alpine House Designs" /></a>
                            <cfelseif VARIABLES.thisASPlan EQ 2>
                            <strong><a href="plans/planSearchResults.cfm?Id=11" class="brownLink">BUNGALOW<br />HOUSE PLANS</a></strong>
                            <br />
                            <a href="plans/planSearchResults.cfm?Id=11"><img src="/assets/renderings/architecturalStyles/thumbnails/Bungalow-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Bungalow House Plans" /></a>
                            <cfelseif VARIABLES.thisASPlan EQ 3>
                            <strong><a href="plans/planSearchResults.cfm?Id=12" class="brownLink">CAPE COD<br />HOUSE PLANS</a></strong>
                            <br />
                            <a href="plans/planSearchResults.cfm?Id=12"><img src="/assets/renderings/architecturalStyles/thumbnails/Cape-Cod-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Cape Cod House Plans" /></a>
                            <cfelseif VARIABLES.thisASPlan EQ 4>
                            <strong><a href="plans/planSearchResults.cfm?Id=13" class="brownLink">CARRIAGE<br />HOUSE PLANS</a></strong>
                            <br />
                            <a href="plans/planSearchResults.cfm?Id=13"><img src="/assets/renderings/architecturalStyles/thumbnails/Cape-Cod-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Carriage House Plans" /></a>
                            <cfelseif VARIABLES.thisASPlan EQ 5>
                            <strong><a href="plans/planSearchResults.cfm?Id=14" class="brownLink">CHATEAU<br />HOUSE PLANS</a></strong>
                            <br />
                            <a href="plans/planSearchResults.cfm?Id=14"><img src="/assets/renderings/architecturalStyles/thumbnails/Chateau-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Chateau House Plans" /></a>
                            <cfelseif VARIABLES.thisASPlan EQ 6>
                            <strong><a href="plans/planSearchResults.cfm?Id=15" class="brownLink">COLONIAL<br />HOUSE PLANS</a></strong>
                            <br />
                            <a href="plans/planSearchResults.cfm?Id=15"><img src="/assets/renderings/architecturalStyles/thumbnails/Colonial-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Colonial House Plans" /></a>
                            <cfelseif VARIABLES.thisASPlan EQ 7>
                            <strong><a href="plans/planSearchResults.cfm?Id=16" class="brownLink">CONTEMPORARY<br />HOME PLANS</a></strong>
                            <br />
                            <a href="plans/planSearchResults.cfm?Id=16"><img src="/assets/renderings/architecturalStyles/thumbnails/Contemporary-Home-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Contemporary Home Plans" /></a>
                            <cfelseif VARIABLES.thisASPlan EQ 8>
                            <strong><a href="plans/planSearchResults.cfm?Id=17" class="brownLink">COTTAGE<br />HOUSE PLANS</a></strong>
                            <br />
                            <a href="plans/planSearchResults.cfm?Id=17"><img src="/assets/renderings/architecturalStyles/thumbnails/Cottage-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Cottage House Plans" /></a>
                            </cfif>
                        </div>
                        <div class="architecturalStyleContainer">
                            <cfif VARIABLES.thisASPlan2 EQ 9>
                            <strong><a href="plans/planSearchResults.cfm?Id=18" class="brownLink">COUNTRY<br />HOUSE PLANS</a></strong>
                            <br />
                            <a href="plans/planSearchResults.cfm?Id=18"><img src="/assets/renderings/architecturalStyles/thumbnails/Country-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Country House Plans" /></a>
                            <cfelseif VARIABLES.thisASPlan2 EQ 10>
                            <strong><a href="plans/planSearchResults.cfm?Id=19" class="brownLink">CRAFTSMAN<br />HOUSE PLANS</a></strong>
                            <br />
                            <a href="plans/planSearchResults.cfm?Id=19"><img src="/assets/renderings/architecturalStyles/thumbnails/Craftsman-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Craftsman House Plans" /></a>
                            <cfelseif VARIABLES.thisASPlan2 EQ 11>
                            <strong><a href="plans/planSearchResults.cfm?Id=20" class="brownLink">EUROPEAN<br />HOUSE PLANS</a></strong>
                            <br />
                            <a href="plans/planSearchResults.cfm?Id=20"><img src="/assets/renderings/architecturalStyles/thumbnails/European-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="European House Plans" /></a>
                            <cfelseif VARIABLES.thisASPlan2 EQ 12>
                            <strong><a href="plans/planSearchResults.cfm?Id=21" class="brownLink">FARM<br />HOUSE PLANS</a></strong>
                            <br />
                            <a href="plans/planSearchResults.cfm?Id=21"><img src="/assets/renderings/architecturalStyles/thumbnails/Farmhouse-Home-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Farmhouse Home Plans" /></a>
                            <cfelseif VARIABLES.thisASPlan2 EQ 13>
                            <strong><a href="plans/planSearchResults.cfm?Id=22" class="brownLink">HAMPTON<br />HOUSE PLANS</a></strong>
                            <br />
                            <a href="plans/planSearchResults.cfm?Id=22"><img src="/assets/renderings/architecturalStyles/thumbnails/Hampton-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Hampton House Plans" /></a>
                            <cfelseif VARIABLES.thisASPlan2 EQ 14>
                            <strong><a href="plans/planSearchResults.cfm?Id=23" class="brownLink">LODGE<br />HOUSE PLANS</a></strong>
                            <br />
                            <a href="plans/planSearchResults.cfm?Id=23"><img src="/assets/renderings/architecturalStyles/thumbnails/Lodge-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Lodge House Plans" /></a>
                            <cfelseif VARIABLES.thisASPlan2 EQ 15>
                            <strong><a href="plans/planSearchResults.cfm?Id=24" class="brownLink">MODERN<br />HOUSE PLANS</a></strong>
                            <br />
                            <a href="plans/planSearchResults.cfm?Id=24"><img src="/assets/renderings/architecturalStyles/thumbnails/Modern-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Modern House Plans" /></a>
                            <cfelseif VARIABLES.thisASPlan2 EQ 16>
                            <strong><a href="plans/planSearchResults.cfm?Id=25" class="brownLink">MOUNTAIN<br />HOUSE PLANS</a></strong>
                            <br />
                            <a href="plans/planSearchResults.cfm?Id=25"><img src="/assets/renderings/architecturalStyles/thumbnails/Mountain-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Mountain House Plans" /></a>
                            </cfif>
                        </div>
                        <div class="architecturalStyleRightContainer">
                                <cfif VARIABLES.thisASPlan3 EQ 17>
                                <strong><a href="plans/planSearchResults.cfm?Id=26" class="brownLink">NORTHWEST<br />FLOOR PLANS</a></strong>
                                <br />
                                <a href="plans/planSearchResults.cfm?Id=26"><img src="/assets/renderings/architecturalStyles/thumbnails/Northwest-Floor-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Northwest Floor Plans" /></a>
                                <cfelseif VARIABLES.thisASPlan3 EQ 18>
                                <strong><a href="plans/planSearchResults.cfm?Id=27" class="brownLink">PRARIE<br />HOME PLANS</a></strong>
                                <br />
                                <a href="plans/planSearchResults.cfm?Id=27"><img src="/assets/renderings/architecturalStyles/thumbnails/Prairie-Home-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Prarie Home Plans" /></a>
                                <cfelseif VARIABLES.thisASPlan3 EQ 19>
                                <strong><a href="plans/planSearchResults.cfm?Id=28" class="brownLink">RANCH<br />HOUSE PLANS</a></strong>
                                <br />
                                <a href="plans/planSearchResults.cfm?Id=28"><img src="/assets/renderings/architecturalStyles/thumbnails/Ranch-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Ranch House Plans" /></a>
                                <cfelseif VARIABLES.thisASPlan3 EQ 20>
                                <strong><a href="plans/planSearchResults.cfm?Id=29" class="brownLink">SHINGLE<br />HOUSE PLANS</a></strong>
                                <br />
                                <a href="plans/planSearchResults.cfm?Id=29"><img src="/assets/renderings/architecturalStyles/thumbnails/Shingle-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Shingle House Plans" /></a>
                                <cfelseif VARIABLES.thisASPlan3 EQ 21>
                                <strong><a href="plans/planSearchResults.cfm?Id=30" class="brownLink">SHOTGUN<br />FLOOR PLANS</a></strong>
                                <br />
                                <a href="plans/planSearchResults.cfm?Id=30"><img src="/assets/renderings/architecturalStyles/thumbnails/Shotgun-Floor-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Shotgun Floor Plans" /></a>
                                <cfelseif VARIABLES.thisASPlan3 EQ 22>
                                <strong><a href="plans/planSearchResults.cfm?Id=31" class="brownLink">TRADITIONAL<br />HOUSE PLANS</a></strong>
                                <br />
                                <a href="plans/planSearchResults.cfm?Id=31"><img src="/assets/renderings/architecturalStyles/thumbnails/Traditional-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Traditional House Plans" /></a>
                                <cfelseif VARIABLES.thisASPlan3 EQ 23>
                                    <strong><a href="plans/planSearchResults.cfm?Id=32" class="brownLink">TUDOR<br />HOUSE PLANS</a></strong>
                                <br />
                                <a href="plans/planSearchResults.cfm?Id=32"><img src="/assets/renderings/architecturalStyles/thumbnails/Tudor-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Tudor House Plans" /></a>
                                <cfelseif VARIABLES.thisASPlan3 EQ 24>
                                <strong><a href="plans/planSearchResults.cfm?Id=33" class="brownLink">VICTORIAN<br />HOUSE DESIGNS</a></strong>
                                <br />
                                <a href="plans/planSearchResults.cfm?Id=33"><img src="/assets/renderings/architecturalStyles/thumbnails/Victorian-House-Designs.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Victorian House Designs" /></a>
                                </cfif>
                        </div>
                        <div class="clearFloat"></div>
                    </div>
                    <div class="middleSpacer"></div>
                    <div id="hpTextLinkContainer">
                        <div id="hpPopularSearches">
                           <a href="plans/popularSearches.cfm" class="brownLink">POPULAR SEARCHES</a><br />
                           <div class="hpSearch">
                                <a href="/plans/planSearchResults.cfm?Id=1" class="brownLinkNoBold">Award Winning Designs</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=2" class="brownLinkNoBold">Best Selling Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=3" class="brownLinkNoBold">Garage &amp; Accessory Plans</a>
                           </div>
                           <div class="hpSearch">
                                <a href="/plans/planSearchResults.cfm?Id=4" class="brownLinkNoBold">Green Plans</a><br />
                                <a href="/plans/homesByDesigner.cfm" class="brownLinkNoBold">Homes By Designer</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=6" class="brownLinkNoBold">New Plans</a>
                           </div>
                           <div class="hpSearchRight">
                                <a href="/plans/planSearchResults.cfm?Id=7" class="brownLinkNoBold">Plans Coming Soon</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=8" class="brownLinkNoBold">Show All Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=61" class="brownLinkNoBold">Suncadia Collection</a>
                           </div>
                           <div class="clearFloat"></div>
                        </div>
                        <div id="hpArchitecturalStyles">
                           <a href="plans/architecturalStyles.cfm" class="brownLink">ARCHITECTURAL STYLES</a><br />
                           <div class="hpSearch">
                                <a href="/plans/planSearchResults.cfm?Id=10" class="brownLinkNoBold">Alpine House Designs</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=11" class="brownLinkNoBold">Bungalow House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=12" class="brownLinkNoBold">Cape Cod House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=13" class="brownLinkNoBold">Carriage House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=14" class="brownLinkNoBold">Chateau House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=15" class="brownLinkNoBold">Colonial House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=16" class="brownLinkNoBold">Contemporary Home Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=17" class="brownLinkNoBold">Cottage House Plans</a>
                           </div>
                           <div class="hpSearch">
                                <a href="/plans/planSearchResults.cfm?Id=18" class="brownLinkNoBold">Country House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=19" class="brownLinkNoBold">Craftsman House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=20" class="brownLinkNoBold">European House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=21" class="brownLinkNoBold">Farmhouse Home Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=22" class="brownLinkNoBold">Hampton House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=23" class="brownLinkNoBold">Lodge House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=24" class="brownLinkNoBold">Modern House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=25" class="brownLinkNoBold">Mountain House Plans</a>
                           </div>
                           <div class="hpSearchRight">
                                <a href="/plans/planSearchResults.cfm?Id=26" class="brownLinkNoBold">Northwest Floor Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=27" class="brownLinkNoBold">Prairie Home Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=28" class="brownLinkNoBold">Ranch House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=29" class="brownLinkNoBold">Shingle House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=30" class="brownLinkNoBold">Shotgun Floor Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=31" class="brownLinkNoBold">Traditional House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=32" class="brownLinkNoBold">Tudor House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=33" class="brownLinkNoBold">Victorian House Designs</a>
                           </div>
                           <div class="clearFloat"></div>
                        </div>
                        <div id="hpHousePlanCollections">
                           <a href="plans/housePlanCollections.cfm" class="brownLink">HOUSE PLAN COLLECTIONS</a><br />
                           <div class="hpSearch">
                                <a href="/plans/planSearchResults.cfm?Id=34" class="brownLinkNoBold">1 Story House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=35" class="brownLinkNoBold">1 Story House Plans<br />
                                &nbsp;&nbsp;&nbsp;With Basement</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=36" class="brownLinkNoBold">2 Story House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=37" class="brownLinkNoBold">2 Story House Plans<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;With Basement</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=38" class="brownLinkNoBold">3 Story House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=39" class="brownLinkNoBold">3 Story House Plans<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;With Basement</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=40" class="brownLinkNoBold">Affordable Home Designs</a>
                           </div>
                           <div class="hpSearch">
                                <a href="/plans/planSearchResults.cfm?Id=41" class="brownLinkNoBold">Bonus Space Floor Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=42" class="brownLinkNoBold">Covered Porch House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=43" class="brownLinkNoBold">Garage Detach House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=44" class="brownLinkNoBold">Garage Rear House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=45" class="brownLinkNoBold">Garage Side House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=46" class="brownLinkNoBold">Garage Under House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=47" class="brownLinkNoBold">Great Room Floor Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=48" class="brownLinkNoBold">Luxury Home Designs</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=49" class="brownLinkNoBold">Master Bedroom Main Floor</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=50" class="brownLinkNoBold">Narrow Lot House Plans</a>
                           </div>
                           <div class="hpSearchRight">
                                <a href="/plans/planSearchResults.cfm?Id=51" class="brownLinkNoBold">Sloping Lot (Down Hill) Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=52" class="brownLinkNoBold">Sloping Lot (Side Hill) Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=53" class="brownLinkNoBold">Sloping Lot (Up Hill) Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=54" class="brownLinkNoBold">Small House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=55" class="brownLinkNoBold">Split Level Home Designs</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=56" class="brownLinkNoBold">Tri Level Home Designs</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=57" class="brownLinkNoBold">Vacation House Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=58" class="brownLinkNoBold">View Lot (Front) Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=59" class="brownLinkNoBold">View Lot (Rear) Plans</a><br />
                                <a href="/plans/planSearchResults.cfm?Id=60" class="brownLinkNoBold">Wide Lot House Plans</a>
                           </div>
                           <div class="clearFloat"></div>
                        </div>
                    </div>
                </div>
            <div id="hpSponsors">
                <strong><a href="/buildingResources/buildingProducts.cfm" class="brownLink">BUILDING<br />PRODUCTS</a></strong>
                <br />
                <img src="/assets/images/SponsorLogos.jpg" width="174" height="592" border=0 usemap="#m_SponsorLogos">
            </div>
        </div>
    </div>
</cfmodule>