<cfscript>
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.favIcon = "http://www.cornerstonedesigns.com/cdfavicon.ico";
	}
	else {
		VARIABLES.favIcon = "http://www.architectsnw.com/favicon.ico";	
	}
</cfscript>

<!--- Commonly used code snippets used throughout the site --->
<cfinclude template="/CommonScripts.cfm">

	<cfscript>	
		// Page Titles
		VARIABLES.PageTitle = 'HOMES BY DESIGNER';
		
        if (CGI.HTTP_HOST CONTAINS "CornerStone") {
            VARIABLES.pageTitleBar = VARIABLES.PageTitle & " - Stock Home Plans for Every Style - CornerStone Designs";	
        }
        else {
            VARIABLES.pageTitleBar = VARIABLES.PageTitle & " - Stock Home Plans for Every Style - Your Family Architect - Architects Northwest";		
        }
    </cfscript>

	<cfmodule template="#Application.CTPath#planLayout.cfm" title="#VARIABLES.pageTitleBar#" recentlyViewedPlans="#VARIABLES.RecentlyViewedPlans#" cannedSearch="0">
        <div id="centerColumn">
            <div id="titleBar">
                HOMES BY DESIGNER
            </div>

            <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;">
                <strong><a href="homesByDesignerPlans.cfm?Id=1" class="brownLink">JEFFREY DEROULET</a></strong>
                <br />
                <a href="homesByDesignerPlans.cfm?Id=1"><img src="/assets/designerImages/jeffreyDeRoulet.jpg" width="165" height="121" alt="Click to View Plans Designed By Jeffrey DeRoulet" style="padding-top:6px;padding-bottom:5px;" border="0" /></a>
            </div>
            <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:10px;">
                <strong><a href="homesByDesignerPlans.cfm?Id=2" class="brownLink">TROY CLYMER</a></strong>
                <br />
                <a href="homesByDesignerPlans.cfm?Id=2"><img src="/assets/designerImages/troyClymer.jpg" width="165" height="121" alt="Click to View Plans Designed By Troy Clymer" style="padding-top:6px;padding-bottom:5px;" border="0" /></a>
            </div>
            <div style="float:right;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;">
                <strong><a href="homesByDesignerPlans.cfm?Id=3" class="brownLink">MARCUS JENKINS</a></strong>
                <br />
                <a href="homesByDesignerPlans.cfm?Id=3"><img src="/assets/designerImages/marcusJenkins.jpg" width="165" height="121" alt="Click to View Plans Designed By Marcus Jenkins" style="padding-top:6px;padding-bottom:5px;" border="0" /></a>
            </div>
            <br clear="all" />
            <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:11px;margin-top:10px;">
                <strong><a href="homesByDesignerPlans.cfm?Id=4" class="brownLink">SARAH WEIGHT</a></strong>
                <br />
                <a href="homesByDesignerPlans.cfm?Id=4"><img src="/assets/designerImages/saraWeight.jpg" width="165" height="121" alt="Click to View Plans Designed By Sarah Weight" style="padding-top:6px;padding-bottom:5px;" border="0" /></a>
            </div>
            <div style="float:left;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-right:1-px;margin-top:10px;">
                <strong><a href="homesByDesignerPlans.cfm?Id=5" class="brownLink">TONY SOPER</a></strong>
                <br />
                <a href="homesByDesignerPlans.cfm?Id=5"><img src="/assets/designerImages/tonySoper.jpg" width="165" height="121" alt="Click to View Plans Designed By Tony Soper" style="padding-top:6px;padding-bottom:5px;" border="0" /></a>
            </div>
            <div style="float:right;width:165px;color:black;background-color:#caccbb;padding:7px;text-align:center;margin-top:10px;">
                <strong><a href="homesByDesignerPlans.cfm?Id=7" class="brownLink">OTHERS</a></strong>
                <br />
                <a href="homesByDesignerPlans.cfm?Id=7"><img src="/assets/designerImages/others.jpg" width="165" height="121" alt="Click to View Plans Designed By Others" style="padding-top:6px;padding-bottom:5px;" border="0" /></a>
            </div>
            <br clear="all" />
        </div>
    </cfmodule>
