<cfscript>
	if (NOT IsDefined("URL.deleteBPC")) {
		if (CGI.HTTP_HOST CONTAINS "CornerStone") {
			VARIABLES.pageTitle = "Delete a Professional Association Link - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
		}
		else {
			VARIABLES.pageTitle = "Delete a Professional Association Link - Site Management - Your Family Architect - Architects Northwest";		
		}
	}
	else {
		if (CGI.HTTP_HOST CONTAINS "CornerStone") {
			VARIABLES.pageTitle = "Professional Association Link Deleted Successfully - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
		}
		else {
			VARIABLES.pageTitle = "Professional Association Link Deleted Successfully - Site Management - Your Family Architect - Architects Northwest";		
		}
	}
</cfscript>

<cfif IsDefined("URL.ProfessionalAssociationId")>
	<cfscript>
        Session.ProfessionalAssociationId = URL.ProfessionalAssociationId;
    </cfscript>
</cfif>

<cfscript>
	VARIABLES.ProfessionalAssociationId = Session.ProfessionalAssociationId;
</cfscript>

<cfif VARIABLES.ProfessionalAssociationId EQ 0>
	<cflocation url="default.cfm">
</cfif>

<cfscript>
	VARIABLES.pai = Application.ProfessionalAssociationService.getById(VARIABLES.ProfessionalAssociationId);
	if (IsDefined("URL.deletePA")) {
		VARIABLES.delPA = Application.ProfessionalAssociationService.deleteById(VARIABLES.ProfessionalAssociationId);
		VARIABLES.paDelete = 1;
		VARIABLES.professionalAssociations = Application.ProfessionalAssociationService.getProfessionalAssociationPicklist();
	}	
</cfscript>

<!--- Get Quick Search Business Logic --->
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainManagePlanImagesContainer">
            <h1 id="sm">Site Management</h1>
            <h2 id="sm">Confirm Professional Association Link Deletion</h2>
            
            <div class="smBreadcrumb">
                <a href="/default.cfm">Home</a> &gt; <a href="default.cfm">Site Management</a> &gt; Confirm Professional Association Link Deletion
            </div>
            
            <cfif IsDefined("VARIABLES.paDelete")>
                <div class="loadPlanSuccessMessage">
                    <strong>Professional Association link deleted successfully!</strong>
                </div>
                <cfform action="deleteProfessionalAssociationLink.cfm" method="get" name="up">
                    Delete another Professional Association <cfselect name="ProfessionalAssociationId" query="VARIABLES.professionalAssociations" display="ProfessionalAssociation" value="ProfessionalAssociationId" />
                    <cfinput type="submit" name="submit" value="Go!">
                </cfform>
            <cfelse>
            	<div class="smNormal">
					<cfoutput>Are you sure that you want to delete the link for <strong>#VARIABLES.pai.ProfessionalAssociation#</strong></cfoutput>?
                    <br /><br />
                    <a href="deleteProfessionalAssociationLink.cfm?deletePA=1">Yes</a> | <a href="default.cfm">No</a>
                </div>
            </cfif>
        </div>
    </cfmodule>