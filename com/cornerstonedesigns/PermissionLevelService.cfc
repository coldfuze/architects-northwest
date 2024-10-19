<cfcomponent extends="PermissionLevelGateway">
	<cffunction name="getPickList" access="public" roles="general,admin" returntype="query" hint="This method returns a picklist of permission levels">        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="pis">
        	SELECT 	CASE WHEN PermissionLevel = 'Super User' THEN 'Super User (has access to all site management functionality)'
            		ELSE 'General (can add/update/delete plans)'
                    END AS PermissionLevel,
                    PermissionLevelId
            FROM 	PermissionLevel
            ORDER BY PermissionLevelId DESC
        </cfquery>
        
        <cfreturn pis>
    </cffunction>
</cfcomponent>