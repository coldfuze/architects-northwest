        <cfscript>			
			variables.ma = {};
			variables.ma.to = 'leon@odanieldesigns.com';
			variables.ma.from = "mailprocessor@architectsnw.com";
			variables.ma.subject = "Your Architects Northwest/CornerStone Designs Login Credentials";
			variables.ma.server = "architectsnw-com.mail.protection.outlook.com";
			variables.ma.username = "mailprocessor@architectsnw.com";
			variables.ma.password = "qQ8!kgb";
			variables.ma.useTLS = "true";
			variables.ma.useSSL = "true";
			variables.ma.port = "587";
			variables.ma.type="html";
		</cfscript>
        <cfif IsValid("email","leon@odanieldesigns.com")>
            <cfquery name="getCredentials" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
                SELECT 	FName, Password, AdminId, Login
                FROM 	dbo.Admin
                WHERE 	EMail = 'leon@odanieldesigns.com'
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
             <cfmail attributecollection="#variables.ma#">
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
			 Match
			<cfelse>
				No match
			</cfif>