<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<cftry>
<cfscript>
	// Initialize CFFormProtect
	Cffp = CreateObject("component","cfformprotect.cffpVerify").init();

	// Send the information request message, if applicable
	
	if (IsDefined("Form.FName")) {
		// Disable sending a message until the form content has passed validation 
		VARIABLES.sendMessage = 0;
		
		if (Cffp.testSubmission(Form)) {
			VARIABLES.ValidZipCode = 0;
			
			if (IsNumeric(Form.InfoRequestTypeId)) {
				VARIABLES.InfoRequestTypeId = Form.InfoRequestTypeId;
				VARIABLES.ValidInfoRequestType = 1;
			}
			else {
				VARIABLES.ValidInfoRequestType = 0;
			}
			
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
			
			if (LEN(TRIM(Form.Address)) GT 0) {
				if (IsValid("regular_expression",Form.Address,"^[a-zA-Z0-9\s'-]+$")) {
					VARIABLES.Address = Form.Address;
					VARIABLES.ValidAddress = 1;
				}
				else {
					VARIABLES.Address = "";
				}
			}
			else {
				VARIABLES.Address = "";	
			}
			
			if (LEN(TRIM(Form.Address2)) GT 0) {
				if (IsValid("regular_expression",Form.Address2,"^[a-zA-Z0-9\s'-]+$")) {
					VARIABLES.Address2 = Form.Address2;
				}
				else {
					VARIABLES.Address2 = "";
				}
			}
			else {
				VARIABLES.Address2 = "";	
			}
	
			if (IsValid("regular_expression",Form.City,"^[a-zA-Z\s'-]+$")) {
				VARIABLES.City = Form.City;
			}
			else {
				VARIABLES.City = "";
			}
			
			if (IsValid("regular_expression",Form.StateId,"^[A-Z]+$")) {
				VARIABLES.StateId = Form.StateId;
			}
			else {
				VARIABLES.StateId = "";
			}
			
			if (IsValid("zipcode",Form.ZipCode)) {
				if (Form.ZipCode EQ "123456") {
					VARIABLES.ZipCode = "";
				}
				else {
					VARIABLES.ZipCode = Form.ZipCode;
					VARIABLES.ValidZipCode = 1;
				}
			}
			else {
				if (LEN(Form.ZipCode) EQ 0) {
					VARIABLES.ZipCode = "";
					VARIABLES.ValidZipCode = 1;
				}
			}
			
			if (IsValid("email",Form.EMail)) {
				VARIABLES.EMail = Form.EMail;
				VARIABLES.ValidEMail = 1;
			}
			else {
				VARIABLES.ValidEMail = 0;
			}
			
			if (IsValid("telephone",Form.phone)) {
				VARIABLES.Phone = Form.phone;
			}
			else {
				VARIABLES.Phone = "";
			}
			
			if (isValid('regex',Form.PlanNameNumber,'^[A-Za-z0-9 -]{0,35}$')) {
				VARIABLES.PlanNameNumber = Form.PlanNameNumber;
				VARIABLES.validPlanNameNumber = 1;	
			}
			else {
				VARIABLES.validPlanNameNumber = 0;	
				VARIABLES.PlanNameNumber = 'Plan not identified';
			}
			
			if (CGI.HTTP_HOST CONTAINS "architects") {
				VARIABLES.WebSite = "Architects Northwest";	
			}
			else {
				VARIABLES.WebSite = "CornerStone Designs";	
			}	
			
			if (VARIABLES.ValidInfoRequestType EQ 1 AND VARIABLES.ValidLName EQ 1 AND VARIABLES.ValidFName EQ 1 AND VARIABLES.ValidEMail EQ 1 AND VARIABLES.ValidZipCode EQ 1 AND VARIABLES.validPlanNameNumber EQ 1) {
				VARIABLES.sendMessage = 1;
			}
		}
		else {
			VARIABLES.PotentialSPAM = 1;
		}	
		
		if (VARIABLES.sendMessage EQ 1) {
			// Store information in the database
			mi = CreateObject("component","com.cornerstonedesigns.InfoRequest").init();
			mi.FName = VARIABLES.FName;
			mi.LName = VARIABLES.LName;
			mi.Address = VARIABLES.Address;
			mi.Address2 = VARIABLES.Address2;
			mi.City = VARIABLES.City;
			mi.StateId = VARIABLES.StateId;
			mi.ZipCode = VARIABLES.ZipCode;
			mi.InfoRequestTypeId = VARIABLES.InfoRequestTypeId;
			mi.EMail = VARIABLES.EMail;
			mi.Phone = VARIABLES.Phone;
			mi.PlanNameNumber = VARIABLES.PlanNameNumber;
			mi.Comments = HTMLEditFormat(Form.Comments);
			mi.RequestDate = Now();
			mi.WebSite = VARIABLES.WebSite;
			newMessage = Application.InfoRequestService.save(mi);
			
			// Send the info request to Architects Northwest
			nmi = StructNew();
			nmi.FName = Form.FName;
			nmi.LName = Form.LName;
			nmi.Address = Form.Address;
			nmi.Address2 = Form.Address2;
			nmi.City = Form.City;
			nmi.StateId = Form.StateId;
			nmi.ZipCode = Form.ZipCode;
			nmi.InfoRequestTypeId = Form.InfoRequestTypeId;
			nmi.EMail = Form.EMail;
			nmi.Phone = Form.Phone;
			nmi.PlanNameNumber = VARIABLES.PlanNameNumber;
			nmi.Comments = HTMLEditFormat(Form.Comments);
			nmi.WebSite = VARIABLES.WebSite;
			sendNewMessage = Application.MailService.sendInformationRequestMessage(nmi);
		}
	}
	
	// Get page titles
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Contact Us - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Contact Us - Your Family Architect - Architects Northwest";		
	}
	
	// Architectural Style Links
	VARIABLES.ArchitecturalStyleLinks = Application.PlanSearchService.getSideBarLinks(1);
	
	// Popular Search Links
	VARIABLES.PopularSearchLinks = Application.PlanSearchService.getSideBarLinks(2);
	
	// Popular Search Links
	VARIABLES.HousePlanCollectionLinks = Application.PlanSearchService.getSideBarLinks(3);
	
	// Get info request types
	VARIABLES.InfoRequestType = Application.InfoRequestTypeService.getAllAsQuery();
	
	// Get states
	VARIABLES.State = Application.StateService.getAllAsQuery();
</cfscript>
<cfcatch>
	<cfscript>
		writedump(cfcatch);
		abort;
	</cfscript>
</cfcatch>
</cftry>

<cfscript>
	VARIABLES.StateId = Session.StateId;
</cfscript>

<cfsavecontent variable="head">
	<script language="javascript1.2" type="text/javascript">
    <!-- Begin
        function textCounter(field, countfield, maxlimit) {
            if (field.value.length > maxlimit) // if too long...trim it!
            field.value = field.value.substring(0, maxlimit);
            // otherwise, update 'characters left' counter
            else 
            countfield.value = maxlimit - field.value.length;
        }
    // End -->
    </script>
</cfsavecontent>

<cfhtmlhead text="#head#">

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
                	CONTACT US
                </div>
                
                <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                    CornerStone Designs<br />
                    18915 142ND Avenue N.E. Suite 100<br />
                    Woodinville, WA  98072<br />
                    Phone Number:  1.888.884.9488<br />
                    Fax Number:  1.425.487.6585 
                <cfelse>
                	Architects Northwest<br />
                    18915 142ND Avenue N.E. Suite 100<br />
                    Woodinville, WA  98072<br />
                    Phone Number:  1.888.272.4100<br />
                    Fax Number:  1.425.487.6585 
                </cfif>
                
                <cfif IsDefined("sendNewMessage")>
                	<cfif sendNewMessage EQ 1>
                        <div id="submitSuccessMessage">
                            Message sent successfully!
                        </div>
                	</cfif>
                <cfelseif IsDefined("VARIABLES.PotentialSPAM")>
					<div id="submitErrorMessage">
                        There was trouble submitting your information request. Please contact us directly at the phone number listed above.
                    </div>
                </cfif>
                <div style="margin-top:20px;">
                	<a href="/aboutUs/MapAndDirections.cfm" class="planSpec">Select here for Map &amp; Directions</a>
                </div>
                
                <div style="margin-top:20px;">
                	<div style="float:left;padding-top:10px;padding-right:5px;">
                	Follow Us On:
                    </div>
                    <div style="float:left;white-space:nowrap;">
                    	<a href="http://www.facebook.com/ArchitectsNW?v=info" target="_blank"><img src="/assets/images/btn_Facebook.gif" width="33" height="32" alt="Click to view our Facebook page" border="0"  /></a>
                        <a href="http://twitter.com/ArchitectsNW" target="_blank"><img src="../assets/images/btn_Twitter.gif" width="32" height="32" alt="Click to view our Twitter page" border="0" /></a>
                        <a href="http://www.youtube.com/user/ArchitectsNW?feature=mhum#p/a" target="_blank"><img src="../assets/images/btn_YouTube.gif" width="32" height="32" alt="Click to view our YouTube page" border="0" /></a>
                    </div>
                    <div class="clearFloat"></div>
                </div>
                
                <div style="margin-top:20px;">
                	Thank you for your interest in <cfif CGI.HTTP_HOST CONTAINS "CornerStone">CornerStone Designs<cfelse>Architects Northwest</cfif>.  As you fill in your information below, fields with an asterisk (<span style="color:red;">*</span>) are required. 
                </div>
					
				<div id="adBlockerNote" style="margin:20px 0;">
					<strong>NOTE:</strong> If you experience any issues with completing and sending us your information request and are using ad blocking software, please temporarily disable that software, then try sending us your information request again.	
				</div>
                
                <cfform action="#CGI.SCRIPT_NAME#" name="irf" method="post" style="margin:0;white-space:nowrap;">
                <cfinclude template="/cfformprotect/cffp.cfm">
                <div class="contactUsFormField">
                	<div class="heading">
                		Type of Information Request: 
                	</div>
                	<div class="field">
                		<cfselect name="InfoRequestTypeId" query="VARIABLES.InfoRequestType" display="InfoRequestType" value="InfoRequestTypeId" style="width:260px;" />
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		First Name: <span style="color:red;">*</span>
                	</div>
                	<div class="field">
                		<cfinput size=15 type="text" name="FName" class="required" required="yes" validate="regular_expression" pattern="^[a-zA-Z\s]+$" maxlength=21 message="Please enter your first name - thanks!" style="width:260px;" validateat="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		Last Name: <span style="color:red;">*</span> 
                	</div>
                	<div class="field">
                		<cfinput size=15 type="text" name="LName" class="required" required="yes" validate="regular_expression" pattern="^[a-zA-Z\s'-]+$" maxlength=21 message="Please enter your last name - thanks!" style="width:260px;" validateat="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		Mailing Address:
                	</div>
                	<div class="field">
                		<cfinput size=15 type="text" name="Address" required="no" validate="regular_expression" pattern="^[a-zA-Z0-9\s'-]+$" maxlength=50 message="Please enter your mailing address or leave the first mailing address field blank - thanks!" style="width:260px;" validateat="onSubmit">
                        <br />
                        <cfinput size=15 type="text" name="Address2" required="no" validate="regular_expression" pattern="^[a-zA-Z0-9\s'-]+$" maxlength=50 message="Please enter your mailing address or leave the 2nd mailing address field blank - thanks!" style="width:260px;" validateat="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		City:
                	</div>
                	<div class="field">
                		<cfinput size=15 type="text" name="City" required="no" validate="regular_expression" pattern="^[a-zA-Z\s'-]+$" maxlength="21" message="Please enter your city - thanks!" style="width:260px;" validateat="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		State/Province: 
                	</div>
                	<div class="field">
                		<cfselect name="StateId" query="VARIABLES.State" selected="#VARIABLES.StateId#" display="State" value="StateId" style="width:260px;" />
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		Zip or Postal Code: 
                	</div>
                	<div class="field">
                		<cfinput size=15 type="text" name="ZipCode" class="required" required="no" validate="regular_expression" pattern="^\d{5}-\d{4}|\d{5}|[A-Z]\d[A-Z] \d[A-Z]\d$" maxlength="12" message="Please enter your zip code, or leave this field blank - thanks!" style="width:260px;" validateat="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		EMail Address: <span style="color:red;">*</span> 
                	</div>
                	<div class="field">
                		<cfinput size=15 type="text" name="EMail" class="required" required="yes" validate="email" maxlength="75" message="Please enter a valid e-mail address - thanks!" style="width:260px;" validateat="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		Phone Number: 
                	</div>
                	<div class="field">
                		<cfinput size=15 type="text" name="Phone" class="required" required="no" validate="telephone" mask="(999) 999-9999" maxlength=21 message="Please enter your phone number, or leave this field blank - thanks!" style="width:260px;" validateat="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>

                <div class="contactUsFormField">
                	<div class="heading">
                		Plan Name or Number: 
                	</div>
                	<div class="field">
                		<cfinput size=15 type="text" name="PlanNameNumber" class="required" required="no" validate="regex" pattern="^[A-Za-z0-9 -]{0,35}$" maxlength=35 message="Please enter a plan number or title (up to 35 letters, numbers, spaces and dashes are allowed), or leave this field blank - thanks!" style="width:260px;" validateat="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		Message: 
                	</div>
                	<div class="field">
                		<cftextarea name="Comments" wrap="virtual" rows="5" cols="40" style="width:260px;" onKeyDown="textCounter(this.form.Comments,this.form.counter,999);" onKeyUp="textCounter(this.form.Comments,this.form.counter,999);" />
                        <br />
                        <cfinput type="text" name="counter" maxlength="3" size="2" value="999" style="width:25px;border:none;background-color:##e6ebe7;" readonly>characters remaining
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">&nbsp;</div>
                	<div class="field">
                		<cfinput type="submit" name="submit" value="Submit Information Request " style="font-weight:bold;margin-top:0px;width:260px;">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                </cfform>
            </div>
            
            <cfinclude template="../assets/includes/commonRightSideBar.cfm">
        </div>
    </cfmodule>