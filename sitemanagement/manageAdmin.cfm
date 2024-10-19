<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Update Site Administrator Information/Manage Access - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Update Site Administrator Information/Manage Access - Site Management - Your Family Architect - Architects Northwest";		
	}
</cfscript>

<cfif IsDefined("Form.AdminId")>
	<cfif IsNumeric(Form.AdminId)>
        <cfset Session.ManagedAdminId = Form.AdminId>
    <cfelse>
       	<cfset Session.ManagedAdminId = 0>
    </cfif>
</cfif>

<cfscript>
	VARIABLES.ManagedAdminId = Session.ManagedAdminId;
	VARIABLES.AdminId = Session.AdminId;
</cfscript>

<cfif VARIABLES.ManagedAdminId EQ 0>
	<cflocation url="default.cfm">
</cfif>

<cfscript>
	if (IsDefined("Form.FName")) {
		// Check to make sure that this administrator does not already have an account
		ci = {};
		ci.FName = Form.FName;
		ci.LName = Form.LName;
		ci.EMail = Form.EMail;
		ci.AdminId = VARIABLES.ManagedAdminId;
		VARIABLES.uniqueAccount = Application.AdminService.verifyUniqueAccountForCurrentAdmin(ci);
		
		if (VARIABLES.uniqueAccount IS "True") {
			ai = CreateObject("component","com.cornerstonedesigns.Admin").init();
			ai.FName = Form.FName;
			ai.LName = Form.LName;
			ai.EMail = Form.EMail;
			ai.Login = Form.Login;
			ai.Password = Form.Password;
			ai.PermissionLevelId = Form.PermissionLevelId;
			ai.Role = 'admin';
			ai.Active = Form.Active;
			ai.AdminId = VARIABLES.ManagedAdminId;
			VARIABLES.updatedAdmin = Application.AdminService.save(ai);
			
		// Record Admin Activity
		aa = CreateObject("component","com.cornerstonedesigns.AdminActivity").init();
		aa.AdminId = VARIABLES.AdminId;
		aa.ImpactedAdminId = VARIABLES.ManagedAdminId;
		aa.ActivityDate = CreateODBCDateTime(Now());
		aa.TransactionId = 6;
		aa.PlanId=0;
		VARIABLES.adminActivity = Application.AdminActivityService.save(aa);
		}
	}
	
	// Get Site Administrator Information
	VARIABLES.sai = Application.AdminService.getById(VARIABLES.ManagedAdminId);
	
	// Get Permission Levels
	VARIABLES.PermissionLevels = Application.PermissionLevelService.getPicklist();
</cfscript>

<!--- Get Quick Search Business Logic --->
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainManagePlanImagesContainer">
            <h1 id="sm">Site Management</h1>
            <cfoutput><h2 id="sm">Update #VARIABLES.sai.FName# #VARIABLES.sai.LName#'s Information/Manage Access</h2></cfoutput>
            
            <div class="smBreadcrumb">
                <a href="/default.cfm">Home</a> &gt; <a href="default.cfm">Site Management</a> &gt; <cfoutput>Update #VARIABLES.sai.FName# #VARIABLES.sai.LName#'s Information/Manage Access</cfoutput>
            </div>
            
            <cfif IsDefined("VARIABLES.updatedAdmin")>
                <div class="loadPlanSuccessMessage">
                    <strong>Site Administrator information/access updated successfully!</strong>
                </div>
            <cfelseif IsDefined("VARIABLES.uniqueAccount")>
            	<div id="submitErrorMessage">
                	Administrator not added. An administrator with this first name, last name and e-mail address already exists.
                </div>
            </cfif>
              
            <div class="smNormal">
                <cfif Hour(Now()) LT 12>Good Morning<cfelseif Hour(Now()) GTE 12 AND Hour(Now()) LT 18>Good Afternoon<cfelse>Good Evening</cfif><cfif IsDefined("Cookie.AdminFName")><cfoutput> #Cookie.AdminFName# </cfoutput></cfif> and welcome back to the site management section of your web site. Update <cfoutput>#VARIABLES.sai.FName# #VARIABLES.sai.LName#'s</cfoutput> information/access by completing the information in the form below, then click the <strong>Update Site Administrator</strong> button.
                
                <cfform action="#CGI.SCRIPT_NAME#" name="abpc" method="post">
                    <table border="0" cellpadding=5 cellspacing=0 style="width:500px;margin-top:10px;">
                        <tr class="planMainRow">
                            <td>
                                First Name
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfinput name="FName" required="yes" validate="regular_expression" pattern="^[a-zA-Z\s]+$" maxlength=21 message="Please enter the administrator's first name - thanks!" type="text" value="#VARIABLES.sai.FName#" size="40" style="width:450px;">
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td>
                                Last Name
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfinput name="LName" required="yes" validate="regular_expression" pattern="^[a-zA-Z\s'-]+$" maxlength=21 message="Please enter the administrator's last name - thanks!" value="#VARIABLES.sai.LName#" type="text" size="40" style="width:450px;">
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td>
                                E-Mail Address
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfinput name="EMail" required="yes" maxlength="75" validate="email" message="Please enter the administrator's e-mail address - thanks" type="text" value="#VARIABLES.sai.EMail#" size="40" style="width:450px;">
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td>
                                Login
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfinput name="Login" required="yes" maxlength="12" validate="regular_expression" message="Please enter a login for the administrator with at least 6, but no more than 12 characters - thanks" pattern="\w{6,12}" type="text" value="#VARIABLES.sai.Login#" size="40" style="width:450px;">
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td>
                                Password
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfinput name="Password" required="yes" maxlength="12" validate="regular_expression" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).{8,12}$" message="Please enter an 8-12 character password with at least 1 uppercase letter, 1 lower case letter and 1 number" type="password" value="#VARIABLES.sai.Password#" size="40" style="width:450px;">
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td>
                                Permission Level
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfselect name="PermissionLevelId" query="VARIABLES.PermissionLevels" display="PermissionLevel" value="PermissionLevelId"  selected="#VARIABLES.sai.PermissionLevelId#" style="width:450px;" />
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td>
                                Is Active User/Can Access Site Management
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                               <cfif VARIABLES.sai.Active EQ 1>
                               	<cfinput type="radio" name="active" value="1" checked> Yes &nbsp;&nbsp;&nbsp;
                                <cfinput type="radio" name="active" value="0"> No
                               <cfelse>
                               	<cfinput type="radio" name="active" value="1"> Yes &nbsp;&nbsp;&nbsp;
                                <cfinput type="radio" name="active" value="0" checked> No
                               </cfif>
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td align="center">
                                <cfinput type="submit" name="ap" value="Update Site Administrator" style="width:400px;">
                            </td>
                        </tr>
                    </table>
                </cfform>
            </div>
        </div>
    </cfmodule>