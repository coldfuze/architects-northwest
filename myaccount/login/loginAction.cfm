<cflogin>
	<cfif IsDefined("Form.CustomerEMail")>
    <!--- Make sure that the E-mail Address is safe --->
    	<cfif NOT IsValid("email",Form.CustomerEMail)>
        	<cfabort>
        </cfif>
        
    <!--- Get Login Info --->
        <cfscript>
			// Get new testimonial info
			ai = Application.CustomerService.getCredentialsByEMail(Form.CustomerEMail);
		</cfscript>
        
    <!--- Go to the Login page if ther was no match --->
        <cfif ai.Valid EQ 0>
            <cfset Session.getCredentials=0>
        <cfelse>
        	<cfset Session.getCredentials=1>
            <cfset Session.EMail=Form.CustomerEMail>
        </cfif>
        
        <cfinclude template="UserLoginForm.cfm">
		<cfabort>
	<cfelseif NOT IsDefined("Form.EMail")>
		<cfinclude template="UserLoginForm.cfm">
		<cfabort>
	<cfelse>
		<cfscript>
			user = Application.CustomerService.validateUser(Form.EMail,Form.Password);
		</cfscript>
		<cfif user.IsUser EQ 1>
			<cfloginuser name="#user.Login#" password="#user.Password#" roles="#user.Role#">
			<cfscript>
                request.LoggedIn=1;
                Session.CustomerFName = user.FName;
                Session.CustomerId = user.CustomerId;
                Session.savedPlans = user.SavedPlans;
            </cfscript>
            <cfcookie name="CustomerFName" value="#user.FName#" expires="NEVER">
		<cfelse>
			<cfset request.LoginFailed=0>
			<cfinclude template="UserLoginForm.cfm">
			<cfabort>
		</cfif>
	</cfif>
</cflogin>