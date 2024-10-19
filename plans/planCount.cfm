<cfscript>
	pi = StructNew();
	if (IsNumeric(URL.SquareFootageLow)) {
		pi.SquareFootageLow = URL.SquareFootageLow;
	}
	else {
		pi.SquareFootageLow = 0;
	}
	if (IsNumeric(URL.SquareFootageHigh)) {
		pi.SquareFootageHigh = URL.SquareFootageHigh;
	}
	else {
		URL.SquareFootageHigh = 11000;	
	}
	if (IsNumeric(URL.PlanTypeId)) {
		pi.PlanTypeId = URL.PlanTypeId;
	}
	else {
		pi.PlanTypeId = 0;
	}
	if (IsNumeric(URL.Bedrooms)) {
		pi.Bedrooms = URL.Bedrooms;
	}
	else {
		pi.Bedrooms = 100;
	}
	if (IsNumeric(URL.Bathrooms)) {
		if (URL.Bathrooms EQ 6) {
			pi.Bathrooms = 5;
		}
		else {
			pi.Bathrooms = URL.Bathrooms;
		}
	}
	else {
		pi.Bathrooms = 100;
	}
	VARIABLES.planResults = Application.PlanSearchService.getPlansForQuickSearch(pi);

	Session.qsPlanType = URL.PlanTypeId;
	Session.qsSquareFootageLow = URL.SquareFootageLow;
	Session.qsSquareFootageHigh = URL.SquareFootageHigh;
	Session.qsBedrooms = URL.Bedrooms;
	Session.qsBathrooms = URL.Bathrooms;
	Session.QuickSearchPlans = VARIABLES.planResults.Plans;
</cfscript>

Plans Found: <cfoutput><span style="font-size:22px;">#VARIABLES.planResults.PlanCount#</span></cfoutput>