<cfif IsDefined("URL.reset")>
	<cflock scope="session" type="exclusive" timeout="2">
    	<cfscript>
			Session.qsPlanType = 0;
			Session.qsSquareFootageLow = 0;
			Session.qsSquareFootageHigh = 12000;
			Session.qsBedrooms = 100;
			Session.qsBathrooms = 100;
		</cfscript>
    </cflock>
</cfif>

<cfif IsDefined("URL.PlanType")>
	<cflock scope="session" type="exclusive" timeout="2">
    	<cfscript>
			if (IsNumeric(URL.PlanType)) {
				Session.qsPlanType = URL.PlanType;
			}
		</cfscript>
    </cflock>
</cfif>

<cfif IsDefined("URL.SquareFootageLow")>
	<cflock scope="session" type="exclusive" timeout="2">
    	<cfscript>
			if (IsNumeric(URL.SquareFootageLow)) {
				Session.qsSquareFootageLow = URL.SquareFootageLow;
			}
		</cfscript>
    </cflock>
</cfif>

<cfif IsDefined("URL.SquareFootageHigh")>
	<cflock scope="session" type="exclusive" timeout="2">
    	<cfscript>
			if (IsNumeric(URL.SquareFootageHigh)) {
				Session.qsSquareFootageHigh = URL.SquareFootageHigh;
			}
		</cfscript>
    </cflock>
</cfif>

<cfif IsDefined("URL.Bedrooms")>
	<cflock scope="session" type="exclusive" timeout="2">
    	<cfscript>
			if (IsNumeric(URL.Bedrooms)) {
				Session.qsBedrooms = URL.Bedrooms;
			}
		</cfscript>
    </cflock>
</cfif>

<cfif IsDefined("URL.Bathrooms")>
	<cflock scope="session" type="exclusive" timeout="2">
    	<cfscript>
			if (IsNumeric(URL.Bathrooms)) {
				Session.qsBathrooms = URL.Bathrooms;
			}
		</cfscript>
    </cflock>
</cfif>

<cflock scope="session" type="readonly" timeout="2">
	<cfscript>
		if (IsNumeric(Session.qsBathrooms)) {
			VARIABLES.Bathrooms = Session.qsBathrooms;
		}
		else {
			VARIABLES.Bathrooms = 100;
		}
		if (IsNumeric(Session.qsPlanType)) {
			VARIABLES.PlanType = Session.qsPlanType;
		}
		else {
			VARIABLES.PlanType = 0;
		}
		if (IsNumeric(Session.qsSquareFootageLow)) {
			VARIABLES.SquareFootageLow = Session.qsSquareFootageLow;
		}
		else {
			VARIABLES.SquareFootageLow = 0;
		}
		if (IsNumeric(Session.qsSquareFootageHigh)) {
			VARIABLES.SquareFootageHigh = Session.qsSquareFootageHigh;
		}
		else {
			VARIABLES.SquareFootageHigh = 12000;
		}
		if (IsNumeric(Session.qsBedrooms)) {
			VARIABLES.Bedrooms = Session.qsBedrooms;
		}
		else {
			VARIABLES.Bedrooms = 100;
		}
	</cfscript>
</cflock>  

<cfscript>
	VARIABLES.br = Application.BedroomService.getBedroomsForSearch();
	VARIABLES.fbr = Application.FullBathroomService.getFullBathroomsForSearch();
	VARIABLES.ptng = Application.PlanTypeService.getPlanTypesForNonGarageSearch();
	VARIABLES.pt = Application.PlanTypeService.getAllAsQuery();
	planTitlePicklist = Application.PlanService.getPlanTitlePicklistforQuickSearch();
	VARIABLES.planNumberPicklist = Application.PlanService.getPlanNumberPicklistforQuickSearch();
</cfscript>

<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="sr">
	SELECT  PlanId
    FROM 	[Plan] 
    WHERE	DisplayPlan = 1
    		AND TotalSF BETWEEN <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.SquareFootageLow#"> AND <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.SquareFootageHigh#">
    		<cfif PlanType NEQ 0>AND PlanTypeId = <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.PlanType#"></cfif>
            <cfif VARIABLES.Bedrooms NEQ 100>AND BedroomId >= <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.Bedrooms#"></cfif>
            <cfif VARIABLES.Bathrooms NEQ 100>AND FullBathroomId >= <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.Bathrooms#"></cfif>
</cfquery>

<cflock scope="session" type="exclusive" timeout="2">
	<cfscript>
        Session.QuickSearchPlans = ValueList(sr.PlanId);
    </cfscript>
</cflock>

<cflock scope="session" type="readonly" timeout="2">
	<cfscript>
		VARIABLES.QuickSearchPlanCount = ListLen(Session.QuickSearchPlans);
	</cfscript>
</cflock>