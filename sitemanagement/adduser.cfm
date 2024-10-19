<cfscript>
	VARIABLES.PermissionLevelId = Session.PermissionLevelId;
	VARIABLES.LocationId = Session.LocationId;
	VARIABLES.AdminFName = Session.AdminFName;
</cfscript>

<cfif VARIABLES.PermissionLevelId GT 2>
	<cflocation url="default.cfm">
</cfif>

<cfscript>
	Cffp = CreateObject("component","cfformprotect.cffpVerify").init();
	if (VARIABLES.PermissionLevelId NEQ 1) {
		VARIABLES.li = Application.LocationService.getLocalPicklistSorted(VARIABLES.LocationId);
	}
	else {
		VARIABLES.li = Application.LocationService.getLocalPicklistSorted();	
	}
	VARIABLES.pli = Application.PermissionLevelService.getPickList();
</cfscript>

<cfif IsDefined("Form.FName")>
	<cfif Cffp.testSubmission(form)>
		<cfinclude template="generatePassword.cfm">
        <cfscript>
			VARIABLES.Password = generatePassword(8);
			ci = StructNew();
			ci.FName = Form.FName;
			ci.LName = Form.LName;
			ci.EMail = Form.EMail;
			uniqueAccount = Application.AdminService.verifyUniqueAccount(ci);

			if (uniqueAccount IS "true") {
				ui = CreateObject("component","com.peaksportsandspinept.Admin").init();
				ui.FName = Form.FName;
				ui.LName = Form.LName;
				ui.EMail = Form.EMail;
				ui.LocationId = Form.LocationId;
				ui.PermissionLevelId = Form.PermissionLevelId;
				ui.isTherapist = Form.isTherapist;
				ui.IsActive = 1;
				ui.Login = Form.Login;
				ui.Password = VARIABLES.Password;
			
				newUser = Application.AdminService.save(ui);
				if (newuser.PermissionLevelId LT 4) {
					sendCredentials = Application.AdminService.getCredentialsById(newUser.AdminId);	
				}
			}
			else {
				VARIABLES.duplicateAccount = 1;	
			}
		</cfscript>
	</cfif>
</cfif>

<cfscript>
	if (VARIABLES.PermissionLevelId EQ 1) {
		VARIABLES.ai = Application.AdminService.getAllUserInfo(1);
	}
	if (VARIABLES.PermissionLevelId EQ 2) {
		VARIABLES.ai = Application.AdminService.getAllUserInfo(2,VARIABLES.LocationId);
	}
</cfscript>

<cfmodule 
		template="#Application.CTPath#layout.cfm"
        title="Add User - Site Management - Peak Sports and Spine Physical Therapy"
        description="This form provides the ability to add a user as a Therapist, or as one who has access to Site Management.">
        <div id="content">
        	<div id="threeColLeftCol">
            	<cfinclude template="../leftSideBar.cfm">
            </div>
        
        <div id="threeColCenterCol">
        	<h1 id="article">
            	Add User
            </h1>
            
            <p id="breadCrumb">
            	<a class="breadCrumb" href="/default.cfm">Home</a> &gt; <a class="breadCrumb" href="default.cfm">Site Management</a> &gt; Add User
            </p>
            
            <cfif IsDefined("newUser")>
            	<p class="successMessage">
                	You have successfully added user <cfoutput>#newUser.FName# #newUser.LName#</cfoutput>
                </p>
            </cfif>
			
            <cfif IsDefined("duplicateAccount")>
            	<div class="errorMessage">
                	New user not added. Another account with the First Name, Last Name and E-Mail Address that you submitted already exists.
                </div>
            </cfif>
            
            <cfform action="#CGI.SCRIPT_NAME#" method="post" name="info" id="info" style="padding:10px;border-bottom:thin solid ##999;">
            	<cfinclude template="/cfformprotect/cffp.cfm">
                
                <div class="smFormLeft">
                	First Name
                </div>
                
                <div class="smFormRight">
                	<cfinput size=30 type="text" name="FName" class="required" required="yes" maxlength=21 message="Please enter your first name - thanks!" validateAt="onSubmit">
                </div>
                
                <br class="clearfloat" />
                
                <div class="smFormLeft">
                	Last Name
                </div>
                
                <div class="smFormRight">
                	<cfinput size=30 type="text" name="LName" class="required" required="yes" maxlength=22 message="Please enter your last name - thanks!" validateAt="onSubmit">
                </div>
                
                <br class="clearfloat" />
                
                <div class="smFormLeft">
                	E-mail
                </div>
                
                <div class="smFormRight">
                	<cfinput size=30 required="yes" name="email" validate="email" message="Please enter your e-mail address" type="text"class="required" validateAt="onSubmit">
                </div>
                
                <br class="clearfloat" />
                
                <div class="smFormLeft">
                	Login Id<br /><span style="font-size:10px;color:#09F;">(6-10 characters)</span>
                </div>
                
                <div class="smFormRight">
                	<cfinput size=30 required="yes" name="login"  maxlength="10" validate="regular_expression" pattern="^.*(?=.{6,10})(?=.*\w).*$" message="Please enter a new login with 6-10 characters" type="text" class="required" validateAt="onSubmit,onBlur">
                </div>
                
                <br class="clearfloat" />
                
                <div class="smFormLeft">
                	Location
                </div>
                
                <div class="smFormRight">
                	<cfselect name="LocationId" query="VARIABLES.li" display="LocationSName" value="LocationId" />
                </div>
                
                <br class="clearfloat" />
                
                <div class="smFormLeft">
                	Is the person a therapist?
                </div>
                
                <div class="smFormRight">
                	<cfinput name="IsTherapist" value=1 type="radio" checked>Yes &nbsp;&nbsp; <cfinput name="IsTherapist" value=0 type="radio">No
                </div>
                
                <br class="clearfloat" />
                
                <div class="smFormLeft">
                	Permission Level
                </div>
                
                <div class="smFormRight">
                	<cfselect name="PermissionLevelId" query="VARIABLES.pli" display="PermissionLevel" value="PermissionLevelId" />
                </div>
                
                <br class="clearfloat" />
                
                <p class="normal">
                	<cfinput type="image" src="/assets/images/btn_AddUser.gif" alt="Add User" name="submit">
                </p>
            </cfform>
        </div>
        
        <div id="threeColRightCol">
        	<cfinclude template="../rightSideBar.cfm">
        </div>
       	
        <br class="clearfloat" />
    </div> 
</cfmodule>