<cfcomponent extends="RelatedPlanGateway">
	<cffunction name="getRelatedPlansForPlan" access="public" returntype="query" hint="This method returns related plans for a plan">
    	<cfargument name="PlanId" required="yes" type="numeric" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	a.PlanToRelatedPlanId,
            		CASE WHEN LEN(RTRIM(LTRIM(b.PlanTitle))) > 0 THEN b.PlanNumber + ' - '  + b.PlanTitle
                    ELSE b.PlanTitle
                    END AS PlanTitle
             FROM	RelatedPlan a
             		INNER JOIN [Plan] b ON a.RelatedPlanId = b.PlanId
             WHERE	a.PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.PlanId#">
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="addRelatedPlan" access="public" roles="general,admin" returntype="numeric" hint="This method add a related plan when passed a PlanTitle and a PlanId">
    	<cfargument name="thisPI" required="yes" type="struct" hint="This stucture expects a numeric PlanId and a related plan's PlanNumber">
        
        <cfscript>
			VARIABLES.addRelatedPlan = 0;
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT 	PlanId
        	FROM 	[Plan]
        	WHERE	PlanNumber = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.thisPI.PlanNumber#" maxlength="20">
        </cfquery>
         
         <cfif gi.recordCount EQ 1>
         	<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="mi">
                SELECT 	PlanId
                FROM 	RelatedPlan
                WHERE	RelatedPlanId = <cfqueryparam cfsqltype="cf_sql_varchar" value="#gi.PlanId#" maxlength="20">
                		AND PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.thisPI.PlanId#">
             </cfquery>
             
             <cfif mi.recordcount EQ 0>
             	<cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#">
                	INSERT INTO RelatedPlan(PlanId,RelatedPlanId)
                    VALUES(<cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.thisPI.PlanId#">,
                    	<cfqueryparam cfsqltype="cf_sql_smallint" value="#gi.PlanId#">)
                </cfquery>
             
             	<cfscript>
             		VARIABLES.addRelatedPlan = 1;
				</cfscript>
             </cfif>
         </cfif>
         
         <cfreturn VARIABLES.addRelatedPlan>
    </cffunction>
    
    <cffunction name="deleteRelatedPlansForAPlan" access="public" roles="admin" hint="This method deletes RelatedPlans for a plan">
    	<cfargument name="PlanId" type="numeric" required="yes" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	DELETE
            FROM 	RelatedPlan
            WHERE PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.PlanId#">
        </cfquery>
    </cffunction>
</cfcomponent>