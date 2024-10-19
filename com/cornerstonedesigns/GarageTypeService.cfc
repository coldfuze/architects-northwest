<cfcomponent extends="GarageTypeGateway">
	<cffunction name="getGarageTypesForPlan" access="public" returntype="query" hint="This method returns Garage Types for a plan">
    	<cfargument name="PlanId" required="yes" type="numeric" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	SELECT	a.GarageTypeId,
            		a.GarageType
            FROM	GarageType a
            		INNER JOIN PlanToGarageType b ON a.GarageTypeId = b.GarageTypeId
            WHERE	b.PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.PlanId#">
            ORDER BY a.GarageType
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
</cfcomponent>