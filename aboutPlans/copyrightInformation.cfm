<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Copyright Information - About Plans - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Copyright Information - About Plans - Your Family Architect - Architects Northwest";		
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
                	COPYRIGHT INFORMATION
                </div>
				
                Please review the following important information about home plan design copyrights which has been prepared in part by the <a class="planSpec" href="http://www.thehpma.com/" target="_blank">House Plan Marketing Association</a>.
                
                <cfif CGI.HTTP_HOST CONTAINS "cornerstone">
                <ul type="square" class="ci">
                    <li class="ci"><strong>CORNERSTONE DESIGNS (CSD) HOME PLANS ARE COPYRIGHTED!</strong>  Like books, movies, and songs, CSD home plans are protected under Federal Copyright Law.  Copyright Law prohibits anyone, other than CSD, from reproducing, modifying, or reusing home plan designs without written permission from CSD.</li>
                    <li class="ci"><strong>DO NOT COPY CSD DESIGNS OR FLOOR PLANS FROM ANY PUBLICATION, ELECTRONIC MEDIA OR BUILT HOME.</strong>  It is illegal to copy CSD home plans from a plan book, magazine, CD, or on the Internet.  It is a mistake to believe that changing, redesigning, or redrawing any plan from a plan book or magazine is allowed – IT IS NOT!  The right to modify CSD plans is held exclusively by CSD.  It is also illegal to copy or redraw a built home, even if you have never seen plans for the home.  If you find a plan that you like, you must purchase the right to use the design from CSD or an authorized source.</li>
                    <li class="ci"><strong>DO NOT USE PLANS TO BUILD MORE THAN ONE HOUSE.</strong>  The original purchaser of a CSD multiple-set home plan package is licensed to build a single home from the plans.  Building more than one home from the plans without permission is an infringement of CSD&#39;s copyright.  The purchase of additional sets of plans does not grant the right to construct more than one home.  Purchase of home plans in newer formats, such as CDs, PDFs, or CAD files, also grants the buyer the right to build a single home, unless a license to build more than one home is specifically included by CSD with the purchase.</li>
                    <li class="ci"><strong>HOUSE PLAN BLUEPRINTS OR BLACKLINES CANNOT BE COPIED OR REPRODUCED.</strong>  Home plans cannot be copied or reproduced without written permission from CSD.  If additional sets are required for estimating or construction, please contact CSD to purchase additional sets, or to obtain a letter of permission to make additional copies.  It is illegal for copy shops to make copies of home designs by Federal Copyright Law without written permission from CSD.</li>
                    <li class="ci"><strong>HOUSE PLANS IN THE FORM OF BLUEPRINTS OR BLACKLINES CANNOT BE REDRAWN.</strong>  Plans cannot be modified or redrawn without first obtaining CSD&#39;s permission.  With your multiple-set plan package purchase, you are licensed to make changes by “red-lining” the plans.  If you need to make major changes or need to redraw the plans for any reason, you must purchase a reproducible license or a PDF license, which includes the right to modify the plan or redraw the plan, and build one home from the modified or redrawn plan.  You may not reuse or sell the modified or redrawn design.</li>
                    <li class="ci"><strong>REPRODUCIBLE HOME PLANS.</strong>  Reproducible plans (CAD files, PDF files and vellums) include a license to make modifications to the plans.  The license includes permission to make up to 10 sets of the home plans.  Only one home can be constructed from the purchase of a reproducible plan license, either in original form or as modified.</li>
                    <li class="ci"><strong>MODIFIED DESIGNS CANNOT BE REUSED.</strong>  Even if you are licensed to make modifications to a CSD plan, the modified design remains protected by CSD&#39;s original copyright.  Sale or reuse of the modified design is prohibited.  In addition, modifications to plans releases CSD from any liability for design defects and voids all warranties, expressed or implied.</li>
                    <li class="ci"><strong>WHO IS RESPONSIBLE FOR COPYRIGHT INFRINGEMENT?</strong>  Any party who participates in a copyright infringement may be responsible including the purchaser, designers, architects, engineers, drafters, homeowners, builders, contractors, sub-contractors, copy shops, developers, and real estate agencies.  It does not matter whether or not the individual knows that a violation has occurred.  Ignorance of Copyright Law is not a valid defense!  Refuse to participate in illegal copying or use of CSD designs, or the creation of derivative designs or homes.</li>
                    <li class="ci"><strong>PLEASE RESPECT HOME DESIGN COPYRIGHTS.</strong>  If you suspect that a violation of CSD&#39;s copyrights has occurred, or if there is any uncertainty about the plans purchased, please contact CSD before proceeding.  A reward may be offered for information about home design copyright infringement.</li>
                    <li class="ci"><strong>PENALTIES FOR HOME DESIGN COPYRIGHT INFRINGEMENT CAN BE HUGE.</strong>  Parties found liable may be required to pay actual damages caused by the infringement, along with profits from the sale of any home built from an infringing design.  Copyright Law also allows for statutory damages of up to $150,000 per home built from an infringed plan, plus CSD&#39;s legal fees, which can exceed the damages.</li>
                </ul>
                <cfelse>
					<ul type="square" class="ci">
						<li class="ci"><strong>ARCHITECTS NORTHWEST (ANW) HOME PLANS ARE COPYRIGHTED!</strong>  Like books, movies, and songs, ANW home plans are protected under Federal Copyright Law.  Copyright Law prohibits anyone, other than ANW, from reproducing, modifying, or reusing home plan designs without written permission from ANW.</li>
                        <li class="ci"><strong>DO NOT COPY ANW DESIGNS OR FLOOR PLANS FROM ANY PUBLICATION, ELECTRONIC MEDIA OR BUILT HOME.</strong>  It is illegal to copy ANW home plans from a plan book, magazine, CD, or on the Internet.  It is a mistake to believe that changing, redesigning, or redrawing any plan from a plan book or magazine is allowed – IT IS NOT!  The right to modify ANW plans is held exclusively by ANW.  It is also illegal to copy or redraw a built home, even if you have never seen plans for the home.  If you find a plan that you like, you must purchase the right to use the design from ANW.</li>
                        <li class="ci"><strong>DO NOT USE PLANS TO BUILD MORE THAN ONE HOUSE.</strong>  The original purchaser of a ANW multiple-set home plan package is licensed to build a single home from the plans.  Building more than one home from the plans without permission is an infringement of ANW&#39;s copyright.  The purchase of additional sets of plans does not grant the right to construct more than one home.  Purchase of home plans in newer formats, such as CDs, PDFs, or CAD files, also grants the buyer the right to build a single home, unless a license to build more than one home is specifically included by ANW with the purchase.</li>
                        <li class="ci"><strong>HOUSE PLAN BLUEPRINTS OR BLACKLINES CANNOT BE COPIED OR REPRODUCED.</strong>  Home plans cannot be copied or reproduced without written permission from ANW.  If additional sets are required for estimating or construction, please contact ANW to purchase additional sets, or to obtain a letter of permission to make additional copies.  It is illegal for copy shops to make copies of home designs by Federal Copyright Law without written permission from ANW.</li>
                        <li class="ci"><strong>HOUSE PLANS IN THE FORM OF BLUEPRINTS OR BLACKLINES CANNOT BE REDRAWN.</strong>  Plans cannot be modified or redrawn without first obtaining ANW&#39;s permission.  With your multiple-set plan package purchase, you are licensed to make changes by “red-lining” the plans.  If you need to make major changes or need to redraw the plans for any reason, you must purchase a reproducible license or a PDF license, which includes the right to modify the plan or redraw the plan, and build one home from the modified or redrawn plan.  You may not reuse or sell the modified or redrawn design.</li>
                        <li class="ci"><strong>REPRODUCIBLE HOME PLANS.</strong>  Reproducible plans (CAD files, PDF files and vellums) include a license to make modifications to the plans.  The license includes permission to make up to 10 sets of the home plans.  Only one home can be constructed from the purchase of a reproducible plan license, either in original form or as modified.</li>
                        <li class="ci"><strong>MODIFIED DESIGNS CANNOT BE REUSED.</strong>  Even if you are licensed to make modifications to a ANW plan, the modified design remains protected by ANW&#39;s original copyright.  Sale or reuse of the modified design is prohibited.  In addition, modifications to plans releases ANW from any liability for design defects and voids all warranties, expressed or implied.</li>
                        <li class="ci"><strong>WHO IS RESPONSIBLE FOR COPYRIGHT INFRINGEMENT?</strong>  Any party who participates in a copyright infringement may be responsible including the purchaser, designers, architects, engineers, drafters, homeowners, builders, contractors, sub-contractors, copy shops, developers, and real estate agencies.  It does not matter whether or not the individual knows that a violation has occurred.  Ignorance of Copyright Law is not a valid defense!  Refuse to participate in illegal copying or use of ANW designs, or the creation of derivative designs or homes.</li>
                        <li class="ci"><strong>PLEASE RESPECT HOME DESIGN COPYRIGHTS.</strong>  If you suspect that a violation of ANW&#39;s copyrights has occurred, or if there is any uncertainty about the plans purchased, please contact ANW before proceeding.  A reward may be offered for information about home design copyright infringement.</li>
                        <li class="ci"><strong>PENALTIES FOR HOME DESIGN COPYRIGHT INFRINGEMENT CAN BE HUGE.</strong>  Parties found liable may be required to pay actual damages caused by the infringement, along with profits from the sale of any home built from an infringing design.  Copyright Law also allows for statutory damages of up to $150,000 per home built from an infringed plan, plus ANW&#39;s legal fees, which can exceed the damages.</li>
                    </ul>
                </cfif>
            </div>
            
            <cfinclude template="../assets/includes/commonRightSideBar.cfm">
        </div>
    </cfmodule>