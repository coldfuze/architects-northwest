<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Verify Access - Site Management - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Verify Access - Site Management - Architects Northwest";		
	}
</cfscript>

<!--- Get Quick Search Business Logic --->
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainVerifyAccessContainer">                        
            <div id="siteManagementContainer">
            	<div style="position:relative;text-align:left;">
                	<h1 id="sm">Site Management</h1>
                    <h2 id="sm">Verify Access</h2>
                    
                    <div class="smBreadcrumb">
                    	<a href="/default.cfm">Home</a> &gt; Site Management &gt; Verify Access
                    </div>
                    
                	<cfif IsDefined("Form.Login")>
                        <div class="smError">
                            The User Id and Password combination that you entered does not match our records, or you are not an active user. Please re-enter your User Id and Password again - thanks! If you have forgotten your login credentials, <a href="#getlc">click here</a> to have them sent to you.
                        </div>
                    </cfif>
                    
                    <cfif IsDefined("Form.AdminEMail")>
						<cfif Session.getCredentials EQ 0>
                            <div class="smError">
                                Sorry - Your e-mail address did not match one in our database. Please re-enter your e-mail address, or contact 
                                our Corporate Offices to obtain you login credentials.
                            </div>
                        <cfelse>
                            <div class="successMessage">
                                Your log-in information has been sent successfully to <cfoutput>#Form.AdminEMail#</cfoutput>. Once you have received your information,
                                you can once again attempt to log-in.
                            </div>
                        </cfif>
                    </cfif>
                    
                    <div class="smNormal">
                    	<cfif Hour(Now()) LT 12>Good Morning<cfelseif Hour(Now()) GTE 12 AND Hour(Now()) LT 18>Good Afternoon<cfelse>Good Evening</cfif><cfif IsDefined("Cookie.AdminFName")><cfoutput> #Cookie.AdminFName# </cfoutput></cfif> and welcome back to the site management section of your web site. Please enter your
                    	login and password, then click the <strong>Go!</strong> button to continue.
                        
                        <cfform action="#CGI.SCRIPT_NAME#" method="post" name="va" style="margin-top:20px;margin-bottom:50px;">
                            <strong>Login:</strong> <cfinput type="text" name="Login" size=10 maxlength="15" required="yes" validate="maxlength" message="Please enter your Login">&nbsp;&nbsp;
                            <strong>Password:</strong> <cfinput type="password" size=10 name="password"  maxlength="15" validate="maxlength" message="Please enter your Password.">
                            <input type="submit" value="Go!">
                        </cfform>
                        
                        <a name="getlc"><strong>Get Your Login Credentials</strong><br /></a>
                    	If you have forgotten your user name or password, please complete the form below to have your login credentials sent to you.
                        
                        <cfform action="#CGI.SCRIPT_NAME#" method="post" name="info" style="margin-top:20px;width:500px;padding-bottom:20px;">
                             <strong>E-mail</strong>: <cfinput size=50 type="text" name="AdminEmail" required="yes" validate="email" message="Please enter a valid e-mail address in the E-mail field"> <cfinput type="submit" value="Go!" name="submit">
                        </cfform>
                    </div>
                </div>
            </div>
        </div>
    </cfmodule>