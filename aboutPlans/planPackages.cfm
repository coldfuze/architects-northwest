<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Plan Packages - About Plans - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Plan Packages - About Plans - Your Family Architect - Architects Northwest";		
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
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#" recentlyviewedplans="#VARIABLES.RecentlyViewedPlans#">
        <cfif CGI.HTTP_HOST CONTAINS "cornerstone"><div id="planPackagesMainContainer"><cfelse><div id="copyrightMainContainer"></cfif>         
            <cfif CGI.HTTP_HOST CONTAINS "cornerstone"><div style="position:absolute;top:0px;left:10px;height:1285px;width:164px;padding:10px 10px 10px 10px;line-height:17px;font-size:12px;background-color:#caccbb;text-align:left;margin-bottom:10px;"><cfelse><div style="position:absolute;top:0px;left:10px;height:1225px;width:164px;padding:10px 10px 10px 10px;line-height:17px;font-size:12px;background-color:#caccbb;text-align:left;margin-bottom:10px;"></cfif>
            	<cfoutput>#VARIABLES.PopularSearchLinks#</cfoutput>
                <cfoutput>#VARIABLES.ArchitecturalStyleLinks#</cfoutput>
                <cfoutput>#VARIABLES.HousePlanCollectionLinks#</cfoutput>
            </div>
            
            <div id="copyrightContainer">
            	<div id="titleBar">
                	PLAN PACKAGES
                </div>
                
                <cfif CGI.HTTP_HOST CONTAINS "cornerstone">
                <div>
					<strong>Digital PDF File Single Use License</strong><br />											
					This single use license is delivered electronically via a digital PDF file which is licensed to print as many copies of the construction drawings as necessary for the construction of a single residence.  This license requires a signed license agreement and building site location.  The price includes beam calculations for 25psf snow load and standard live loads, but does not include engineering or retaining wall calculations.  
				</div>
                <div style="margin-top:20px;">
                	<strong>5 Set Plan Package Single Use License</strong><br />									
					The single use license package includes 5 complete sets of 1/4" scale construction drawings, allowing for the construction of a single residence.  Additional sets may be purchased if needed.  The price includes beam calculations for 25psf snow load and standard live loads, but does not include engineering or retaining wall calculations.  Modifications are not allowed with this license.  Reproducible vellums, PDFs, or AutoCAD license must be purchased in order to make modifications to plans.
				</div>
                <div style="margin-top:20px;">
                	<strong>CAD File Multiple Use License</strong><br />									
					This multiple use license is delivered electronically via a digital AutoCAD file that allows modifications by a CAD drafter for the construction of multiple residences.  This license requires a signed license agreement and initial building site location. The price includes beam calculations for 25psf snow load and standard live loads, but does not include engineering or retaining wall calculations.  
				</div>
				
                <div style="text-align:center;margin-top:20px;">
					<strong>OPTIONS (REQUIRES PLAN LICENSE PACKAGE)</strong>
                </div>
				<div style="margin-top:20px;">
					<strong>Adding a Walk-Out Basement</strong><br />							            
					Engineering is not included when adding a walk-out basement.  Adding a basement is an extensive revision so please budget two to four weeks for this modification.
				</div>
                <div style="margin-top:20px;">
                	<strong>Adding a Cellar (Full) Basement</strong><br />
                    Engineering is not included when adding a cellar basement.  Adding a basement is an extensive revision so please budget two to four weeks for this modification.
				</div>
                <div style="margin-top:20px;">
                	<strong>Slab Foundation Conversion</strong><br />
                	Engineering is not included when converting a plan from a crawl space to a slab on grade foundation.  Please budget two weeks for this modification.
				</div>
                <div style="margin-top:20px;">
                	<strong>Right Reading Reverse Plan</strong><br />								 	           
					The plan is reversed from the orientation shown on the CornerStone Designs website.  Some plans may not apply. 
				</div>
                <div style="text-align:center;margin-top:30px;">
                	Pricing for plan packages and options are shown for each individual plan.
                </div>
                <div style="margin-top:20px;">
                	<strong>Note:</strong> CornerStone Designs plan packages are not available for building sites located in Washington State. Please visit <a class="planSpec" href="http://www.architectsnwdev.com/aboutPlans/planPackages.cfm">Architects Northwest</a> to see plan packages for building sites located in Washington State.
				</div>
                <cfelse>
                <div>
                	<strong>Single Use License</strong><br />
					The single use license package includes PDF files of building permit sets, allowing for the construction of a single residence. Structural engineering provided w/ building permit sets is billed to the client.
				</div>
                <div style="margin-top:20px;">
                	<strong>Multi Use License</strong><br />
					The multiple use license package includes PDF files of building permit sets with a license to construct multiple residences. Structural engineering provided w/ building permit sets is billed to the client.
				</div>
				<div style="text-align:center;margin-top:20px;">
					<strong>OPTIONS (REQUIRES PLAN LICENSE PACKAGE)</strong>
				</div>
                <div style="margin-top:20px;">
                    <strong>Adding a Basement</strong><br />													
                    Plans can be modified by adding a full or daylight basement
				</div>
                <div style="margin-top:20px;">
                    <strong>Slab Foundation Revision</strong><br />												
                    Foundation plan can be converted from a crawl space to a slab on grade foundation.
				</div>
                <div style="margin-top:20px;margin-bottom:25px;">
                	<strong>Right Reading Reverse Plan</strong><br />		
					The plan is reversed from the orientation shown on the Architects Northwest website.
				</div>
				<a href="/assets/pdf/ArchitectsNorthwestPriceSheet2023.pdf" target="_blank" title="Click to download Architects Northwest's Price List and Fee Schedule"><img src="/assets/images/2023-ANW-PRICE-REVS-04-21-2023.png" width="550" alt="Architects Northwest Pricing" border="0" /></a>
				<ul type="square" style="margin-top:25px;">
					<li><a href="/assets/pdf/ArchitectsNorthwestPriceSheet2023.pdf" class="planSpec" target="_blank" title="Click to download Architects Northwest's Price List and Fee Schedule">Download Price List and Fee Schedule</a></li>	
				</ul>
              	<!---
                <div style="margin-top:30px;text-align:center;">
                	Pricing for plan packages and options are shown for each individual plan.
                </div>--->
                </cfif>
            </div>
            
            <cfinclude template="../assets/includes/commonRightSideBar.cfm">
        </div>
    </cfmodule>