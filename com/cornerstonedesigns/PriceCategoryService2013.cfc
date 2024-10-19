<cfcomponent extends="PriceCategoryGateway">
	<cffunction name="getPricingDataForCategory" returntype="query" access="public" hint="This method returns plan pricing for a particular price category">
    	<cfargument name="PriceCategoryId" type="numeric" required="yes" hint="This argument expects a numeric PriceCategoryId">
        <cfscript>
			var gi="";
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	SELECT 	*
            FROM 	PriceCategory
            WHERE	PriceCategoryId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.PriceCategoryId#">
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="getPricingCategoryForPlan" returntype="any" access="public" hint="This method return the pricing category when passed a numeric PlanId">
    	<cfargument name="PlanId"  required="yes" type="numeric" hint="This argument expects a numeric PlanId">
        <cfscript>
			gi = "";
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT PriceCategoryId
            FROM [Plan]
            WHERE PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.PlanId#">
        </cfquery>
        
        <cfreturn gi.PriceCategoryId>
    </cffunction>
</cfcomponent>