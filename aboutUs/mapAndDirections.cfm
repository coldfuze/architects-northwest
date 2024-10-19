<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Map and Directions - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Map and Directions - Your Family Architect - Architects Northwest";		
	}
	
	// Architectural Style Links
	VARIABLES.ArchitecturalStyleLinks = Application.PlanSearchService.getSideBarLinks(1);
	
	// Popular Search Links
	VARIABLES.PopularSearchLinks = Application.PlanSearchService.getSideBarLinks(2);
	
	// Popular Search Links
	VARIABLES.HousePlanCollectionLinks = Application.PlanSearchService.getSideBarLinks(3);
</cfscript>

<!--- Get Quick Search Business Logic --->
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#" recentlyViewedPlans="#VARIABLES.RecentlyViewedPlans#">
        <div id="copyrightMainContainer">            
            <div style="position:absolute;top:0px;left:10px;height:1225px;width:164px;padding:10px 10px 10px 10px;line-height:17px;font-size:12px;background-color:#caccbb;text-align:left;margin-bottom:10px;">
            	<cfoutput>#VARIABLES.PopularSearchLinks#</cfoutput>
                <cfoutput>#VARIABLES.ArchitecturalStyleLinks#</cfoutput>
                <cfoutput>#VARIABLES.HousePlanCollectionLinks#</cfoutput>
            </div>
            
            <div id="copyrightContainer">
            	<div id="titleBar">
                	MAP AND DIRECTIONS
                </div>
                
                <strong>Address:</strong><br />
				<cfif CGI.HTTP_HOST CONTAINS "CornerStone">CornerStone Designs<cfelse>Architects Northwest</cfif><br />
				18915 142ND Avenue N.E. Suite 100<br />
				Woodinville, WA  98072<br />
				Phone Number:  <cfif CGI.HTTP_HOST CONTAINS "CornerStone">1.888.884.9488<cfelse>1.888.272.4100</cfif><br />
				Fax Number:  1.425.487.6585
				
                <div style="margin-top:20px;">
                    <strong>Directions:</strong><br />
                    Take I-405 to Highway 522 East which is the Woodinville-Monroe-Stevens Pass Exit
                    <div style="padding-left:35px;">
                        (Exit 23A Northbound / Exit 23A Southbound
                    </div>
					Take the N.E. 195th Street Exit off of Highway 522
                    <div style="padding-left:35px;">
						(Duvall Exit)
                    </div>
                    Turn Right at the bottom of the off ramp<br />
                    Go straight thru the stoplight and then a 1/4 mile up the hill<br />
                    Turn right onto 142nd Avenue N.E.<br />
                    Our office is immediately visible in the Woodview Plaza office building
                    <div style="padding-left:35px;">
                        (A tan building with a blue metal roof)
                    </div>
                </div>
				<div style="margin-top:20px;">
                	<cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                    	<img src="/assets/images/CornerStoneDesignsMap.gif" width="541" height="353" />	
                        <div style="margin-top:10px;text-align:center;">
                        	<a href="javascript: newWindow = openWin( 'csdPrintMap.htm', 'map', 'width=750,height=500,toolbar=1,location=0,directories=0,status=0,menuBar=0,scrollBars=1,resizable=0' ); newWindow.focus()" class="planSpec">Select Here for a Printer-Friendly Version of this Map</a>
                        </div>
                    <cfelse>
                    	<img src="/assets/images/ArchitectsNWMap.gif" width="541" height="353" />	
                        <div style="margin-top:10px;text-align:center;">
                        	<a href="javascript: newWindow = openWin( 'anwPrintMap.htm', 'map', 'width=750,height=500,toolbar=1,location=0,directories=0,status=0,menuBar=0,scrollBars=1,resizable=0' ); newWindow.focus()" class="planSpec">Select Here for a Printer-Friendly Version of this Map</a>
                        </div>
                    </cfif>
                </div>
            </div>
            
            <cfinclude template="../assets/includes/commonRightSideBar.cfm">
        </div>
    </cfmodule>