<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Builder Directory - Building Resources - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Builder Directory - Building Resources - Your Family Architect - Architects Northwest";		
	}
	
	// Architectural Style Links
	VARIABLES.ArchitecturalStyleLinks = Application.PlanSearchService.getSideBarLinks(1);
	
	// Popular Search Links
	VARIABLES.PopularSearchLinks = Application.PlanSearchService.getSideBarLinks(2);
	
	// Popular Search Links
	VARIABLES.HousePlanCollectionLinks = Application.PlanSearchService.getSideBarLinks(3);
	
	// Get Builders
	VARIABLES.bi = Application.BuilderService.getAllBuildersSorted();
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
                	BUILDER DIRECTORY
                </div>
				
                <div style="text-align:center;">
                	<strong>Washington State Builders</strong>
                </div>
                
                <div>
                    <ul type="square">
                        <cfoutput query="VARIABLES.bi"><li><a class="planSpec" href="#Link#" target="_blank">#Builder#</a></li></cfoutput>
					</ul>
                </div>
            </div>
            
            <cfinclude template="../assets/includes/commonRightSideBar.cfm">
        </div>
    </cfmodule>