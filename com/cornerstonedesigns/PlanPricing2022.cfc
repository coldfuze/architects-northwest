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
                            	<cfif ARGUMENTS.pi.HasExistingMaterialList EQ 1>$150.00<cfelse>Not Available</cfif>
                            </div>
                            <div class="clearFloat"></div>
                        </div>
                    </div>
                </div>
            </cfsavecontent>
        <cfelse>
        	<cfscript>				
				if (ARGUMENTS.pi.isGarageAccessoryPlan EQ 1) {
					if (IsNumeric(ARGUMENTS.pi.GarageSF)) {
						VARIABLES.GarageSF = ARGUMENTS.pi.GarageSF;
					}
					else {
						VARIABLES.GarageSF = 0;
					}
					
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
					
					VARIABLES.TotalArea = VARIABLES.GarageSF + VARIABLES.MainFloorSF + VARIABLES.UpperFloorSF + VARIABLES.LowerFloorSF + VARIABLES.ThirdFloorSF;
					VARIABLES.LivingArea = VARIABLES.MainFloorSF + VARIABLES.UpperFloorSF;
					
					VARIABLES.StudySetPrice = DollarFormat(0.10 * VARIABLES.TotalArea);
					VARIABLES.BidSetPrice = DollarFormat(0.20 * VARIABLES.TotalArea);
					// VARIABLES.SingleUseLicense = DollarFormat((0.25 * VARIABLES.GarageSF) + (0.5 * VARIABLES.LivingArea));
					VARIABLES.SingleUseLicense = VARIABLES.TotalArea;
					if (VARIABLES.TotalArea LTE 3000) {
						if (VARIABLES.TotalArea LTE 1000) {
							VARIABLES.SingleUseLicense = '$2000.00';
							VARIABLES.MultiUseLicense = '$4000.00';
						}
						else {
							if (VARIABLES.TotalArea LTE 2000) {
								VARIABLES.SingleUseLicense = '$2500.00';
								VARIABLES.MultiUseLicense = '$5000.00';
							}
							else {
								VARIABLES.SingleUseLicense = '$3000.00';
								VARIABLES.MultiUseLicense = '$7500.00';
							}
						}
					}
					else {
						VARIABLES.SingleUseLicense = DollarFormat(VARIABLES.SingleUseLicense);
						VARIABLES.MultiUseLicense = DollarFormat(2.5 * (VARIABLES.GaragePlusTotalSF));
					}
					VARIABLES.FiveAdditionalSetsPrice = '$100.00';
					VARIABLES.FullReverseSets = DollarFormat(0.08 * VARIABLES.TotalArea);
				}
				else {
					if (IsNumeric(ARGUMENTS.pi.GarageSF)) {
						VARIABLES.GarageSF = ARGUMENTS.pi.GarageSF;
					}
					else {
						VARIABLES.GarageSF = 0;
					}
					VARIABLES.GaragePlusTotalSF = VARIABLES.GarageSF + ARGUMENTS.pi.TotalSF;
					VARIABLES.StudySetPrice = DollarFormat(VARIABLES.GaragePlusTotalSF * 0.1);
					VARIABLES.BidSetPrice = DollarFormat(VARIABLES.GaragePlusTotalSF * 0.2);
					VARIABLES.SingleUseLicense = VARIABLES.GaragePlusTotalSF;	
					if (VARIABLES.GaragePlusTotalSF LTE 3000) {
						if (VARIABLES.GaragePlusTotalSF LTE 1000) {
							VARIABLES.SingleUseLicense = '$2000.00';
							VARIABLES.MultiUseLicense = '$4000.00';
						}
						else {
							if (VARIABLES.GaragePlusTotalSF LTE 2000) {
								VARIABLES.SingleUseLicense = '$2500.00';
								VARIABLES.MultiUseLicense = '$5000.00';
							}
							else {
								VARIABLES.SingleUseLicense = '$3000.00';
								VARIABLES.MultiUseLicense = '$7500.00';
							}
						}
					}
					else {
						VARIABLES.SingleUseLicense = DollarFormat(VARIABLES.SingleUseLicense);
						VARIABLES.MultiUseLicense = DollarFormat(2.5 * (VARIABLES.GaragePlusTotalSF));
					}
					
					VARIABLES.FullReverseSets =  DollarFormat(VARIABLES.GaragePlusTotalSF * 0.08);
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
                            	<cfoutput>#VARIABLES.StudySetPrice#</cfoutput>
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	The study set includes PDF files of floor plans and elevations stamped &quot;NOT FOR CONSTRUCTION&quot;, allowing you to review the design before purchasing a license package.  A study set does not include a license required to 
construct the residence.  100% of the study set purchase price will be credited towards any plan package upgrade.
                            </div>
                        </div>
                        <div class="packageContents">
                        	<div class="itemLabel">
                            	Bid Set (No License Purchase)
                            </div>
                            <div class="itemPrice">
                            	<cfoutput>#VARIABLES.BidSetPrice#</cfoutput>
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	The bid set includes PDF files of the foundation plan , floor framing plans, floor plans,  roof framing plan, and elevations stamped &quot;NOT FOR CONSTRUCION&quot;, allowing you to review the working drawings before purchasing a license package.  A bid set does not include a license to construct the residence.  100% of the bid set purchase price will be credited towards any plan package upgrade.
                            </div>
                        </div>
                        <div class="packageContents">
                        	<div class="itemLabel">
                            	Single Use License
                            </div>
                            <div class="itemPrice">
                            	<cfoutput>#VARIABLES.SingleUseLicense#</cfoutput>
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	The single use license package includes PDF files of construction drawings, allowing for the construction of a single residence. The price includes beam calculations for 25psf snow load and typical Washington State lateral engineering.
                            </div>
                        </div>
                        <div class="packageContentsNoLine">
                        	<div class="itemLabel">
                            	Multi Use License
                            </div>
                            <div class="itemPrice">
                            	<cfoutput>#VARIABLES.MultiUseLicense#</cfoutput>
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	The multiple use license package includes PDF files of construction drawings with a license to construct multiple residences. The price includes beam calculations for 25psf snow load and typical Washington State lateral engineering.
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
                        <div class="packageContents">
                        	<div class="itemLabel">
                            	Right Reading Reverse Plan
                            </div>
                            <div class="itemPrice">
                            	<cfoutput>#VARIABLES.FullReverseSets#</cfoutput>
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	The plan is reversed from the orientation shown on the website.  Some plans may not apply.
                            </div>
                        </div>
                        <!---<div class="packageContents">
                        	<div class="itemLabel">
                            	Digital PDF File
                            </div>
                            <div class="itemPrice">
                            	$50.00
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	PDFs of your permit-ready, engineered plans are available only with a license purchase.	
                            </div>
                        </div>--->
                        <div class="packageContentsNoLine">
                        	<div class="itemLabel">
                            	Additional Engineering Calculations
                            </div>
                            <div class="itemPrice">
                            	<!---$500.00 to $1500.00 Estimated--->Call for pricing and availability
                            </div>
                            <div class="clearFloat"></div>
                            <div class="itemDescription">
                            	Additional engineering may be required and is not included in the price such as: retaining walls and basement foundations, pilings and shoring, and steel structural items (beams, columns, and moment frames).
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
                            	$90.00
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