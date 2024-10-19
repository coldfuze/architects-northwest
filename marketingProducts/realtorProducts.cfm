<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Realtor Products - Marketing Products - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Realtor Products - Marketing Products - Your Family Architect - Architects Northwest";		
	}
	
	// Architectural Style Links
	VARIABLES.ArchitecturalStyleLinks = Application.PlanSearchService.getSideBarLinks(1);
	
	// Popular Search Links
	VARIABLES.PopularSearchLinks = Application.PlanSearchService.getSideBarLinks(2);
	
	// Popular Search Links
	VARIABLES.HousePlanCollectionLinks = Application.PlanSearchService.getSideBarLinks(3);
</cfscript>

<!--- Get Quick Search Business Logic --->
	<cfinclude template="../includes/quickSearchBusinessLogic.cfm">
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#" recentlyViewedPlans="#VARIABLES.RecentlyViewedPlans#">
        <div id="copyrightMainContainer">            
            <div style="position:absolute;top:0px;left:10px;height:1225px;width:164px;padding:10px 10px 10px 10px;line-height:17px;font-size:12px;background-color:#caccbb;text-align:left;margin-bottom:10px;">
            	<cfoutput>#VARIABLES.PopularSearchLinks#</cfoutput>
                <cfoutput>#VARIABLES.ArchitecturalStyleLinks#</cfoutput>
                <cfoutput>#VARIABLES.HousePlanCollectionLinks#</cfoutput>
            </div>
            
            <div id="copyrightContainer">
            	<div id="titleBar">
                	REALTOR PRODUCTS
                </div>
				
                <div class="productTitle">
                	Marketing Graphic Files
                </div>
                <div class="productPrice">
                	$25.00 per plan
                </div>
                <div class="clearFloat"></div>
                <div class="productDescription">
					A JPEG image of the existing rendering and a B&W JPEG marketing image of the floor plans.
				</div>
                
                <div class="productTitle">
					Marketing Flyer
                </div>
                <div class="productPrice">
                	$75.00 per plan
                </div>
                <div class="clearFloat"></div>
                <div class="productDescription">
					A custom made PDF marketing flyer containing the existing rendering, marketing floor plans, your logo, and contact information.  <a class="planSpec" href="javascript: newWindow = openWin( '/assets/images/MarketingFlyerExample.jpg', 'marketingFlyer', 'width=540,height=720,toolbar=0,location=0,directories=0,status=0,menuBar=0,scrollBars=0,resizable=0' ); newWindow.focus()">Select here to view an example of a marketing flyer</a>.
				</div>
            </div>
            
            <cfinclude template="../assets/includes/commonRightSideBar.cfm">
        </div>
    </cfmodule>