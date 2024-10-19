<cfsetting requesttimeout="1200">

<cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="pl">
	SELECT DISTINCT PlanId
    FROM PlanImage
    WHERE PlanId = 63
    ORDER By PlanId
</cfquery>

<cfloop query="pl">
	<cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        SELECT	PlanId,ImageFile
        FROM	PlanImage
        WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#PlanId#">
        ORDER BY PlanId
    </cfquery>
    
    <cfloop query="gi">
    	<cfscript>
			VARIABLES.tempPhotoPath = '/assets/planImages/' & PlanId;
        	VARIABLES.PhotoPath = ExpandPath(VARIABLES.tempPhotoPath);
			
			// Set the Plan Thumbnail Path
			VARIABLES.planThuPath = VARIABLES.PhotoPath & '\planthu';
			
			VARIABLES.planThuImagePath = VARIABLES.planThuPath & '\' & ImageFile;			
			
			// Set the original-size image path
			VARIABLES.originalPath = VARIABLES.PhotoPath &  '\original';
			
			// Set the Base Image Variable
			VARIABLES.thisBaseImage = VARIABLES.originalPath & '\' & ImageFile;
		</cfscript>

		<!--- Read the uploaded image to memory --->
        <cfimage action="read" name="baseImage" source="#thisBaseImage#">
        
    	<!--- Create the plan thumbnail directory - if necessary --->
		<cfif NOT DirectoryExists(planThuPath)>
            <cfdirectory action="create" directory="#planThuPath#">
        </cfif>
        
        <cfif baseImage.width gt baseImage.height>           
             <cfif baseImage.width gt 536>
             	<!--- Create and store the plan thumbnail photo --->
                <cfimage action="resize" width="165" height="" source="#baseImage#" name="planThuImage"> 
                
                <!--- Put photo in the plan thumbnail images folder --->
                <cfimage action="write" source="#planThuImage#" destination="#VARIABLES.planThuImagePath#" overwrite="yes">
            <cfelse>                
                <!--- Create and store the plan thumbnail photo --->
                <cfimage action="resize" width="165" height="" source="#VARIABLES.thisBaseImage#" name="planThuImage"> 
                
                <!--- Put photo in the plan thumbnail images folder --->
                <cfimage action="write" source="#planThuImage#" destination="#VARIABLES.planThuImagePath#" overwrite="yes">
            </cfif>
        <cfelse>
            <cfif baseImage.height gt 302>
                <!--- Create and store the plan thumbnail photo --->
                <cfimage action="resize" width="" height="121" source="#VARIABLES.thisBaseImage#" name="planThuImage"> 
                
                <!--- Put photo in the plan thumbnail images folder --->
                <cfimage action="write" source="#planThuImage#" destination="#VARIABLES.planThuImagePath#" overwrite="yes">
            <cfelse>                
                <!--- Create and store the plan thumbnail photo --->
                <cfimage action="resize" width="" height="121" source="#VARIABLES.thisBaseImage#" name="planThuImage"> 
                
                <!--- Put photo in the plan thumbnail images folder --->
                <cfimage action="write" source="#planThuImage#" destination="#VARIABLES.planThuImagePath#" overwrite="yes">
            </cfif>
        </cfif>
    </cfloop>
</cfloop>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>

</body>
</html>