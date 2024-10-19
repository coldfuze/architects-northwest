<cflogin>
	<cfif IsDefined("Form.AdminEMail")>
    <!--- Make sure that the E-mail Address is safe --->
    	<cfif NOT IsValid("email",Form.AdminEMail)>
        	<cfabort>
        </cfif>
        
    <!--- Get Login Info --->
        <cfscript>
			// Get new testimonial info
			ai = Application.AdminService.getCredentialsByEMail(Form.AdminEMail);
		</cfscript>
        
    <!--- Go to the retrievelogininfoform.cfm page if ther was no match --->
        <cfif ai.Valid EQ 0>
            <cfset Session.getCredentials=0>
        <cfelse>
        	<cfset Session.getCredentials=1>
            <cfset Session.EMail=Form.AdminEMail>
        </cfif>
        
        <cfinclude template="UserLoginForm.cfm">
		<cfabort>
	<cfelseif NOT IsDefined("Form.Login")>
		<cfinclude template="UserLoginForm.cfm">
		<cfdump var="#session#"> and <cfoutput> IsUserLoggedIn(): #IsUserLoggedIn()#</cfoutput> 
		<cfabort>
	<cfelse>
		<cfscript>
			user = Application.AdminService.validateUser(Form.Login,Form.Password);
		</cfscript>
		<cfif user.IsUser EQ 1>
			<cfloginuser name="#user.Login#" password="#user.Password#" roles="#user.Role#">
            <cflock scope="session" type="exclusive" timeout="2">
				<cfscript>
                    request.LoggedIn=1;
                    Session.AdminFName = user.FName;
                    Session.PermissionLevelId = user.PermissionLevelId;
                </cfscript>
            </cflock>
            <cfscript>
        		// Record Admin Activity
				aa = CreateObject("component","com.cornerstonedesigns.AdminActivity").init();
				aa.AdminId = user.AdminId;
				aa.ImpactedAdminId = user.AdminId;
				aa.ActivityDate = CreateODBCDateTime(Now());
				aa.TransactionId = 1;
				aa.PlanId=0;
				VARIABLES.adminActivity = Application.AdminActivityService.save(aa);  
			</cfscript> 
            <cfcookie name="AdminFName" value="#user.FName#" expires="NEVER">
		<cfelse>
			<cfset request.LoginFailed=0>
			<cfinclude template="UserLoginForm.cfm">
			<cfabort>
		</cfif>
	</cfif>
</cflogin>