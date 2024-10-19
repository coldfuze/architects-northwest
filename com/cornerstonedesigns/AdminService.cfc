<cfcomponent extends="AdminGateway">
	<cffunction name="getCredentialsByEMail" returntype="query" hint="This method returns login credentials based on an e-mail address">
    	<cfargument name="email" type="string" hint="This is the e-mail address for the user" required="yes">
        
        <cfif IsValid("email",Arguments.EMail)>
            <cfquery name="getCredentials" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
                SELECT 	FName, Password, AdminId, Login
                FROM 	dbo.Admin
                WHERE 	EMail = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#Arguments.EMail#">
            </cfquery>
        	
			<cfscript>
                if (getCredentials.recordCount NEQ 0) {
                    cred = QueryNew("Fname,Login,Password,Valid","varchar,varchar,varchar,bit");
					newRow = QueryAddRow(cred,1);
                    newValue = QuerySetCell(cred, "fname", getCredentials.FName, 1);
                    newValue = QuerySetCell(cred, "Login", getCredentials.Login, 1);
                    newValue = QuerySetCell(cred, "Password", getCredentials.Password, 1);
                    newValue = QuerySetCell(cred, "Valid", "1", 1);
                }
                else {
                    cred = QueryNew("Fname,Login,Password,Valid","varchar,varchar,varchar,bit");
					newRow = QueryAddRow(cred,1);
                    newValue = QuerySetCell(cred, "fname", "", 1);
                    newValue = QuerySetCell(cred, "Login", "", 1);
                    newValue = QuerySetCell(cred, "Password", "", 1);
                    newValue = QuerySetCell(cred, "Valid", "0", 1);
                }
            </cfscript>
         <cfelse>
         	<cfscript>
				cred = QueryNew("Fname,Login,Password,Valid","varchar,varchar,varchar,bit");
				newRow = QueryAddRow(cred,1);
				newValue = QuerySetCell(cred, "fname", "", 1);
				newValue = QuerySetCell(cred, "Login", "", 1);
				newValue = QuerySetCell(cred, "Password", "", 1);
				newValue = QuerySetCell(cred, "Valid", "0", 1);
			</cfscript>
         </cfif>
         
         <cfscript>
		 	if (Hour(Now()) LT 12) {
				VARIABLES.Greeting = 'Good Morning';
			}
			if (Hour(Now()) GTE 12 AND Hour(Now()) LTE 18) {
				VARIABLES.Greeting = 'Good Afternoon';
			}
			if (Hour(Now()) GTE 18) {
				VARIABLES.Greeting = 'Good Evening';
			}
			VARIABLES.lineBreak = Chr(13) & Chr(10);
			VARIABLES.BannerImage = Application.BasePath & '/assets/images/mailBanner.jpg';
		 </cfscript>
         
         <cfif getCredentials.recordCount GT 0>
             <cfmail from="Architects Northwest/CornerStone Designs <info@architectsnw.com>" to="#ARGUMENTS.eMail#" subject="Your Architects Northwest/CornerStone Designs Login Credentials">
                <cfmailpart type="text">
                   #VARIABLES.Greeting# #getCredentials.FName#, #VARIABLES.lineBreak#
                   Your User Id is #getCredentials.Login# and your Password is #getCredentials.Password#.
                </cfmailpart>
                <cfmailpart type="html">
                    <html>
                        <head></head>
                        <body style="background-color:##4a584b;margin:0;padding:0;font-family:verdana,arial,sans-serif;">
                            <table align="center" border=0 cellpadding=0 cellspacing=0 style="background-color:white;width:600px;">
                                <tr>
                                    <td style="text-align:left;height:450px;background-color:white;font-family:verdana,arial,sans-serif;font-size:12px;" valign="top">
                                        <a href="http://www.architectsnw.com"><img src="#VARIABLES.BannerImage#" width="600" height="89" alt="Architects Northwest/CornerStone Designs" border=0></a>
                                        <p style="margin-left:20px;margin-top:20px;margin-right:20px;">
                                            #VARIABLES.Greeting# #getCredentials.FName#,
                                        </p>
                                        <p style="margin-left:20px;margin-top:20px;margin-right:20px;font-family:verdana,arial,sans-serif;font-size:12px;">
                                        	Your Login is <strong>#getCredentials.Login#</strong> and your Password is <strong>#getCredentials.Password#</strong>.
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="color:white;font-weight:bold;text-align:left;padding:10px;font-size:10px;background-color:##818f82;font-family:verdana,arial,sans-serif;font-size:10px;">
                                        Click for: <a style="color:white;" href="http://www.architectsnwdev.com/">Home Page</a> | <a style="color:white;" href="http://www.architectsnwdev.com/plans/">Plans</a> | <a style="color:white;" href="http://www.architectsnwdev.com/sitemanagement/">Site Management</a>
                                    </td>
                                </tr>
                            </table>
                        </body>
                    </html>
                </cfmailpart>
             </cfmail>
         </cfif>
          
         <cfreturn cred>
    </cffunction>
    
    <cffunction name="getCredentialsById" returntype="query" hint="This method returns login credentials based on an e-mail address">
    	<cfargument name="AdminId" type="string" hint="This is the AdminId for the user" required="yes">
        
        <cfquery name="getCredentials" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
            SELECT 	FName, Password, AdminId, Login, Email
            FROM 	dbo.Admin
            WHERE 	AdminId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#Arguments.AdminId#">
        </cfquery>
        
        <cfscript>
            if (getCredentials.recordCount NEQ 0) {
                cred = QueryNew("Fname,Login,Password,Valid","varchar,varchar,varchar,bit");
                newRow = QueryAddRow(cred,1);
                newValue = QuerySetCell(cred, "fname", getCredentials.FName, 1);
                newValue = QuerySetCell(cred, "Login", getCredentials.Login, 1);
                newValue = QuerySetCell(cred, "Password", getCredentials.Password, 1);
                newValue = QuerySetCell(cred, "Valid", "1", 1);
            }
            else {
                cred = QueryNew("Fname,Login,Password,Valid","varchar,varchar,varchar,bit");
                newRow = QueryAddRow(cred,1);
                newValue = QuerySetCell(cred, "fname", "", 1);
                newValue = QuerySetCell(cred, "Login", "", 1);
                newValue = QuerySetCell(cred, "Password", "", 1);
                newValue = QuerySetCell(cred, "Valid", "0", 1);
            }
        </cfscript>
         
         <cfscript>
		 	if (Hour(Now()) LT 12) {
				VARIABLES.Greeting = 'Good Morning';
			}
			if (Hour(Now()) GTE 12 AND Hour(Now()) LTE 18) {
				VARIABLES.Greeting = 'Good Afternoon';
			}
			if (Hour(Now()) GTE 18) {
				VARIABLES.Greeting = 'Good Evening';
			}
			VARIABLES.lineBreak = Chr(13) & Chr(10);
			VARIABLES.BannerImage = Application.BasePath & '/assets/images/mailBanner.jpg';
		 </cfscript>
         
         <cfif getCredentials.recordCount GT 0>
             <cfmail from="Architects Northwest/CornerStone Designs <info@architectsnw.com>" to="#getCredentials.eMail#" subject="Your Architects Northwest/CornerStone Designs Login Credentials" server="scriptmail.intermedia.net">
                <cfmailpart type="text">
                   #VARIABLES.Greeting# #getCredentials.FName#, #VARIABLES.lineBreak#
                   Your User Id is #getCredentials.Login# and your Password is #getCredentials.Password#.
                </cfmailpart>
                <cfmailpart type="html">
                    <html>
                        <head></head>
                        <body style="background-color:##4D658C;margin:0;padding:0;font-family:verdana,arial,sans-serif;">
                            <table align="center" border=0 cellpadding=0 cellspacing=0 style="background-color:white;width:600px;">
                                <tr>
                                    <td style="text-align:left;height:450px;background-color:white;font-family:verdana,arial,sans-serif;font-size:12px;" valign="top">
                                        <a href="http://www.architectsnw.com"><img src="#VARIABLES.BannerImage#" width="600" height="91" alt="Architects Northwest/CornerStone Designs" border=0></a>
                                        <p style="margin-left:20px;margin-top:20px;margin-right:20px;">
                                            #VARIABLES.Greeting# #getCredentials.FName#,
                                        </p>
                                        <p style="margin-left:20px;margin-top:20px;margin-right:20px;font-family:verdana,arial,sans-serif;font-size:12px;">
                                        	Your Login is <strong>#getCredentials.Login#</strong> and your Password is <strong>#getCredentials.Password#</strong>.
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="color:white;font-weight:bold;text-align:left;padding:10px;font-size:10px;background-color:##f57603;font-family:verdana,arial,sans-serif;font-size:10px;">
                                        Click for: <a style="color:white;" href="http://www.architectsnw.com/">Home Page</a> | <a style="color:white;" href="http://www.architectsnw.com/locations/">Locations</a> | <a style="color:white;" href="http://www.architectsnw.com/services/">Services</a>
                                    </td>
                                </tr>
                            </table>
                        </body>
                    </html>
                </cfmailpart>
             </cfmail>
         </cfif>
          
         <cfreturn cred>
    </cffunction>
    
    <cffunction name="validateUser" returntype="Struct" hint="This will validate the user and return the user credentials" access="public">
		<cfargument name="Login" type="string" required="true">
		<cfargument name="Password" type="string" required="true">
        
        <cfquery name="qLogin" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
            SELECT 	*
            FROM 	Admin
            WHERE 	Login = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.Login#" maxlength="15"> 
                    AND Password = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.Password#" maxlength="15">
                    AND Active = 1
        </cfquery>
        
        <cfif qLogin.recordcount EQ 1>
            <cflock scope="session" type="exclusive" timeout="2">
            	<cfscript>
                	Session.AdminFName = qLogin.FName;
                	Session.AdminId = qLogin.AdminId;
				</cfscript>
            </cflock>
            
            <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="ui">
                UPDATE Admin
                SET LastLogin = getDate()
                WHERE AdminId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#qLogin.AdminId#" maxlength="1">
            </cfquery>
        </cfif>
		
		<cfscript>
			str = StructNew();
			str.Login			= qLogin.Login;
			str.IsUser			= qLogin.Recordcount;
			str.AdminId			= qLogin.AdminId;
			if (qLogin.PermissionLevelId LTE 3) {
				str.Role = 'admin';
			}
			else {
				str.Role = 'general';
			}
			str.PermissionLevelId = qLogin.PermissionLevelId;
			str.FName 			= qLogin.FName;
			str.Password		= qLogin.Password;
		</cfscript>

		<cfreturn str>
	</cffunction>
    
    <cffunction name="getAdminPicklist" access="public" returntype="query" hint="This method returns a query of admins for use in a picklist">
    	<cfquery name="gi" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
            SELECT 	AdminId, LName + ', ' + FName AS AdminName
            FROM 	Admin
            ORDER BY LName, FName
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="getAllAdmins" access="public" returntype="query" hint="This method returns a query of all of the persons who have (or have had) Site Management access.">
    	<cfargument name="PermissionLevelId" required="no" type="numeric" default="2">
        <cfargument name="LocationId" required="no" type="numeric" default="0">
        
        <!--- Get all users --->
    	<cfquery name="ui" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
            SELECT	Admin.FName,
					Admin.LName,
                    Admin.EMail,
                    Admin.Login,
                    Admin.Password,
                    Admin.IsActive
			FROM	Admin
			ORDER BY Admin.LName, Admin.FName
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="verifyUniqueAccount" roles="admin" returntype="boolean" access="public" hint="This method checks to ensure that accounts are unique">
    	<cfargument name="ai" type="struct" required="yes" hint="This argument expects a structure of user data to compare against existing admin information">
        
        <cfquery name="ui" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
            SELECT	AdminId
			FROM	Admin
            WHERE	FName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.ai.FName#">
            		AND LName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.ai.LName#">
                    AND EMail = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.ai.EMail#">
        </cfquery>
        
        <cfscript>
			if (ui.recordCount GT 0) {
				uniqueAccount = "false";
			}
			else {
				uniqueAccount = "true";
			}
		</cfscript>
        
        <cfreturn uniqueAccount>
    </cffunction>
    
    <cffunction name="verifyUniqueAccountForCurrentAdmin" roles="admin" returntype="boolean" access="public" hint="This method checks to ensure that accounts are unique">
    	<cfargument name="ai" type="struct" required="yes" hint="This argument expects a structure of user data to compare against existing admin information">
        
        <cfquery name="ui" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
            SELECT	AdminId
			FROM	Admin
            WHERE	FName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.ai.FName#">
            		AND LName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.ai.LName#">
                    AND EMail = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.ai.EMail#">
            AND		AdminId != <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.ai.AdminId#">
        </cfquery>
        
        <cfscript>
			if (ui.recordCount GT 0) {
				uniqueAccount = "false";
			}
			else {
				uniqueAccount = "true";
			}
		</cfscript>
        
        <cfreturn uniqueAccount>
    </cffunction>
</cfcomponent>