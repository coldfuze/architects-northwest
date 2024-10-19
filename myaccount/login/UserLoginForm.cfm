<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../../CommonScripts.cfm">

<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Verify Access - My Account - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Verify Access - My Account - Architects Northwest";		
	}
	
	// Architectural Style Links
	VARIABLES.ArchitecturalStyleLinks = Application.PlanSearchService.getSideBarLinks(1);
	
	// Popular Search Links
	VARIABLES.PopularSearchLinks = Application.PlanSearchService.getSideBarLinks(2);

	// Popular Search Links
	VARIABLES.HousePlanCollectionLinks = Application.PlanSearchService.getSideBarLinks(3);
</cfscript>

<!--- Get Quick Search Business Logic --->
	<cfinclude template="../../includes/quickSearchBusinessLogic.cfm">
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#" recentlyViewedPlans="#VARIABLES.RecentlyViewedPlans#">
        <div id="copyrightMainContainer">            
            <div style="position:absolute;top:0px;left:10px;height:1225px;width:164px;padding:10px 10px 10px 10px;line-height:17px;font-size:12px;background-color:#caccbb;text-align:left;margin-bottom:10px;">
            	<cfoutput>#VARIABLES.PopularSearchLinks#</cfoutput>
                <cfoutput>#VARIABLES.ArchitecturalStyleLinks#</cfoutput>
                <cfoutput>#VARIABLES.HousePlanCollectionLinks#</cfoutput>
            </div>
            
            <div id="copyrightContainer">
            	<div id="titleBar">
                	MY ACCOUNT - VERIFY ACCESS
                </div>
                
                <cfif IsDefined("Form.Login")>
                    <div id="submitErrorMessage">
                        The E-Mail Address and Password combination that you entered does not match our records. Please re-enter your User Id and Password again - thanks! If you have forgotten your password, <a href="#getlc">click here</a> to have them sent to you.
                    </div>
                </cfif>
                
                <cfif IsDefined("Form.CustomerEMail")>
                    <cfif Session.getCredentials EQ 0>
                        <div id="submitErrorMessage">
                            Sorry - Your e-mail address did not match one in our database. Please re-enter your e-mail address, or contact 
                            our Corporate Offices to obtain you login credentials.
                        </div>
                    <cfelse>
                        <div id="submitSuccessMessage">
                            Your log-in information has been sent successfully to <cfoutput>#Form.CustomerEMail#</cfoutput>. Once you have received your information,
                            you can once again attempt to log-in.
                        </div>
                    </cfif>
                </cfif>
				
                <cfif IsDefined("Cookie.CustomerFName")>
                <div style="text-align:left;">
					<cfif Hour(Now()) LT 12>Good Morning<cfelseif Hour(Now()) GTE 12 AND Hour(Now()) LT 18>Good Afternoon<cfelse>Good Evening</cfif><cfif IsDefined("Cookie.CustomerFName")><cfoutput> #Cookie.CustomerFName# </cfoutput></cfif> and welcome back to your section of our web site.
               	</div>
                <cfelse>
                <div style="text-align:left;">
                	Welcome to your section of our web site, where you can view your saved plans.
                </div>
                
                <div style="text-align:left;margin-top:20px;">
					If you have been here before and created an account with us, please login.
                </div>
                <div style="text-align:left;margin-top:20px;">
                    If not, to get started, you will need to <a href="/createAccount/" class="planSpec">create an account with us</a>. All that we will ask for is your First Name, Last Name, and E-mail Address. Rest assured that we will do everything that we can to ensure that your information is protected and never shared with any third-parties. 
                </div>
                <div style="text-align:left;margin-top:20px;">
                	Once you have created your account and logged-in, you will be able build and view your list of saved plans.
                </div>
                </cfif>
                
                <div style="margin-top:20px;">  
                 	<strong>Login to Your Account</strong>
                </div>
                
                <div class="contactUsFormField">
                <cfform action="#CGI.SCRIPT_NAME#" method="post" name="va">
                    E-Mail Address: <cfinput type="text" name="EMail" size=15 maxlength="75" style="width:200px;" required="yes" validate="email" message="Please enter your E-Mail Address">&nbsp;&nbsp;
                    Password: <cfinput type="password" size=10 name="password" maxlength="12" required="yes" validate="regular_expression" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).{8,12}$" message="Please enter your Password.">
                    <input type="submit" value="Go!">
                </cfform>
                </div>
                
                <div style="margin-top:50px;text-align:left;">
                <a name="getlc"><strong>Get Your Password</strong><br /></a>
                If you have forgotten your password, please complete the form below to have your password sent to you.
                </div>
                
                <div class="contactUsFormField">
                    <cfform action="#CGI.SCRIPT_NAME#" method="post" name="getLoginInfo">
                         E-mail Address: <cfinput size=50 maxlength="75" type="text" name="CustomerEMail" required="yes" validate="email" message="Please enter a valid e-mail address in the E-mail field" style="width:200px;"> <cfinput type="submit" value="Go!" name="submit">
                    </cfform>
                </div>
            </div>
            
            <cfinclude template="../../assets/includes/commonRightSideBar.cfm">
        </div>
    </cfmodule>