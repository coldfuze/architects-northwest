<cfscript>
	VARIABLES.PlanId = 1396;
	// Determine which floor plans to display
	VARIABLES.mainFloorPlanPath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normal/MainFloorPlan.gif';
	VARIABLES.mainFloorPlanReversePath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normalReverse/MainFloorPlan.gif';
	VARIABLES.mainFloorPlanAbsolutePath = ExpandPath(VARIABLES.mainFloorPlanPath);
	if (FileExists(VARIABLES.mainFloorPlanAbsolutePath)) {
		VARIABLES.hasMainFloorPlan = 1;	
	}
	VARIABLES.upperFloorPlanPath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normal/UpperFloorPlan.gif';
	VARIABLES.upperFloorPlanReversePath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normalReverse/UpperFloorPlan.gif';
	VARIABLES.upperFloorPlanAbsolutePath = ExpandPath(VARIABLES.upperFloorPlanPath);
	if (FileExists(VARIABLES.upperFloorPlanAbsolutePath)) {
		VARIABLES.hasUpperFloorPlan = 1;	
	}
	VARIABLES.lowerFloorPlanPath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normal/LowerFloorPlan.gif';
	VARIABLES.lowerFloorPlanReversePath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normalReverse/LowerFloorPlan.gif';
	VARIABLES.lowerFloorPlanAbsolutePath = ExpandPath(VARIABLES.lowerFloorPlanPath);
	if (FileExists(VARIABLES.lowerFloorPlanAbsolutePath)) {
		VARIABLES.hasLowerFloorPlan = 1;	
	}
	VARIABLES.thirdFloorPlanPath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normal/ThirdFloorPlan.gif';
	VARIABLES.thirdFloorPlanReversePath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normalReverse/ThirdFloorPlan.gif';
	VARIABLES.thirdFloorPlanAbsolutePath = ExpandPath(VARIABLES.thirdFloorPlanPath);
	if (FileExists(VARIABLES.thirdFloorPlanAbsolutePath)) {
		VARIABLES.hasThirdFloorPlan = 1;	
	}

	VARIABLES.PlanImage = Application.PlanImageService.getPlanImageForPrintPlan(VARIABLES.PlanId);
</cfscript>

<cfdocument format="pdf" margintop="0.25" marginbottom="0.6" marginright="1" marginleft="1" overwrite="yes" saveasname="Test.pdf" fontembed="yes">
	<img src="https://www.architectsnw.com/assets/printPlanImages/CornerStoneDesignsHeader.png" width="100%">
	<cfscript>
		writeDump(VARIABLES);
	</cfscript>
</cfdocument>