<cfscript>
	if (NOT IsDefined("URL.deleteBPC")) {
		if (CGI.HTTP_HOST CONTAINS "CornerStone") {
			VARIABLES.pageTitle = "Delete a Builder Link - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
		}
		else {
			VARIABLES.pageTitle = "Delete a Builder Link - Site Management - Your Family Architect - Architects Northwest";		
		}
	}
	else {
		if (CGI.HTTP_HOST CONTAINS "CornerStone") {
			VARIABLES.pageTitle = "Builder Link Deleted Successfully - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
		}
		else {
			VARIABLES.pageTitle = "Builder Link Deleted Successfully - Site Management - Your Family Architect - Architects Northwest";		
		}
	}
</cfscript>

<cfif IsDefined("URL.Builder")>
	<cfscript>
        Session.BuilderId = URL.BuilderId;
    </cfscript>
</cfif>

<cfscript>
	VARIABLES.BuilderId = Session.BuilderId;
</cfscript>

<cfif VARIABLES.BuilderId EQ 0>
	<cflocation url="default.cfm">
</cfif>

<cfscript>
	VARIABLES.bi = Application.BuilderService.getById(VARIABLES.BuilderId);
	if (IsDefined("URL.deleteBC")) {
		VARIABLES.delBPC = Application.BuilderService.deleteById(VARIABLES.BuilderId);
		VARIABLES.bpciDelete = 1;
		VARIABLES.builders = Application.BuilderService.getAllBuildersSorted();
	}	
</cfscript>

<!--- Get Quick Search Business Logic --->
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainManagePlanImagesContainer">
            <h1 id="sm">Site Management</h1>
            <h2 id="sm">Confirm Builder Link Deletion</h2>
            
            <div class="smBreadcrumb">
                <a href="/default.cfm">Home</a> &gt; <a href="default.cfm">Site Management</a> &gt; Confirm Builder Link Deletion
            </div>
            
            <cfif IsDefined("VARIABLES.bpciDelete")>
                <div class="loadPlanSuccessMessage">
                    <strong>Builder link deleted successfully!</strong>
                </div>
                <cfform action="#CGI.SCRIPT_NAME#" method="get" name="up">
                    Delete another Builder <cfselect name="Builder" query="VARIABLES.builders" display="Builder" value="BuilderId" />
                    <cfinput type="submit" name="submit" value="Go!">
                </cfform>
            <cfelse>
            	<div class="smNormal">
					<cfoutput>Are you sure that you want to delete the link for <strong>#VARIABLES.bi.Builder#</strong></cfoutput>?
                    <br /><br />
                    <a href="deleteBuilderLink.cfm?deleteBC=1">Yes</a> | <a href="default.cfm">No</a>
                </div>
            </cfif>
        </div>
    </cfmodule>