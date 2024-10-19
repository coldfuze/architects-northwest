<cfscript>
	VARIABLES.PermissionLevelId = Session.PermissionLevelId;
	VARIABLES.LocationId = Session.LocationId;
	VARIABLES.AdminFName = Session.AdminFName;

	if (VARIABLES.PermissionLevelId EQ 1) {
		VARIABLES.ai = Application.AdminService.getAllUserInfo(1);
	}
	if (VARIABLES.PermissionLevelId EQ 2) {
		VARIABLES.ai = Application.AdminService.getAllUserInfo(2,VARIABLES.LocationId);
	}
</cfscript>

<cfmodule 
		template="#Application.CTPath#layout.cfm"
        title="User List - Site Management - Peak Sports and Spine Physical Therapy"
        description="Complete list of users who have access to Site Management or are listed as a therapist.">
        <div id="content">
        	<div id="threeColLeftCol">
            	<cfinclude template="../leftSideBar.cfm">
            </div>
        
        <div id="threeColCenterCol">
        	<h1 id="article">
            	User List
            </h1>
            
            <p id="breadCrumb">
            	<a class="breadCrumb" href="/default.cfm">Home</a> &gt; <a class="breadCrumb" href="default.cfm">Site Management</a> &gt; User List
            </p>
			
            <h2>Persons who have access to Site Management</h2>
			<cfoutput query="VARIABLES.ai.users" group="PermissionLevel">
            <cfif VARIABLES.ai.users.CurrentRow EQ 1><p class="toppage"><cfelse><p class="normal"></cfif>
                <h3 class="sm">#PermissionLevel#</h3>
                <ul type="disc">
                    <cfoutput><li class="user">#FName# #LName# - #LocationSName#<br />(<em><strong>Login:</strong></em> #Login#&nbsp;&nbsp;<em><strong>Password:</strong></em> #Password#&nbsp;&nbsp;<strong>EMail:</strong> #EMail#)</li></cfoutput>
                </ul>
            </p>
            </cfoutput>

            <h2>Persons who are listed as Therapists</h2>
            <cfoutput query="VARIABLES.ai.therapists" group="PermissionLevel">
            <cfif VARIABLES.ai.therapists.CurrentRow EQ 1><p class="toppage"><cfelse><p class="normal"></cfif>
                <h3 class="sm">#PermissionLevel#</h3>
                <ul type="disc">
                    <cfoutput><li class="user">#FName# #LName# - #LocationSName# (<strong>EMail:</strong> #EMail#)</li></cfoutput>
                </ul>
            </p>
            </cfoutput>
        </div>
        
        <div id="threeColRightCol">
        	<cfinclude template="../rightSideBar.cfm">
        </div>
       	
        <br class="clearfloat" />
    </div> 
</cfmodule>