<cfcomponent>
	<cffunction name="getCredentialsByEMail" returntype="query" hint="This method returns login credentials based on an e-mail address">
    	<cfargument name="email" type="string" hint="This is the e-mail address for the user" required="yes">
        <cfscript>			
			var ma = {};
			ma.to = ARGUMENTS.email;
			ma.from = "mailprocessor@architectsnw.com";
			ma.subject = "Your Architects Northwest/CornerStone Designs Login Credentials";
			ma.server = "mail20.ezhostingserver.com";
			ma.username = "mailprocessor@architectsnw.com";
			ma.password = "ArCd~^FUze2K18";
			ma.useSSL = "true";
			ma.port = "465";
			ma.type="html";
		</cfscript>
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
             <cfmail attributecollection="#ma#">
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
    
    <cffunction name="emailPlanInformation" returntype="void" hint="This method e-mail's plan information from a web site visitor to an e-mail address">
    	<cfargument name="ei" type="struct" hint="This argument expects a structure containing the person who is sending an e-mail message, the PlanId, and the recipient's e-mail address and name" required="yes">
        <cfscript>
			var ma = {};
			ma.server = "mail20.ezhostingserver.com";
			ma.username = "mailprocessor@architectsnw.com";
			ma.password = "ArCd~^FUze2K18";
			ma.useSSL = "true";
			ma.port = "465";
			ma.type="html";
			ma.to = ARGUMENTS.ei.RecipientName & '<' & ARGUMENTS.ei.RecipientEMail & '>';
			if (ARGUMENTS.ei.Site IS "cornerstone") {
				ma.from = "CornerStone Designs <info@cornerstonedesigns.com>";
			}
			else {
				ma.from = "Architects Northwest <info@architectsnw.com>";
			}
			
			VARIABLES.PlanId = ARGUMENTS.ei.PlanId;
			VARIABLES.PlanInfo = Application.PlanService.getPlanInfo(VARIABLES.PlanId);
			
			if (LEN(TRIM(VARIABLES.PlanInfo.PlanTitle)) GT 0) {
				VARIABLES.PlanFileName = VARIABLES.PlanInfo.PlanTitle & '.pdf';
				VARIABLES.MessageTitle = ARGUMENTS.ei.fromName & ' has sent you The ' & VARIABLES.PlanInfo.PlanTitle & ' house plan to view';
			}
			else {
				VARIABLES.PlanFileName = VARIABLES.PlanInfo.PlanNumber & '.pdf';
				VARIABLES.MessageTitle = ARGUMENTS.ei.fromName & ' has sent you the ' & VARIABLES.PlanInfo.PlanTitle & ' house plan to view';
			}
            ma.subject= VARIABLES.MessageTitle;
		</cfscript>
		
        <!--- Get Plan Information --->
		<cfscript>
            VARIABLES.RelatedPlans = Application.RelatedPlanService.getRelatedPlansForPlan(ARGUMENTS.ei.PlanId);
            VARIABLES.architecturalStyles = Application.SearchSubGroupingService.getArchitecturalStylesforPlan(ARGUMENTS.ei.PlanId);
            VARIABLES.garageTypes = Application.GarageTypeService.getGarageTypesForPlan(ARGUMENTS.ei.PlanId);
            VARIABLES.designFeatures = Application.PlanService.getPlanDesignFeatures(ARGUMENTS.ei.PlanId);
            VARIABLES.PlanLabel = Application.PlanService.getPlanTitleWithTitleFirst(ARGUMENTS.ei.PlanId);
            VARIABLES.Media = Application.PlanService.doesPlanHaveMedia(ARGUMENTS.ei.PlanId);
            VARIABLES.hasMainFloorPlan = 0;
            VARIABLES.hasUpperFloorPlan = 0;
            VARIABLES.hasLowerFloorPlan = 0;
            VARIABLES.hasThirdFloorPlan = 0;
        
            // Determine which floor plans to display
            VARIABLES.mainFloorPlanPath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normal/MainFloorPlan.gif';
            VARIABLES.mainFloorPlanReversePath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normalReverse/MainFloorPlan.gif';
            VARIABLES.mainFloorPlanAbsolutePath = ExpandPath(VARIABLES.mainFloorPlanPath);
            if (FileExists(VARIABLES.mainFloorPlanAbsolutePath)) {
                VARIABLES.hasMainFloorPlan = 1;	
            }
            VARIABLES.upperFloorPlanPath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normal/UpperFloorPlan.gif';
            VARIABLES.upperFloorPlanReversePath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normalReverse/UpperFloorPlan.gif';
            VARIABLES.upperFloorPlanAbsolutePath = ExpandPath(VARIABLES.upperFloorPlanPath);
            if (FileExists(VARIABLES.upperFloorPlanAbsolutePath)) {
                VARIABLES.hasUpperFloorPlan = 1;	
            }
            VARIABLES.lowerFloorPlanPath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normal/LowerFloorPlan.gif';
            VARIABLES.lowerFloorPlanReversePath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normalReverse/LowerFloorPlan.gif';
            VARIABLES.lowerFloorPlanAbsolutePath = ExpandPath(VARIABLES.lowerFloorPlanPath);
            if (FileExists(VARIABLES.lowerFloorPlanAbsolutePath)) {
                VARIABLES.hasLowerFloorPlan = 1;	
            }
            VARIABLES.thirdFloorPlanPath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normal/ThirdFloorPlan.gif';
            VARIABLES.thirdFloorPlanReversePath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normalReverse/ThirdFloorPlan.gif';
            VARIABLES.thirdFloorPlanAbsolutePath = ExpandPath(VARIABLES.thirdFloorPlanPath);
            if (FileExists(VARIABLES.thirdFloorPlanAbsolutePath)) {
                VARIABLES.hasThirdFloorPlan = 1;	
            }
            
            VARIABLES.PlanImage = Application.PlanImageService.getPlanImageForPrintPlan(ARGUMENTS.ei.PlanId);
        </cfscript>
        
    <cfdocument format="pdf" name="planPDF" margintop="0.25" marginbottom="0.6" marginright="1" marginleft="1" overwrite="yes" fontembed="no" localurl="true">
        <html>
            <head>
                <style>
                    BODY {
                        background:white;	
                        margin:0;
                        text-align:left;
                        color:black;
                    }
                    .descriptionHeading {
                        line-height:26px;
                        font-family:"Times New Roman",arial,sans-serif;
                        font-style:italic;
                        font-size: 28px;
                        font-weight:bold;
                        text-align:justify;
                    }
                    .planDetailsContentLeft {
                        float:left;	
                    }
                    
                    .planDetailsContentRight {
                        float:right;	
                        text-align:right;
                    }
                    
                    .clearFloat {
                        clear:both;
                        margin:0;
                        padding:0;
                    }
                </style>
            </head>
            <body>
                <cfdocumentitem type="footer">
                    <div style="font-size:9px;font-family:calibri,verdana,arial,sans-serif;color:black;">
                    <strong>COPYRIGHT NOTICE:</strong> It is illegal to build this plan without a legally obtained set of prints. It is illegal to copy or redraw these plans. 
                    Violation of U.S. Copyright Laws are punishable with fines up to $150,000. After the purchase of plans, changes may be made by a qualified professional.
                    </div>
                    <div style="font-size:9px;font-family:calibri,verdana,arial,sans-serif;color:black;margin-top:0.1in;">
                        <cfoutput>#VARIABLES.PlanLabel#</cfoutput> ::: 
                        <cfoutput>Page #cfdocument.currentpagenumber# of #cfdocument.totalPageCount#</cfoutput>
                    </div>
                </cfdocumentitem>
                <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                    <a href="http://www.cornerstonedesigns.com"><img src="/assets/printPlanImages/CornerStoneDesignsHeader.png" border=0 width="100%"></a>
                    <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                        <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                    </div>
                <cfelse>
                    <a href="http://www.architectsnw.com"><img src="/assets/printPlanImages/ArchitectsNorthwestHeader.png" border=0 width="100%"></a>
                    <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                        <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                    </div>
                </cfif>
                <table border="0" cellpadding=10 cellspacing=0 style="width:100%;background-color:#caccbb;margin:0.05in 0 0 0;padding:0;">
                    <tr>
                        <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;" valign="top">
                            <table border=0 cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        Total Area:
                                    </td>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        <cfoutput>#VARIABLES.PlanInfo.TotalSF# sq. ft.</cfoutput>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        Garage Area:
                                    </td>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        <cfoutput>#VARIABLES.PlanInfo.GarageSF# sq. ft.</cfoutput>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        Garage Area:
                                    </td>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        <cfoutput>#VARIABLES.PlanInfo.GarageSF# sq. ft.</cfoutput>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        Garage Size:
                                    </td>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        <cfoutput>#VARIABLES.PlanInfo.GarageSizeAbbr#</cfoutput>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        Stories:
                                    </td>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        <cfoutput>#VARIABLES.PlanInfo.Stories#</cfoutput>
                                    </td>
                                </tr>
                                <cfif IsNumeric(VARIABLES.PlanInfo.Bedroom)>
                                <tr>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        Bedrooms:
                                    </td>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        <cfoutput>#VARIABLES.PlanInfo.Bedroom#</cfoutput>
                                    </td>
                                </tr>
                                </cfif>
                                <cfif IsNumeric(VARIABLES.PlanInfo.FullBathroom)>
                                <tr>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        Full Baths:
                                    </td>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        <cfoutput>#VARIABLES.PlanInfo.FullBathroom#</cfoutput>
                                    </td>
                                </tr>
                                </cfif>
                                <cfif IsNumeric(VARIABLES.PlanInfo.HalfBathroom)>
                                <tr>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        Half Baths:
                                    </td>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        <cfoutput>#VARIABLES.PlanInfo.HalfBathroom#</cfoutput>
                                    </td>
                                </tr>
                                </cfif>
                                <tr>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        Width:
                                    </td>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        <cfoutput>#VARIABLES.PlanInfo.HouseDimensionWidthFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionWidthIn#</cfoutput>&quot;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        Depth:
                                    </td>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        <cfoutput>#VARIABLES.PlanInfo.HouseDimensionDepthFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionDepthIn#</cfoutput>&quot;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        Height:
                                    </td>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        <cfoutput>#VARIABLES.PlanInfo.HouseDimensionHeightFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionHeightIn#</cfoutput>&quot;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        Foundation:
                                    </td>
                                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                        <cfoutput>#VARIABLES.PlanInfo.FoundationType#</cfoutput>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td align="right" valign="top">
                            <cfoutput><img src="#VARIABLES.PlanImage#"></cfoutput>
                        </td>
                    </tr>
                </table>
                
                <div style="margin-top:20px;font-family:verdana,arial,sans-serif;font-size:14px;">
                <cfif LEN(TRIM(VARIABLES.PlanInfo.PlanDescription)) GT 0>
                    <cfoutput>#Replace(Replace(VARIABLES.PlanInfo.PlanDescription,'<p>','','All'),'</p>','','All')#</cfoutput>
                </cfif>
                </div>
                
                <cfif VARIABLES.hasMainFloorPlan EQ 1>
                    <cfdocumentitem type="pagebreak" />
                    <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                        <a href="http://www.cornerstonedesigns.com"><img src="/assets/printPlanImages/CornerStoneDesignsHeader.png" border=0 width="100%"></a>
                        <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                            <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                        </div>
                    <cfelse>
                        <a href="http://www.architectsnw.com"><img src="/assets/printPlanImages/ArchitectsNorthwestHeader.png" border=0 width="100%"></a>
                        <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                            <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                        </div>
                    </cfif>
                    <div align="center" style="margin-top:0.1in;">
                    <strong style="text-decoration:underline;font-size:14px;">MAIN FLOOR</strong><br />
                    <cfoutput><img src="#VARIABLES.mainFloorPlanPath#" alt="Main Floor Plan" /></cfoutput>
                    </div>                
                </cfif>
                <cfif VARIABLES.hasUpperFloorPlan EQ 1>
                    <cfdocumentitem type="pagebreak" />
                    <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                        <a href="http://www.cornerstonedesigns.com"><img src="/assets/printPlanImages/CornerStoneDesignsHeader.png" border=0 width="100%"></a>
                        <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                            <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                        </div>
                    <cfelse>
                        <a href="http://www.architectsnw.com"><img src="/assets/printPlanImages/ArchitectsNorthwestHeader.png" border=0 width="100%"></a>
                        <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                            <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                        </div>
                    </cfif>
                    <div align="center" style="margin-top:0.1in;">
                    <strong style="text-decoration:underline;font-size:14px;">UPPER FLOOR</strong><br />
                    <cfoutput><img src="#VARIABLES.UpperFloorPlanPath#" alt="Upper Floor Plan" /></cfoutput>
                    </div>                
                </cfif>
                <cfif VARIABLES.hasLowerFloorPlan EQ 1>
                    <cfdocumentitem type="pagebreak" />
                    <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                        <a href="http://www.cornerstonedesigns.com"><img src="/assets/printPlanImages/CornerStoneDesignsHeader.png" border=0 width="100%"></a>
                        <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                            <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                        </div>
                    <cfelse>
    
                        <a href="http://www.architectsnw.com"><img src="/assets/printPlanImages/ArchitectsNorthwestHeader.png" border=0 width="100%"></a>
                        <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                            <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                        </div>
                    </cfif>
                    <div align="center" style="margin-top:0.1in;">
                    <strong style="text-decoration:underline;font-size:14px;">LOWER FLOOR</strong><br />
                    <cfoutput><img src="#VARIABLES.LowerFloorPlanPath#" alt="Lower Floor Plan" /></cfoutput>
                    </div>                
                </cfif>
                <cfif VARIABLES.hasThirdFloorPlan EQ 1>
                    <cfdocumentitem type="pagebreak" />
                    <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                        <a href="http://www.cornerstonedesigns.com"><img src="/assets/printPlanImages/CornerStoneDesignsHeader.png" border=0 width="100%"></a>
                        <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                            <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                        </div>
                    <cfelse>
                        <a href="http://www.architectsnw.com"><img src="/assets/printPlanImages/ArchitectsNorthwestHeader.png" border=0 width="100%"></a>
                        <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                            <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                        </div>
                    </cfif>
                    <div align="center" style="margin-top:0.1in;">
                    <strong style="text-decoration:underline;font-size:14px;">THIRD FLOOR</strong><br />
                    <cfoutput><img src="#VARIABLES.ThirdFloorPlanPath#" alt="Third Floor Plan" /></cfoutput>
                    </div>                
                </cfif>
                <cfdocumentitem type="pagebreak" />
                    <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                        <a href="http://www.cornerstonedesigns.com"><img src="/assets/printPlanImages/CornerStoneDesignsHeader.png" border=0 width="100%"></a>
                        <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                            <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                        </div>
                    <cfelse>
                        <a href="http://www.architectsnw.com"><img src="/assets/printPlanImages/ArchitectsNorthwestHeader.png" border=0 width="100%"></a>
                        <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                            <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                        </div>
                    </cfif>
                    <div align="center" style="margin-top:0.1in;">
                        <strong style="text-decoration:underline;font-size:18px;">PLAN DETAILS</strong>
                    </div>
                    <div style="position:relative;margin-top:0.1in;">
                        <div style="position:absolute;left:0;width:2.25in;">
                            <strong style="text-decoration:underline;">Area Summary</strong><br />
                            <div class="planDetailsContentLeft">Total Area:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.TotalSF#</cfoutput> sq. ft.</div>
                            <div class="clearFloat"></div>
                            
                            <cfif VARIABLES.PlanInfo.MainFloorSF GT 0>
                                <div class="planDetailsContentLeft">Main Floor:</div>
                                <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.MainFloorSF#</cfoutput> sq. ft.</div>
                                <div class="clearFloat"></div>
                            </cfif>
                            <cfif VARIABLES.PlanInfo.UpperFloorSF GT 0>
                                <div class="planDetailsContentLeft">Upper Floor:</div>
                                <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.UpperFloorSF#</cfoutput> sq. ft.</div>
                                <div class="clearFloat"></div>
                            </cfif>
                            <cfif VARIABLES.PlanInfo.ThirdFloorSF GT 0>
                                <div class="planDetailsContentLeft">3rd Floor:</div>
                                <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.ThirdFloorSF#</cfoutput> sq. ft.</div>
                                <div class="clearFloat"></div>
                            </cfif>
                            <cfif VARIABLES.PlanInfo.LowerFloorSF GT 0>
                                <div class="planDetailsContentLeft">Lower Floor:</div>
                                <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.LowerFloorSF#</cfoutput> sq. ft.</div>
                                <div class="clearFloat"></div>
                            </cfif>
                            <cfif VARIABLES.PlanInfo.GarageSF GT 0>
                                <div class="planDetailsContentLeft">Garage Floor:</div>
                                <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.GarageSF#</cfoutput> sq. ft.</div>
                                <div class="clearFloat"></div>
                            </cfif>
                            <br />
                            <strong style="text-decoration:underline;">General Information</strong><br />
                            <div class="planDetailsContentLeft">Stories:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.Stories#</cfoutput></div>
                            <div class="clearFloat"></div>
                            
                            <div class="planDetailsContentLeft">Width:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.HouseDimensionWidthFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionWidthIn#</cfoutput>&quot;</div>
                            <div class="clearFloat"></div>
                            
                            <div class="planDetailsContentLeft">Depth:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.HouseDimensionDepthFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionDepthIn#</cfoutput>&quot;</div>
                            <div class="clearFloat"></div>
                            
                            <div class="planDetailsContentLeft">Height:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.HouseDimensionHeightFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionHeightIn#</cfoutput>&quot;</div>
                            <div class="clearFloat"></div>
                            <br>
                            <strong style="text-decoration:underline;">Architectural Style</strong><br />
                            <cfoutput query="VARIABLES.architecturalStyles">#SearchSubGrouping#<cfif VARIABLES.architecturalStyles.currentRow LT VARIABLES.architecturalStyles.recordCount><br /></cfif></cfoutput>
                            <br /><br />
                            <strong style="text-decoration:underline;">Number of Rooms</strong><br />
                            <cfif IsNumeric(VARIABLES.PlanInfo.Bedroom)>
                                <div class="planDetailsContentLeft">Bedrooms:</div>
                                <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.Bedroom#</cfoutput></div>
                                <div class="clearFloat"></div>
                            </cfif>
                            <cfif IsNumeric(VARIABLES.PlanInfo.FullBathroom)>
                            <div class="planDetailsContentLeft">Full Baths:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.FullBathroom#</cfoutput></div>
                            <div class="clearFloat"></div>
                            </cfif>
                            <cfif IsNumeric(VARIABLES.PlanInfo.HalfBathroom)>
                            <div class="planDetailsContentLeft">Half Baths:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.HalfBathroom#</cfoutput></div>
                            <div class="clearFloat"></div>
                            </cfif>
                            <br>
                            <cfif VARIABLES.PlanInfo.GarageSizeId GT 1>
                                <strong style="text-decoration:underline;">Garage</strong><br />
                                <div class="planDetailsContentLeft">Garage Size:</div>
                                <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.GarageSizeAbbr#</cfoutput></div>
                                <div class="clearFloat"></div>
                                <cfif LEN(VARIABLES.PlanInfo.GarageDoorLocationAbbr) GT 0>
                                    <div class="planDetailsContentLeft">Garage Door Location:</div>
                                    <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.GarageDoorLocationAbbr#</cfoutput></div>
                                    <div class="clearFloat"></div>
                                </cfif>
                                <cfif VARIABLES.garageTypes.recordCount GT 0>
                                    <div class="planDetailsContentLeft">Garage Type:</div>
                                    <div class="planDetailsContentRight"><cfoutput query="VARIABLES.garageTypes">#GarageType#</cfoutput></div>
                                    <div class="clearFloat"></div>
                                </cfif>
                            <cfelse>
                                <div class="planDetailsContentLeft"><strong style="text-decoration:underline;">Garage</strong></div>
                                <div class="planDetailsContentRight">No Garage</div>
                                <div class="clearFloat"></div>
                            </cfif>
                            <br />
                            <strong style="text-decoration:underline;">Roof Pitches</strong><br />
                            <div class="planDetailsContentLeft">Primary:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.RoofPrimary#</cfoutput>:12</div>
                            <div class="clearFloat"></div>
                            <cfif IsNumeric(VARIABLES.PlanInfo.RoofSecondary)>
                            <div class="planDetailsContentLeft">Secondary:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.RoofSecondary#</cfoutput>:12</div>
                            <div class="clearFloat"></div>
                            </cfif>
                            <br />
                            <strong style="text-decoration:underline;">Wall Heights</strong><br />
                            <cfif IsNumeric(VARIABLES.PlanInfo.CeilingHeightMainFloor)>
                            <div class="planDetailsContentLeft">Main:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.CeilingHeightMainFloor#</cfoutput>&#39;-0&quot;</div>
                            <div class="clearFloat"></div>
                            </cfif>
                            <cfif IsNumeric(VARIABLES.PlanInfo.CeilingHeightUpperFloor)>
                            <div class="planDetailsContentLeft">Upper:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.CeilingHeightUpperFloor#</cfoutput>&#39;-0&quot;</div>
                            <div class="clearFloat"></div>
                            </cfif>
                            <cfif IsNumeric(VARIABLES.PlanInfo.CeilingHeightThirdFloor)>
                            <div class="planDetailsContentLeft">3rd Floor:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.CeilingHeightThirdFloor#</cfoutput>&#39;-0&quot;</div>
                            <div class="clearFloat"></div>
                            </cfif>
                            <cfif IsNumeric(VARIABLES.PlanInfo.CeilingHeightLowerFloor)>
                            <div class="planDetailsContentLeft">Lower:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.CeilingHeightLowerFloor#</cfoutput>&#39;-0&quot;</div>
                            <div class="clearFloat"></div>
                            </cfif>
                        </div>
                        
                        <div style="position:absolute;right:0;width:2.25in;">
                            <strong style="text-decoration:underline;">Foundation Type</strong><br />
                            <cfoutput>#VARIABLES.PlanInfo.FoundationType#</cfoutput>
                            <br /><br />
                            <strong style="text-decoration:underline;">Roof Framing</strong><br />
                            <cfoutput>#VARIABLES.PlanInfo.RoofFraming#</cfoutput>
                            <br /><br />
                            <strong style="text-decoration:underline;">Floor Load</strong><br />
                            <div class="planDetailsContentLeft">Live (lbs):</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.FloorLive#</cfoutput> PSF</div>
                            <div class="clearFloat"></div>
                            <div class="planDetailsContentLeft">Dead (lbs):</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.FloorDead#</cfoutput> PSF</div>
                            <div class="clearFloat"></div>
                            <br />
                            <strong style="text-decoration:underline;">Roof Load</strong><br />
                            <div class="planDetailsContentLeft">Live (lbs):</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.RoofLive#</cfoutput> PSF</div>
                            <div class="clearFloat"></div>
                            <div class="planDetailsContentLeft">Dead (lbs):</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.RoofDead#</cfoutput> PSF</div>
                            <div class="clearFloat"></div>
                            <div class="planDetailsContentLeft">Wind:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.MaxWind#</cfoutput> PSF</div>
                            <div class="clearFloat"></div>
                            <br>
                            <strong style="text-decoration:underline;">Design Features</strong>
                            <cfoutput>#VARIABLES.designFeatures#</cfoutput>
                        </div>
                    </div>
            </body>
        </html>
    </cfdocument>
    
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
			
			if (ARGUMENTS.ei.Site IS "cornerstone") {
				VARIABLES.BannerImage = Application.BasePath & '/assets/mailImages/CornerStoneDesignsMailBanner.jpg';
				VARIABLES.company = "CornerStone Designs";
			}
			else {
				VARIABLES.BannerImage = Application.BasePath & '/assets/mailImages/ArchitectsNorthwestMailBanner.jpg';
				VARIABLES.company = "Architects Northwest";
			}
			VARIABLES.PlanFileName = VARIABLES.planinfo.PlanTitle & '.pdf';
			VARIABLES.thumbnail = Application.BasePath & VARIABLES.PlanInfo.PlanThumbnail;
			VARIABLES.PlanLink = Application.BasePath & '/plans/detailedPlanInfo.cfm?PlanId=' & VARIABLES.PlanInfo.PlanId;
			VARIABLES.LinkButton = Application.BasePath & '/assets/images/viewplanbutton.png';
		 </cfscript>
         
         <cfmail attributecollection="#ma#">>
                <!---<cfmailparam file="#VARIABLES.PlanFileName#" type="application/pdf" content="#planPDF#"/>--->

                <cfmailpart type="text"></cfmailpart>
                <cfmailpart type="html">
                    <html>
                        <head>
                        	<style type="text/css">
								a {
									text-decoration:underline;
									color:white;
								}
								
								a:link, a:visited {
									text-decoration:underline;
									color:white;
								}
								
								a:hover, a:active {
									text-decoration:underline;
									color:##06C;
								}
							</style>
                        </head>
                        <body style="background-color:##4a584b;margin:0;padding:0;font-family:verdana,arial,sans-serif;">
                            <table border=0 cellpadding=0 cellspacing=0 style="background-color:white;width:600px;margin-left:20px;">
                                <tr>
                                    <td style="text-align:left;height:600px;background-color:white;font-family:verdana,arial,sans-serif;font-size:12px;" valign="top">
                                    	<cfif ARGUMENTS.ei.Site IS "cornerstone">
                                        <img name="CornerStoneDesignsMailBanner" src="#VARIABLES.BannerImage#" width="600" height="89" border="0" id="CornerStoneDesignsMailBanner" usemap="##m_CornerStoneDesignsMailBanner" alt="" /><map name="m_CornerStoneDesignsMailBanner" id="m_CornerStoneDesignsMailBanner">
                                        <area shape="rect" coords="402,54,591,73" href="tel:1-888-884-9488" alt="" />
                                        <area shape="rect" coords="571,4,591,26" href="http://www.cornerstonedesigns.com/rss.cfm" title="View to subscribe to our RSS feed" alt="View to subscribe to our RSS feed" />
                                        <area shape="rect" coords="546,4,565,26" href="http://www.youtube.com/user/ArchitectsNW?feature=mhum##p/a" title="Click to view our YouTube page" alt="Click to view our YouTube page" />
                                        <area shape="rect" coords="11,4,194,73" href="http://www.cornerstonedesigns.com" title="CornerStone Designs" alt="CornerStone Designs" />
                                        <area shape="rect" coords="519,4,540,26" href="http://twitter.com/ArchitectsNW" title="Follow Us on Twitter" alt="Follow Us on Twitter" />
                                        <area shape="rect" coords="494,4,515,26" href="http://www.facebook.com/ArchitectsNW?v=info" alt="Click to view our Facebook Page" />
                                        </map>
                                        <cfelse>
                                        <img name="ArchitectsNorthwestMailBanner" src="#VARIABLES.BannerImage#" width="600" height="89" border="0" id="ArchitectsNorthwestMailBanner" usemap="##m_ArchitectsNorthwestMailBanner" alt="" /><map name="m_ArchitectsNorthwestMailBanner" id="m_ArchitectsNorthwestMailBanner">
                                        <area shape="rect" coords="402,54,591,73" href="tel:1-888-272-4100" alt="" />
                                        <area shape="rect" coords="570,4,590,26" href="http://www.architectsnw.com/rss.cfm" title="View to subscribe to our RSS feed" alt="View to subscribe to our RSS feed" />
                                        <area shape="rect" coords="544,4,563,26" href="http://www.youtube.com/user/ArchitectsNW?feature=mhum##p/a" title="Click to view our YouTube page" alt="Click to view our YouTube page" />
                                        <area shape="rect" coords="11,4,261,73" href="http://www.architectsnw.com" title="Architects Northwest" alt="Architects Northwest" />
                                        <area shape="rect" coords="519,4,540,26" href="http://twitter.com/ArchitectsNW" title="Follow Us on Twitter" alt="Follow Us on Twitter" />
                                        <area shape="rect" coords="494,4,515,26" href="http://www.facebook.com/ArchitectsNW?v=info" title="View our Faceboook Page" alt="View our Faceboook Page" />
                                        </map>
                                       	</cfif>
                                        <table border=0 cellpadding=5 cellspacing="0" style="margin-top:0px;width:560px;" align="center">
                                        	<tr>
                                            	<td colspan=2 style="font-family:verdana,arial,sans-serif;font-size:12px;padding-top:10px;">
                                                	#DateFormat(Now(), "DDDD, MMMM D, YYYY")#
                                                </td>
                                            </tr>
                                            <tr>
                                            	<td colspan=2 style="font-family:verdana,arial,sans-serif;font-size:12px;padding-top:20px;">
                                                	#ARGUMENTS.ei.fromName# has a plan from the #VARIABLES.company# web site that they would like you to view.
                                                </td>
                                            </tr>
                                        	<tr>
                                            	<td style="width:300px;line-height:15px;font-family:verdana,arial,sans-serif;font-size:12px;" valign="top">
                                                    <strong>#VARIABLES.PlanLabel#</strong><br>
                                                    Total Area: <cfoutput>#VARIABLES.PlanInfo.TotalSF# sq. ft.</cfoutput><br>
                                                    Garage Area: <cfoutput>#VARIABLES.PlanInfo.GarageSF# sq. ft.</cfoutput><br>
                                                    Garage Size: <cfoutput>#VARIABLES.PlanInfo.GarageSizeAbbr#</cfoutput><br>
                                                    Stories: <cfoutput>#VARIABLES.PlanInfo.Stories#</cfoutput><br>
                                                    <cfif IsNumeric(VARIABLES.PlanInfo.Bedroom)>Bedrooms: <cfoutput>#VARIABLES.PlanInfo.Bedroom#</cfoutput><br></cfif>
                                                    <cfif IsNumeric(VARIABLES.PlanInfo.FullBathroom)>Full Baths: <cfoutput>#VARIABLES.PlanInfo.FullBathroom#</cfoutput><br></cfif>
                                                    <cfif IsNumeric(VARIABLES.PlanInfo.HalfBathroom)>Half Baths: <cfoutput>#VARIABLES.PlanInfo.HalfBathroom#</cfoutput><br></cfif>
                                                    Width: <cfoutput>#VARIABLES.PlanInfo.HouseDimensionWidthFt#</cfoutput>&##39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionWidthIn#</cfoutput>&quot;<br>
                                                    Depth: <cfoutput>#VARIABLES.PlanInfo.HouseDimensionDepthFt#</cfoutput>&##39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionDepthIn#</cfoutput>&quot;<br>
                                                    Height: <cfoutput>#VARIABLES.PlanInfo.HouseDimensionHeightFt#</cfoutput>&##39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionHeightIn#</cfoutput>&quot;<br>
                                                    Foundation: <cfoutput>#VARIABLES.PlanInfo.FoundationType#</cfoutput>
                                                </td>
                                                <td style="width:265px;line-height:20px;" valign="top">
                                            		<a href="#VARIABLES.PlanLink#"><img src="#VARIABLES.thumbnail#" width="165" height="121" alt="Plan #VARIABLES.PlanLabel#" border="0"></a>
                                                    <div style="margin-top:10px;">
													<a href="#VARIABLES.PlanLink#"><img src="#VARIABLES.LinkButton#" width="165" height="35" alt="Click to view more information about this plan" border="0"></a>
                                                    </div>
                                                </td>
                                             </tr>
                                             <cfif LEN(TRIM(ARGUMENTS.ei.Comments)) GT 0>
                                             <tr>
                                             	<td style="font-family:verdana,arial,sans-serif;font-size:12px;">
                                                	<strong>Comments from #ARGUMENTS.ei.fromName#:</strong><br>
													#ARGUMENTS.ei.Comments#
                                                </td>
                                             </tr>
                                             </cfif>
                                         </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="color:white;font-weight:bold;text-align:left;padding:10px;font-size:10px;background-color:##364736;font-family:verdana,arial,sans-serif;font-size:10px;">
                                        <a href="#VARIABLES.PlanLink#">Click for more information about this plan</a>
                                    </td>
                                </tr>
                            </table>
                        </body>
                    </html>
                </cfmailpart>
         </cfmail>
    </cffunction>
    
    <cffunction name="sendInformationRequestMessage" returntype="boolean" hint="This method sends an information request to Architects Northwest">
    	<cfargument name="mi" type="struct" hint="This argument expects a structure of information to be sent to Architects Northwest/CornerStone Designs" required="yes">
        <cfscript>
			var ma = {};
			ma.server = "mail20.ezhostingserver.com";
			ma.username = "mailprocessor@architectsnw.com";
			ma.password = "ArCd~^FUze2K18";
			ma.useSSL = "true";
			ma.port = "465";
			var sendMessage = 0;
			
			if (IsNumeric(ARGUMENTS.mi.InfoRequestTypeId)) {
				VARIABLES.InfoRequestType = Application.InfoRequestTypeService.getInfoRequestType(ARGUMENTS.mi.InfoRequestTypeId);
				VARIABLES.ValidInfoRequestType = 1;
			}
			else {
				VARIABLES.ValidInfoRequestType = 0;
			}
			
			if (IsValid("regular_expression",ARGUMENTS.mi.FName,"^[a-zA-Z\s]+$")) {
				VARIABLES.FName = ARGUMENTS.mi.FName;
				VARIABLES.ValidFName = 1;
			}
			else {
				VARIABLES.ValidFName = 0;
			}
			
			if (IsValid("regular_expression",ARGUMENTS.mi.LName,"^[a-zA-Z\s'-]+$")) {
				VARIABLES.LName = ARGUMENTS.mi.LName;
				VARIABLES.ValidLName = 1;
			}
			else {
				VARIABLES.ValidLName = 0;
			}
			
			if (LEN(TRIM(ARGUMENTS.mi.Address)) GT 0) {
				if (IsValid("regular_expression",ARGUMENTS.mi.Address,"^[a-zA-Z0-9\s'-]+$")) {
					VARIABLES.Address = ARGUMENTS.mi.Address;
					VARIABLES.ValidAddress = 1;
				}
				else {
					VARIABLES.Address = "";
				}
			}
			else {
				VARIABLES.Address = "";	
			}
			
			if (LEN(TRIM(ARGUMENTS.mi.Address2)) GT 0) {
				if (IsValid("regular_expression",ARGUMENTS.mi.Address2,"^[a-zA-Z0-9\s'-]+$")) {
					VARIABLES.Address2 = ARGUMENTS.mi.Address2;
				}
				else {
					VARIABLES.Address2 = "";
				}
			}
			else {
				VARIABLES.Address2 = "";	
			}

			if (IsValid("regular_expression",ARGUMENTS.mi.City,"^[a-zA-Z\s'-]+$")) {
        		VARIABLES.City = ARGUMENTS.mi.City;
			}
			else {
				VARIABLES.City = "";
			}
			
			if (IsValid("regular_expression",ARGUMENTS.mi.StateId,"^[A-Z]+$")) {
        		VARIABLES.StateId = ARGUMENTS.mi.StateId;
			}
			else {
				VARIABLES.StateId = "";
			}
			
			if (IsValid("zipcode",ARGUMENTS.mi.ZipCode)) {
        		VARIABLES.ZipCode = ARGUMENTS.mi.ZipCode;
			}
			else {
				VARIABLES.ZipCode = "";
			}
			
        	if (IsValid("email",ARGUMENTS.mi.EMail)) {
        		VARIABLES.EMail = ARGUMENTS.mi.EMail;
				VARIABLES.ValidEMail = 1;
			}
			else {
				VARIABLES.ValidEMail = 0;
			}
			
			if (IsValid("telephone",ARGUMENTS.mi.phone)) {
				VARIABLES.Phone = ARGUMENTS.mi.phone;
			}
			else {
				VARIABLES.Phone = "";
			}
			
			if (isValid('regex',ARGUMENTS.mi.PlanNameNumber,'^[A-Za-z0-9 -]{0,35}$')) {
				VARIABLES.PlanNameNumber = ARGUMENTS.mi.PlanNameNumber;
			}
			else {
				VARIABLES.validPlanNameNumber = 0;	
				VARIABLES.PlanNameNumber = 'Plan not identified';
			}
			
			if (LEN(ARGUMENTS.mi.Comments) GT 0) {
				VARIABLES.Comments = HTMLEditFormat(ARGUMENTS.mi.Comments);
			}
			else {
				VARIABLES.Comments = "";	
			}
			
			if (VARIABLES.ValidInfoRequestType EQ 1 AND VARIABLES.ValidLName EQ 1 AND VARIABLES.ValidFName EQ 1 AND VARIABLES.ValidEMail EQ 1) {
				VARIABLES.sendMessage = 1;
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
			
			if (ARGUMENTS.mi.webSite IS "Architects Northwest") {
				VARIABLES.WebSite = 'Architects Northwest';	
				VARIABLES.BannerImage = Application.BasePath & '/assets/mailImages/ArchitectsNorthwestMailBanner.jpg';
				VARIABLES.ToAddress = 'Architects Northwest <info@architectsnw.com>';
				VARIABLES.FromAddress = 'Architects Northwest Mail Processor <mailprocessor@architectsnw.com>';
				VARIABLES.HomePage = 'http://www.architectsnw.com/';
			}
			else {
				VARIABLES.WebSite = 'CornerStone Designs';
				VARIABLES.BannerImage = Application.BasePath & '/assets/mailImages/CornerStoneDesignsMailBanner.jpg';
				VARIABLES.ToAddress = 'CornerStone Designs <info@cornerstonedesigns.com>';
				VARIABLES.FromAddress = 'CornerStone Designs Mail Processor <mailprocessor@cornerstonedesigns.com>';
				VARIABLES.HomePage = 'http://www.cornerstonedesigns.com/';
			}
			
			VARIABLES.PlansPage = VARIABLES.HomePage & 'plans/';
			VARIABLES.SMPage = VARIABLES.HomePage & 'siteManagement';

			VARIABLES.subject = VARIABLES.InfoRequestType & ' Message Submitted by ' & VARIABLES.FName & ' ' & VARIABLES.LName & ' from the ' & VARIABLES.WebSite & ' Web Site';
			ma.to = VARIABLES.ToAddress;
			ma.from = VARIABLES.fromAddress;
			//ma.cc = "jeffrey@architectsnw.com";
			ma.bcc = "leon@odanieldesigns.com";
			ma.subject = VARIABLES.subject;
		 </cfscript>
         
         <cfif VARIABLES.sendMessage EQ 1>
             <cfmail attributecollection="#ma#">
                <cfmailpart type="html">
                    <html>
                        <head></head>
                        <body style="background-color:white;margin:0;padding:0;font-family:verdana,arial,sans-serif;">
                            <table align="center" border=0 cellpadding=0 cellspacing=0 style="background-color:white;width:600px;">
                                <tr>
                                    <td style="text-align:left;height:450px;background-color:white;font-family:verdana,arial,sans-serif;font-size:12px;" valign="top">
                                        <a href="#VARIABLES.HomePage#"><img src="#VARIABLES.BannerImage#" width="600" height="89" alt="#VARIABLES.WebSite#" border=0></a>
                                        <p style="margin-left:20px;margin-top:20px;margin-right:20px;">
                                            #VARIABLES.Greeting#,
                                        </p>
                                        <p style="margin-left:20px;margin-top:20px;margin-right:20px;font-family:verdana,arial,sans-serif;font-size:12px;">
                                        	#VARIABLES.FName# #VARIABLES.LName# has submitted the following message from the #VARIABLES.WebSite# web site:
                                        </p>
                                        <p style="margin-left:20px;margin-top:20px;margin-right:20px;font-family:verdana,arial,sans-serif;font-size:12px;">
                                        	Type of Information Request: #VARIABLES.InfoRequestType#
                                        </p>
                                        
                                        <p style="margin-left:20px;margin-top:20px;margin-right:20px;font-family:verdana,arial,sans-serif;font-size:12px;">
                                        	<strong>Contact Information:</strong>
                                        </p>
                                        
                                        <p style="margin-left:45px;margin-top:20px;margin-right:20px;font-family:verdana,arial,sans-serif;font-size:12px;">
                                            #VARIABLES.FName# #VARIABLES.LName#
                                            <cfif LEN(VARIABLES.Address) GT 0><br>#VARIABLES.Address#<cfif LEN(VARIABLES.Address2) GT 0><br>#VARIABLES.Address2#</cfif></cfif>
                                            <cfif LEN(VARIABLES.City) GT 0><br>#VARIABLES.City#<cfif LEN(VARIABLES.StateId) GT 0>, #VARIABLES.StateId#</cfif><cfif LEN(VARIABLES.ZipCode) GT 0>&nbsp;&nbsp;#VARIABLES.ZipCode#</cfif></cfif>
                                        </p>
                                          
                                        <p style="margin-left:45px;margin-top:20px;margin-right:20px;font-family:verdana,arial,sans-serif;font-size:12px;">
                                        	<em>E-Mail Address:</em> <a href="mailto:#VARIABLES.EMail#">#VARIABLES.EMail#</a>
                                            <cfif LEN(VARIABLES.Phone) GT 0><br><em>Phone:</em> #VARIABLES.Phone#</cfif>
                                        </p>
                                        
                                        <p style="margin-left:20px;margin-top:20px;margin-right:20px;font-family:verdana,arial,sans-serif;font-size:12px;">
                                        	<strong>Plan Name or Number:</strong> #VARIABLES.planNameNumber#
                                        </p>
                                        
                                        <cfif LEN(VARIABLES.Comments) GT 0>
                                        <p style="margin-left:20px;margin-top:20px;margin-right:20px;font-family:verdana,arial,sans-serif;font-size:12px;">
                                        	<strong>Comments:</strong> #VARIABLES.Comments#
                                        </p>
                                        </cfif>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="color:white;font-weight:bold;text-align:left;padding:10px;font-size:10px;background-color:##818f82;font-family:verdana,arial,sans-serif;font-size:10px;">
                                        Click for: <a style="color:white;" href="#VARIABLES.HomePage#">Home Page</a> | <a style="color:white;" href="#VARIABLES.PlansPage#">Plans</a> | <a style="color:white;" href="#VARIABLES.SMPage#">Site Management</a>
                                    </td>
                                </tr>
                            </table>
                        </body>
                    </html>
                </cfmailpart>
             </cfmail>
         </cfif>
         
         <cfreturn VARIABLES.sendMessage>
    </cffunction>
</cfcomponent>