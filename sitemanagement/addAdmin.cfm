<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Add a Site Administrator - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Add a Site Administrator - Site Management - Your Family Architect - Architects Northwest";		
	}

	VARIABLES.AdminId = Session.AdminId;

	if (IsDefined("Form.FName")) {
		// Check to make sure that this administrator does not already have an account
		ci = {};
		ci.FName = Form.FName;
		ci.LName = Form.LName;
		ci.EMail = Form.EMail;
		VARIABLES.uniqueAccount = Application.AdminService.verifyUniqueAccount(ci);
		
		if (VARIABLES.uniqueAccount IS "True") {
			ai = CreateObject("component","com.cornerstonedesigns.Admin").init();
			ai.FName = Form.FName;
			ai.LName = Form.LName;
			ai.EMail = Form.EMail;
			ai.Login = Form.Login;
			ai.Password = Form.Password;
			ai.PermissionLevelId = Form.PermissionLevelId;
			ai.Role = 'admin';
			ai.Active = 1;
			VARIABLES.newAdmin = Application.AdminService.save(ai);
			
			// Record Admin Activity
			aa = CreateObject("component","com.cornerstonedesigns.AdminActivity").init();
			aa.AdminId = VARIABLES.AdminId;
			aa.ImpactedAdminId = VARIABLES.newAdmin.AdminId;
			aa.ActivityDate = CreateODBCDateTime(Now());
			aa.TransactionId = 5;
			aa.PlanId=0;
			VARIABLES.adminActivity = Application.AdminActivityService.save(aa);
		}
	}
	
	// Get Permission Levels
	VARIABLES.PermissionLevels = Application.PermissionLevelService.getPicklist();
</cfscript>

    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainManagePlanImagesContainer">
            <h1 id="sm">Site Management</h1>
            <h2 id="sm">Add a Site Administrator</h2>
            
            <div class="smBreadcrumb">
                <a href="/default.cfm">Home</a> &gt; <a href="default.cfm">Site Management</a> &gt; Add a Site Administrator
            </div>
            
            <cfif IsDefined("VARIABLES.newAdmin")>
                <div class="loadPlanSuccessMessage">
                    <strong>New Site Administrator added successfully!</strong>
                </div>
            <cfelseif IsDefined("VARIABLES.uniqueAccount")>
            	<div id="submitErrorMessage">
                	Administrator not added. An administrator with this first name, last name and e-mail address already exists.
                </div>
            </cfif>
              
            <div class="smNormal">
                <cfif Hour(Now()) LT 12>Good Morning<cfelseif Hour(Now()) GTE 12 AND Hour(Now()) LT 18>Good Afternoon<cfelse>Good Evening</cfif><cfif IsDefined("Cookie.AdminFName")><cfoutput> #Cookie.AdminFName# </cfoutput></cfif> and welcome back to the site management section of your web site. Add a new site administrator by completing the information in the form below, then click the <strong>Add Site Administrator</strong> button.
                
                <cfform action="#CGI.SCRIPT_NAME#" name="abpc" method="post">
                    <table border="0" cellpadding=5 cellspacing=0 style="width:500px;margin-top:10px;">
                        <tr class="planMainRow">
                            <td>
                                First Name
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfinput name="FName" required="yes" validate="regular_expression" pattern="^[a-zA-Z\s]+$" maxlength=21 message="Please enter the administrator's first name - thanks!" type="text" size="40" style="width:450px;">
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td>
                                Last Name
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfinput name="LName" required="yes" validate="regular_expression" pattern="^[a-zA-Z\s'-]+$" maxlength=21 message="Please enter the administrator's last name - thanks!" type="text" size="40" style="width:450px;">
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td>
                                E-Mail Address
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfinput name="EMail" required="yes" maxlength="75" validate="email" message="Please enter the administrator's e-mail address - thanks" type="text" value="" size="40" style="width:450px;">
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td>
                                Login <span style="font-size:10px;font-weight:normal;">(6-12 characters)</span>
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfinput name="Login" required="yes" maxlength="12" validate="regular_expression" message="Please enter a login for the administrator with at least 6, but no more than 12 characters - thanks" pattern="\w{6,12}" type="text" value="" size="40" style="width:450px;">
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td>
                                Password <span style="font-size:10px;font-weight:normal;">(8-12 characters with at least 1 uppercase letter, 1 lower case letter &amp; 1 number)</span>
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfinput name="Password" required="yes" maxlength="12" validate="regular_expression" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).{8,12}$" message="Please enter an 8-12 character password with at least 1 uppercase letter, 1 lower case letter and 1 number" type="password" value="" size="40" style="width:450px;">
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td>
                                Permission Level
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfselect name="PermissionLevelId" query="VARIABLES.PermissionLevels" display="PermissionLevel" value="PermissionLevelId" style="width:450px;" />
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td align="center">
                                <cfinput type="submit" name="ap" value="Add Site Administrator" style="width:400px;">
                            </td>
                        </tr>
                    </table>
                </cfform>
            </div>
        </div>
    </cfmodule>