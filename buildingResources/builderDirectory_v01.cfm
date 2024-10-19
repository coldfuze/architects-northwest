<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Builder Directory - Building Resources - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Builder Directory - Building Resources - Your Family Architect - Architects Northwest";		
	}
</cfscript>

<!--- Get Quick Search Business Logic --->
	<cfinclude template="../includes/quickSearchBusinessLogic.cfm">
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#" recentlyViewedPlans="#VARIABLES.RecentlyViewedPlans#">
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
                <h1 class="planStyleTitle"><a href="plans/housePlanCollections.cfm" class="brownLink">HOUSE PLAN<BR />COLLECTIONS</a></h1>
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
                	BUILDER DIRECTORY
                </div>
				
                <div style="text-align:center;">
                	<strong>Washington State Builders</strong>
                </div>
                
                <div>
                    <ul type="square">
                        <li><a class="planSpec" href="http://www.americanclassicbuilder.com" target="_blank">American Classic Homes</a> (americanclassicbuilder.com)</li>
                        <li><a class="planSpec" href="http://www.ardun.net" target="_blank">Ardun Construction</a> (ardun.net)</li>
                        <li><a class="planSpec" href="http://www.aspenhomesinc.us" target="_blank">Aspen Homes</a> (aspenhomesinc.us)</li>
                        <li><a class="planSpec" href="http://www.brookshomes.com" target="_blank">Brooks Homes</a> (brookshomes.com)</li>
                        <li><a class="planSpec" href="http://www.builderonthelake.com" target="_blank">Builder On The Lake</a> (builderonthelake.com)</li>
                        <li><a class="planSpec" href="http://www.campbellhomesinc.com" target="_blank">Campbell Homes</a> (campbellhomesinc.com)</li>
                        <li><a class="planSpec" href="http://www.cascadiahomes.net" target="_blank">Cascadia Homes</a> (cascadiahomes.net)</li>
                        <li><a class="planSpec" href="http://www.crafthomesllc.com" target="_blank">Craft Homes</a> (crafthomesllc.com)</li>
                        <li><a class="planSpec" href="http://www.columbiahomes.net" target="_blank">Columbia Homes</a> (columbiahomes.net)</li>
                        <li><a class="planSpec" href="http://www.dkmartincustomhomes.com" target="_blank">DK Martin Custom Homes</a> (dkmartincustomhomes.com)</li>
                        <li><a class="planSpec" href="http://www.dmeconstruction.com" target="_blank">DME Construction</a> (dmeconstruction.com)</li>
                        <li><a class="planSpec" href="http://www.donoghhomes.net" target="_blank">Donogh Homes</a> (donoghhomes.net)</li>
                        <li><a class="planSpec" href="http://www.dutchsons.com" target="_blank">Dutch Sons</a> (dutchsons.com)</li>
                        <li><a class="planSpec" href="http://www.grburgess.com" target="_blank">G.R. Burgess Co.</a> (grburgess.com)</li>
                        <li><a class="planSpec" href="http://www.ginsbergcustomhomes.com" target="_blank">Ginsberg Custom Homes</a> (ginsbergcustomhomes.com)</li>
                        <li><a class="planSpec" href="http://www.gurneecompanybuilders.com" target="_blank">Gurnee Company Builders</a> (gurneecompanybuilders.com)</li>
                        <li><a class="planSpec" href="http://www.hallamorehomes.com" target="_blank">Hallamore Homes</a> (hallamorehomes.com)</li>
                        <li><a class="planSpec" href="http://www.seattlecustomhomebuilders.com" target="_blank">Hayes and Corley Custom Homes</a> (seattlecustomhomebuilders.com)</li>
                        <li><a class="planSpec" href="http://www.highcountryhomes.us" target="_blank">High Country Homes</a> (highcountryhomes.us)</li>
                        <li><a class="planSpec" href="http://www.hillcustomhomes.com" target="_blank">Hill Custom Homes</a> (hillcustomhomes.com)</li>
                        <li><a class="planSpec" href="http://www.hughesbuildingco.com" target="_blank">Hughes Building Company</a> (hughesbuildingco.com)</li>
                        <li><a class="planSpec" href="http://www.jdbergevinhomes.com" target="_blank">JD Bergevin Homes</a> (jdbergevinhomes.com)</li>
                        <li><a class="planSpec" href="http://www.kmshomes.com" target="_blank">KMS Homes</a> (kmshomes.com)</li>
                        <li><a class="planSpec" href="http://www.kenmarconstruction.com" target="_blank">Kenmar Construction</a> (kenmarconstruction.com)</li>
                        <li><a class="planSpec" href="http://www.kirklandbuildersgroup.com" target="_blank">Kirkland Builders Group</a> (kirklandbuildersgroup.com)</li>
                        <li><a class="planSpec" href="http://www.lockiehomes.com" target="_blank">Lockie Homes</a> (lockiehomes.com)</li>
                        <li><a class="planSpec" href="http://www.luxhomesllc.com" target="_blank">Lux Homes</a> (luxhomesllc.com)</li>
                        <li><a class="planSpec" href="http://www.madronacustomhomes.com" target="_blank">Madrona Custom Homes</a> (madronacustomhomes.com)</li>
                        <li><a class="planSpec" href="http://www.merithomesinc.com" target="_blank">Merit Homes</a> (merithomesinc.com)</li>
                        <li><a class="planSpec" href="http://www.meritageltd.com" target="_blank">Meritage Development Group</a> (meritageltd.com)</li>
                        <li><a class="planSpec" href="http://www.pacificridgehomes.com" target="_blank">Pacific Ridge Homes</a> (pacificridgehomes.com)</li>
                        <li><a class="planSpec" href="http://www.parmenterhomes.com" target="_blank">Parmenter Homes</a> (parmenterhomes.com)</li>
                        <li><a class="planSpec" href="http://www.premierpacifichomes.net" target="_blank">Premier Pacific Homes</a> (premierpacifichomes.net)</li>
                        <li><a class="planSpec" href="http://www.rkkconstruction.com" target="_blank">RKK Construction</a> (rkkconstruction.com)</li>
                        <li><a class="planSpec" href="http://www.roberteggeconstruction.com" target="_blank">Robert Egge Construction</a> (roberteggeconstruction.com)</li>
                        <li><a class="planSpec" href="http://www.soaringeaglehomes.com" target="_blank">Soaring Eagle Homes</a> (soaringeaglehomes.com)</li>
                        <li><a class="planSpec" href="http://www.westtier.com" target="_blank">West Tier Homes</a> (westtier.com)</li>
                        <li><a class="planSpec" href="http://www.billwheelerconstruction.com" target="_blank">Wheeler Construction</a> (billwheelerconstruction.com)</li>
					</ul>
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
                    <!-- live2support.com tracking codes starts --><div id="l2s_trk" style="z-index:99;"><a href="http://live2support.com" style="font-size:1px;">Live Chat Software</a></div><script type="text/javascript"><!-- 
     var l2s_pht=escape(location.protocol); if(l2s_pht.indexOf("http")==-1) l2s_pht='http:'; function l2s_load() { document.write('<scr'+'ipt type="text/javaScr'+'ipt" src="'+unescape(l2s_pht)+'//sb.live2support.com/js/lsjs1.php?stid=17189"  defer=true>'+'</scr'+'ipt>');  } 
    l2s_load();  document.getElementById('l2s_trk').style.visibility='hidden'; //--></script><!-- live2support.com tracking codes closed -->
                </div>
                
                <div id="buildingProductsCI">
                	<strong><a href="/buildingResources/buildingProducts.cfm" class="brownLink">BUILDING<br />PRODUCTS</a></strong>
                    <br />
                    <img src="/assets/images/SponsorLogos.jpg" width="174" height="592" border=0 usemap="#m_SponsorLogos">
                </div>
            </div>
        </div>
    </cfmodule>