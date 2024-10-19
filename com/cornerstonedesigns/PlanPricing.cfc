<cfcomponent>
	<cffunction name="getPricingForPlan" access="public" returntype="string" hint="This method returns plan pricing for a particular plan, given the Zip Code,Price Category, and Total Square Footage">
		<cfargument name="pi" type="struct" required="yes" hint="This argument expects a structure that contains a Zip Code, PriceCategoryId, and Total Square Footage">
		
        <cfscript>
			VARIABLES.isWashingtonStateZipCode = Application.WashingtonStateZipCodeService.isWashingtonStateZipCode(ARGUMENTS.pi.ZipCode);
		</cfscript>
        
        <cfif VARIABLES.isWashingtonStateZipCode IS "False">
        	<cfscript>
				VARIABLES.pci = Application.PriceCategoryService.getPricingDataForCategory(ARGUMENTS.pi.PriceCategoryId);
				VARIABLES.FullBasementPrice = ARGUMENTS.pi.TotalSF * 0.2;
				if (VARIABLES.FullBasementPrice LT 300) {
					VARIABLES.FullBasementPrice = 300;	
				}
				VARIABLES.DaylightBasementPrice = ARGUMENTS.pi.TotalSF * 0.4;
				if (VARIABLES.DaylightBasementPrice LT 500) {
					VARIABLES.DaylightBasementPrice = 500;	
				}
				VARIABLES.SlabFoundationPrice = ARGUMENTS.pi.TotalSF * 0.15;
				if (VARIABLES.SlabFoundationPrice LT 200) {
					VARIABLES.SlabFoundationPrice = 200;	
				}
			</cfscript>
            
            <cfsavecontent variable="pricingInfo">
            	<div id="planPackagesContainer2017">
                	<div id="planPackagesContentContainer2017">
                    	<div class="packageGrouping">
                        	PLAN LICENSE PACKAGES
                        </div>
                        <div class="packageContents">
                        	<div class="itemLabel">
                            	Digital PDF File Single Use License
                            </div>
                            <div class="itemPrice">
                            	<cfoutput>#DollarFormat(VARIABLES.pci.PDFPrice)#</cfoutput>
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	This single use license is delivered electronically via a digital PDF file which is licensed to print as many copies of the construction drawings as necessary for the construction of a single residence.  This license requires a signed license agreement and building site location.  The price includes beam calculations for 25psf snow load and standard live loads, but does not include engineering or retaining wall calculations.
                            </div>
                        </div>
                        <div class="packageContentsNoLine">
                        	<div class="itemLabel">
                            	CAD File Multiple Use License
                            </div>
                            <div class="itemPrice">
                            	<cfoutput>#DollarFormat(VARIABLES.pci.MultiUsePrice)#</cfoutput>
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	This multiple use license is delivered electronically via a digital AutoCAD file that allows modifications by a CAD drafter for the construction of multiple residences.  This license requires a signed license agreement and initial building site location. The price includes beam calculations for 25psf snow load and standard live loads, but does not include engineering or retaining wall calculations.
                            </div>
                        </div>
                    </div>
            	</div>
                
                <div id="planOptionsContainer">
                	<div id="planOptionsContentContainer">
                    	<div class="packageGrouping">
                        	OPTIONS (REQUIRES PLAN LICENSE PACKAGE)
                        </div> 
                        <div class="packageContents">
                        	<div class="itemLabel">
                            	<cfif CGI.HTTP_HOST CONTAINS "cornerstone">Convert plan to unfinished walk-out (daylight) basement<cfelse>Adding a Daylight Basement</cfif>
                            </div>
                            <div class="itemPrice">
                            	<cfoutput>#DollarFormat(VARIABLES.DaylightBasementPrice)#</cfoutput>
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	<cfif CGI.HTTP_HOST CONTAINS "cornerstone">Engineering is not included when adding a walk-out basement.  Adding a basement is an extensive revision so please budget two to four weeks for this modification.<cfelse>Engineering is not included when adding a daylight basement.  Adding a basement is an extensive revision so please budget two to four weeks for this modification.</cfif>
                            </div>
                        </div>
                        <div class="packageContents">
                        	<div class="itemLabel">
                            	Convert plan to unfinished cellar basement
                            </div>
                            <div class="itemPrice">
                            	<cfoutput>#DollarFormat(VARIABLES.FullBasementPrice)#</cfoutput>
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	Engineering is not included when adding a cellar (full) basement.  Adding a basement is an extensive revision so please budget two to four weeks for this modification.
                            </div>
                        </div>
                        <div class="packageContents">
                        	<div class="itemLabel">
                            	Convert plan from crawl space to slab on grade
                            </div>
                            <div class="itemPrice">
                            	<cfoutput>#DollarFormat(VARIABLES.SlabFoundationPrice)#</cfoutput>
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	Engineering is not included when converting a plan from a crawl space to a slab on grade foundation.  Please budget two weeks for this modification.
                            </div>
                        </div>
                        <div class="packageContents">
                        	<div class="itemLabel">
                            	Right Reading Reverse Plan
                            </div>
                            <div class="itemPrice">
                            	<cfoutput>#DollarFormat(VARIABLES.pci.FullReversePrice)#</cfoutput>
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	The plan is reversed from the orientation shown on the website.  Some plans may not apply.
                            </div>
                        </div>
						<div class="packageContents" style="padding-bottom:5px;">
                        	<div class="itemLabel">
                            	Revisions &amp; Modifications
                            </div>
                            <div class="itemPrice">
                            	$100.00/HR
                            </div>
                            <div class="clearFloat"></div>
                        </div>
						<div class="packageContentsNoLine">
                        	<div class="itemLabel">
                            	Existing Materials List
                            </div>
                            <div class="itemPrice">
                            	<cfif ARGUMENTS.pi.HasExistingMaterialList EQ 1>$275.00<cfelse>Not Available</cfif>
                            </div>
                            <div class="clearFloat"></div>
                        </div>
                    </div>
                </div>
            </cfsavecontent>
        <cfelse>
        	<cfscript>	
				if (IsNumeric(ARGUMENTS.pi.MainFloorSF)) {
					VARIABLES.MainFloorSF = ARGUMENTS.pi.MainFloorSF;
				}
				else {
					VARIABLES.MainFloorSF = 0;
				}

				if (IsNumeric(ARGUMENTS.pi.UpperFloorSF)) {
					VARIABLES.UpperFloorSF = ARGUMENTS.pi.UpperFloorSF;
				}
				else {
					VARIABLES.UpperFloorSF = 0;
				}

				if (IsNumeric(ARGUMENTS.pi.LowerFloorSF)) {
					VARIABLES.LowerFloorSF = ARGUMENTS.pi.LowerFloorSF;
				}
				else {
					VARIABLES.LowerFloorSF = 0;
				}

				if (IsNumeric(ARGUMENTS.pi.ThirdFloorSF)) {
					VARIABLES.ThirdFloorSF = ARGUMENTS.pi.ThirdFloorSF;
				}
				else {
					VARIABLES.ThirdFloorSF = 0;
				}
				
				VARIABLES.TotalArea = VARIABLES.MainFloorSF + VARIABLES.UpperFloorSF + VARIABLES.LowerFloorSF + VARIABLES.ThirdFloorSF;
				
				VARIABLES.SingleUseLicense = 2500;
				if (VARIABLES.TotalArea > 2272) {
					VARIABLES.SingleUseLicense = 1.1 * VARIABLES.TotalArea;
				}
				
				VARIABLES.MultiUseLicense = 2.75 * VARIABLES.TotalArea;
				if (VARIABLES.MultiUseLicense LT 5000) {
					VARIABLES.MultiUseLicense = 6250;
				}
				
				VARIABLES.FullReverseSets = 0.1 * VARIABLES.TotalArea;
				if (VARIABLES.FullReverseSets LT 150) {
					VARIABLES.FullReverseSets = 150;
				}
				if (VARIABLES.FullReverseSets GT 500) {
					VARIABLES.FullReverseSets = 500;
				}
			</cfscript>
           
            <cfsavecontent variable="pricingInfo">
                <div id="waStatePlanPackagesContainer">
                	<div id="waStatePlanPackagesContentContainer">
                    	<div class="packageGrouping">
                        	PLAN LICENSE PACKAGES
                        </div>
                    	<div class="packageContents">
                        	<div class="itemLabel">
                            	Study Set (No License Purchase)
                            </div>
                            <div class="itemPrice">
                            	Complimentary
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	The study set includes PDF files of floor plans and elevations stamped &quot;NOT FOR CONSTRUCTION&quot;, allowing you to review the design before purchasing a license package.  A study set does not include a license required to construct the residence.
                            </div>
                        </div>
                        <div class="packageContents">
                        	<div class="itemLabel">
                            	Single Use License
                            </div>
                            <div class="itemPrice">
                            	<cfoutput>#DollarFormat(VARIABLES.SingleUseLicense)#</cfoutput>
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	The single use license package includes PDF files of construction drawings, allowing for the construction of a single residence.
                            </div>
                        </div>
                        <div class="packageContentsNoLine">
                        	<div class="itemLabel">
                            	Multi Use License
                            </div>
                            <div class="itemPrice">
                            	<cfoutput>#DollarFormat(VARIABLES.MultiUseLicense)#</cfoutput>
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	The multiple use license package includes PDF files of construction drawings with a license to construct multiple residences.
                            </div>
                        </div>
                    </div>
            	</div>
                
                <div id="planOptionsContainer">
                	<div id="planOptionsContentContainer">
                    	<div class="packageGrouping">
                        	OPTIONS (REQUIRES PLAN LICENSE PACKAGE)
                        </div> 
                        <div class="packageContents">
                        	<div class="itemLabel">
                            	Adding a Basement
                            </div>
                            <div class="itemPrice">
                            	Call for pricing and availability
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	Foundation and retaining wall engineering is not included when adding a full or daylight basement.
                            </div>
                        </div>
                        <div class="packageContents">
                        	<div class="itemLabel">
                            	Slab Foundation Revision
                            </div>
                            <div class="itemPrice">
                            	Call for pricing and availability
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	Foundation engineering is not included when converting a plan from a crawl space to a slab on grade foundation.
                            </div>
                        </div>
                        <div class="packageContentsNoLine">
                        	<div class="itemLabel">
                            	Right Reading Reverse Plan
                            </div>
                            <div class="itemPrice">
                            	<cfoutput>#DollarFormat(VARIABLES.FullReverseSets)#</cfoutput>
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	The plan is reversed from the orientation shown on the website.  Some plans may not apply.
                            </div>
                        </div>
                    </div>
                </div>
                
                <div id="realtorProductsContainer">
                	<div id="realtorProductsContentContainer">
                    	<div class="packageGrouping">
                        	REALTOR PRODUCTS
                        </div>
                    	<!---<div class="packageContents">
                        	<div class="itemLabel">
                            	Marketing Graphic Files
                            </div>
                            <div class="itemPrice">
                            	$25.00
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	A color JPEG image of the website rendering, and a black and white JPEG marketing image of the floor plans.
                            </div>
                        </div>--->
                        <div class="packageContentsNoLine">
                        	<div class="itemLabel">
                            	Marketing Flyer
                            </div>
                            <div class="itemPrice">
                            	$150.00
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	A custom PDF marketing flyer containing the website rendering, marketing floor plans, your logo and contact information.<br>
								<a class="planSpec" href="javascript: newWindow = openWin( '/assets/images/MarketingFlyerExample.jpg', 'marketingFlyer', 'width=540,height=720,toolbar=0,location=0,directories=0,status=0,menuBar=0,scrollBars=0,resizable=0' ); newWindow.focus()">Select here to view an example of a marketing flyer</a>.
                            </div>
                        </div>
                     </div>
                 </div>
            </cfsavecontent>
        </cfif>
		<cfreturn pricingInfo>
	</cffunction>
</cfcomponent>