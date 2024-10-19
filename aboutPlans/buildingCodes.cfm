<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Building Codes - About Plans - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Building Codes - About Plans - Your Family Architect - Architects Northwest";		
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
                	BUILDING CODES
                </div>
				
                <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                <div>
                    All CornerStone Designs house plans are designed to comply with the <a class="planSpec" href="http://www.iccsafe.org/Pages/default.aspx" target="_blank">International Residential Code</a> (IRC).  
                    Some states, counties and local jurisdictions have additional building codes, zoning requirements, and other regulations that may apply to your project.  
                    Modifications may be necessary to meet these local codes, most notably regarding site-specific earthquake loads, special wind loads, increased snow loads, 
                    soils conditions, flood plain and critical areas issues.  CornerStone Designs plans are not designed to comply with IRC prescriptive wall bracing requirements 
                    and may require site-specific lateral (wind & earthquake) engineering calculations stamped by a Professional Engineer (PE) licensed in your state.  
                    Please check with your local building department to determine the specific requirements that will apply to your site.
                </div>
                
                <div style="margin:20px 0 10px 0;font-weight:bold;">
                	CornerStone Designs Standard Design Loads
                </div>
                
                <div> 
                	<div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:100px;">
                    	Roof
                    </div>
                    <div style="float:left;width:250px;">
                    	15 PSF Dead Load  +  25 PSF Live Load
                    </div>
                    <div style="float:left;width:100px;">
                    	=  40 PSF
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:100px;">
                    	Floor
                    </div>
                    <div style="float:left;width:250px;">
                    	10 PSF Dead Load  +  40 PSF Live Load
                    </div>
                    <div style="float:left;width:100px;">
                    	=  50 PSF
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:100px;">
                    	Ceiling
                    </div>
                    <div style="float:left;width:250px;">
                    	05 PSF Dead Load  +  10 PSF Live Load
                    </div>
                    <div style="float:left;width:100px;">
                    	=  15 PSF
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:100px;">
                    	Deck
                    </div>
                    <div style="float:left;width:250px;">
                    	05 PSF Dead Load  +  40 PSF Live Load
                    </div>
                    <div style="float:left;width:100px;">
                    	=  45 PSF
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:350px;">Interior Wall</div>
                    <div style="float:left;width:100px;">
                    	=  07 PSF
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:350px;">Exterior Wall</div>
                    <div style="float:left;width:100px;">
                    	=  10 PSF
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:350px;">Snow Load</div>
                    <div style="float:left;width:100px;">
                    	=  25 PSF
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:350px;">Wind Load</div>
                    <div style="float:left;width:100px;">
                    	=  N/A
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:350px;">Wind Exposure</div>
                    <div style="float:left;width:100px;">
                    	=  N/A
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:350px;">Seismic Category</div>
                    <div style="float:left;width:100px;">
                    	=  N/A
                    </div>
                    <div class="clearFloat"></div>
                </div>
                
                <div style="margin:20px 0 10px 0;font-weight:bold;">
                	CornerStone Designs Standard Beam Design Deflection Criteria
                </div>
                
                <div> 
                	<div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:100px;">
                    	Roof
                    </div>
                    <div style="float:left;width:350px;">
                    	1:240 Live Load and 1:180 Total Load; 1/2" maximum
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:100px;">
                    	Floor
                    </div>
                    <div style="float:left;width:350px;">
                    	1:360 Live Load and 1:240 Total Load; 1/2" maximum
                    </div>
                    <div class="clearFloat"></div>
                </div>
                <cfelse>
                <div>
                    All Architects Northwest house plans are designed to comply with the <a class="planSpec" href="http://www.iccsafe.org/Pages/default.aspx" target="_blank">International Residential Code</a> (IRC) and the <a class="planSpec" href="http://apps.leg.wa.gov/WAC/default.aspx?cite=51-11" target="_blank">Washington State Energy Code</a>.  
                    Some Washington State counties and cities have additional building codes, zoning requirements, and other regulations that may apply to your project.  
                    Modifications may be necessary to meet these local codes, most notably regarding site-specific earthquake loads, special wind loads, increased snow loads, 
                    soils conditions, flood plain and critical areas issues.  Nearly all Washington State jurisdictions require site-specific lateral (wind &amp; earthquake) 
                    engineering calculations stamped by a Professional Engineer (PE) licensed in Washington State.  As early as possible in planning your project, it is 
                    a good idea to check with your local building department to determine the specific requirements that will apply to your site.
                </div>
                
                <div style="margin:20px 0 10px 0;font-weight:bold;">
                	Architects Northwest Standard Design Loads
                </div>
                
                <div> 
                	<div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:100px;">
                    	Roof
                    </div>
                    <div style="float:left;width:250px;">
                    	15 PSF Dead Load  +  25 PSF Live Load
                    </div>
                    <div style="float:left;width:100px;">
                    	=  40 PSF
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:100px;">
                    	Floor
                    </div>
                    <div style="float:left;width:250px;">
                    	10 PSF Dead Load  +  40 PSF Live Load
                    </div>
                    <div style="float:left;width:100px;">
                    	=  50 PSF
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:100px;">
                    	Ceiling
                    </div>
                    <div style="float:left;width:250px;">
                    	05 PSF Dead Load  +  10 PSF Live Load
                    </div>
                    <div style="float:left;width:100px;">
                    	=  15 PSF
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:100px;">
                    	Deck
                    </div>
                    <div style="float:left;width:250px;">
                    	05 PSF Dead Load  +  40 PSF Live Load
                    </div>
                    <div style="float:left;width:100px;">
                    	=  45 PSF
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:350px;">Interior Wall</div>
                    <div style="float:left;width:100px;">
                    	=  07 PSF
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:350px;">Exterior Wall</div>
                    <div style="float:left;width:100px;">
                    	=  10 PSF
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:350px;">Snow Load</div>
                    <div style="float:left;width:100px;">
                    	=  25 PSF
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:350px;">Wind Load</div>
                    <div style="float:left;width:100px;">
                    	=  85 PSF
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:350px;">Wind Exposure</div>
                    <div style="float:left;width:100px;">
                    	=  B
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:350px;">Seismic Category</div>
                    <div style="float:left;width:100px;">
                    	=  D
                    </div>
                    <div class="clearFloat"></div>
                </div>
                
                <div style="margin:20px 0 10px 0;font-weight:bold;">
                	Architects Northwest Standard Beam Design Deflection Criteria
                </div>
                
                <div> 
                	<div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:100px;">
                    	Roof
                    </div>
                    <div style="float:left;width:350px;">
                    	1:240 Live Load and 1:180 Total Load; 1/2" maximum
                    </div>
                    <div class="clearFloat"></div>
                    
                    <div style="float:left;width:15px;padding-top:2px;padding-left:25px;">
                    	<img src="/assets/images/squareBullet.png" width="11" height="10" alt="*" />
                    </div>
                    <div style="float:left;width:100px;">
                    	Floor
                    </div>
                    <div style="float:left;width:350px;">
                    	1:360 Live Load and 1:240 Total Load; 1/2" maximum
                    </div>
                    <div class="clearFloat"></div>
                </div>
            </cfif>
            </div>
            
            <cfinclude template="../assets/includes/commonRightSideBar.cfm">
        </div>
    </cfmodule>