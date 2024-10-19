<cfsetting enablecfoutputonly="no" requesttimeout="1200">

<cfif IsDefined("URL.PlanId")>
	<cfif NOT IsValid('integer',URL.PlanId)>
    	<cflocation url="default.cfm">
    <cfelse>    
		<cfscript>
            Session.PlanId = URL.PlanId;
        </cfscript>
    </cfif>
</cfif>

<cfscript>
	VARIABLES.PlanId = Session.PlanId;
	VARIABLES.AdminId = Session.AdminId;
</cfscript>

<cfif VARIABLES.PlanId EQ 0 OR NOT IsNumeric(VARIABLES.PlanId)>
	<cflocation url="default.cfm">
</cfif>

<cfscript>
	if (IsDefined("Form.PlanNumber")) {
		tpi = CreateObject("component","com.cornerstonedesigns.Plan").init();
		tpi.PlanId = VARIABLES.PlanId;
		tpi.PlanNumber = Form.PlanNumber;
		tpi.PlanTitle = Form.PlanTitle;
		tpi.PlanShortTitle = Form.PlanShortTitle;
		tpi.PlanDescription = Form.planDescription;
		tpi.PlanDesignFeatures = "";
		tpi.PlanTypeId = Form.PlanTypeId;
		tpi.PriceCategoryId = Form.PriceCategoryId;
		tpi.DesignerId = Form.DesignerId;
		tpi.Stories = Form.Stories;
		tpi.Animation360 = Form.Animation360;
		tpi.Animation = Form.Animation;
		tpi.Video = Form.Video;
		if (IsNumeric(Form.TotalSF)) {
			tpi.TotalSF = Form.TotalSF;
		}
		else {
			tpi.TotalSF = 0;
		}
		if (IsNumeric(Form.MainFloorSF)) {
			tpi.MainFloorSF = Form.MainFloorSF;
		}
		else {
			tpi.MainFloorSF = 0;
		}
		if (IsNumeric(Form.UnitTotalSF)) {
			tpi.UnitTotalSF = Form.UnitTotalSF;
		}
		else {
			tpi.UnitTotalSF = 0;
		}
		if (IsNumeric(Form.UpperFloorSF)) {
			tpi.UpperFloorSF = Form.UpperFloorSF;
		}
		else {
			tpi.UpperFloorSF = 0;
		}
		if (IsNumeric(Form.LowerFloorSF)) {
			tpi.LowerFloorSF = Form.LowerFloorSF;
		}
		else {
			tpi.LowerFloorSF = 0;
		}
		if (IsNumeric(Form.ThirdFloorSF)) {
			tpi.ThirdFloorSF = Form.ThirdFloorSF;
		}
		else {
			tpi.ThirdFloorSF = 0;
		}
		if (IsNumeric(Form.GarageSF)) {
			tpi.GarageSF = Form.GarageSF;
		}
		else {
			tpi.GarageSF = 0;
		}
		if (IsNumeric(Form.BonusRmSF)) {
			tpi.BonusRmSF = Form.BonusRmSF;
		}
		else {
			tpi.BonusRmSF = 0;
		}
		if (IsNumeric(Form.StorageSF)) {
			tpi.StorageSF = Form.StorageSF;
		}
		else {
			tpi.StorageSF = 0;
		}
		if (IsNumeric(Form.CoveredPorchSF)) {
			tpi.CoveredPorchSF = Form.CoveredPorchSF;
		}
		else {
			tpi.CoveredPorchSF = 0;
		}
		if (IsNumeric(Form.DeckSF)) {
			tpi.DeckSF = Form.DeckSF;
		}
		else {
			tpi.DeckSF = 0;
		}
		
		if (IsNumeric(Form.CoveredPatioSF)) {
			tpi.CoveredPatioSF = Form.CoveredPatioSF;
		}
		else {
			tpi.CoveredPatioSF = 0;
		}
		tpi.FullBathroomId = Form.FullBathroomId;
		tpi.HalfBathroomId = Form.HalfBathroomId;
		tpi.BedroomId = Form.BedroomId;
		tpi.MasterBedroomLocationId = Form.MasterBedroomLocationId;
		tpi.FoundationTypeId = Form.FoundationTypeId;
		tpi.LotSlopeId = Form.LotSlopeId;
		tpi.HouseDimensionWidthFt = Form.HouseDimensionWidthFt;
		if (IsNumeric(HouseDimensionWidthIn)) {
			tpi.HouseDimensionWidthIn = Form.HouseDimensionWidthIn;
		}
		else {
			tpi.HouseDimensionWidthIn = 0;
		}
		tpi.HouseDimensionDepthFt = Form.HouseDimensionDepthFt;
		if (IsNumeric(HouseDimensionDepthIn)) {
			tpi.HouseDimensionDepthIn = Form.HouseDimensionDepthIn;
		}
		else {
			tpi.HouseDimensionDepthIn = 0;
		}
		tpi.HouseDimensionHeightFt = Form.HouseDimensionHeightFt;
		if (IsNumeric(Form.HouseDimensionHeightIn)) {
			tpi.HouseDimensionHeightIn = Form.HouseDimensionHeightIn;
		}
		else {
			tpi.HouseDimensionHeightIn = 0;
		}
		tpi.CeilingHeightMainFloor = Form.CeilingHeightMainFloor;
		tpi.CeilingHeightUpperFloor = Form.CeilingHeightUpperFloor;
		tpi.CeilingHeightThirdFloor = CeilingHeightThirdFloor;
		tpi.CeilingHeightLowerFloor = CeilingHeightLowerFloor;
		tpi.RoofLive = Form.RoofLive;
		tpi.RoofDead = Form.RoofDead;
		tpi.MaxWind = Form.MaxWind;
		tpi.RoofPrimary = Form.RoofPrimary;
		tpi.RoofSecondary = Form.RoofSecondary;
		tpi.RoofFramingId = Form.RoofFramingId;
		tpi.FloorLive = Form.FloorLive;
		tpi.FloorDead = Form.FloorDead;
		tpi.GarageSizeId = Form.GarageSizeId;
		tpi.GarageDoorLocationId = GarageDoorLocationId;
		tpi.CoveredPorchId = Form.CoveredPorchId;
		tpi.LivingArrangementId = Form.LivingArrangementId;
		if (IsDefined("Form.Den")) {
			tpi.Den = 1;
		}
		else {
			tpi.Den = 0;	
		}
		tpi.CopyrightNumber = Form.CopyrightNumber;
		if (IsDefined("Form.LaundryRoomMain")) {
			tpi.LaundryRoomMain = Form.LaundryRoomMain;
		}
		else {
			tpi.LaundryRoomMain = 0;	
		}
		if (IsDefined("Form.LaundryRoomMain")) {
			tpi.LaundryRoomMain = Form.LaundryRoomMain;
		}
		else {
			tpi.LaundryRoomMain = 0;	
		}
		if (IsDefined("Form.LaundryRoomUpper")) {
			tpi.LaundryRoomUpper = Form.LaundryRoomUpper;
		}
		else {
			tpi.LaundryRoomUpper = 0;	
		}
		if (IsDefined("Form.LaundryRoomLower")) {
			tpi.LaundryRoomLower = Form.LaundryRoomLower;
		}
		else {
			tpi.LaundryRoomLower = 0;	
		}
		if (IsDefined("Form.BonusRecRoomMain")) {
			tpi.BonusRecRoomMain = Form.BonusRecRoomMain;
		}
		else {
			tpi.BonusRecRoomMain = 0;	
		}
		if (IsDefined("Form.BonusRecRoomUpper")) {
			tpi.BonusRecRoomUpper = Form.BonusRecRoomUpper;
		}
		else {
			tpi.BonusRecRoomUpper = 0;	
		}
		if (IsDefined("Form.BonusRecRoomThird")) {
			tpi.BonusRecRoomThird = Form.BonusRecRoomThird;
		}
		else {
			tpi.BonusRecRoomThird = 0;	
		}
		if (IsDefined("Form.BonusRecRoomLower")) {
			tpi.BonusRecRoomLower = Form.BonusRecRoomLower;
		}
		else {
			tpi.BonusRecRoomLower = 0;	
		}
		if (IsDefined("Form.HandDrawn")) {
			tpi.HandDrawn = Form.HandDrawn;
		}
		else {
			tpi.HandDrawn = 0;	
		}
		tpi.DisplayPlan = Form.DisplayPlan;
		tpi.hasExistingMaterialList = Form.hasExistingMaterialList;
		VARIABLES.NewPlan = Application.PlanService.save(tpi);
		
		
		// Delete floor plans
		if (IsDefined("Form.delMainFloorPlan") OR IsDefined("Form.delUpperFloorPlan") OR IsDefined("Form.delLowerFloorPlan") OR IsDefined("Form.delThirdFloorPlan")) {
			dfp = {};
			dfp.PlanId = VARIABLES.PlanId;
			if (IsDefined("Form.delMainFloorPlan")) {
				dfp.delMainFloorPlan = 1;	
			}
			else {
				dfp.delMainFloorPlan = 0;
			}
			if (IsDefined("Form.delUpperFloorPlan")) {
				dfp.delUpperFloorPlan = 1;	
			}
			else {
				dfp.delUpperFloorPlan = 0;
			}
			if (IsDefined("Form.delLowerFloorPlan")) {
				dfp.delLowerFloorPlan = 1;	
			}
			else {
				dfp.delLowerFloorPlan = 0;
			}
			if (IsDefined("Form.delThirdFloorPlan")) {
				dfp.delThirdFloorPlan = 1;	
			}
			else {
				dfp.delThirdFloorPlan = 0;
			}
			Application.PlanService.deleteFloorPlans(dfp);
		}
		
		// Record Admin Activity
		aa = CreateObject("component","com.cornerstonedesigns.AdminActivity").init();
		aa.AdminId = VARIABLES.AdminId;
		aa.ImpactedAdminId = VARIABLES.AdminId;
		aa.ActivityDate = CreateODBCDateTime(Now());
		aa.TransactionId = 4;
		aa.PlanId=VARIABLES.PlanId;
		VARIABLES.adminActivity = Application.AdminActivityService.save(aa);
	}
</cfscript>

<cfif IsDefined("VARIABLES.NewPlan")>
	<cfscript>
		Application.PlanToSearchSubGroupingService.deleteSearchSubGroupingsForPlan(VARIABLES.PlanId);
	</cfscript>
	<cfif IsDefined("Form.SearchSubGroupingId")>
    	<cfscript>
			sgi = StructNew();
			sgi.PlanId = VARIABLES.PlanId;
			sgi.SearchSubGrouping = Form.SearchSubGroupingId;
			VARIABLES.newSubGrouping = Application.PlanToSearchSubGroupingService.loadSearchSubGroupings(sgi);
		</cfscript>
    </cfif>

	<cfif IsDefined("Form.GarageTypeId")>
        <cfscript>
			gti = StructNew();
			gti.PlanId = VARIABLES.PlanId;
			gti.GarageTypes = Form.GarageTypeId;
			VARIABLES.newGarageTypes = Application.PlanToGarageTypeService.loadGarageTypes(gti);
		</cfscript>
    <cfelse>
    	<cfscript>
			Application.PlanToGarageTypeService.deleteGarageTypesForPlan(VARIABLES.PlanId);
		</cfscript>
    </cfif>
    
    <cfscript>
		VARIABLES.floorPlanPath = '/assets/floorplans/' & VARIABLES.PlanId;
		VARIABLES.floorPlanOriginalPath = '/assets/floorplans/' & VARIABLES.PlanId & '/original';
		VARIABLES.floorPlanFullPath = '/assets/floorplans/' & VARIABLES.PlanId & '/full';
		VARIABLES.floorPlanFullReversePath = '/assets/floorplans/' & VARIABLES.PlanId & '/fullReverse';
		VARIABLES.floorPlanNormalPath = '/assets/floorplans/' & VARIABLES.PlanId & '/normal';
		VARIABLES.floorPlanNormalReversePath = '/assets/floorplans/' & VARIABLES.PlanId & '/normalReverse';
		VARIABLES.videoPath = '/assets/videos';
		VARIABLES.animationPath = '/assets/animations';
		VARIABLES.floorPlanOriginalUploadPath = ExpandPath(VARIABLES.floorPlanOriginalPath);
		VARIABLES.floorPlanFullUploadPath = ExpandPath(VARIABLES.floorPlanFullPath);
		VARIABLES.floorPlanNormalUploadPath = ExpandPath(VARIABLES.floorPlanNormalPath);
		VARIABLES.floorPlanFullReverseUploadPath = ExpandPath(VARIABLES.floorPlanFullReversePath);
		VARIABLES.floorPlanNormalReverseUploadPath = ExpandPath(VARIABLES.floorPlanNormalReversePath);
		VARIABLES.videoUploadPath = ExpandPath(VARIABLES.videoPath);
		VARIABLES.animationUploadPath = ExpandPath(VARIABLES.animationPath);
	</cfscript>
    
    <cfif NOT DirectoryExists(VARIABLES.floorPlanOriginalUploadPath)>
    	<cfdirectory action="create" directory="#VARIABLES.floorPlanOriginalUploadPath#">
    </cfif>
    <cfif NOT DirectoryExists(VARIABLES.floorPlanFullUploadPath)>
    	<cfdirectory action="create" directory="#VARIABLES.floorPlanFullUploadPath#">
    </cfif>
    <cfif NOT DirectoryExists(VARIABLES.floorPlanFullReverseUploadPath)>
    	<cfdirectory action="create" directory="#VARIABLES.floorPlanFullReverseUploadPath#">
    </cfif>
    <cfif NOT DirectoryExists(VARIABLES.floorPlanNormalUploadPath)>
    	<cfdirectory action="create" directory="#VARIABLES.floorPlanNormalUploadPath#">
    </cfif>
    <cfif NOT DirectoryExists(VARIABLES.floorPlanNormalReverseUploadPath)>
    	<cfdirectory action="create" directory="#VARIABLES.floorPlanNormalReverseUploadPath#">
    </cfif>
    
    <cfif LEN(TRIM(Form.newAnimation)) GT 0>
    	<cfscript>
			VARIABLES.currentAnimation = Application.PlanService.getAnimationForPlan(VARIABLES.PlanId);
		</cfscript>
        
        <cfif LEN(TRIM(VARIABLES.currentAnimation)) GT 0>            
			<cfscript>
                VARIABLES.existingAnimation = VARIABLES.animationUploadPath & '\' & VARIABLES.currentAnimation;
            </cfscript>
            
            <cfif FileExists(VARIABLES.existingAnimation)>
                <cffile action="delete" file="#VARIABLES.existingAnimation#">
            </cfif>
        </cfif>
        
    	<cffile action="upload" filefield="newAnimation" nameconflict="overwrite" destination="#VARIABLES.animationUploadPath#">
        
        <cfscript>
			VARIABLES.ai = StructNew();
			VARIABLES.ai.PlanId = VARIABLES.PlanId;
			VARIABLES.ai.Animation = CFFile.ServerFile;
			VARIABLES.updatedAnimation = Application.PlanService.updateAnimationForPlan(VARIABLES.ai);
		</cfscript>
    </cfif>
    
    <cfif LEN(TRIM(Form.newVideo)) GT 0>
    	<cfscript>
			VARIABLES.currentVideo = Application.PlanService.getVideoForPlan(VARIABLES.PlanId);
		</cfscript>
        
        <cfif LEN(TRIM(VARIABLES.currentVideo)) GT 0>            
			<cfscript>
                VARIABLES.existingVideo = VARIABLES.VideoUploadPath & '\' & VARIABLES.currentVideo;
            </cfscript>
            
            <cfif FileExists(VARIABLES.existingVideo)>
                <cffile action="delete" file="#VARIABLES.existingVideo#">
            </cfif>
        </cfif>
        
    	<cffile action="upload" filefield="newVideo" nameconflict="overwrite" destination="#VARIABLES.VideoUploadPath#">
        
        <cfscript>
			VARIABLES.ai = StructNew();
			VARIABLES.ai.PlanId = VARIABLES.PlanId;
			VARIABLES.ai.Video = CFFile.ServerFile;
			VARIABLES.updatedVideo = Application.PlanService.updateVideoForPlan(VARIABLES.ai);
		</cfscript>
    </cfif>
    
    <cfif IsDefined("Form.YouTube")>
    	<cfif LEN(TRIM(Form.YouTube)) GT 0>
        	<cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="updateYouTube">
            	UPDATE [Plan]
                SET YouTube = <cfqueryparam cfsqltype="cf_sql_varchar" value="#Form.YouTube#" maxlength="200">
                WHERE PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.PlanId#">
            </cfquery>
        </cfif>
    </cfif>
    
    <cfif LEN(TRIM(Form.MainFloorPlan)) GT 0>
    	<cffile action="upload" filefield="MainFloorPlan" nameconflict="overwrite" destination="#floorPlanOriginalUploadPath#">
        
        <cfscript>
			VARIABLES.MainFloorPlanFile = CFFile.ServerFile;
			VARIABLES.NewMainFloorPlanFile = Form.PlanNumber & 'MainFloorPlan.gif';
			VARIABLES.MainFloorPlanFilePath = VARIABLES.floorPlanOriginalUploadPath & '\' & VARIABLES.MainFloorPlanFile;
			VARIABLES.NewMainFloorPlanFilePath = VARIABLES.floorPlanOriginalUploadPath & '\' & VARIABLES.NewMainFloorPlanFile;
		</cfscript>
        
        <cfif FileExists(VARIABLES.NewMainFloorPlanFilePath)>
        	<cffile action="delete" file="#VARIABLES.NewMainFloorPlanFilePath#">
        </cfif> 
        
        <cffile action="rename" source="#VARIABLES.MainFloorPlanFilePath#" destination="#VARIABLES.NewMainFloorPlanFilePath#">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="ui">
            UPDATE [Plan]
            SET 	MainFloorPlan = <cfqueryparam cfsqltype="cf_sql_varchar" value="#VARIABLES.NewMainFloorPlanFile#">
            WHERE 	PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#VARIABLES.PlanId#">
        </cfquery>
            
        <cfscript>
			VARIABLES.ii = StructNew();
			VARIABLES.ii.FloorPlan = "MainFloorPlan";
			VARIABLES.ii.OriginalFilePath = VARIABLES.NewMainFloorPlanFilePath;
			VARIABLES.ii.PlanId = VARIABLES.PlanId;
			VARIABLES.ii.FileName = VARIABLES.NewMainFloorPlanFile;
			VARIABLES.ii.FullUploadPath = VARIABLES.floorPlanFullUploadPath;
			VARIABLES.ii.FullReverseUploadPath = VARIABLES.floorPlanFullReverseUploadPath;
			VARIABLES.ii.NormalUploadPath = VARIABLES.floorPlanNormalUploadPath;
			VARIABLES.ii.NormalReverseUploadPath = VARIABLES.floorPlanNormalReverseUploadPath;
			VARIABLES.uploadedFloorPlan = Application.PlanImageService.prepareFloorPlanImagesForPlan(VARIABLES.ii);
		</cfscript>
    </cfif>

    <cfif LEN(TRIM(Form.UpperFloorPlan)) GT 0>
    	<cffile action="upload" filefield="UpperFloorPlan" nameconflict="overwrite" destination="#floorPlanOriginalUploadPath#">      

        <cfscript>
			VARIABLES.UpperFloorPlanFile = CFFile.ServerFile;
			VARIABLES.NewUpperFloorPlanFile = Form.PlanNumber & 'UpperFloorPlan.gif';
			VARIABLES.UpperFloorPlanFilePath = VARIABLES.floorPlanOriginalUploadPath & '\' & VARIABLES.UpperFloorPlanFile;
			VARIABLES.NewUpperFloorPlanFilePath = VARIABLES.floorPlanOriginalUploadPath & '\' & VARIABLES.NewUpperFloorPlanFile;
		</cfscript>
        
        <cfif FileExists(VARIABLES.NewUpperFloorPlanFilePath)>
        	<cffile action="delete" file="#VARIABLES.NewUpperFloorPlanFilePath#">
        </cfif> 
        
        <cffile action="rename" source="#VARIABLES.UpperFloorPlanFilePath#" destination="#VARIABLES.NewUpperFloorPlanFilePath#">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="ui">
            UPDATE [Plan]
            SET 	UpperFloorPlan = <cfqueryparam cfsqltype="cf_sql_varchar" value="#VARIABLES.NewUpperFloorPlanFile#">
            WHERE 	PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#VARIABLES.PlanId#">
        </cfquery>
        
        <cfscript>
			VARIABLES.ii = StructNew();
			VARIABLES.ii.FloorPlan = "UpperFloorPlan";
			VARIABLES.ii.OriginalFilePath = VARIABLES.NewUpperFloorPlanFilePath;
			VARIABLES.ii.PlanId = VARIABLES.PlanId;
			VARIABLES.ii.FileName = VARIABLES.NewUpperFloorPlanFile;
			VARIABLES.ii.FullUploadPath = VARIABLES.floorPlanFullUploadPath;
			VARIABLES.ii.FullReverseUploadPath = VARIABLES.floorPlanFullReverseUploadPath;
			VARIABLES.ii.NormalUploadPath = VARIABLES.floorPlanNormalUploadPath;
			VARIABLES.ii.NormalReverseUploadPath = VARIABLES.floorPlanNormalReverseUploadPath;
			VARIABLES.uploadedFloorPlan = Application.PlanImageService.prepareFloorPlanImagesForPlan(VARIABLES.ii);
		</cfscript>
    </cfif>
    
    <cfif LEN(TRIM(Form.LowerFloorPlan)) GT 0>
    	<cffile action="upload" filefield="LowerFloorPlan" nameconflict="overwrite" destination="#floorPlanOriginalUploadPath#">
        
        <cfscript>
			VARIABLES.LowerFloorPlanFile = CFFile.ServerFile;
			VARIABLES.NewLowerFloorPlanFile = Form.PlanNumber & 'LowerFloorPlan.gif';
			VARIABLES.LowerFloorPlanFilePath = VARIABLES.floorPlanOriginalUploadPath & '\' & VARIABLES.LowerFloorPlanFile;
			VARIABLES.NewLowerFloorPlanFilePath = VARIABLES.floorPlanOriginalUploadPath & '\' & VARIABLES.NewLowerFloorPlanFile;
		</cfscript>
        
        <cfif FileExists(VARIABLES.NewLowerFloorPlanFilePath)>
        	<cffile action="delete" file="#VARIABLES.NewLowerFloorPlanFilePath#">
        </cfif> 
        
        <cffile action="rename" source="#VARIABLES.LowerFloorPlanFilePath#" destination="#VARIABLES.NewLowerFloorPlanFilePath#">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="ui">
            UPDATE 	[Plan]
            SET 	LowerFloorPlan = <cfqueryparam cfsqltype="cf_sql_varchar" value="#VARIABLES.NewLowerFloorPlanFile#">
            WHERE 	PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#VARIABLES.PlanId#">
        </cfquery>
        
        <cfscript>
			VARIABLES.ii = StructNew();
			VARIABLES.ii.FloorPlan = "LowerFloorPlan";
			VARIABLES.ii.OriginalFilePath = VARIABLES.NewLowerFloorPlanFilePath;
			VARIABLES.ii.PlanId = VARIABLES.PlanId;
			VARIABLES.ii.FileName = VARIABLES.NewLowerFloorPlanFile;
			VARIABLES.ii.FullUploadPath = VARIABLES.floorPlanFullUploadPath;
			VARIABLES.ii.FullReverseUploadPath = VARIABLES.floorPlanFullReverseUploadPath;
			VARIABLES.ii.NormalUploadPath = VARIABLES.floorPlanNormalUploadPath;
			VARIABLES.ii.NormalReverseUploadPath = VARIABLES.floorPlanNormalReverseUploadPath;
			VARIABLES.uploadedFloorPlan = Application.PlanImageService.prepareFloorPlanImagesForPlan(VARIABLES.ii);
		</cfscript>
    </cfif>
    
    <cfif LEN(TRIM(Form.ThirdFloorPlan)) GT 0>
    	<cffile action="upload" filefield="ThirdFloorPlan" nameconflict="overwrite" destination="#floorPlanOriginalUploadPath#">
        
        <cfscript>
			VARIABLES.ThirdFloorPlanFile = CFFile.ServerFile;
			VARIABLES.NewThirdFloorPlanFile = Form.PlanNumber & 'ThirdFloorPlan.gif';
			VARIABLES.ThirdFloorPlanFilePath = VARIABLES.floorPlanOriginalUploadPath & '\' & VARIABLES.ThirdFloorPlanFile;
			VARIABLES.NewThirdFloorPlanFilePath = VARIABLES.floorPlanOriginalUploadPath & '\' & VARIABLES.NewThirdFloorPlanFile;
		</cfscript>
        
        <cfif FileExists(VARIABLES.NewThirdFloorPlanFilePath)>
        	<cffile action="delete" file="#VARIABLES.NewThirdFloorPlanFilePath#">
        </cfif> 
        
        <cffile action="rename" source="#VARIABLES.ThirdFloorPlanFilePath#" destination="#VARIABLES.NewThirdFloorPlanFilePath#">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="ui">
            UPDATE 	[Plan]
            SET 	ThirdFloorPlan = <cfqueryparam cfsqltype="cf_sql_varchar" value="#VARIABLES.NewThirdFloorPlanFile#">
            WHERE 	PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#VARIABLES.PlanId#">
        </cfquery>
        
        <cfscript>
			VARIABLES.ii = StructNew();
			VARIABLES.ii.FloorPlan = "ThirdFloorPlan";
			VARIABLES.ii.OriginalFilePath = VARIABLES.NewThirdFloorPlanFilePath;
			VARIABLES.ii.PlanId = VARIABLES.PlanId;
			VARIABLES.ii.FileName = VARIABLES.NewThirdFloorPlanFile;
			VARIABLES.ii.FullUploadPath = VARIABLES.floorPlanFullUploadPath;
			VARIABLES.ii.FullReverseUploadPath = VARIABLES.floorPlanFullReverseUploadPath;
			VARIABLES.ii.NormalUploadPath = VARIABLES.floorPlanNormalUploadPath;
			VARIABLES.ii.NormalReverseUploadPath = VARIABLES.floorPlanNormalReverseUploadPath;
			VARIABLES.uploadedFloorPlan = Application.PlanImageService.prepareFloorPlanImagesForPlan(VARIABLES.ii);
		</cfscript>
    </cfif>
</cfif>

<cfscript>
	VARIABLES.thisPI = Application.PlanService.getById(VARIABLES.PlanId);
	VARIABLES.thisPG = Application.PlanToSearchSubGroupingService.getSearchSubGroupingsForPlan(VARIABLES.PlanId);
	VARIABLES.thisGT = Application.PlanToGarageTypeService.getGarageTypesForPlan(VARIABLES.PlanId);
	VARIABLES.tbr = Application.BedroomService.getBedroomsForAdvancedSearch();
	VARIABLES.tfbr = Application.FullBathroomService.getFullBathroomsForAdvancedSearch();
	VARIABLES.planType = Application.PlanTypeService.getAllAsQuery();
	VARIABLES.priceCat = Application.PriceCategoryService.getAllAsQuery();
	VARIABLES.designer = Application.DesignerService.getAllAsQuery();
	VARIABLES.foundType = Application.FoundationTypeService.getAllAsQuery();
	VARIABLES.lotSlope = Application.LotSlopeService.getAllAsQuery();
	VARIABLES.stories = Application.StoriesService.getAllAsQuery();
	VARIABLES.architecturalStyles = Application.SearchSubGroupingService.getSubGroupingByType(1);
	VARIABLES.popularSearches = Application.SearchSubGroupingService.getSubGroupingByType(2);
	VARIABLES.housePlanCollections = Application.SearchSubGroupingService.getSubGroupingByType(3);
	VARIABLES.roofFraming = Application.RoofFramingService.getAllAsQuery();
	VARIABLES.garageSize = Application.GarageSizeService.getAllAsQuery();
	VARIABLES.garageType = Application.GarageTypeService.getAllAsQuery();
	VARIABLES.garageDoorLocation = Application.GarageDoorLocationService.getAllAsQuery();
	VARIABLES.livingArrangement = Application.LivingArrangementService.getAllAsQuery();
	VARIABLES.masterBedroomLocation = Application.MasterBedroomLocationService.getAllAsQuery();
	VARIABLES.coveredPorch = Application.CoveredPorchService.getAllAsQuery();
	VARIABLES.bedroom = Application.BedroomService.getBedroomsForPlanManagement();
	VARIABLES.fullBath = Application.FullBathroomService.getFullBathroomsForPlanManagement();
	VARIABLES.halfBath = Application.HalfBathroomService.getAllAsQuery();
	VARIABLES.prevNextPlanInfo = Application.PlanService.getPreviousAndNextPlanForSiteManagement(VARIABLES.PlanId);
</cfscript>

<cfscript>
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Update Plan " &  VARIABLES.thisPI.PlanNumber & " - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Update Plan " &  VARIABLES.thisPI.PlanNumber & " - Site Management - Your Family Architect - Architects Northwest";		
	}

	VARIABLES.RoofLive = Session.RoofLive;
	VARIABLES.RoofDead = Session.RoofDead;
	VARIABLES.FloorLive = Session.FloorLive;
	VARIABLES.FloorDead = Session.FloorDead;
	VARIABLES.MaxWind = Session.MaxWind;
</cfscript>

<cfsavecontent variable="head">
	<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
    <script src="/ckeditor/_samples/sample.js" type="text/javascript"></script>
</cfsavecontent>
<cfhtmlhead text="#head#">
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainManagePlanImagesContainer">
            <h1 id="sm">Site Management</h1>
            <h2 id="sm">Update Plan <cfoutput>#VARIABLES.thisPI.PlanNumber#</cfoutput></h2>

            <div class="planNavigation">
                <strong>Plan Management Navigation:</strong>
                <a href="addPlan.cfm">Add a plan</a> | Update this plan | <a href="relatedPlans.cfm">Related Plans</a> | <a href="managePlanImages.cfm">Load/Manage Plan Images</a> | <cfoutput><a href="detailedPlanInfo.cfm?PlanId=#VARIABLES.PlanId#&nps=1" target="_blank">View Plan</a></cfoutput> | <a href="deletePlan.cfm">Delete Plan</a><cfif VARIABLES.prevNextPlanInfo.previousPlanId NEQ 0> | <cfoutput><a href="#CGI.SCRIPT_NAME#?PlanId=#VARIABLES.prevNextPlanInfo.previousPlanId#" title="#VARIABLES.prevNextPlanInfo.previousPlanTitle#">Previous Plan</a></cfoutput></cfif><cfif VARIABLES.prevNextPlanInfo.nextPlanId NEQ 0> | <cfoutput><a href="#CGI.SCRIPT_NAME#?PlanId=#VARIABLES.prevNextPlanInfo.nextPlanId#" title="#VARIABLES.prevNextPlanInfo.nextPlanTitle#">Next Plan</a></cfoutput></cfif>
            </div>

            <cfif IsDefined("VARIABLES.NewPlan")>
                <div class="loadPlanSuccessMessage">
                    <strong>Plan updated successfully!</strong>
                </div>
            </cfif>
            
            <div class="smBreadcrumb">
                <a href="/default.cfm">Home</a> &gt; <a href="default.cfm">Site Management</a> &gt; Update Plan <cfoutput>#VARIABLES.thisPI.PlanNumber#</cfoutput>
            </div>
            
            <cfform action="#CGI.SCRIPT_NAME#" method="post" name="addUpdatePlan" enctype="multipart/form-data">
            <cfinput type="hidden" name="Animation" value="#VARIABLES.thisPI.Animation#">
            <cfinput type="hidden" name="Video" value="#VARIABLES.thisPI.Video#">
            <div class="normal">
                <table border="0" cellpadding=5 cellspacing=0 style="width:940px;">
                    <tr class="planMainRow">
                        <td>
                            Plan Number
                        </td>
                        <td>
                            Plan Title
                        </td>
                        <td>
                            Price Category
                        </td>
                        <td>
                            Designer
                        </td>
                    </tr>
                    <tr class="planDataRow">
                        <td>
                            <cfinput type="text" maxlength="20" name="PlanNumber" value="#VARIABLES.thisPI.PlanNumber#" style="width:150px;" required="yes" validate="noblanks" message="Pease enter a number for this plan">
                        </td>
                        <td>
                            <cfinput type="text" maxlength="50" name="PlanTitle" value="#VARIABLES.thisPI.PlanTitle#" style="width:300px;" required="yes" validate="noblanks" message="Please enter a title for this plan">
                        </td>
                        <td>
                            <cfselect name="PriceCategoryId" query="VARIABLES.priceCat" display="PriceCategory" value="PriceCategoryId" selected="#VARIABLES.thisPI.PriceCategoryId#" queryPosition="below" style="font-size:12px;margin-top:0px;">
                                <option value="0">Select a Price Category</option>
                            </cfselect>
                        </td>
                        <td>
                            <cfselect name="DesignerId" query="VARIABLES.designer" display="Designer" value="DesignerId" selected="#VARIABLES.thisPI.DesignerId#" queryPosition="below" style="font-size:12px;margin-top:0px;">
                                <option value="0">Select a Designer</option>
                            </cfselect>
                        </td>
                    </tr>
                    <tr class="planMainRow">
                        <td colspan=4>
                            Plan Short Title
                        </td>
                    </tr>
                    <tr class="planDataRow">
                        <td colspan=4>
                            <cfinput type="text" name="PlanShortTitle" value="#VARIABLES.thisPI.PlanShortTitle#" style="width:300px;" required="no" validate="maxlength" maxlength="15" message="Please enter a short title for this plan">
                        </td>
                    <tr class="planMainRow">
                        <td colspan=4>
                            Structure Type
                        </td>
                    </tr>
                    <tr class="planSubRow">
                        <td>
                            Type
                        </td>
                        <td>
                            Foundation Type
                        </td>
                        <td>
                            Lot Slope
                        </td>
                        <td>
                            Hand Drawn?
                        </td>
                    </tr>
                    <tr class="planDataRow">
                        <td>
                            <cfselect name="PlanTypeId" query="VARIABLES.planType" display="PlanType" value="PlanTypeId" selected="#VARIABLES.thisPI.PlanTypeId#" queryPosition="below" style="font-size:12px;margin-top:0px;">
                                <option value="0">Select a Plan Type</option>
                            </cfselect>
                        </td>
                        <td>
                            <cfselect name="FoundationTypeId" query="VARIABLES.foundType" display="FoundationType" value="FoundationTypeId" selected="#VARIABLES.thisPI.FoundationTypeId#" queryPosition="below" style="font-size:12px;margin-top:0px;">
                                <option value="0">Select a Foundation Type</option>
                            </cfselect>
                        </td>
                        <td>
                            <cfselect name="LotSlopeId" query="VARIABLES.lotSlope" display="LotSlope" value="LotSlopeId" selected="#VARIABLES.thisPI.LotSlopeId#" queryPosition="below" style="font-size:12px;margin-top:0px;">
                                <option value="0">Select a Lot Slope</option>
                            </cfselect>
                        </td>
                        <td style="padding-left:40px;">
                            <cfif VARIABLES.thisPI.HandDrawn EQ 1><cfinput name="HandDrawn" value="1" type="checkbox" checked><cfelse><cfinput name="HandDrawn" value="1" type="checkbox"></cfif>
                        </td>
                    </tr>
                    <tr class="planMainRow">
                        <td>
                            House Dimensions
                        </td>
                        <td>
                            Ceiling Height
                        </td>
                        <td colspan=2>
                            Popular Searches
                        </td>
                    </tr>
                    <tr class="planDataRow">
                        <td style="line-height:25px;vertical-align:top;" nowrap="nowrap">
                            <strong>Stories:</strong>
                            <cfselect name="Stories" query="VARIABLES.stories" display="Stories" value="Stories" selected="#VARIABLES.thisPI.Stories#" queryPosition="below" style="font-size:12px;margin-top:0px;">
                                <option value="0">Select Number of Stories</option>
                            </cfselect>
                            <br />
                            <strong>Width:</strong> &nbsp;<cfinput name="HouseDimensionWidthFt" value="#VARIABLES.thisPI.HouseDimensionWidthFt#" maxlength="3" validate="integer" required="no" message="Please enter a numeric value for the House Dimension Width (in feet) or leave this field blank" style="width:30px;"> FT&nbsp;&nbsp;
                            <cfinput name="HouseDimensionWidthIn" value="#VARIABLES.thisPI.HouseDimensionWidthIn#" maxlength="3" validate="integer" required="no" message="Please enter a numeric value for the House Dimension Width (in inches) or leave this field blank" style="width:30px;"> IN
                            <br />
                            <strong>Depth:</strong> &nbsp;<cfinput name="HouseDimensionDepthFt" value="#VARIABLES.thisPI.HouseDimensionDepthFt#" maxlength="3" validate="integer" required="no" message="Please enter a numeric value for the House Dimension Depth (in feet) or leave this field blank" style="width:30px;"> FT&nbsp;&nbsp;
                            <cfinput name="HouseDimensionDepthIn" value="#VARIABLES.thisPI.HouseDimensionDepthIn#" maxlength="3" validate="integer" required="no" message="Please enter a numeric value for the House Dimension Depth (in inches) or leave this field blank" style="width:30px;"> IN
                            <br />
                            <strong>Height:</strong> <cfinput name="HouseDimensionHeightFt" value="#VARIABLES.thisPI.HouseDimensionHeightFt#" maxlength="3" validate="integer" required="no" message="Please enter a numeric value for the House Dimension Height (in feet) or leave this field blank" style="width:30px;"> FT&nbsp;&nbsp;
                            <cfinput name="HouseDimensionHeightIn" value="#VARIABLES.thisPI.HouseDimensionHeightIn#" maxlength="3" validate="integer" required="no" message="Please enter a numeric value for the House Dimension Height (in inches) or leave this field blank" style="width:30px;"> IN
                        </td>
                        <td style="line-height:25px;vertical-align:top;">
                            <strong>Main Floor:</strong> &nbsp;&nbsp;&nbsp;<cfinput name="CeilingHeightMainFloor" value="#VARIABLES.thisPI.CeilingHeightMainFloor#" maxlength="3" validate="integer" required="no" message="Please enter a numeric value for the Ceiling Height - Main Floor (in feet) or leave this field blank" style="width:30px;"> FT
                            <br />
                            <strong>Upper Floor:</strong> &nbsp;<cfinput name="CeilingHeightUpperFloor" value="#VARIABLES.thisPI.CeilingHeightUpperFloor#" maxlength="3" validate="integer" required="no" message="Please enter a numeric value for the Ceiling Height - Upper Floor (in feet) or leave this field blank" style="width:30px;"> FT
                            <br />
                            <strong>Third Floor:</strong> &nbsp;&nbsp;&nbsp;<cfinput name="CeilingHeightThirdFloor" value="#VARIABLES.thisPI.CeilingHeightThirdFloor#" maxlength="3" validate="integer" required="no" message="Please enter a numeric value for the Ceiling Height - Third Floor (in feet) or leave this field blank" style="width:30px;"> FT
                            <br />
                            <strong>Lower Floor:</strong> &nbsp;<cfinput name="CeilingHeightLowerFloor" value="#VARIABLES.thisPI.CeilingHeightLowerFloor#" maxlength="3" validate="integer" required="no" message="Please enter a numeric value for the Ceiling Height - Lower Floor (in feet) or leave this field blank" style="width:30px;"> FT
                        </td>
                        <td colspan=2 style="line-height:25px;vertical-align:top;">
                            <cfoutput query="VARIABLES.popularSearches"><cfif ListFind(VARIABLES.thisPG,SearchSubGroupingId)><cfinput type="checkbox" name="SearchSubGroupingId" value="#SearchSubGroupingId#" checked><cfelse><cfinput type="checkbox" name="SearchSubGroupingId" value="#SearchSubGroupingId#"></cfif>#SearchSubGrouping#<cfif VARIABLES.popularSearches.currentRow LT VARIABLES.popularSearches.recordCount><br /></cfif></cfoutput>
                        </td>
                    </tr>
                    <tr class="planMainRow">
                        <td>
                            Square Feet
                        </td>
                        <td>
                            Roof Info
                        </td>
                        <td colspan=2>
                            Architectural Styles
                        </td>
                    </tr>
                    <tr class="planDataRow">
                        <td style="vertical-align:top;">
                            <table border=0 cellpadding=3 cellspacing=0>
                                <tr>
                                    <td style="width:90px;font-weight:bold;">Total:</td>
                                    <td><cfinput name="TotalSF" value="#VARIABLES.thisPI.TotalSF#" maxlength="5" validate="integer" required="no" message="Please enter a numeric value for the Total Square Feet or leave this field blank" style="width:30px;"></td>
                                </tr>
                                <tr>
                                    <td style="width:90px;font-weight:bold;">Unit Total:</td>
                                    <td><cfinput name="UnitTotalSF" value="#VARIABLES.thisPI.UnitTotalSF#" maxlength="5" validate="integer" required="no" message="Please enter a numeric value for the Unit Total Square Feet or leave this field blank" style="width:30px;"></td>
                                </tr>
                                <tr>
                                    <td style="width:90px;font-weight:bold;">Main Floor:</td>
                                    <td><cfinput name="MainFloorSF" value="#VARIABLES.thisPI.MainFloorSF#" maxlength="5" validate="integer" required="no" message="Please enter a numeric value for the Main Floor Square Feet or leave this field blank" style="width:30px;"></td>
                                </tr>
                                <tr>
                                    <td style="width:90px;font-weight:bold;">Upper Floor:</td>
                                    <td><cfinput name="UpperFloorSF" value="#VARIABLES.thisPI.UpperFloorSF#" maxlength="5" validate="integer" required="no" message="Please enter a numeric value for the Upper Floor Square Feet or leave this field blank" style="width:30px;"></td>
                                </tr>
                                <tr>
                                    <td style="width:90px;font-weight:bold;">Third Floor:</td>
                                    <td><cfinput name="ThirdFloorSF" value="#VARIABLES.thisPI.ThirdFloorSF#" maxlength="5" validate="integer" required="no" message="Please enter a numeric value for the Third Floor Square Feet or leave this field blank" style="width:30px;"></td>
                                </tr>
                                <tr>
                                    <td style="width:90px;font-weight:bold;">Lower Floor:</td>
                                    <td><cfinput name="LowerFloorSF" value="#VARIABLES.thisPI.LowerFloorSF#" maxlength="5" validate="integer" required="no" message="Please enter a numeric value for the Lower Floor Square Feet or leave this field blank" style="width:30px;"></td>
                                </tr>
                                <tr>
                                    <td style="width:90px;font-weight:bold;">Garage:</td>
                                    <td><cfinput name="GarageSF" value="#VARIABLES.thisPI.GarageSF#" maxlength="5" validate="integer" required="no" message="Please enter a numeric value for the Garage Square Feet or leave this field blank" style="width:30px;"></td>
                                </tr>
                                <tr>
                                    <td style="width:90px;font-weight:bold;">Bonus:</td>
                                    <td><cfinput name="BonusRmSF" value="#VARIABLES.thisPI.BonusRmSF#" maxlength="5" validate="integer" required="no" message="Please enter a numeric value for the Bonus Room Square Feet or leave this field blank" style="width:30px;"></td>
                                </tr>
                                <tr>
                                    <td style="width:90px;font-weight:bold;">Storage:</td>
                                    <td><cfinput name="StorageSF" value="#VARIABLES.thisPI.StorageSF#" maxlength="5" validate="integer" required="no" message="Please enter a numeric value for the Storage Square Feet or leave this field blank" style="width:30px;"></td>
                                </tr>
                                <tr>
                                    <td style="width:90px;font-weight:bold;">Porch:</td>
                                    <td><cfinput name="CoveredPorchSF" value="#VARIABLES.thisPI.CoveredPorchSF#" maxlength="5" validate="integer" required="no" message="Please enter a numeric value for the Porch Square Feet or leave this field blank" style="width:30px;"></td>
                                </tr>
                                <tr>
                                    <td style="width:90px;font-weight:bold;">Deck:</td>
                                    <td><cfinput name="DeckSF" value="#VARIABLES.thisPI.DeckSF#" maxlength="5" validate="integer" required="no" message="Please enter a numeric value for the Deck Square Feet or leave this field blank" style="width:30px;"></td>
                                </tr>
                                <tr>
                                    <td style="width:90px;font-weight:bold;">Patio:</td>
                                    <td><cfinput name="CoveredPatioSF" value="#VARIABLES.thisPI.CoveredPatioSF#" maxlength="5" validate="integer" required="no" message="Please enter a numeric value for the Patio Square Feet or leave this field blank" style="width:30px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td style="vertical-align:top;text-align:left;">
                            <table border=0 cellpadding=3 cellspacing=0>
                                <tr>
                                    <td style="width:100px;font-weight:bold;">Live:</td>
                                    <td><cfinput name="RoofLive" maxlength="3" validate="integer" value="#VARIABLES.thisPI.RoofLive#" required="no" message="Please enter a numeric value for the Roof Live or leave this field blank" style="width:30px;"></td>
                                </tr>
                                <tr>
                                    <td style="width:100px;font-weight:bold;">Dead:</td>
                                    <td><cfinput name="RoofDead" maxlength="3" validate="integer" value="#VARIABLES.thisPI.RoofDead#" required="no" message="Please enter a numeric value for the Roof Dead or leave this field blank" style="width:30px;"></td>
                                </tr>
                                <tr>
                                    <td style="width:100px;font-weight:bold;">Max Wind:</td>
                                    <td><cfinput name="MaxWind" maxlength="3" validate="integer" value="#VARIABLES.thisPI.MaxWind#" required="no" message="Please enter a numeric value for the Max Wind or leave this field blank" style="width:30px;"></td>
                                </tr>
                                <tr>
                                    <td style="width:100px;font-weight:bold;">Primary:</td>
                                    <td><cfinput name="RoofPrimary" value="#VARIABLES.thisPI.RoofPrimary#" maxlength="3" validate="integer" required="no" message="Please enter a numeric value for the Roof Primary or leave this field blank" style="width:30px;"> :12</td>
                                </tr>
                                <tr>
                                    <td style="width:100px;font-weight:bold;">Secondary:</td>
                                    <td><cfinput name="RoofSecondary" value="#VARIABLES.thisPI.RoofSecondary#" maxlength="3" validate="integer" required="no" message="Please enter a numeric value for the Roof Secondary or leave this field blank" style="width:30px;"> :12</td>
                                </tr>
                                <tr>
                                    <td style="width:100px;font-weight:bold;">Roof Framing:</td>
                                    <td>
                                        <cfselect name="RoofFramingId" query="VARIABLES.roofFraming" display="RoofFraming" value="RoofFramingId" selected="#VARIABLES.thisPI.RoofFramingId#" queryPosition="below" style="font-size:12px;margin-top:0px;">
                                            <option value="0">Select a Value</option>
                                        </cfselect>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td colspan=2 style="line-height:25px;vertical-align:top;">
                            <cfscript>
                                VARIABLES.row1end = Ceiling(VARIABLES.architecturalStyles.recordcount/2);
                                VARIABLES.row2Start = VARIABLES.row1End + 1;
                            </cfscript>
                            <table border=0 cellpadding=3 cellspacing=0>
                                <tr>
                                    <td>
                                        <cfloop query="VARIABLES.architecturalStyles" startrow="1" endrow="#VARIABLES.row1end#">
                                            <cfoutput><cfif ListFind(VARIABLES.thisPG,SearchSubGroupingId)><cfinput type="checkbox" name="SearchSubGroupingId" value="#SearchSubGroupingId#" checked><cfelse><cfinput type="checkbox" name="SearchSubGroupingId" value="#SearchSubGroupingId#"></cfif>#SearchSubGrouping#<cfif VARIABLES.architecturalStyles.currentRow LT VARIABLES.row1end><br /></cfif></cfoutput>
                                        </cfloop>
                                    </td>
                                    <td>
                                        <cfloop query="VARIABLES.architecturalStyles" startrow="#VARIABLES.row2Start#">
                                            <cfoutput><cfif ListFind(VARIABLES.thisPG,SearchSubGroupingId)><cfinput type="checkbox" name="SearchSubGroupingId" value="#SearchSubGroupingId#" checked><cfelse><cfinput type="checkbox" name="SearchSubGroupingId" value="#SearchSubGroupingId#"></cfif>#SearchSubGrouping#<cfif VARIABLES.architecturalStyles.currentRow LT VARIABLES.architecturalStyles.recordCount><br /></cfif></cfoutput>
                                        </cfloop>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr class="planMainRow">
                        <td>
                            Garage Info
                        </td>
                        <td>
                            Floor Info
                        </td>
                        <td colspan=2>
                            House Plan Collections
                        </td>
                    </tr>
                    <tr class="planDataRow">
                        <td style="vertical-align:top;">
                            <table border=0 cellpadding=3 cellspacing=0>
                                <tr>
                                    <td style="width:60px;text-align:right;font-weight:bold;">Car:</td>
                                    <td>
                                        <cfselect name="GarageSizeId" query="VARIABLES.garageSize" display="GarageSize" value="GarageSizeId" selected="#VARIABLES.thisPI.GarageSizeId#" queryPosition="below" style="font-size:12px;margin-top:0px;">
                                            <option value="0">Select a Value</option>
                                        </cfselect>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:60px;text-align:right;font-weight:bold;">Location:</td>
                                    <td>
                                        <cfselect name="GarageDoorLocationId" query="VARIABLES.garageDoorLocation" display="GarageDoorLocation" value="GarageDoorLocationId" selected="#VARIABLES.thisPI.GarageDoorLocationId#" queryPosition="below" style="font-size:12px;margin-top:0px;">
                                            <option value="0">Select a Value</option>
                                        </cfselect>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:60px;text-align:right;font-weight:bold;" valign="top">Type:</td>
                                    <td>
                                        <cfoutput query="VARIABLES.garageType">
                                            <cfif ListFind(VARIABLES.thisGT,GarageTypeId)><cfinput type="checkbox" name="GarageTypeId" value="#GarageTypeId#" checked><cfelse><cfinput type="checkbox" name="GarageTypeId" value="#GarageTypeId#"></cfif> #GarageType#<cfif VARIABLES.garageType.currentRow LT VARIABLES.garageType.recordCount><br /></cfif>
                                        </cfoutput>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="vertical-align:top;text-align:left;">
                            <table border=0 cellpadding=3 cellspacing=0>
                                <tr>
                                    <td style="width:40px;font-weight:bold;">Live:</td>
                                    <td><cfinput name="FloorLive" maxlength="3" validate="integer" value="#VARIABLES.thisPI.FloorLive#" required="no" message="Please enter a numeric value for Floor Live or leave this field blank" style="width:30px;"></td>
                                </tr>
                                <tr>
                                    <td style="width:40px;font-weight:bold;">Dead:</td>
                                    <td><cfinput name="FloorDead" maxlength="3" validate="integer" value="#VARIABLES.thisPI.FloorDead#" required="no" message="Please enter a numeric value for the Floor Dead or leave this field blank" style="width:30px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td style="line-height:25px;vertical-align:top;" colspan=2>
                            <cfscript>
                                VARIABLES.row1end = Ceiling(VARIABLES.housePlanCollections.recordcount/2);
                                VARIABLES.row2Start = VARIABLES.row1End + 1;
                            </cfscript>
                            <table border=0 cellpadding=3 cellspacing=0>
                                <tr>
                                    <td>
                                        <cfloop query="VARIABLES.housePlanCollections" startrow="1" endrow="#VARIABLES.row1end#">
                                            <cfoutput><cfif ListFind(VARIABLES.thisPG,SearchSubGroupingId)><cfinput type="checkbox" name="SearchSubGroupingId" value="#SearchSubGroupingId#" checked><cfelse><cfinput type="checkbox" name="SearchSubGroupingId" value="#SearchSubGroupingId#"></cfif>#SearchSubGrouping#<cfif VARIABLES.architecturalStyles.currentRow LT VARIABLES.row1end><br /></cfif></cfoutput>
                                        </cfloop>
                                    </td>
                                    <td style="vertical-align:top;">
                                        <cfloop query="VARIABLES.housePlanCollections" startrow="#VARIABLES.row2Start#">
                                            <cfoutput><cfif ListFind(VARIABLES.thisPG,SearchSubGroupingId)><cfinput type="checkbox" name="SearchSubGroupingId" value="#SearchSubGroupingId#" checked><cfelse><cfinput type="checkbox" name="SearchSubGroupingId" value="#SearchSubGroupingId#"></cfif>#SearchSubGrouping#<cfif VARIABLES.architecturalStyles.currentRow LT VARIABLES.architecturalStyles.recordCount><br /></cfif></cfoutput>
                                        </cfloop>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr class="planMainRow">
                        <td colspan=4>
                            Room Info
                        </td>
                    </tr>
                    <tr class="planDataRow">
                        <td colspan=2 style="vertical-align:top;">
                            <table border=0 cellpadding=3 cellspacing=0>
                                <tr>
                                    <td>Bedrooms:</td>
                                    <td>
                                        <cfselect name="BedroomId" query="VARIABLES.bedroom" display="Bedroom" value="BedroomId" selected="#VARIABLES.thisPI.BedroomId#" queryPosition="below">
                                            <option value="">Select a Value</option>
                                        </cfselect>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Full Baths:</td>
                                    <td>
                                        <cfselect name="FullBathroomId" query="VARIABLES.fullBath" display="FullBathRoom" value="FullBathroomId" selected="#VARIABLES.thisPI.FullBathroomId#" queryPosition="below">
                                            <option value="">Select a Value</option>
                                        </cfselect>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Half Baths:</td>
                                    <td>
                                        <cfselect name="HalfBathroomId" query="VARIABLES.halfBath" display="HalfBathroom" value="HalfBathroomId" selected="#VARIABLES.thisPI.HalfBathroomId#" queryPosition="below">
                                            <option value="">Select a Value</option>
                                        </cfselect>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Master Bedroom:</td>
                                    <td>
                                        <cfselect name="MasterBedroomLocationId" query="VARIABLES.masterBedroomLocation" display="MasterBedroomLocation" value="MasterBedroomLocationId" selected="#VARIABLES.thisPI.MasterBedroomLocationId#" queryPosition="below">
                                            <option value="">Select a Value</option>
                                        </cfselect>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Covered Porch:</td>
                                    <td>
                                        <cfselect name="CoveredPorchId" query="VARIABLES.coveredPorch" display="CoveredPorch" value="CoveredPorchId" selected="#VARIABLES.thisPI.CoveredPorchId#" queryPosition="below">
                                            <option value="">Select a Value</option>
                                        </cfselect>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Living Space Arrangements:</td>
                                    <td>
                                        <cfselect name="LivingArrangementId" query="VARIABLES.livingArrangement" display="LivingArrangement" value="LivingArrangementId" selected="#VARIABLES.thisPI.LivingArrangementId#" queryPosition="below">
                                            <option value="">Select a Value</option>
                                        </cfselect>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Den/Office:</td>
                                    <td>
                                        <cfif VARIABLES.thisPI.Den EQ 1><cfinput type="checkbox" name="Den" value="1" checked><cfelse><cfinput type="checkbox" name="Den" value="1"></cfif>
                                    </td>
                                </tr>
                              </table>
                        </td>
                        <td colspan=2 style="line-height:25px;vertical-align:top;">
                            <table border=0 cellpadding=3 cellspacing=0>
                                <tr>
                                    <tr>
                                    <td valign="top">Laundry Room:</td>
                                    <td>
                                        <cfif VARIABLES.thisPI.LaundryRoomMain EQ 1><cfinput type="checkbox" name="LaundryRoomMain" value="1" checked><cfelse><cfinput type="checkbox" name="LaundryRoomMain" value="1"></cfif> Main<br />
                                        <cfif VARIABLES.thisPI.LaundryRoomUpper EQ 1><cfinput type="checkbox" name="LaundryRoomUpper" value="1" checked><cfelse><cfinput type="checkbox" name="LaundryRoomUpper" value="1"></cfif> Upper<br />
                                        <cfif VARIABLES.thisPI.LaundryRoomLower EQ 1><cfinput type="checkbox" name="LaundryRoomLower" value="1" checked><cfelse><cfinput type="checkbox" name="LaundryRoomLower" value="1"></cfif> Lower
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Bonus/Recreation:</td>
                                    <td>
                                        <cfif VARIABLES.thisPI.BonusRecRoomMain EQ 1><cfinput type="checkbox" name="BonusRecRoomMain" value="1" checked><cfelse><cfinput type="checkbox" name="BonusRecRoomMain" value="1"></cfif> Main<br />
                                        <cfif VARIABLES.thisPI.BonusRecRoomUpper EQ 1><cfinput type="checkbox" name="BonusRecRoomUpper" value="1" checked><cfelse><cfinput type="checkbox" name="BonusRecRoomUpper" value="1"></cfif> Upper<br />
                                        <cfif VARIABLES.thisPI.BonusRecRoomThird EQ 1><cfinput type="checkbox" name="BonusRecRoomThird" value="1" checked><cfelse><cfinput type="checkbox" name="BonusRecRoomThird" value="1"></cfif> Third<br />
                                        <cfif VARIABLES.thisPI.BonusRecRoomLower EQ 1><cfinput type="checkbox" name="BonusRecRoomLower" value="1" checked><cfelse><cfinput type="checkbox" name="BonusRecRoomLower" value="1"></cfif> Lower<br />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr class="planMainRow">
                        <td colspan=4>
                            Floor Plans
                        </td>
                    </tr>
                    <tr class="planSubRow">
                        <td colspan=2>
                            Main Floor Plan <cfif LEN(TRIM(VARIABLES.thisPI.MainFloorPlan)) GT 0><cfinput type="checkbox" name="delMainFloorPlan" value="1"><span style="font-weight:normal;">delete floor plan</span></cfif>
                        </td>
                        <td colspan=2>
                            Upper Floor Plan <cfif LEN(TRIM(VARIABLES.thisPI.UpperFloorPlan)) GT 0><cfinput type="checkbox" name="delUpperFloorPlan" value="1"><span style="font-weight:normal;">delete floor plan</span></cfif>
                        </td>
                    </tr>
                    <tr class="planDataRow">
                        <td colspan=2>
                            <cfinput type="file" name="MainFloorPlan" size=30 maxlength=40>
                        </td>
                        <td colspan=2>
                            <cfinput type="file" name="UpperFloorPlan" size=30 maxlength=40>
                        </td>
                    </tr>
                    <tr class="planSubRow">
                        <td colspan=2>
                            Lower Floor Plan <cfif LEN(TRIM(VARIABLES.thisPI.LowerFloorPlan)) GT 0><cfinput type="checkbox" name="delLowerFloorPlan" value="1"><span style="font-weight:normal;">delete floor plan</span></cfif>
                        </td>
                        <td colspan=2>
                            Third Floor Plan <cfif LEN(TRIM(VARIABLES.thisPI.ThirdFloorPlan)) GT 0><cfinput type="checkbox" name="delThirdFloorPlan" value="1"><span style="font-weight:normal;">delete floor plan</span></cfif>
                        </td>
                    </tr>
                    <tr class="planDataRow">
                        <td colspan=2>
                            <cfinput type="file" name="LowerFloorPlan" size=30 maxlength=40>
                        </td>
                        <td colspan=2>
                            <cfinput type="file" name="ThirdFloorPlan" size=30 maxlength=40>
                        </td>
                    </tr>
                    <tr class="planMainRow">
                        <td colspan=4>
                            Animations and Videos
                        </td>
                    </tr>
                    <tr class="planSubRow">
                        <td colspan=2>
                            Animation
                        </td>
                        <td colspan=2>
                            Link to 360 Degree Animation
                        </td>
                    </tr>
                    <tr class="planDataRow">
                        <td colspan=2>
                            <cfinput type="file" name="newAnimation" size=30 maxlength=40>
                        </td>
                        <td colspan=2>
                            <cfinput type="text" name="Animation360" value="#VARIABLES.thisPI.Animation360#" size=30 maxlength=40>
                        </td>
                    </tr>
                    <tr class="planSubRow">
                        <td colspan=2>
                            Video
                        </td>
                        <td colspan=2>
                            YouTube
                        </td>
                    </tr>
                    <tr class="planDataRow">
                        <td colspan=2>
                            <cfinput type="file" name="newVideo" size=30 maxlength=40>
                        </td>
                        <td colspan=2>
                            <cfinput type="text" name="youTube" value="#VARIABLES.thisPI.YouTube#" size=30 maxlength=200>
                        </td>
                    </tr>
                    <tr class="planMainRow">
                        <td>
                            Copyright Number
                        </td>
                        <td>
                            Display Plan
                        </td>
						<td colspan=2>
                            Existng Material List Available?
                        </td>
                    </tr>
                    <tr class="planDataRow">
                        <td>
                            <cfinput type="text" name="CopyrightNumber" value="#VARIABLES.thisPI.CopyrightNumber#" size=20 maxlength=25>
                        </td>
                        <td>
                            <cfif VARIABLES.thisPI.DisplayPlan EQ 1>
                                <cfinput type="radio" name="DisplayPlan" value="1" checked>Yes&nbsp;&nbsp;
                                <cfinput type="radio" name="DisplayPlan" value="0">No
                            <cfelse>
                                <cfinput type="radio" name="DisplayPlan" value="1">Yes&nbsp;&nbsp;
                                <cfinput type="radio" name="DisplayPlan" value="0" checked>No
                            </cfif>
                        </td>
						<td colspan=2>
                            <cfif VARIABLES.thisPI.hasExistingMaterialList EQ 1>
                                <cfinput type="radio" name="hasExistingMaterialList" value="1" checked>Yes&nbsp;&nbsp;
                                <cfinput type="radio" name="hasExistingMaterialList" value="0">No
                            <cfelse>
                                <cfinput type="radio" name="hasExistingMaterialList" value="1">Yes&nbsp;&nbsp;
                                <cfinput type="radio" name="hasExistingMaterialList" value="0" checked>No
                            </cfif>
                        </td>
                    </tr>
                    <tr class="planMainRow">
                        <td colspan=4>
                            Plan Description
                        </td>
                    </tr>
                    <tr class="planDataRow">
                        <td colspan=4>
                            <cftextarea name="PlanDescription" id="PlanDescription" style="width:930px;height:150px;font-family:times,serif;font-size:12px;background-color:white;" value="#VARIABLES.thisPI.PlanDescription#"></cftextarea>
                            <script type="text/javascript">
								CKEDITOR.addStylesSet( 'my_styles',
								[				
									// Inline Styles
									{ name : 'Description Heading', element : 'span', attributes : { 'class' : 'descriptionHeading' } }
								]);
								
								CKEDITOR.config.stylesCombo_stylesSet = 'my_styles';
								CKEDITOR.config.contentsCss = '/assets/css/editorCSS.css';
                                CKEDITOR.config.skin = 'kama'; 
                                CKEDITOR.config.width = 930;
                                CKEDITOR.config.height = 150;
                                CKEDITOR.replace( 'PlanDescription',{
                                toolbar :
                                [
                                    ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
                                    ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat',],
                                    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
                                    ['NumberedList','BulletedList','-'],
                                    '/',
                                    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
                                    ['Link','Unlink','Anchor'],
                                    ['Smiley','Styles'],
                                    ['TextColor','ShowBlocks','-','About','Source']
                                ]});
                            </script>
                        </td>
                    </tr>
                    <tr class="planMainRow">
                        <td colspan=4 align="center">
                            <cfinput type="submit" name="ap" value="Update Plan Information" style="width:400px;">
                        </td>
                    </tr>
                </table>
            </div>
            </cfform>
        </div>
    </cfmodule>