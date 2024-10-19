<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Building Products - Building Resources - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Building Products - Building Resources - Your Family Architect - Architects Northwest";		
	}
	
	// Architectural Style Links
	VARIABLES.ArchitecturalStyleLinks = Application.PlanSearchService.getSideBarLinks(1);
	
	// Popular Search Links
	VARIABLES.PopularSearchLinks = Application.PlanSearchService.getSideBarLinks(2);
	
	// Popular Search Links
	VARIABLES.HousePlanCollectionLinks = Application.PlanSearchService.getSideBarLinks(3);
	
	// Building Product Companies
	VARIABLES.bpc = Application.BuildingProductCompanyService.getBuildingProductCompanies();
</cfscript>

<!--- Get Quick Search Business Logic --->
	<cfinclude template="../includes/quickSearchBusinessLogic.cfm">
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#" recentlyViewedPlans="#VARIABLES.RecentlyViewedPlans#">
        <div id="buildingProductsMainContainer22">            
            <div style="position:absolute;top:0px;left:10px;height:1870px;width:164px;padding:10px 10px 10px 10px;line-height:17px;font-size:12px;background-color:#caccbb;text-align:left;margin-bottom:10px;">
            	<cfoutput>#VARIABLES.PopularSearchLinks#</cfoutput>
                <cfoutput>#VARIABLES.ArchitecturalStyleLinks#</cfoutput>
                <cfoutput>#VARIABLES.HousePlanCollectionLinks#</cfoutput>
            </div>
            
            <div id="buildingProductsContainer">
            	<div id="titleBar">
                	BUILDING PRODUCTS
                </div>
				
                <div>
                	Below is a list of building products which we or our clients have incorporated into the design of our homes.  Many of these manufactures have showcased our house designs in their marketing brochures.  By selecting the product name will take you to their website. 
                </div>
                
                <cfoutput query="VARIABLES.bpc" group="BuildingProductType">
                <div style="margin-top:20px;">
               		<strong>#BuildingProductType#</strong>
                    <ul type="square" style="margin-top:5px;">
                        <cfoutput><li><a class="planSpec" href="#WebSite#" target="_blank">#BuildingProductCompany#</a></li></cfoutput>
					</ul>
                </div>
                </cfoutput>
            </div>
            
            <cfinclude template="../assets/includes/commonRightSideBar.cfm">
        </div>
    </cfmodule>