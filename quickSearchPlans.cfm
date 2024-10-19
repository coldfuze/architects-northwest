<cfscript>
	VARIABLES.qspi = StructNew();
	
	if (IsDefined("Form.SquareFootageLow")) {
		if (IsNumeric(Form.SquareFootageLow)) {
			VARIABLES.qspi.SquareFootageLow = Form.SquareFootageLow;
		}
		else {
			VARIABLES.qspi.SquareFootageLow = 0;
		}
	}
	else {
		VARIABLES.qspi.SquareFootageLow = 0;
	}
	
	if (IsDefined("Form.SquareFootageHigh")) {
		if (IsNumeric(Form.SquareFootageHigh)) {
			VARIABLES.qspi.SquareFootageHigh = Form.SquareFootageHigh;
		}
		else {
			VARIABLES.qspi.SquareFootageHigh = 11000;	
		}
	}
	else {
		VARIABLES.qspi.SquareFootageHigh = 11000;	
	}
	
	if (IsDefined("Form.PlanTypeId")) {
		if (IsNumeric(Form.PlanTypeId)) {
			VARIABLES.qspi.PlanTypeId = Form.PlanTypeId;
		}
		else {
			VARIABLES.qspi.PlanTypeId = 0;
		}
	}
	else {
		VARIABLES.qspi.PlanTypeId = 0;
	}
	
	if (IsDefined("Form.Bedrooms")) {
		if (IsNumeric(Form.Bedrooms)) {
			VARIABLES.qspi.Bedrooms = Form.Bedrooms;
		}
		else {
			VARIABLES.qspi.Bedrooms = 100;
		}
	}
	else {
		VARIABLES.qspi.Bedrooms = 100;
	}
	
	if (IsDefined("Form.Bathrooms")) {
		if (IsNumeric(Form.Bathrooms)) {
			if (Form.Bathrooms EQ 6) {
				VARIABLES.qspi.Bathrooms = 5;
			}
			else {
				VARIABLES.qspi.Bathrooms = Form.Bathrooms;
			}
		}
		else {
			VARIABLES.qspi.Bathrooms = 100;
		}
	}
	else {
		VARIABLES.qspi.Bathrooms = 100;
	}
	
	VARIABLES.planResults = Application.PlanSearchService.getPlansForQuickSearch(VARIABLES.qspi);
</cfscript>

<cfscript>
	Session.qsPlanType = VARIABLES.qspi.PlanTypeId;
	Session.qsSquareFootageLow = VARIABLES.qspi.SquareFootageLow;
	Session.qsSquareFootageHigh = VARIABLES.qspi.SquareFootageHigh;
	Session.qsBedrooms = VARIABLES.qspi.Bedrooms;
	Session.qsBathrooms = VARIABLES.qspi.Bathrooms;
	Session.QuickSearchPlans = VARIABLES.planResults.Plans;
</cfscript>

Plans Found: <cfoutput><span style="font-size:22px;">#VARIABLES.planResults.PlanCount#</span></cfoutput>