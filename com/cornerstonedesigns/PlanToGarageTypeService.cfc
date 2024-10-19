<cfcomponent extends="PlanToGarageTypeGateway">
	<cffunction name="loadGarageTypes" access="public" roles="admin" returntype="void" hint="This method loads garage types for a plan">
    	<cfargument name="gti" required="yes" type="struct" hint="This argument expects a structure containing the PlanId and its corresponding garage types">
		
        <cfscript>
			VARIABLES.currentlyMapped = Application.PlanToGarageTypeService.getGarageTypesForPlan(ARGUMENTS.gti.PlanId);
		</cfscript>
        
        <cfloop list="#ARGUMENTS.gti.GarageTypes#" index="i">
        	<cfscript>
				if (ListFind(VARIABLES.currentlyMapped,i) EQ 0) {
					nm = CreateObject("component","com.cornerstonedesigns.PlanToGarageType").init();
					nm.PlanId = ARGUMENTS.gti.PlanId;
					nm.GarageTypeId = i;
					newMapping = Application.PlanToGarageTypeService.save(nm);
				}
			</cfscript>
        </cfloop>
    </cffunction>
    
    <cffunction name="getGarageTypesForPlan" access="public" roles="admin" returntype="string" hint="This method returns a list of garage types applicable to a plan">
    	<cfargument name="PlanId" type="numeric" required="yes" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	GarageTypeId
            FROM 	PlanToGarageType
            WHERE PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.PlanId#">
        </cfquery>
        
        <cfscript>
			if (gi.recordCount GT 0) {
				VARIABLES.GarageTypes = ValueList(gi.GarageTypeId);
			}
			else {
				VARIABLES.GarageTypes = "";
			}
		</cfscript>
        
        <cfreturn VARIABLES.GarageTypes>
    </cffunction>
    
    <cffunction name="deleteDuplicates" returntype="void" access="public" roles="admin" hint="This method deleted duplicate Plan to Garage Type mappings">
    	<cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="dd">
        	WITH CTE(PlanId, GarageTypeId, DuplicateCount)
            AS
            (SELECT PlanId, GarageTypeId, ROW_NUMBER() OVER (PARTITION BY PlanId, GarageTypeId ORDER BY PlanId) AS DuplicateCount
			FROM PlanToGarageType)
    		DELETE FROM CTE
     		WHERE DuplicateCount > 1
        </cfquery>
    </cffunction>
    
    <cffunction name="deleteGarageTypesForPlan" returntype="void" access="public" roles="admin" hint="This method deletes plan to garage type mappings">
    	<cfargument name="PlanId" type="numeric" required="yes" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="dp">
        	DELETE FROM PlanToGarageType
            WHERE PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.PlanId#">
        </cfquery>
    </cffunction>
</cfcomponent>