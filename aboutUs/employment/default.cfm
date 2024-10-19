<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../../CommonScripts.cfm">

<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Employment - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Employment - Your Family Architect - Architects Northwest";		
	}
	
	// Architectural Style Links
	VARIABLES.ArchitecturalStyleLinks = Application.PlanSearchService.getSideBarLinks(1);
	
	// Popular Search Links
	VARIABLES.PopularSearchLinks = Application.PlanSearchService.getSideBarLinks(2);
	
	// Popular Search Links
	VARIABLES.HousePlanCollectionLinks = Application.PlanSearchService.getSideBarLinks(3);
</cfscript>

    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#" recentlyViewedPlans="#VARIABLES.RecentlyViewedPlans#">
        <div id="copyrightMainContainer">            
            <div style="position:absolute;top:0px;left:10px;height:1225px;width:164px;padding:10px 10px 10px 10px;line-height:17px;font-size:12px;background-color:#caccbb;text-align:left;margin-bottom:10px;">
            	<cfoutput>#VARIABLES.PopularSearchLinks#</cfoutput>
                <cfoutput>#VARIABLES.ArchitecturalStyleLinks#</cfoutput>
                <cfoutput>#VARIABLES.HousePlanCollectionLinks#</cfoutput>
            </div>
            
            <div id="copyrightContainer">
            	<div id="titleBar">
                	EMPLOYMENT
                </div>
				
                <div style="text-align:center;">
                    <div>
                    Thank you for your interest in job openings at <cfif CGI.HTTP_HOST CONTAINS "CornerStone">CornerStone Designs<cfelse>Architects Northwest</cfif>.  We are accepting applications for the following career opportunities:
                    </div>
                    
                    <div style="margin-top:20px;">
                        <strong>Currently there are no job openings available.</strong>
                    </div>
                    
                    <div style="margin-top:20px;">
                        Please send your resume, references, and salary requirements via fax, mail or email to:
                    </div>
                    
                    <div style="margin-top:20px;">
                        <cfif CGI.HTTP_HOST CONTAINS "CornerStone"><strong>CornerStone Designs</strong><cfelse>Architects Northwest</cfif><br />
                        Attn: Human Resources<br />
                        18915 142ND Avenue N.E., Suite 100<br />
                        Woodinville, WA  98072<br />
                        Fax:  1-425-487-6585 
                    </div>
                    
                    <div style="margin-top:20px;">
                        PLEASE NO PHONE CALLS
                    </div>
                </div>
            </div>
            
            <cfinclude template="../../assets/includes/commonRightSideBar.cfm">
        </div>
    </cfmodule>