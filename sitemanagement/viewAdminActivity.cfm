<cfsetting enablecfoutputonly="no" requesttimeout="1000">

<cfif IsDefined("URL.AdminViewedId")>
	<cfif IsNumeric(URL.AdminViewedId)>
		<cfscript>
            Session.AdminViewedId = URL.AdminViewedId;
        </cfscript>
    <cfelse>
		<cfscript>
            Session.AdminViewedId = 0;
        </cfscript>
    </cfif>
</cfif>

<cfscript>
	VARIABLES.AdminViewedId = Session.AdminViewedId;

	// Get Information for this informaiton request
	VARIABLES.AdminActivity = Application.AdminActivityService.getAllActivity(VARIABLES.AdminViewedId);
	if (VARIABLES.AdminViewedId NEQ 0) {
		VARIABLES.Admin = Application.AdminService.getById(VARIABLES.AdminViewedId);
		VARIABLES.Subject = 'Site Management Activity for ' & VARIABLES.Admin.FName & ' ' & VARIABLES.Admin.LName;
	}
	else {
		VARIABLES.Subject = 'Site Management Activity';
	}
	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = VARIABLES.Subject & " - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = VARIABLES.Subject & " - Site Management - Your Family Architect - Architects Northwest";		
	}
	VARIABLES.administrators = Application.AdminService.getAdminPicklist();
</cfscript>

    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainManagePlanImagesContainer">
            <h1 id="sm">Site Management</h1>
            <h2 id="sm"><cfoutput>#VARIABLES.Subject#</cfoutput></h2>
            
            <div class="smBreadcrumb">
                <a href="/default.cfm">Home</a> &gt; <a href="default.cfm">Site Management</a> &gt; <cfoutput>#VARIABLES.Subject#</cfoutput>
            </div>
            
            <div class="successMessage">
                <cfform action="viewAdminActivity.cfm" method="get" name="up">
                    View Site Administration Activity for 
                    <cfselect name="AdminViewedId" query="VARIABLES.administrators" display="AdminName" queryPosition="below" selected="#VARIABLES.AdminViewedId#" value="AdminId" onChange="this.form.submit();">
                        <option value="0">All Administrators</option>
                    </cfselect>
                </cfform>
            </div>
            
            <cfif VARIABLES.AdminActivity.recordCount GT 0>
            <div class="smNormal">
            	<cfform style="margin-top:20px;" name="acf">
                    <cfgrid format="html" query="VARIABLES.AdminActivity" striperows="yes" autowidth="yes" width="800px;" highlighthref="yes" appendkey="no" pagesize="10" selectmode="single" name="acfg">
                        <cfgridcolumn name="AdminName" header="Name">
                        <cfgridcolumn name="TransactionTitle" header="Transaction">
                        <cfgridcolumn name="PlanNumber" header="Plan Number">
                        <cfgridcolumn name="PlanTitle" header="Plan Title"> 
                        <cfgridcolumn name="ImpactedAdmin" header="Applicable Admin"> 
                        <cfgridcolumn name="ActivityDate" header="Date"> 
                    </cfgrid>
                </cfform>
            </div>
            <cfelse>
            <div class="smError">
            	There is no activity recorded for <cfoutput>#VARIABLES.Admin.FName# #VARIABLES.Admin.LName#</cfoutput>.
            </div>
            </cfif>
        </div>
    </cfmodule>