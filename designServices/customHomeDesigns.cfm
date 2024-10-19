<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Custom Home Designs - About Plans - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Custom Home Designs - About Plans - Your Family Architect - Architects Northwest";		
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
                	CUSTOM HOME DESIGNS
                </div>
                
                <cfif CGI.HTTP_HOST CONTAINS "cornerstone">
                <div style="margin-bottom:20px;text-align:left;">
                	Do you have a tough building site, an unusual design program, or a unique vision of your dream home?  You have probably looked at hundreds of designs by now, but you haven&#39;t found one that is just right.  You need a custom home design!
                </div>
                <div style="margin-bottom:20px;text-align:left;">
					Our professional home designers specialize in capturing the essence of your wish list and your building site.  Our goal is to make your custom home an expression of your dreams and your lifestyle.  We interview you to understand your design program, budget, aesthetic and material preferences.  You provide us with your site information, covenants and local codes.  Usually, we will visit your project site to fully understand and visualize its views, opportunities and constraints.  Then, we will create a design that maximizes the advantages of your building site, deals with its challenges and complies with the regulations that affect your property.
                </div>
                <div style="margin-bottom:20px;text-align:left;">
                	Our fees are based on building area.  We will write you a fee and service agreement and produce preliminary concept sketches for your review.  Your home design will become more complete as we move from hand-drawn sketches to computer layouts.  We will produce full-size CAD floor plans, exterior elevations and a site plan for your final design approval.  We can create 3D color computer models and renderings of your design, so you can be sure that your new home will look exactly as you imagined.
                </div>
                <div style="margin-bottom:20px;text-align:left;">
                	Then, our drafters will finish the permit drawings from which your house will be built, incorporating the structural design from a local engineer.  The time frame for a custom design ranges from two months for a small home to six months for a grand estate, starting from a signed agreement to the delivery of permit submittal drawings.  We can also help you to pick a qualified builder, and we can work with you and your builder to make the actual construction of your home proceed smoothly to a quality end result.
                </div>
                <div style="margin-bottom:20px;text-align:left;">
					CornerStone Designs has a strong reputation for outstanding design quality, excellent technical drawings, and superior service developed over our 20-year history and the production of over 30,000 fine homes.  We look forward to the opportunity to assist you in creating your dream home.  <em>We want to be Your Family Home Designer!</em>
                </div>
                <cfelse>
                <div style="margin-bottom:20px;text-align:left;">
					Do you have a tough building site, an unusual design program, or a unique vision of your dream home?  You have probably looked at hundreds of designs by now, but you haven&#39;t found one that is just right.  You need a custom home design!
                </div>
                <div style="margin-bottom:20px;text-align:left;">
	Our professional home designers specialize in capturing the essence of your wish list and your building site.  Our goal is to make your custom home an expression of your dreams and your lifestyle.  We interview you to understand your design program, budget, aesthetic and material preferences.  You provide us with your site information, covenants and local codes.  Usually, we will visit your project site to fully understand and visualize its views, opportunities and constraints.  Then, we will create a design that maximizes the advantages of your building site, deals with its challenges and complies with the regulations that affect your property.
    			</div>
                <div style="margin-bottom:20px;text-align:left;">
                	Our fees are based on building area.  We will write you a fee and service agreement and produce preliminary concept sketches for your review.  Your home design will become more complete as we move from hand-drawn sketches to computer layouts.  We will produce full-size CAD floor plans, exterior elevations and a site plan for your final design approval.  We can create 3D color computer models and renderings of your design, so you can be sure that your new home will look exactly as you imagined.
                </div>
                <div style="margin-bottom:20px;text-align:left;">
                	Then, our drafters will finish the permit drawings from which your house will be built, incorporating the structural design from a local engineer.  The time frame for a custom design ranges from two months for a small home to six months for a grand estate, starting from a signed agreement to the delivery of permit submittal drawings.  We can also help you to pick a qualified builder, and we can work with you and your builder to make the actual construction of your home proceed smoothly to a quality end result.
                </div>
                <div style="margin-bottom:20px;text-align:left;">
                	Architects Northwest has a strong reputation for outstanding design quality, excellent technical drawings, and superior service developed over our 20-year history and the production of over 30,000 fine homes.  We look forward to the opportunity to assist you in creating your dream home.  <em>We want to be Your Family Architect!</em>
				</div>
                </cfif>
            </div>
            
            <cfinclude template="../assets/includes/commonRightSideBar.cfm">
        </div>
    </cfmodule>