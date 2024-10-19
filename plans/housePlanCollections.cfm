<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<!--- Page Titles --->
<cfscript>
	// Page Title
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "House Plan Collections - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "House Plan Collections - Your Family Architect - Architects Northwest";		
	}
	
	// Architectural Style Links
	VARIABLES.ArchitecturalStyleLinks = Application.PlanSearchService.getSideBarLinks(1);
	
	// Popular Search Links
	VARIABLES.PopularSearchLinks = Application.PlanSearchService.getSideBarLinks(2);
	
	// Randon New Plan
	VARIABLES.NewPlan = Application.PlanService.getFeaturedPlanInfoForSearchSubGrouping(28);
</cfscript>

<!--- Get Quick Search Business Logic --->
	<cfinclude template="../includes/quickSearchBusinessLogic.cfm">

    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#" recentlyViewedPlans="#VARIABLES.RecentlyViewedPlans#">
        <div id="mainHousePlanCollectionContainer">
        	<cfinclude template="/assets/customTags/quickSearch.cfm">
            
            <div style="position:absolute;top:498px;left:10px;width:164px;padding:10px;height:1220px;line-height:17px;font-size:12px;background-color:#caccbb;text-align:left;margin-bottom:10px;">
            	<cfoutput>#VARIABLES.PopularSearchLinks#</cfoutput>
                <cfoutput>#VARIABLES.ArchitecturalStyleLinks#</cfoutput>
            </div>
            
            <div id="planStyleContainer">
            	<div id="titleBar">
                	HOUSE PLAN COLLECTIONS
                </div>

                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;">
                    <strong><a href="planSearchResults.cfm?Id=34" class="brownLink">1 STORY<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=34"><img src="../assets/renderings/housePlanCollections/thumbnails/1-Story-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="1 Story House Plans" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;">
                	<strong><a href="planSearchResults.cfm?Id=35" class="brownLink">1 STORY HOUSE PLANS<br />WITH BASEMENT</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=35"><img src="../assets/renderings/housePlanCollections/thumbnails/1-Story-House-Plans-With-Basement.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="1 Story House Plans with Basement" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;">
                    <strong><a href="planSearchResults.cfm?Id=36" class="brownLink">2 STORY<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=36"><img src="../assets/renderings/housePlanCollections/thumbnails/2-Story-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="2 Story House Plans" /></a>
                </div>
                <br clear="all" />
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=37" class="brownLink">2 STORY HOUSE PLANS<br />WITH BASEMENT</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=37"><img src="../assets/renderings/housePlanCollections/thumbnails/2-story-House-Plans-With-Basement.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="2 Story House Plans with Basement" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                	<strong><a href="planSearchResults.cfm?Id=38" class="brownLink">3 STORY<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=38"><img src="../assets/renderings/housePlanCollections/thumbnails/3-Story-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="3 Story House Plans" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=39" class="brownLink">3 STORY HOUSE PLANS<br />WITH BASEMENT</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=39"><img src="../assets/renderings/housePlanCollections/thumbnails/3-Story-House-Plans-With-Basement.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="3 Story House Plans with Basement" /></a>
                </div>
                <br clear="all" />
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=40" class="brownLink">AFFORDABLE<br />HOME DESIGNS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=40"><img src="../assets/renderings/housePlanCollections/thumbnails/Affordable-Home-Designs.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Affordable Home Designs" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                	<strong><a href="planSearchResults.cfm?Id=41" class="brownLink">BONUS SPACE<br />FLOOR PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=41"><img src="../assets/renderings/housePlanCollections/thumbnails/Bonus-Space-Floor-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Bonus Space Floor Plans" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=42" class="brownLink">COVERED PORCH<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=42"><img src="../assets/renderings/housePlanCollections/thumbnails/Covered-Porch-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Covered Porch House Plans" /></a>
                </div>
                <br clear="all" />
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=43" class="brownLink">GARAGE DETACHED<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=43"><img src="../assets/renderings/housePlanCollections/thumbnails/Garage-Detach-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Garage Detached House Plans" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                	<strong><a href="planSearchResults.cfm?Id=44" class="brownLink">GARAGE REAR<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=44"><img src="../assets/renderings/housePlanCollections/thumbnails/Garage-Rear-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Garage Rear House Plans" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=45" class="brownLink">GARAGE SIDE<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=45"><img src="../assets/renderings/housePlanCollections/thumbnails/Garage-Side-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Garage Side House Plans" /></a>
                </div>
                <br clear="all" />
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=46" class="brownLink">GARAGE UNDER<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=46"><img src="../assets/renderings/housePlanCollections/thumbnails/Garage-Under-House-Plans.jpg" width="165" height="121" border="0" style="padding-top:6px;padding-bottom:5px;" alt="Garage Under House Plans" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                	<strong><a href="planSearchResults.cfm?Id=47" class="brownLink">GREAT ROOM<br />FLOOR PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=47"><img src="../assets/renderings/housePlanCollections/thumbnails/Great-Room-Floor-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Great Room Floor Plans" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=48" class="brownLink">LUXURY<br />HOME DESIGNS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=48"><img src="../assets/renderings/housePlanCollections/thumbnails/Luxury-Home-Designs.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Luxury Home Designs" /></a>
                </div>
                <br clear="all" />
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=49" class="brownLink">MASTER BEDROOM<br />MAIN FLOOR</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=49"><img src="../assets/renderings/housePlanCollections/thumbnails/Master-Bedroom-Main-Floor.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Master Bedroom Main Floor" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                	<strong><a href="planSearchResults.cfm?Id=50" class="brownLink">NARROW LOT<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=50"><img src="../assets/renderings/housePlanCollections/thumbnails/Narrow-Lot-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Narrow Lot House Plans" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=51" class="brownLink">SLOPING LOT<br />(DOWN HILL) PLANS</a></strong>
					<br />
                    <a href="planSearchResults.cfm?Id=51"><img src="../assets/renderings/housePlanCollections/thumbnails/Sloping-Lot-(Down-Hill)-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Sloping Lot (Down Hill) Plans" /></a>
                </div>
                <br clear="all" />
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=52" class="brownLink">SLOPING LOT<br />(SIDE HILL) PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=52"><img src="../assets/renderings/housePlanCollections/thumbnails/Sloping-Lot-(Side-Hill)-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Sloping Lot (Side Hill) Plans" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                	<strong><a href="planSearchResults.cfm?Id=53" class="brownLink">SLOPING LOT<br />(UP HILL) PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=53"><img src="../assets/renderings/housePlanCollections/thumbnails/Sloping-Lot-(Up-Hill)-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Sloping Lot (Up Hill) Plans" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=54" class="brownLink">SMALL<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=54"><img src="../assets/renderings/housePlanCollections/thumbnails/Small-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Small House Plans" /></a>
                </div>
                <br clear="all" />
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=55" class="brownLink">SPLIT LEVEL<br />HOME DESIGNS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=55"><img src="../assets/renderings/housePlanCollections/thumbnails/Split-Level-Home-Designs.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Split Level Home Designs" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                	<strong><a href="planSearchResults.cfm?Id=56" class="brownLink">TRI LEVEL<br />HOME DESIGNS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=56"><img src="../assets/renderings/housePlanCollections/thumbnails/Tri-Level-Home-Designs.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Tri Level Home Designs" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=57" class="brownLink">VACATION<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=57"><img src="../assets/renderings/housePlanCollections/thumbnails/Vacation-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Vacation House Plans" /></a>
                </div>
                <br clear="all" />
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=58" class="brownLink">VIEW LOT<br />(FRONT) PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=58"><img src="../assets/renderings/housePlanCollections/thumbnails/View-Lot-(Front)-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="View Lot (Front) House Plans" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                	<strong><a href="planSearchResults.cfm?Id=59" class="brownLink">VIEW LOT<br />(REAR) PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=59"><img src="../assets/renderings/housePlanCollections/thumbnails/View-Lot-(Rear)-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="View Lot (Rear) House Plans" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=60" class="brownLink">WIDE LOT<br />HOUSE PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=60"><img src="../assets/renderings/housePlanCollections/thumbnails/Wide-Lot-House-Plans.jpg" width="165" height="121" style="padding-top:6px;padding-bottom:5px;" border="0" alt="Wide Lot House Plans" /></a>
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
                
                <div id="buildingProductsHPC">
                	<strong>BUILDING<br />
                    PRODUCTS</strong>
                    <br />
                    <img src="/assets/images/SponsorLogos.jpg" width="174" height="592" border=0 usemap="#m_SponsorLogos">
                </div>
            </div>
        </div>
    </cfmodule>