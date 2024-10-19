<!--- Set the Page Title --->
	<cfscript>
		// Page Titles	
		if (CGI.HTTP_HOST CONTAINS "CornerStone") {
			VARIABLES.pageTitle = "Architectural Styles - Stock Home Plans for Every Style - CornerStone Designs";	
		}
		else {
			VARIABLES.pageTitle = "Architectural Styles - Your Family Architect - Architects Northwest";		
		}
	
		// Popular Search Links
		VARIABLES.PopularSearchLinks = Application.PlanSearchService.getSideBarLinks(2);
		
		// Popular Search Links
		VARIABLES.HousePlanCollectionLinks = Application.PlanSearchService.getSideBarLinks(3);
		
		// Randon New Plan
		VARIABLES.NewPlan = Application.PlanService.getFeaturedPlanInfoForSearchSubGrouping(28);
	</cfscript>
 
<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<!--- Get Quick Search Business Logic --->
	<cfinclude template="../includes/quickSearchBusinessLogic.cfm">

    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#" recentlyViewedPlans="#VARIABLES.RecentlyViewedPlans#">
        <div id="mainPlanStyleContainer">
        	<cfinclude template="../assets/customTags/quickSearch.cfm">
            
            <div style="position:absolute;top:498px;left:10px;width:164px;padding:10px;height:1032px;line-height:17px;font-size:12px;background-color:#caccbb;text-align:left;margin-bottom:10px;">
            	<cfoutput>#VARIABLES.PopularSearchLinks#</cfoutput>
                <cfoutput>#VARIABLES.HousePlanCollectionLinks#</cfoutput>
            </div>
            
            <div id="planStyleContainer">
            	<div id="titleBar">
                	ARCHITECTURAL STYLES
                </div>

                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;">
                    <strong><a href="planSearchResults.cfm?Id=10" class="brownLink">ALPINE<br />HOUSE DESIGNS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=10"><img src="/assets/renderings/architecturalStyles/thumbnails/Alpine-House-Designs.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Alpine House Designs" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;">
                	<strong><a href="planSearchResults.cfm?Id=11" class="brownLink">BUNGALOW<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=11"><img src="/assets/renderings/architecturalStyles/thumbnails/Bungalow-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Bungalow House Plans" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;">
                    <strong><a href="planSearchResults.cfm?Id=12" class="brownLink">CAPE COD<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=12"><img src="/assets/renderings/architecturalStyles/thumbnails/Cape-Cod-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Cape Cod House Plans" /></a>
                </div>
                <br clear="all" />
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=13" class="brownLink">CARRIAGE<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=13"><img src="/assets/renderings/architecturalStyles/thumbnails/Cape-Cod-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Carriage House Plans" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                	<strong><a href="planSearchResults.cfm?Id=14" class="brownLink">CHATEAU<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=14"><img src="/assets/renderings/architecturalStyles/thumbnails/Chateau-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Chateau House Plans" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=15" class="brownLink">COLONIAL<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=15"><img src="/assets/renderings/architecturalStyles/thumbnails/Colonial-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Colonial House Plans" border="0" /></a>
                </div>
                <br clear="all" />
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=16" class="brownLink">CONTEMPORARY<br />HOME PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=16"><img src="/assets/renderings/architecturalStyles/thumbnails/Contemporary-Home-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Contemporary Home Plans" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                	<strong><a href="planSearchResults.cfm?Id=17" class="brownLink">COTTAGE<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=17"><img src="/assets/renderings/architecturalStyles/thumbnails/Cottage-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Cottage House Plans" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=18" class="brownLink">COUNTRY<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=18"><img src="/assets/renderings/architecturalStyles/thumbnails/Country-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Country House Plans" border="0" /></a>
                </div>
                <br clear="all" />
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=19" class="brownLink">CRAFTSMAN<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=19"><img src="/assets/renderings/architecturalStyles/thumbnails/Craftsman-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Craftsman House Plans" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                	<strong><a href="planSearchResults.cfm?Id=20" class="brownLink">EUROPEAN<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=20"><img src="/assets/renderings/architecturalStyles/thumbnails/European-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="European House Plans" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=21" class="brownLink">FARM<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=21"><img src="/assets/renderings/architecturalStyles/thumbnails/Farmhouse-Home-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Farmhouse Home Plans" border="0" /></a>
                </div>
                <br clear="all" />
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=22" class="brownLink">HAMPTON<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=22"><img src="/assets/renderings/architecturalStyles/thumbnails/Hampton-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Hampton House Plans" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                	<strong><a href="planSearchResults.cfm?Id=23" class="brownLink">LODGE<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=23"><img src="/assets/renderings/architecturalStyles/thumbnails/Lodge-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Lodge House Plans" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=24" class="brownLink">MODERN<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=24"><img src="/assets/renderings/architecturalStyles/thumbnails/Modern-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Modern House Plans" border="0" /></a>
                </div>
                <br clear="all" />
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=25" class="brownLink">MOUNTAIN<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=25"><img src="/assets/renderings/architecturalStyles/thumbnails/Mountain-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Mountain House Plans" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                	<strong><a href="planSearchResults.cfm?Id=26" class="brownLink">NORTHWEST<br />FLOOR PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=26"><img src="/assets/renderings/architecturalStyles/thumbnails/Northwest-Floor-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Northwest Floor Plans" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=27" class="brownLink">PRARIE<br />HOME PLANS</a></strong>
					<br />
                    <a href="planSearchResults.cfm?Id=27"><img src="/assets/renderings/architecturalStyles/thumbnails/Prairie-Home-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Prarie Home Plans" border="0" /></a>
                </div>
                <br clear="all" />
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=28" class="brownLink">RANCH<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=28"><img src="/assets/renderings/architecturalStyles/thumbnails/Ranch-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Ranch House Plans" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                	<strong><a href="planSearchResults.cfm?Id=29" class="brownLink">SHINGLE<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=29"><img src="/assets/renderings/architecturalStyles/thumbnails/Shingle-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Shingle House Plans"border="0"  /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=30" class="brownLink">SHOTGUN<br />FLOOR PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=30"><img src="/assets/renderings/architecturalStyles/thumbnails/Shotgun-Floor-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Shotgun Floor Plans" border="0" /></a>
                </div>
                <br clear="all" />
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=31" class="brownLink">TRADITIONAL<br />HOUSE PLANS</a></strong>
                        <br />
                        <a href="planSearchResults.cfm?Id=31"><img src="/assets/renderings/architecturalStyles/thumbnails/Traditional-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Traditional House Plans" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                	<strong><a href="planSearchResults.cfm?Id=32" class="brownLink">TUDOR<br />HOUSE PLANS</a></strong>
                        <br />
                        <a href="planSearchResults.cfm?Id=32"><img src="/assets/renderings/architecturalStyles/thumbnails/Tudor-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Tudor House Plans" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=33" class="brownLink">VICTORIAN<br />HOUSE DESIGNS</a></strong>
                        <br />
                        <a href="planSearchResults.cfm?Id=33"><img src="/assets/renderings/architecturalStyles/thumbnails/Victorian-House-Designs.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" alt="Victorian House Designs" border="0" /></a>
                </div>
                <br clear="all" />
            </div>
            
            <div id="newPlanChatContainer">
            	<div id="newPlan">
                	<strong><a href="/plans/planSearchResults.cfm?id=6" class="brownLink">NEW<br /> PLANS</a></strong>
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
            	<div id="chatPS">
                    <img src="/assets/images/PayPal.gif" width="175" height="154" alt="Pay Pal Image"/>
                </div>
                <div id="buildingProductsPS">
                	<strong>BUILDING<br />
                    PRODUCTS</strong>
                    <br />
                    <img src="/assets/images/SponsorLogos.jpg" width="174" height="592" border=0 usemap="#m_SponsorLogos">
                </div>
            </div>
        </div>
    </cfmodule>