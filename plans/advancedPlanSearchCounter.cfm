<cfif NOT IsDefined("Form.SquareFootageLow")>
	<cfabort>
</cfif>

<cfscript>
	// Bonus Space Location Picklist
     VARIABLES.BonusSpaceLocationPicklist = "Any,Lower Floor,Main Floor,Upper Floor,3rd Floor";
</cfscript>

<!--- Convert Session to Local Variables --->
    	<cfscript>			
			// Set the Plan View Type
			if (IsDefined("Form.PVT1")) {
				if (Form.PVT1 EQ "true") {
					Session.PlanViewType = "detailed";				
				}
				else {
					Session.PlanViewType = "gallery";	
				}
			}
			else {
				Session.PlanViewType = "gallery";
			}			
			
			// Set the Plan Sort Option
			Session.PlanSortOption = 1;
			if (IsDefined("Form.so")) {
				if (IsNumeric(Form.so)) {
					if (Form.so EQ 1) {
						Session.PlanSortOption = 1;
					}
					if (Form.so EQ 2) {
						Session.PlanSortOption = 2;
					}
				}
			}
			
			// Set the Plans Per Page
			if (IsDefined("Form.ppp")) {
				if (IsNumeric(Form.ppp)) {
					Session.PlansPerPage = Form.ppp;	
				}
				else {
					Session.PlansPerPage = 12;
				}
			}
			else {
				Session.PlansPerPage = 12;	
			}
			
			// Set the PlanTypeId
			if (IsDefined("Form.PlanTypeId")) {
				if (IsNumeric(Form.PlanTypeId)) {
					Session.PlanTypeId = Form.PlanTypeId	;
				}
				else {
					Session.PlanTypeId = 100;
				}
			}
			else {
				Session.PlanTypeId = 100;
			}
			
			// Set the Square Footage
			if (IsNumeric(Form.SquareFootageLow)) {
				if (IsNumeric(Form.SquareFootageHigh)) {
					if (Form.SquareFootageLow LTE Form.SquareFootageHigh) {
						Session.TotalSFLow = Form.SquareFootageLow;
					}
					else {
						Session.TotalSFLow = Form.SquareFootageHigh;
					}
				}
				else {
					Session.TotalSFLow = Form.SquareFootageLow;
				}
			}
			else {
				Session.TotalSFLow = 0;
			}
			if (IsNumeric(Form.SquareFootageHigh)) {
				Session.TotalSFHigh = Form.SquareFootageHigh;
			}
			else {
				Session.TotalSFHigh = 11000;
			}

			// Set the House Width
			if (IsNumeric(Form.houseWidthLow)) {
				Session.HouseDimensionWidthFtLow = Form.houseWidthLow;
			}
			else {
				Session.HouseDimensionWidthFtLow = "Minimum";
			}
			if (IsNumeric(Form.houseWidthHigh)) {
				Session.HouseDimensionWidthFtHigh = Form.houseWidthHigh;
			}
			else {
				Session.HouseDimensionWidthFtHigh = "Maximum";
			}
			
			// Set the House Depth
			if (IsNumeric(Form.houseDepthLow)) {
				Session.HouseDimensionDepthFtLow = Form.houseDepthLow;
			}
			else {
				Session.HouseDimensionDepthFtLow = "Minimum";
			}
			if (IsNumeric(Form.houseDepthHigh)) {
				Session.HouseDimensionDepthFtHigh = Form.houseDepthHigh;
			}
			else {
				Session.HouseDimensionDepthFtHigh = "Maximum";
			}
			
			// Set the House Height
			if (IsNumeric(Form.houseHeightLow)) {
				Session.HouseDimensionHeightFtLow = Form.houseHeightLow;
			}
			else {
				Session.HouseDimensionHeightFtLow = "Minimum";
			}
			if (IsNumeric(Form.houseHeightHigh)) {
				Session.HouseDimensionHeightFtHigh = Form.houseHeightHigh;
			}
			else {
				Session.HouseDimensionHeightFtHigh = "Maximum";
			}
			
			// Set the BedroomId
			if (IsNumeric(Form.BedroomId)) {
				Session.BedroomId = Form.BedroomId	;
			}
			else {
				Session.BedroomId = 100;
			}
			
			// Set the Full Bath Id
			if (IsNumeric(Form.FullBathId)) {
				Session.FullBathId = Form.FullBathId	;
			}
			else {
				Session.FullBathId = 100;
			}
			
			// Set the Master Bedroom Location Id
			if (IsNumeric(Form.MasterBedroomLocationId)) {
				Session.MasterBedroomLocationId = Form.MasterBedroomLocationId	;
			}
			else {
				Session.MasterBedroomLocationId = 100;
			}
			
			// Set the Covered Porch Id
			if (IsNumeric(Form.CoveredPorchId)) {
				Session.CoveredPorchId = Form.CoveredPorchId	;
			}
			else {
				Session.CoveredPorchId = 100;
			}
			
			// Set the Garage Size Id
			if (IsNumeric(Form.GarageSizeId)) {
				Session.GarageSizeId = Form.GarageSizeId	;
			}
			else {
				Session.GarageSizeId = 100;
			}
			
			// Set the Garage Type Id
				if (IsNumeric(Form.GarageTypeId)) {
					Session.GarageTypeId = Form.GarageTypeId	;
				}
				else {
					Session.GarageTypeId = 100;
				}
			
			// Set the Garage Door Location Id
				if (IsNumeric(Form.GarageDoorLocationId)) {
					Session.GarageDoorLocationId = Form.GarageDoorLocationId	;
				}
				else {
					Session.GarageDoorLocationId = 100;
				}
			
            // Set the Bonus Space Location
				if (ListFind(VARIABLES.BonusSpaceLocationPicklist,Form.bonusSpaceLocation) GT 0) {
					Session.BonusRecSpace = Form.bonusSpaceLocation;
				}
				else {
					Session.BonusRecSpace = "Any";
				}
			
			// Set the Living Space Arrangement Id
				if (IsNumeric(Form.LivingArrangementId)) {
					Session.LivingArrangementId = Form.LivingArrangementId	;
				}
				else {
					Session.LivingArrangementId = 100;
				}
			</cfscript>

<!--- Convert Session to Local Variables --->
		<cfscript>
            VARIABLES.PlanTypeId = Session.PlanTypeId;
            VARIABLES.TotalSFLow = Session.TotalSFLow;
            VARIABLES.TotalSFHigh = Session.TotalSFHigh;
            VARIABLES.HouseDimensionWidthFtLow = Session.HouseDimensionWidthFtLow;
            VARIABLES.HouseDimensionWidthFtHigh = Session.HouseDimensionWidthFtHigh;
            VARIABLES.HouseDimensionDepthFtLow = Session.HouseDimensionDepthFtLow;
            VARIABLES.HouseDimensionDepthFtHigh = Session.HouseDimensionDepthFtHigh;
			VARIABLES.HouseDimensionHeightFtLow = Session.HouseDimensionHeightFtLow;
            VARIABLES.HouseDimensionHeightFtHigh = Session.HouseDimensionHeightFtHigh;
            VARIABLES.BedroomId = Session.BedroomId;
            VARIABLES.FullBathId = Session.FullBathId;
            VARIABLES.MasterBedroomLocationId = Session.MasterBedroomLocationId;
            VARIABLES.CoveredPorchId = Session.CoveredPorchId;
            VARIABLES.GarageSizeId = Session.GarageSizeId;
			VARIABLES.GarageTypeId = Session.GarageTypeId;
            VARIABLES.GarageDoorLocationId = Session.GarageDoorLocationId;
            VARIABLES.BonusRecSpace = Session.BonusRecSpace;
            VARIABLES.LivingArrangementId = Session.LivingArrangementId;
			VARIABLES.PlanViewType = Session.PlanViewType;
        </cfscript>
    
    <!--- Get matching plans --->
    	<cfscript>
			VARIABLES.pi = StructNew();
			VARIABLES.pi.PlanTypeId = VARIABLES.PlanTypeId;
			VARIABLES.pi.TotalSFLow = VARIABLES.TotalSFLow;
			VARIABLES.pi.TotalSFHigh = VARIABLES.TotalSFHigh;
			VARIABLES.pi.HouseDimensionWidthFtLow = VARIABLES.HouseDimensionWidthFtLow;
			VARIABLES.pi.HouseDimensionWidthFtHigh = VARIABLES.HouseDimensionWidthFtHigh;
			VARIABLES.pi.HouseDimensionDepthFtLow = VARIABLES.HouseDimensionDepthFtLow;
			VARIABLES.pi.HouseDimensionDepthFtHigh = VARIABLES.HouseDimensionDepthFtHigh;
			VARIABLES.pi.HouseDimensionHeightFtLow = VARIABLES.HouseDimensionHeightFtLow;
			VARIABLES.pi.HouseDimensionHeightFtHigh = VARIABLES.HouseDimensionHeightFtHigh;
			VARIABLES.pi.BedroomId = VARIABLES.BedroomId;
			VARIABLES.pi.FullBathId = VARIABLES.FullBathId;
			VARIABLES.pi.MasterBedroomLocationId = VARIABLES.MasterBedroomLocationId;
			VARIABLES.pi.CoveredPorchId = VARIABLES.CoveredPorchId;
			VARIABLES.pi.GarageSizeId = VARIABLES.GarageSizeId;
			VARIABLES.pi.GarageTypeId = VARIABLES.GarageTypeId;
			VARIABLES.pi.GarageDoorLocationId = VARIABLES.GarageDoorLocationId;
			VARIABLES.pi.BonusRecSpace = VARIABLES.BonusRecSpace;
			VARIABLES.pi.LivingArrangementId = VARIABLES.LivingArrangementId;
			VARIABLES.asr = Application.PlanSearchService.getAdvancedSearchResults(VARIABLES.pi);
		</cfscript>
        
    <!--- Update Advanced Search Plans Session Variable --->
		<cfscript>
            Session.AdvancedSearchPlans = VARIABLES.asr.Plans;
        </cfscript>

Plans Found: <cfoutput><span style="font-size:20px;">#VARIABLES.asr.MatchingPlanCount#</span></cfoutput>