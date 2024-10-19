<cfcomponent extends="PlanSearchGateway">
	<cffunction name="getSideBarLinks" access="public" returntype="string">
		<cfargument name="SearchGroupingId" required="yes" type="numeric" hint="This argument expects a numeric SearchGroupingId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="planGroupLinks">
        	SELECT 	FormattedPageTitle, 
            		CASE WHEN PlanSearchId != 5 THEN '/plans/planSearchResults.cfm?Id=' + CAST(PlanSearchId AS varchar(3)) 
                    ELSE '/plans/homesByDesigner.cfm'
                    END AS Link
            FROM	PlanSearch
            WHERE	SearchGroupingId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.SearchGroupingId#">
            ORDER BY SortOrder
        </cfquery>
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="planGrouping">
        	SELECT 	SearchGroupingLabel, Link
            FROM	SearchGrouping
            WHERE	SearchGroupingId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.SearchGroupingId#">
        </cfquery>
        
        <cfsavecontent variable="links">
			<cfoutput query="planGrouping"><h1 class="planStyleTitle"><a href="#Link#" class="brownLink">#SearchGroupingLabel#</a></h1></cfoutput>
            <cfoutput query="planGroupLinks"><a class="planSearch" href="#Link#">#FormattedPageTitle#</a><cfif planGroupLinks.currentRow LT planGroupLinks.recordCount><br /></cfif></cfoutput>
		</cfsavecontent>
        
		<cfreturn links>
	</cffunction>
    
    <cffunction name="getPlanSearchResults" access="public" returntype="struct" hint="This method returns a structure containing a list of plans and the title for the plan search type">
    	<cfargument name="PlanSearchId" type="numeric" required="yes" hint="This method expects a numeric PlanSearchId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="qi">
        	SELECT 	PageTitle, SQL AS SQLStatement
            FROM 	PlanSearch
            WHERE	PlanSearchId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.PlanSearchId#">
        </cfquery>
        
        <cfif qi.RecordCount EQ 1>
            <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
                <cfoutput>#qi.SQLStatement#</cfoutput>
            </cfquery>
            
            <cfscript>
                VARIABLES.pi = StructNew();
                VARIABLES.pi.PageTitle = qi.PageTitle;
                VARIABLES.pi.Plans = ValueList(gi.PlanId);
                VARIABLES.pi.MatchingPlanCount = ListLen(VARIABLES.pi.Plans);
            </cfscript>
        <cfelse>
        	<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
                SELECT  PlanId FROM [Plan] WHERE DisplayPlan = 1
            </cfquery>
            
            <cfscript>
                VARIABLES.pi = StructNew();
                VARIABLES.pi.PageTitle = 'SHOW ALL PLANS';
                VARIABLES.pi.Plans = ValueList(gi.PlanId);
                VARIABLES.pi.MatchingPlanCount = ListLen(VARIABLES.pi.Plans);
            </cfscript>
        </cfif>
        <cfreturn VARIABLES.pi>
    </cffunction>
    
    <cffunction name="getAdvancedSearchResults" access="public" returntype="struct" hint="This method returns a structure containing a list of plans">
    	<cfargument name="pi" type="struct" required="yes" hint="This argument expects a structure of Advanced Search Criteria">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	DISTINCT a.PlanId, a.TotalSF
            FROM	[Plan] a
					<cfif IsNumeric(ARGUMENTS.pi.GarageTypeId)><cfif ARGUMENTS.pi.GarageTypeId NEQ 100>INNER JOIN PlanToGarageType b ON a.PlanId = b.PlanId</cfif></cfif>
            WHERE	a.DisplayPlan = 1
            		AND a.TotalSF BETWEEN <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.pi.TotalSFLow#"> AND <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.pi.TotalSFHigh#">
					<cfif ARGUMENTS.pi.PlanTypeId NEQ 100>AND a.PlanTypeId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.pi.PlanTypeId#"></cfif>
                    <cfif IsNumeric(ARGUMENTS.pi.HouseDimensionWidthFtLow)>AND a.HouseDimensionWidthFt >= <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.pi.HouseDimensionWidthFtLow#"></cfif>
                    <cfif IsNumeric(ARGUMENTS.pi.HouseDimensionWidthFtHigh)>AND a.HouseDimensionWidthFt <= <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.pi.HouseDimensionWidthFtHigh#"></cfif>
                    <cfif IsNumeric(ARGUMENTS.pi.HouseDimensionDepthFtLow)>AND a.HouseDimensionDepthFt >= <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.pi.HouseDimensionDepthFtLow#"></cfif>
                    <cfif IsNumeric(ARGUMENTS.pi.HouseDimensionDepthFtHigh)>AND a.HouseDimensionDepthFt <= <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.pi.HouseDimensionDepthFtHigh#"></cfif>
                    <cfif IsNumeric(ARGUMENTS.pi.HouseDimensionHeightFtLow)>AND a.HouseDimensionHeightFt >= <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.pi.HouseDimensionHeightFtLow#"></cfif>
                    <cfif IsNumeric(ARGUMENTS.pi.HouseDimensionHeightFtHigh)>AND a.HouseDimensionHeightFt <= <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.pi.HouseDimensionHeightFtHigh#"></cfif>
                    <cfif IsNumeric(ARGUMENTS.pi.BedroomId)><cfif ARGUMENTS.pi.BedroomId NEQ 100>AND a.BedroomId >= <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.pi.BedroomId#"></cfif></cfif>
                    <cfif IsNumeric(ARGUMENTS.pi.FullBathId)><cfif ARGUMENTS.pi.FullBathId NEQ 100>AND a.FullBathroomId >= <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.pi.FullBathId#"></cfif></cfif>
                    <cfif IsNumeric(ARGUMENTS.pi.MasterBedroomLocationId)>
						<cfif ARGUMENTS.pi.MasterBedroomLocationId NEQ 100>
                        	<cfif ARGUMENTS.pi.MasterBedroomLocationId EQ 1>
                            	AND a.MasterBedroomLocationId IN (<cfqueryparam cfsqltype="cf_sql_tinyint" list="yes" value="1,2,3">)
                            <cfelseif ARGUMENTS.pi.MasterBedroomLocationId EQ 2>
								AND a.MasterBedroomLocationId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="2">
                            <cfelseif ARGUMENTS.pi.MasterBedroomLocationId EQ 3>
								AND a.MasterBedroomLocationId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="3">
                            <cfelseif ARGUMENTS.pi.MasterBedroomLocationId EQ 4>
                            	AND a.MasterBedroomLocationId IN (<cfqueryparam cfsqltype="cf_sql_tinyint" list="yes" value="4,5,6">)
                            <cfelseif ARGUMENTS.pi.MasterBedroomLocationId EQ 5>
								AND a.MasterBedroomLocationId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="5">
                            <cfelseif ARGUMENTS.pi.MasterBedroomLocationId EQ 6>
								AND a.MasterBedroomLocationId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="6">
                            </cfif>
                        </cfif>
                    </cfif>
                    <cfif IsNumeric(ARGUMENTS.pi.CoveredPorchId)><cfif ARGUMENTS.pi.CoveredPorchId NEQ 100>AND a.CoveredPorchId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.pi.CoveredPorchId#"></cfif></cfif>
                    <cfif IsNumeric(ARGUMENTS.pi.GarageSizeId)><cfif ARGUMENTS.pi.GarageSizeId NEQ 100><cfif ARGUMENTS.pi.GarageSizeId EQ 1>AND a.GarageSizeId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="1"><cfelse>AND a.GarageSizeId >= <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.pi.GarageSizeId#"></cfif></cfif></cfif>
                    <cfif IsNumeric(ARGUMENTS.pi.GarageDoorLocationId)><cfif ARGUMENTS.pi.GarageDoorLocationId NEQ 100>AND a.GarageDoorLocationId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.pi.GarageDoorLocationId#"></cfif></cfif>
                    <cfif IsNumeric(ARGUMENTS.pi.LivingArrangementId)><cfif ARGUMENTS.pi.LivingArrangementId NEQ 100>AND a.LivingArrangementId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.pi.LivingArrangementId#"></cfif></cfif>
                    <cfif ARGUMENTS.pi.BonusRecSpace IS "Lower Floor">AND a.BonusRecRoomLower = 1</cfif>
                    <cfif ARGUMENTS.pi.BonusRecSpace IS "Main Floor">AND a.BonusRecRoomMain = 1</cfif>
                    <cfif ARGUMENTS.pi.BonusRecSpace IS "Upper Floor">AND a.BonusRecRoomUpper = 1</cfif>
                    <cfif ARGUMENTS.pi.BonusRecSpace IS "3rd Floor">AND a.BonusRecRoomThird = 1</cfif>
                    <cfif IsNumeric(ARGUMENTS.pi.GarageTypeId)><cfif ARGUMENTS.pi.GarageTypeId NEQ 100>AND b.GarageTypeId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.pi.GarageTypeId#"></cfif></cfif>
             ORDER BY a.TotalSF DESC
        </cfquery>

        <cfscript>
			VARIABLES.pi = StructNew();
			VARIABLES.pi.Plans = ValueList(gi.PlanId);
			VARIABLES.pi.MatchingPlanCount = gi.recordCount;
		</cfscript>
        
        <cfreturn VARIABLES.pi>
    </cffunction>
    
    <cffunction name="getDisplayPlans" returntype="numeric" access="remote">
    	<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT Count(*) AS PlanCount
            FROM [Plan]
            WHERE DisplayPlan = 1
        </cfquery>
        
        <cfreturn gi.PlanCount>
    </cffunction>
    
    <cffunction name="getPlansForQuickSearch" returntype="struct" access="remote" hint="This method returns a count of matching plans for a quick search">
   		<cfargument name="pi" required="yes" type="struct" hint="This argument expects a structure of quick search criteria">
        
        <cfscript>
			if (IsNumeric(ARGUMENTS.pi.SquareFootageLow)) {
				VARIABLES.SquareFootageLow = ARGUMENTS.pi.SquareFootageLow;
			}
			else {
				VARIABLES.SquareFootageLow = 0;	
			}
			
			if (IsNumeric(ARGUMENTS.pi.SquareFootageHigh)) {
				VARIABLES.SquareFootageHigh = ARGUMENTS.pi.SquareFootageHigh;
			}
			else {
				VARIABLES.SquareFootageHigh = 11000;
			}
			
			if (IsNumeric(ARGUMENTS.pi.PlanTypeId)) {
				VARIABLES.PlanTypeId = ARGUMENTS.pi.PlanTypeId;
			}
			else {
				VARIABLES.PlanTypeId = 0;	
			}
			
			if (IsNumeric(ARGUMENTS.pi.Bedrooms)) {
				VARIABLES.Bedrooms = ARGUMENTS.pi.Bedrooms;	
			}
			else {
				VARIABLES.Bedrooms = 100;	
			}
			
			if (IsNumeric(ARGUMENTS.pi.Bathrooms)) {
				VARIABLES.Bathrooms = ARGUMENTS.pi.Bathrooms;	
			}
			else {
				VARIABLES.Bathrooms = 100;	
			}
		</cfscript>
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="sr">
            SELECT  PlanId
            FROM 	[Plan] 
            WHERE	DisplayPlan = 1
                    AND TotalSF BETWEEN <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.SquareFootageLow#"> AND <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.SquareFootageHigh#">
                    <cfif VARIABLES.PlanTypeId NEQ 0>AND PlanTypeId = <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.PlanTypeId#"></cfif>
                    <cfif VARIABLES.Bedrooms NEQ 100>AND BedroomId >= <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.Bedrooms#"></cfif>
                    <cfif VARIABLES.Bathrooms NEQ 100>AND FullBathroomId >= <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.Bathrooms#"></cfif>
        </cfquery>
        
        <cfscript>
			VARIABLES.thisPI = StructNew();
			VARIABLES.thisPI.Plans = ValueList(sr.PlanId);
			VARIABLES.thisPI.PlanCount = sr.recordCount;
		</cfscript>
        
        <cfreturn VARIABLES.thisPI>
    </cffunction>
</cfcomponent>