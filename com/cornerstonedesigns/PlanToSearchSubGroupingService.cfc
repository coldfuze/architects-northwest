<cfcomponent extends="PlanToSearchSubGroupingGateway">
	<cffunction name="loadSearchSubGroupings" access="public" roles="admin" returntype="void" hint="This method loads Search Gub Groupings for a plan">
    	<cfargument name="sgi" required="yes" type="struct" hint="This argument expects a structure containing the PlanId and its corresponding sub groupings">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="dsg">
        	DELETE FROM PlanToSearchSubGrouping
            WHERE PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.sgi.PlanId#">
        </cfquery>
        
        <cfloop list="#ARGUMENTS.sgi.SearchSubGrouping#" index="i">
        	<cfscript>
				nm = CreateObject("component","com.cornerstonedesigns.PlanToSearchSubGrouping").init();
				nm.PlanId = ARGUMENTS.sgi.PlanId;
				nm.SearchSubGroupingId = i;
				newMapping = Application.PlanToSearchSubGroupingService.save(nm);
			</cfscript>
        </cfloop>
    </cffunction>
    
    <cffunction name="getSearchSubGroupingsForPlan" access="public" roles="admin" returntype="string" hint="This method returns a list of search sub groupings applicable to a plan">
    	<cfargument name="PlanId" type="numeric" required="yes" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	SearchSubGroupingId
            FROM 	PlanToSearchSubGrouping
            WHERE PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.PlanId#">
        </cfquery>
        
        <cfscript>
			if (gi.recordCount GT 0) {
				VARIABLES.PlanSubGroupings = ValueList(gi.SearchSubGroupingId);
			}
			else {
				VARIABLES.PlanSubGroupings = "";
			}
		</cfscript>
        
        <cfreturn VARIABLES.PlanSubGroupings>
    </cffunction>
    
     <cffunction name="deleteSearchSubGroupingsForPlan" access="public" roles="admin" returntype="void" hint="This method deletes search sub groupings applicable to a plan">
    	<cfargument name="PlanId" type="numeric" required="yes" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	DELETE
            FROM 	PlanToSearchSubGrouping
            WHERE PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.PlanId#">
        </cfquery>
    </cffunction>
</cfcomponent>