<cfcomponent extends="StateGateway">
	<cffunction name="getStatePicklist" access="public" returntype="query" hint="This method returns a picklist of US States">
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="sl">
        	SELECT 	[State], StateId
            FROM 	dbo.State
            ORDER BY [State]
        </cfquery>
        
        <cfreturn sl>
    </cffunction>
</cfcomponent>