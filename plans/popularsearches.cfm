<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<!--- Page Titles --->  
	<cfscript>
		// Page Titles
        if (CGI.HTTP_HOST CONTAINS "CornerStone") {
            VARIABLES.pageTitle = "Popular Searches - Stock Home Plans for Every Style - CornerStone Designs";	
        }
        else {
            VARIABLES.pageTitle = "Popular Searches - Your Family Architect - Architects Northwest";		
        }
		
		// Architectural Style Links
		VARIABLES.ArchitecturalStyleLinks = Application.PlanSearchService.getSideBarLinks(1);
		
		// Popular Search Links
		VARIABLES.HousePlanCollectionLinks = Application.PlanSearchService.getSideBarLinks(3);
		
		// Randon New Plan
		VARIABLES.NewPlan = Application.PlanService.getFeaturedPlanInfoForSearchSubGrouping(28);
    </cfscript>

<!--- Get Quick Search Business Logic --->
	<cfinclude template="../includes/quickSearchBusinessLogic.cfm">

    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#" recentlyViewedPlans="#VARIABLES.RecentlyViewedPlans#">
        <div id="mainPlanStyleContainer">
        	<cfinclude template="../assets/customTags/quickSearch.cfm">
            
            <div style="position:absolute;top:498px;left:10px;width:164px;padding:10px;height:1032px;line-height:17px;font-size:12px;background-color:#caccbb;text-align:left;margin-bottom:10px;">
                <cfoutput>#VARIABLES.ArchitecturalStyleLinks#</cfoutput>
                <cfoutput>#VARIABLES.HousePlanCollectionLinks#</cfoutput>
            </div>
            
            <div id="planStyleContainer">
            	<div id="titleBar">
                	POPULAR SEARCHES
                </div>

                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;">
                    <strong><a href="planSearchResults.cfm?Id=1" class="brownLink">AWARD WINNING<br />DESIGNS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=1"><img src="/assets/renderings/popularSearches/thumbnails/Award-Winning-Designs.jpg" width="165" height="121" alt="Award Winning Designs" style="padding-top:6px;padding-bottom:5px;" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;">
                	<strong><a href="planSearchResults.cfm?Id=2" class="brownLink">BEST SELLING<br />PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=2"><img src="../assets/renderings/popularSearches/thumbnails/Best-Selling-Plans.jpg" width="165" height="121" alt="Best Selling Plans" style="padding-top:6px;padding-bottom:5px;" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;">
                    <strong><a href="planSearchResults.cfm?id=3" class="brownLink">GARAGE &amp;<br />ACCESSORY PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?id=3" class="brownLink"><img src="/assets/renderings/popularSearches/thumbnails/Garage-And-Accessory-Plans.jpg" width="165" height="121" alt="Garage and Accessory Plans" style="padding-top:6px;padding-bottom:5px;" border="0" /></a>
                </div>
                <br clear="all" />
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?id=4" class="brownLink">GREEN<br />PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?id=4"><img src="/assets/renderings/popularSearches/thumbnails/Green-Plans.jpg" width="165" height="121" alt="Green Plans" style="padding-top:6px;padding-bottom:5px;" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                	<strong><a href="homesByDesigner.cfm" class="brownLink">HOMES BY<br />DESIGNER</a></strong>
                    <br />
                    <a href="homesByDesigner.cfm?id=1" class="brownLink"><img src="/assets/renderings/popularSearches/thumbnails/Homes-By-Designer.jpg" width="165" height="121" alt="Homes by Designer" style="padding-top:6px;padding-bottom:5px;" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?id=6" class="brownLink">NEW<br />PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?id=6"><img src="../assets/renderings/popularSearches/thumbnails/New-Plans.jpg" width="165" height="121" alt="New Plans" style="padding-top:6px;padding-bottom:5px;" border="0" /></a>
                </div>
                <br clear="all" />
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=7" class="brownLink">PLANS<br />COMING SOON</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=7"><img src="/assets/renderings/popularSearches/thumbnails/Plans-Coming-Soon.jpg" width="165" height="121" alt="Plans Coming Soon" style="padding-top:6px;padding-bottom:5px;" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;margin-right:10px;">
                    <strong><a href="planSearchResults.cfm?Id=8" class="brownLink">SHOW<br />ALL PLANS</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=39"><img src="/assets/renderings/popularSearches/thumbnails/Show-All-Plans.jpg" width="165" height="121" alt="Show All Plans image" style="padding-top:6px;padding-bottom:5px;" border="0" /></a>
                </div>
                <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                    <strong><a href="planSearchResults.cfm?Id=7" class="brownLink">SUNCADIA<br />COLLECTION</a></strong>
                    <br />
                    <a href="planSearchResults.cfm?Id=39"><img src="/assets/renderings/popularSearches/thumbnails/SuncadiaCollection.jpg" width="165" height="121" alt="Suncadia Collection image" style="padding-top:6px;padding-bottom:5px;" border="0" /></a>
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