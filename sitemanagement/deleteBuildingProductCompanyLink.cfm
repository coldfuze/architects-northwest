<cfscript>
	if (NOT IsDefined("URL.deleteBPC")) {
		if (CGI.HTTP_HOST CONTAINS "CornerStone") {
			VARIABLES.pageTitle = "Delete a Building Product Company Link - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
		}
		else {
			VARIABLES.pageTitle = "Delete a Building Product Company Link - Site Management - Your Family Architect - Architects Northwest";		
		}
	}
	else {
		if (CGI.HTTP_HOST CONTAINS "CornerStone") {
			VARIABLES.pageTitle = "Building Product Company Link Deleted Successfully - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
		}
		else {
			VARIABLES.pageTitle = "Building Product Company Link Deleted Successfully - Site Management - Your Family Architect - Architects Northwest";		
		}
	}
</cfscript>

<cfif IsDefined("URL.BuildingProductCompanyId")>
	<cfscript>
        Session.BuildingProductCompanyId = URL.BuildingProductCompanyId;
    </cfscript>
</cfif>

<cfscript>
	VARIABLES.BuildingProductCompanyId = Session.BuildingProductCompanyId;
</cfscript>

<cfif VARIABLES.BuildingProductCompanyId EQ 0>
	<cflocation url="default.cfm">
</cfif>

<cfscript>
	VARIABLES.bpci = Application.BuildingProductCompanyService.getById(VARIABLES.BuildingProductCompanyId);
	if (IsDefined("URL.deleteBPC")) {
		VARIABLES.delBPC = Application.BuildingProductCompanyService.deleteById(VARIABLES.BuildingProductCompanyId);
		VARIABLES.bpciDelete = 1;
		VARIABLES.buildingProductCompanies = Application.BuildingProductCompanyService.getBuildingProductCompanyPicklist();
	}	
</cfscript>

<!--- Get Quick Search Business Logic --->
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainManagePlanImagesContainer">
            <h1 id="sm">Site Management</h1>
            <h2 id="sm">Confirm Building Product Company Link Deletion</h2>
            
            <div class="smBreadcrumb">
                <a href="/default.cfm">Home</a> &gt; <a href="default.cfm">Site Management</a> &gt; Confirm Building Product Company Link Deletion
            </div>
            
            <cfif IsDefined("VARIABLES.bpciDelete")>
                <div class="loadPlanSuccessMessage">
                    <strong>Building product company link deleted successfully!</strong>
                </div>
                <cfform action="#CGI.SCRIPT_NAME#" method="get" name="up">
                    Delete another Building Product Company <cfselect name="BuildingProductCompanyId" query="VARIABLES.buildingProductCompanies" display="BuildingProductCompany" value="BuildingProductCompanyId" />
                    <cfinput type="submit" name="submit" value="Go!">
                </cfform>
            <cfelse>
            	<div class="smNormal">
					<cfoutput>Are you sure that you want to delete the link for <strong>#VARIABLES.bpci.BuildingProductCompany#</strong></cfoutput>?
                    <br /><br />
                    <a href="deleteBuildingProductCompanyLink.cfm?deleteBPC=1">Yes</a> | <a href="default.cfm">No</a>
                </div>
            </cfif>
        </div>
    </cfmodule>