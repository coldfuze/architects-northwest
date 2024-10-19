<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<!--- Convert Session to Local Variables --->
	<cfscript>
        VARIABLES.CustomerId = Session.CustomerId;
    </cfscript>
 
 <!--- Update the customer's account information, if applicable --->   
<cfscript>
	// Initialize CFFormProtect
	Cffp = CreateObject("component","cfformprotect.cffpVerify").init();

	// Update the account, if applicable
	if (IsDefined("Form.FName")) {
		// Disable Updating Account information until the form content has passed validation 
		VARIABLES.updateAccount = 0;
		VARIABLES.uniqueAccount = 'true';
		
		if (Cffp.testSubmission(Form)) {
			
			if (IsValid("regular_expression",Form.FName,"^[a-zA-Z\s]+$")) {
				VARIABLES.FName = Form.FName;
				VARIABLES.ValidFName = 1;
			}
			else {
				VARIABLES.ValidFName = 0;
			}
			
			if (IsValid("regular_expression",Form.LName,"^[a-zA-Z\s'-]+$")) {
				VARIABLES.LName = Form.LName;
				VARIABLES.ValidLName = 1;
			}
			else {
				VARIABLES.ValidLName = 0;
			}
			
			if (IsValid("email",Form.EMail)) {
				VARIABLES.EMail = Form.EMail;
				VARIABLES.ValidEMail = 1;
			}
			else {
				VARIABLES.ValidEMail = 0;
			}
			
			if (CGI.HTTP_HOST CONTAINS "architects") {
				VARIABLES.WebSite = "Architects Northwest";	
			}
			else {
				VARIABLES.WebSite = "CornerStone Designs";	
			}	
			
			// Get current information for the customer
			VARIABLES.thisCustomer = Application.CustomerService.getById(VARIABLES.CustomerId);
			
			if (VARIABLES.thisCustomer.FName NEQ Form.FName OR VARIABLES.thisCustomer.LName NEQ Form.LName OR VARIABLES.thisCustomer.EMail NEQ Form.EMail) {
				ti = StructNew();
				ti.FName = VARIABLES.FName;
				ti.LName = VARIABLES.LName;
				ti.EMail = VARIABLES.EMail;
				VARIABLES.UniqueAccount = Application.CustomerService.verifyUniqueAccount(ti);
			}
			
			if (VARIABLES.ValidLName EQ 1 AND VARIABLES.ValidFName EQ 1 AND VARIABLES.ValidEMail EQ 1) {
				VARIABLES.updateAccount = 1;
			}
		}
		
		if (VARIABLES.updateAccount EQ 1) {
			// Store information in the database
			ai = CreateObject("component","com.cornerstonedesigns.Customer").init();
			ai.FName = VARIABLES.FName;
			ai.LName = VARIABLES.LName;
			ai.EMail = VARIABLES.EMail;
			ai.Password = Form.Password;
			ai.CustomerId = VARIABLES.CustomerId;
			updatedCustomer = Application.CustomerService.save(ai);
		}
	}
	
	// Get page titles
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Update Account - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Update Account - Your Family Architect - Architects Northwest";		
	}
	
	// Architectural Style Links
	VARIABLES.ArchitecturalStyleLinks = Application.PlanSearchService.getSideBarLinks(1);
	
	// Popular Search Links
	VARIABLES.PopularSearchLinks = Application.PlanSearchService.getSideBarLinks(2);
	
	// Popular Search Links
	VARIABLES.HousePlanCollectionLinks = Application.PlanSearchService.getSideBarLinks(3);
	
	// Get Customer Information
	VARIABLES.thisCustomer = Application.CustomerService.getById(VARIABLES.CustomerId);
</cfscript>

<!--- Get Quick Search Business Logic --->
	<cfinclude template="../includes/quickSearchBusinessLogic.cfm">
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#" recentlyviewedplans="#VARIABLES.RecentlyViewedPlans#">
        <div id="copyrightMainContainer">            
            <div style="position:absolute;top:0px;left:10px;height:1225px;width:164px;padding:10px 10px 10px 10px;line-height:17px;font-size:12px;background-color:#caccbb;text-align:left;margin-bottom:10px;">
            	<cfoutput>#VARIABLES.PopularSearchLinks#</cfoutput>
                <cfoutput>#VARIABLES.ArchitecturalStyleLinks#</cfoutput>
                <cfoutput>#VARIABLES.HousePlanCollectionLinks#</cfoutput>
            </div>
            
            <div id="copyrightContainer">
            	<div id="titleBar">
                	UPDATE ACCOUNT
                </div>

                
                <cfif IsDefined("updatedCustomer")>
                    <div id="submitNoteMessage">
                        Account Information Updated Successfully! You can add to your saved plans by clicking the <strong>Add to My Saved Plans</strong> button 
                        on any plan page. You can view your saved plans by clicking the <strong>My Saved Plans</strong> link located un <em>My Account</em> on the top menu bar.
                    </div>
                <cfelseif IsDefined("VARIABLES.UniqueAccount")>
                	<cfif VARIABLES.UniqueAccount IS "false">
                    	<div id="submitErrorMessage">
                            An account with the e-mail address that you provided already exists. <a href="/myAccount/default.cfm#getlc" style="white-space:nowrap;">Click here to retrieve your login credentials</a>.
                        </div>
                    </cfif>
                </cfif>
                
                <cfform action="#CGI.SCRIPT_NAME#" name="irf" method="post" style="margin:0;white-space:nowrap;">
                <cfinclude template="/cfformprotect/cffp.cfm">
                
                <div class="contactUsFormField">
                	<div class="heading">
                		First Name: <span style="color:red;">*</span>
                	</div>
                	<div class="field">
                		<cfinput size=15 type="text" name="FName" value="#VARIABLES.thisCustomer.FName#" class="required" required="yes" validate="regular_expression" pattern="^[a-zA-Z\s]+$" maxlength=21 message="Please enter your first name - thanks!" style="width:260px;" validateat="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		Last Name: <span style="color:red;">*</span> 
                	</div>
                	<div class="field">
                		<cfinput size=15 type="text" name="LName" value="#VARIABLES.thisCustomer.LName#" class="required" required="yes" validate="regular_expression" pattern="^[a-zA-Z\s'-]+$" maxlength=21 message="Please enter your last name - thanks!" style="width:260px;" validateat="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		EMail Address: <span style="color:red;">*</span> 
                	</div>
                	<div class="field">
                		<cfinput size=15 type="text" name="EMail" value="#VARIABLES.thisCustomer.EMail#" class="required" required="yes" validate="email" maxlength="75" message="Please enter a valid e-mail address - thanks!" style="width:260px;" validateat="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		Password: <span style="color:red;">*</span>
                        <div style="font-weight:normal;font-size:11px;width:100px;">8-12 characters,<br />with at least 1 uppercase letter,<br /> 1 lowercase letter and 1 number</div>
                	</div>
                	<div class="field">
                		<cfinput size=15 type="password" value="#VARIABLES.thisCustomer.Password#" name="Password" class="required" required="yes" validate="regular_expression" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).{8,12}$" maxlength="12" message="Please enter an 8-12 character password with at least 1 uppercase letter, 1 lower case letter and 1 number - thanks!" style="width:260px;" validateat="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">&nbsp;</div>
                	<div class="field">
                		<cfinput type="submit" name="submit" value="Update Account" style="font-weight:bold;margin-top:0px;width:260px;">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                </cfform>
            </div>
            
            <cfinclude template="../assets/includes/commonRightSideBar.cfm">
        </div>
    </cfmodule>