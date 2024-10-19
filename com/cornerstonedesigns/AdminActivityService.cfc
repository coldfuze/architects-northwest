<cfcomponent extends="AdminActivityGateway">
	<cffunction name="getAllActivity" access="public" returntype="query" roles="admin" hint="This method returns all activity for all users">
    	<cfargument name="AdminId" required="no" default="0" hint="This argument expects a numeric AdminId">
        
        <cfscript>
			if (IsNumeric(ARGUMENTS.AdminId)) {
				VARIABLES.AdminId = ARGUMENTS.AdminId;	
			}
			else {
				VARIABLES.AdminId = 0;	
			}
		</cfscript>
    	<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	b.FName + ' ' + b.LName AS AdminName, c.TransactionTitle, 
                    CASE WHEN d.PlanNumber IS NOT NULL THEN d.PlanNumber ELSE 'N/A' END AS PlanNumber,
                    CASE WHEN d.PlanTitle IS NOT NULL THEN d.PlanTitle ELSE 'N/A' END AS PlanTitle, 
                    CASE WHEN a.TransactionId IN (5,6) THEN e.FName + ' ' + e.LName ELSE 'N/A' END AS ImpactedAdmin,
                    a.ActivityDate
            FROM	AdminActivity a
                    INNER JOIN Admin b ON a.AdminId = b.AdminId
                    INNER JOIN [Transaction] c ON a.TransactionId = c.TransactionId
                    LEFT JOIN [Plan] d ON a.PlanId = d.PlanId
                    LEFT JOIN Admin e ON a.ImpactedAdminId = e.AdminId
            <cfif VARIABLES.AdminId NEQ 0>WHERE a.AdminId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#VARIABLES.AdminId#"></cfif>
            ORDER BY a.ActivityDate DESC
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
</cfcomponent>