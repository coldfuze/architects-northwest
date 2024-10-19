<cfcomponent extends="CustomerGateway">
	<cffunction name="getCredentialsByEMail" returntype="query" hint="This method returns login credentials based on an e-mail address">
    	<cfargument name="email" type="string" hint="This is the e-mail address for the user" required="yes">
        
        <cfif IsValid("email",Arguments.EMail)>
            <cfquery name="getCredentials" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
                SELECT 	FName, Password, CustomerId, Login
                FROM 	dbo.Customer
                WHERE 	EMail = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#Arguments.EMail#">
            </cfquery>
        	
			<cfscript>
                if (getCredentials.recordCount NEQ 0) {
                    cred = QueryNew("Fname,Password,Valid","varchar,varchar,bit");
					newRow = QueryAddRow(cred,1);
                    newValue = QuerySetCell(cred, "fname", getCredentials.FName, 1);
                    newValue = QuerySetCell(cred, "Password", getCredentials.Password, 1);
                    newValue = QuerySetCell(cred, "Valid", "1", 1);
                }
                else {
                    cred = QueryNew("Fname,Password,Valid","varchar,varchar,bit");
					newRow = QueryAddRow(cred,1);
                    newValue = QuerySetCell(cred, "fname", "", 1);
                    newValue = QuerySetCell(cred, "Password", "", 1);
                    newValue = QuerySetCell(cred, "Valid", "0", 1);
                }
            </cfscript>
         <cfelse>
         	<cfscript>
				cred = QueryNew("Fname,Password,Valid","varchar,varchar,bit");
				newRow = QueryAddRow(cred,1);
				newValue = QuerySetCell(cred, "fname", "", 1);
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
         	<cfscript>
				VARIABLES.ma = {};
				VARIABLES.ma.to = ARGUMENTS.eMail;
				VARIABLES.ma.from = 'Architects Northwest/CornerStone Designs <info@architectsnw.com>';
				VARIABLES.ma.subject = 'Your Architects Northwest/CornerStone Designs Login Credentials';
			</cfscript>
             <cfmail attributeCollection="#VARIABLES.ma#" useSSL="false">
                <cfmailpart type="text">
                   #VARIABLES.Greeting# #getCredentials.FName#, #VARIABLES.lineBreak#
                   Your Password is #getCredentials.Password#.
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
                                        	Your password is <strong>#getCredentials.Password#</strong>.
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
    	<cfargument name="CustomerId" type="string" hint="This is the CustomerId for the user" required="yes">
        
        <cfquery name="getCredentials" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
            SELECT 	FName, Password, CustomerId, Login, Email
            FROM 	dbo.Customer
            WHERE 	CustomerId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#Arguments.CustomerId#">
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
         	<cfscript>
				VARIABLES.ma = {};
				VARIABLES.ma.to = getCredentials.eMail;
				VARIABLES.ma.from = 'Architects Northwest/CornerStone Designs <info@architectsnw.com>';
				VARIABLES.ma.subject = 'Your Architects Northwest/CornerStone Designs Login Credentials';
			</cfscript>
             <cfmail attributeCollection="#VARIABLES.ma#" useSSL="false">
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
		<cfargument name="Email" type="string" required="true">
		<cfargument name="Password" type="string" required="true">
        
        <cfquery name="qLogin" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
            SELECT 	*
            FROM 	Customer
            WHERE 	EMail = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.EMail#" maxlength="75"> 
                    AND Password = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.Password#" maxlength="15">
        </cfquery>
        
        <cfif qLogin.recordcount EQ 1>
            <cflock scope="session" type="exclusive" timeout="2">
            	<cfscript>
                	Session.CustomerFName = qLogin.FName;
                	Session.CustomerId = qLogin.CustomerId;
				</cfscript>
            </cflock>
            
            <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="ui">
                UPDATE 	Customer
                SET 	LastLogin = getDate()
                WHERE 	CustomerId = <cfqueryparam cfsqltype="cf_sql_integer" value="#qLogin.CustomerId#">
            </cfquery>
        </cfif>
		
		<cfscript>
			str = StructNew();
			str.Login = qLogin.EMail;
			str.IsUser = qLogin.Recordcount;
			str.CustomerId = qLogin.CustomerId;
			str.Role = 'general';
			str.FName = qLogin.FName;
			str.Password = qLogin.Password;
			str.SavedPlans = qLogin.SavedPlans;
		</cfscript>

		<cfreturn str>
	</cffunction>
    
    <cffunction name="addToSavedPlans" access="public" roles="general,admin" returntype="struct" hint="This method adds a plan to a customer's saved plans, if this plan has not already been saved">
    	<cfargument name="spi" type="struct" required="yes" hint="This argument expects a structure containing the customer's saved plans, the CustomerId, and the PlanId that they would like to add to their saved plans">
        
        <cfscript>
			VARIABLES.doesPlanExistInList = ListFind(ARGUMENTS.spi.SavedPlans,ARGUMENTS.spi.PlanId);
		</cfscript>
        
        <cfif VARIABLES.doesPlanExistInList EQ 0>
        	<cfscript>
				VARIABLES.newSavedPlanList = ListAppend(ARGUMENTS.spi.SavedPlans,ARGUMENTS.spi.PlanId);
			</cfscript>
            
			<cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="ui">
            	UPDATE 	Customer
                SET 	SavedPlans = <cfqueryparam cfsqltype="cf_sql_varchar" value="#VARIABLES.newSavedPlanList#">
                WHERE	CustomerId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.spi.CustomerId#">
            </cfquery>
            
            <cfscript>
				VARIABLES.pi = StructNew();
				VARIABLES.pi.SavedPlans = VARIABLES.newSavedPlanList;
				VARIABLES.pi.doesPlanExistInList = 0;
			</cfscript>
        <cfelse>
        	<cfscript>
				VARIABLES.pi = StructNew();
				VARIABLES.pi.doesPlanExistInList = 1;
			</cfscript>
        </cfif>
        
        <cfreturn VARIABLES.pi>
    </cffunction>
    
    <cffunction name="deleteSavedPlan" access="public" roles="general,admin" returntype="string" hint="This method deletes a saved plan for a customer">
    	<cfargument name="spi" type="struct" required="yes" hint="This argument expects a structure containing the customer's CustomerId, and the PlanId that they would like to delete from their saved plans">
        <cfscript>
			var spl = "";
			var sp = "";
			var delPlanPos = 0;
			var savedPlans = {};
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="sp">
            SELECT 	SavedPlans
            FROM 	Customer
            WHERE	CustomerId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.spi.CustomerId#">
        </cfquery>
        
        <cfscript>
			spl = ValueList(sp.SavedPlans);
			delPlanPos = ListFind(spl,ARGUMENTS.spi.PlanId);
			if (delPlanPos NEQ 0) {
				newSavedPlans = ListDeleteAt(spl,delPlanPos);
			}
			else {
				newSavedPlans = spl;	
			}
		</cfscript>
            
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="ui">
            UPDATE 	Customer
            SET 	SavedPlans = <cfqueryparam cfsqltype="cf_sql_varchar" value="#VARIABLES.newSavedPlans#">
            WHERE	CustomerId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.spi.CustomerId#">
        </cfquery>
        
        <cfreturn newSavedPlans>
    </cffunction>
     
    <cffunction name="getCustomerPicklist" access="public" returntype="query" hint="This method returns a query of Customers for use in a picklist" roles="admin">
    	<cfquery name="gi" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
            SELECT 	CustomerId, LName + ', ' + FName AS CustomerName
            FROM 	Customer
            ORDER BY LName, FName
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="verifyUniqueAccount" returntype="boolean" access="public" hint="This method checks to ensure that accounts are unique">
    	<cfargument name="ai" type="struct" required="yes" hint="This argument expects a structure of user data to compare against existing Customer information">
        
        <cfquery name="ui" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
            SELECT	CustomerId
			FROM	Customer
            WHERE	EMail = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.ai.EMail#">
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