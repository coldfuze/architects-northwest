<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Plan Modifications - About Plans - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Plan Modifications - About Plans - Your Family Architect - Architects Northwest";		
	}
</cfscript>

<!--- Get Quick Search Business Logic --->
	<cfinclude template="../includes/quickSearchBusinessLogic.cfm">
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#" recentlyviewedplans="#VARIABLES.RecentlyViewedPlans#">
        <div id="copyrightMainContainer">            
            <div style="position:absolute;top:0px;left:10px;height:1225px;width:164px;padding:10px 10px 10px 10px;line-height:17px;font-size:12px;background-color:#caccbb;text-align:left;margin-bottom:10px;">
            	<h1 class="planStyleTitle"><a href="plans/popularSearches.cfm" class="brownLink">POPULAR<br />SEARCHES</a></h1>
                Award Winning Designs<br />
                Best Selling Plans<br />
                Garage & Accessory Plans<br />
                Green Plans<br />
                Homes By Designer<br />
                New Plans<br />
                Plans Comings Soon<br />
                Show All Plans<br />
                Townhouses
                <h1 class="planStyleTitle"><a href="plans/architecturalStyles.cfm" class="brownLink">ARCHITECTURAL<br />STYLES</a></h1>
                Alpine House Designs<br />
                Bungalow House Plans<br />
                Cape Cod House Plans<br />
                Carriage House Plans<br />
                Chateau House Plans<br />
                Colonial House Plans<br />
                Contemporary Home Plans<br />
                Cottage House Plans<br />
                Country House Plans<br />
                Craftsman House Plans<br />
                European House Plans<br />
                Farmhouse Home Plans<br />
                Hampton House Plans<br />
                Lodge House Plans<br />
                Modern Home Plans<br />
                Mountain House Plans<br />
                Northwest Floor Plans<br />
                Prairie Home Plans<br />
                Ranch House Plans<br />
                Shingle House Plans<br />
                Shotgun Floor Plans<br />
                Traditional House Plans<br />
                Tudor House Plans<br />
                Victorian House Designs<br />
                <h1 class="planStyleTitle"><a href="plans/housePlanCollections.cfm" class="brownLink">HOUSE PLAN<br />COLLECTIONS</a></h1>
                1 Story House Plans<br />
                1 Story House Plans<br />
                &nbsp;&nbsp;&nbsp;With Basement<br />
                2 Story House Plans<br />
                2 Story House Plans<br />
                &nbsp;&nbsp;&nbsp;With Basement<br />
                3 Story House Plans<br />
                3 Story House Plans<br />
                &nbsp;&nbsp;&nbsp;With Basement<br />
                Affordable Home Designs<br />
                Bonus Space Floor Plans<br />
                Covered Porch House Plans<br />
                Garage Detach House Plans<br />
                Garage Rear House Plans<br />
                Garage Side House Plans<br />
                Garage Under House Plans<br />
                Great Room Floor Plans<br />
                Luxury Home Designs<br />
                Master Bedroom Main Floor<br /> 
                Narrow Lot House Plans
                Sloping Lot (Down Hill) Plans<br />
                Sloping Lot  (Side Hill) Plans<br />
                Sloping Lot (Up Hill) Plans<br />
                Small House Plans<br />
                Split Level Home Designs<br />
                Tri Level Home Designs<br />
                Vacation House Plans<br />
                View Lot (Front) Plans<br />
                View Lot (Rear) Plans<br />
                Wide Lot House Plans<br />
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
                	<div style="border-bottom:thin solid black;text-align:left;">
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">1</span> Choose the plan you want modified.
                        </div>
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">2</span> Send us your changes and contact information via email, or call our service team.
                        </div>
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">3</span> We will prepare a free quote and review it with you.
                        </div>
                        <div class="clearFloat"></div>
                    </div>
                    
                    <div style="border-bottom:thin solid black;text-align:left;">
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">4</span> Order your modification services.
                        </div>
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">5</span> A phone meeting begins the modification process.
                        </div>
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">6</span> The modified floor plan and exterior elevation design drawings are emailed to you for your comments and approval.
                        </div>
                        <div class="clearFloat"></div>
                    </div>
                    
                    <div style="text-align:left;">
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">7</span> Your construction drawings, including beam calculations are completed.
                        </div>
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">8</span> Your project is delivered to you after final payment is made.
                        </div>
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">9</span> Your local building department may require that you provide structural calculations and a stamp by a local structural engineer.  Please check with your local building department for their permit requirements.
                        </div>
                        <div class="clearFloat"></div>
                    </div>
                <cfelse>
                    <div style="border-bottom:thin solid black;text-align:left;">
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">1</span> Choose the plan you want modified.
                        </div>
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">2</span> Send us your changes and contact information via email, or call our service team.
                        </div>
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">3</span> We will prepare a free quote and review it with you in person or on the phone.
                        </div>
                        <div class="clearFloat"></div>
                    </div>
                    
                    <div style="border-bottom:thin solid black;text-align:left;">
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">4</span> Order your modification services.
                        </div>
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">5</span> Another meeting in person or on the phone begins the modification process.
                        </div>
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">6</span> The modified floor plan and exterior elevation design drawings are emailed to you for your comments and approval.
                        </div>
                        <div class="clearFloat"></div>
                    </div>
                    
                    <div style="text-align:left;">
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">7</span> If required, your plans are sent to a structural engineer for calculation of lateral (wind and earthquake) and retaining wall elements.
                        </div>
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">8</span> Your construction drawings are completed with any required engineering installed on the plans.
                        </div>
                        <div style="width:165px;padding:10px;float:left;">
                            <span style="font-size:22px;">9</span> Your project is delivered to you after final payment is made.
                        </div>
                        <div class="clearFloat"></div>
                    </div>
                </cfif>
                <div style="text-align:center;margin-top:20px;">
                	<a class="planSpec" href="/contactus/">Select Here to Contact Us for Plan Modifications</a>
                </div>
            </div>
            
            <div id="newPlanChatContainer">
            	<div id="newPlan">
                	<strong><a href="plans/newPlans.cfm" class="brownLink">NEW<br /> PLANS</a></strong>
                	<br />
                	<img src="../assets/renderings/chathamKnoll.jpg" width="170" height="121" style="padding-top:5px;padding-bottom:5px;" alt="Chatham Knoll" />
                	<strong>CHATHAM KNOLL<br />M5900A3S-0</strong>
                    <div style="font-size:12px;position:relative;padding:5px 0 5px 5px;">
                        <div style="float:left;width:80px;text-align:left;margin:10px 0 10px 0;">
                            Total Area:<br />
                            Stories:<br />
                            Bedrooms:<br />
                            Full Baths:
                        </div>
                        <div style="float:left;width:85px;text-align:right;margin:10px 0 10px 0;">
                            5900 sq. ft.<br />
                            2<br />
                            4<br />
                            4
                        </div>
                        <br clear="all" />
                        <strong>View Floor Plan</strong>
                    </div>
                 </div>
                 
            	<div id="chat">
                   <img src="/assets/images/PayPal.gif" width="175" height="154" alt="Pay Pal Image"/>
                </div>
                
                <div id="buildingProductsCI">
                	<strong><a href="/buildingResources/buildingProducts.cfm" class="brownLink">BUILDING<br />PRODUCTS</a></strong>
                    <br />
                    <img src="/assets/images/SponsorLogos.jpg" width="174" height="592" border=0 usemap="#m_SponsorLogos">
                </div>
            </div>
        </div>
    </cfmodule>