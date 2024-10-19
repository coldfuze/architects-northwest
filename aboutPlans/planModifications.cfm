<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Plan Modifications - About Plans - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Plan Modifications - About Plans - Your Family Architect - Architects Northwest";		
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
                	PLAN MODIFICATIONS
                </div>
				
                <div>
               	We understand that it is difficult to find a home design that will completely meet all your needs, which is why we are happy to offer plan modification services.  We will work with you to design the home modifications that you would like to see and revise your plans accordingly.
				</div>
                
                <div style="margin-top:20px;text-align:left;">
					Here are some examples of house plan modifications frequently requested by clients:
                    <ul type="square">
                        <li>Changing the foundation from crawl space to slab on grade or basement.</li>
                        <li>Increasing room sizes or adding square footage to a plan.</li>
                        <li>Changing the location of the garage door from front to side loading or adding a car bay.</li>
                        <li>Redesigning the bathrooms, kitchen or bedrooms, or changing the stair configuration.</li>
                        <li>Revising the exterior elevations, changing the home style, or roof slopes.</li>
                        <li>Changing the ceiling or wall heights.</li>
                        <li>Creating right reading reverse plans.</li>
                    </ul>
                </div>
                
                <div style="text-align:center;font-weight:bold;margin-top:25px;">
                	HERE ARE THE STEPS TO MODIFYING YOUR HOUSE PLAN
                </div>
                
                <cfif CGI.HTTP_HOST CONTAINS "cornerstone">
                	<div style="border-bottom:thin solid black;text-align:left;margin-top:10px;padding-bottom:10px;">
                        <span style="font-size:22px;">1</span> Choose the plan you want modified.
                    </div>
                    <div style="border-bottom:thin solid black;text-align:left;margin-top:3px;padding-bottom:10px;">
                        <span style="font-size:22px;">2</span> Send us your changes and contact information via email, or call our service team.
                    </div>
                    <div style="border-bottom:thin solid black;text-align:left;margin-top:3px;padding-bottom:10px;">
                        <span style="font-size:22px;">3</span> We will prepare a free quote and review it with you.
                    </div>
                    <div style="border-bottom:thin solid black;text-align:left;margin-top:3px;padding-bottom:10px;">
                        <span style="font-size:22px;">4</span> Order your modification services.
                    </div>
                    <div style="border-bottom:thin solid black;text-align:left;margin-top:3px;padding-bottom:10px;">
                        <span style="font-size:22px;">5</span> A phone meeting begins the modification process.
                    </div>
                    <div style="border-bottom:thin solid black;text-align:left;margin-top:3px;padding-bottom:10px;">
                        <span style="font-size:22px;">6</span> The modified floor plan and exterior elevation design drawings are emailed to you for your comments and approval.
                    </div>
                    <div style="border-bottom:thin solid black;text-align:left;margin-top:3px;padding-bottom:10px;">
                        <span style="font-size:22px;">7</span> Your construction drawings, including beam calculations are completed.
                    </div>
                    <div style="border-bottom:thin solid black;text-align:left;margin-top:3px;padding-bottom:10px;">
                        <span style="font-size:22px;">8</span> Your project is delivered to you after final payment is made.
                    </div>
                    <div style="border-bottom:thin solid black;text-align:left;margin-top:3px;padding-bottom:10px;">
                        <span style="font-size:22px;">9</span> Your local building department may require that you provide structural calculations and a stamp by a local structural engineer.  Please check with your local building department for their permit requirements.
                    </div>
                <cfelse>
                    <div style="border-bottom:thin solid black;text-align:left;margin-top:10px;padding-bottom:10px;">
                        <span style="font-size:22px;">1</span> Choose the plan you want modified.
                    </div>
                    <div style="border-bottom:thin solid black;text-align:left;margin-top:3px;padding-bottom:10px;">
                        <span style="font-size:22px;">2</span> Send us your changes and contact information via email, or call our service team.
                    </div>
                    <div style="border-bottom:thin solid black;text-align:left;margin-top:3px;padding-bottom:10px;">
                        <span style="font-size:22px;">3</span> We will prepare a free quote and review it with you in person or on the phone.
                    </div>
                    <div style="border-bottom:thin solid black;text-align:left;margin-top:3px;padding-bottom:10px;">
                        <span style="font-size:22px;">4</span> Order your modification services.
                    </div>
                    <div style="border-bottom:thin solid black;text-align:left;margin-top:3px;padding-bottom:10px;">
                        <span style="font-size:22px;">5</span> Another meeting in person or on the phone begins the modification process.
                    </div>
                    <div style="border-bottom:thin solid black;text-align:left;margin-top:3px;padding-bottom:10px;">
                        <span style="font-size:22px;">6</span> The modified floor plan and exterior elevation design drawings are emailed to you for your comments and approval.
                    </div>
                    <div style="border-bottom:thin solid black;text-align:left;margin-top:3px;padding-bottom:10px;">
                        <span style="font-size:22px;">7</span> If required, your plans are sent to a structural engineer for calculation of lateral (wind and earthquake) and retaining wall elements.
                    </div>
                    <div style="border-bottom:thin solid black;text-align:left;margin-top:3px;padding-bottom:10px;">
                        <span style="font-size:22px;">8</span> Your construction drawings are completed with any required engineering installed on the plans.
                    </div>
                    <div style="border-bottom:thin solid black;text-align:left;margin-top:3px;padding-bottom:10px;">
                        <span style="font-size:22px;">9</span> Your project is delivered to you after final payment is made.
                    </div>
                </cfif>
                <div style="text-align:center;margin-top:20px;">
                	<a class="planSpec" href="/contactus/">Select Here to Contact Us for Plan Modifications</a>
                </div>
            </div>
            
            <cfinclude template="../assets/includes/commonRightSideBar.cfm">
        </div>
    </cfmodule>