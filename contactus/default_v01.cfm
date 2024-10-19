<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<cfscript>	
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

<cflock scope="session" type="readonly" timeout="2">
	<cfscript>
		VARIABLES.InfoRequestTypeId = Session.InfoRequestTypeId;
		VARIABLES.FName = Session.FName;
		VARIABLES.LName = Session.LName;
		VARIABLES.Phone = Session.Phone;
		VARIABLES.EMail = Session.EMail;
		VARIABLES.Address = Session.Address;
		VARIABLES.Address2 = Session.Address2;
		VARIABLES.City = Session.City;
		VARIABLES.StateId = Session.StateId;
		VARIABLES.ZipCode = Session.ZipCode;
		VARIABLES.FName = Session.EMail;
		VARIABLES.Comments = Session.Comments;
	</cfscript>
</cflock>

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
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#" recentlyViewedPlans="#VARIABLES.RecentlyViewedPlans#">
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
                
                <cfform scriptsrc="/assets/js/cfform.js" action="#CGI.SCRIPT_NAME#" name="irf" method="post" style="margin:0;white-space:nowrap;">
                <div class="contactUsFormField">
                	<div class="heading">
                		Type of Information Request: 
                	</div>
                	<div class="field">
                		<cfselect name="InfoRequestId" query="VARIABLES.InfoRequestType" selected="#VARIABLES.InfoRequestTypeId#" display="InfoRequestType" value="InfoRequestTypeId" style="width:260px;" />
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		First Name: <span style="color:red;">*</span>
                	</div>
                	<div class="field">
                		<cfinput size=15 type="text" name="FName" value="#VARIABLES.FName#" class="required" required="yes" validate="regular_expression" pattern="^[a-zA-Z\s]+$" maxlength=21 message="Please enter your first name - thanks!" style="width:260px;" validateAt="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		Last Name: <span style="color:red;">*</span> 
                	</div>
                	<div class="field">
                		<cfinput size=15 type="text" name="LName" value="#VARIABLES.LName#" class="required" required="yes" validate="regular_expression" pattern="^[a-zA-Z\s'-]+$" maxlength=21 message="Please enter your last name - thanks!" style="width:260px;" validateAt="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		Mailing Address: 
                	</div>
                	<div class="field">
                		<cfinput size=15 type="text" name="Address" value="#VARIABLES.Address#" class="required" required="no" validate="regular_expression" pattern="^[a-zA-Z\s]+$" maxlength=21 message="Please enter your address - thanks!" style="width:260px;" validateAt="onSubmit">
                        <br />
                        <cfinput size=15 type="text" name="Address" value="#VARIABLES.Address2#" class="required" required="no" validate="regular_expression" pattern="^[a-zA-Z\s]+$" maxlength=21 message="Please enter your additional address informaiton in this field, or leave it blank - thanks!" style="width:260px;" validateAt="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		City: 
                	</div>
                	<div class="field">
                		<cfinput size=15 type="text" name="City" value="#VARIABLES.City#" class="required" required="no" validate="regular_expression" pattern="^[a-zA-Z\s]+$" maxlength=21 message="Please enter your address - thanks!" style="width:260px;" validateAt="onSubmit">
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
                		<cfinput size=15 type="text" name="City" value="#VARIABLES.ZipCode#" class="required" required="no" validate="regular_expression" pattern="^\d{5}-\d{4}|\d{5}|[A-Z]\d[A-Z] \d[A-Z]\d$" maxlength=21 message="Please enter your zip code, or leave this field blank - thanks!" style="width:260px;" validateAt="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		EMail Address: <span style="color:red;">*</span> 
                	</div>
                	<div class="field">
                		<cfinput size=15 type="text" name="EMail" value="#VARIABLES.EMail#" class="required" required="yes" validate="email" maxlength=21 message="Please enter a valid e-mail address - thanks!" style="width:260px;" validateAt="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		Phone Number: 
                	</div>
                	<div class="field">
                		<cfinput size=15 type="text" name="Phone" value="#VARIABLES.Phone#" class="required" required="no" validate="telephone" mask="(999) 999-9999" maxlength=21 message="Please enter your phone number, or leave this field blank - thanks!" style="width:260px;" validateAt="onSubmit">
                	</div>
                	<div class="clearFloat"></div>
                </div>
                
                <div class="contactUsFormField">
                	<div class="heading">
                		Message: 
                	</div>
                	<div class="field">
                		<cftextarea name="Comments" value="#VARIABLES.Comments#" wrap="virtual" rows="5" cols="40" style="width:260px;" onKeyDown="textCounter(this.form.Comments,this.form.counter,255);" onKeyUp="textCounter(this.form.Comments,this.form.counter,255);" />
                        <br />
                        <cfinput type="text" name="counter" maxlength="3" size="2" value="255" style="width:25px;border:none;background-color:##e6ebe7;" readonly>characters remaining
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