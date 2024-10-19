<cfcomponent output="false" alias="com.cornerstonedesigns.Plan">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="PlanId" type="numeric" default="0">
	<cfproperty name="PlanNumber" type="string" default="">
	<cfproperty name="PlanTitle" type="string" default="">
	<cfproperty name="PlanShortTitle" type="string" default="">
	<cfproperty name="PlanDescription" type="string" default="">
	<cfproperty name="PlanDesignFeatures" type="string" default="">
	<cfproperty name="PlanTypeId" type="numeric" default="0">
	<cfproperty name="PriceCategoryId" type="numeric" default="0">
	<cfproperty name="DesignerId" type="numeric" default="0">
	<cfproperty name="Stories" type="numeric" default="0">
	<cfproperty name="TotalSF" type="numeric" default="0">
	<cfproperty name="MainFloorSF" type="numeric" default="0">
	<cfproperty name="UnitTotalSF" type="numeric" default="0">
	<cfproperty name="UpperFloorSF" type="numeric" default="0">
	<cfproperty name="LowerFloorSF" type="numeric" default="0">
	<cfproperty name="ThirdFloorSF" type="numeric" default="0">
	<cfproperty name="GarageSF" type="numeric" default="0">
	<cfproperty name="BonusRmSF" type="numeric" default="0">
	<cfproperty name="StorageSF" type="numeric" default="0">
	<cfproperty name="CoveredPorchSF" type="numeric" default="0">
	<cfproperty name="DeckSF" type="numeric" default="0">
	<cfproperty name="CoveredPatioSF" type="numeric" default="0">
	<cfproperty name="FullBathroomId" type="numeric" default="0">
	<cfproperty name="HalfBathroomId" type="numeric" default="0">
	<cfproperty name="BedroomId" type="numeric" default="0">
	<cfproperty name="MasterBedroomLocationId" type="numeric" default="0">
	<cfproperty name="FoundationTypeId" type="numeric" default="0">
	<cfproperty name="LotSlopeId" type="numeric" default="0">
	<cfproperty name="HouseDimensionWidthFt" type="numeric" default="0">
	<cfproperty name="HouseDimensionWidthIn" type="numeric" default="0">
	<cfproperty name="HouseDimensionDepthFt" type="numeric" default="0">
	<cfproperty name="HouseDimensionDepthIn" type="numeric" default="0">
	<cfproperty name="HouseDimensionHeightFt" type="numeric" default="0">
	<cfproperty name="HouseDimensionHeightIn" type="numeric" default="0">
	<cfproperty name="CeilingHeightMainFloor" type="numeric" default="0">
	<cfproperty name="CeilingHeightUpperFloor" type="numeric" default="0">
	<cfproperty name="CeilingHeightThirdFloor" type="numeric" default="0">
	<cfproperty name="CeilingHeightLowerFloor" type="numeric" default="0">
	<cfproperty name="RoofLive" type="numeric" default="0">
	<cfproperty name="RoofDead" type="numeric" default="0">
	<cfproperty name="MaxWind" type="numeric" default="0">
	<cfproperty name="RoofPrimary" type="numeric" default="0">
	<cfproperty name="RoofSecondary" type="numeric" default="0">
	<cfproperty name="RoofFramingId" type="numeric" default="0">
	<cfproperty name="FloorLive" type="numeric" default="0">
	<cfproperty name="FloorDead" type="numeric" default="0">
	<cfproperty name="GarageSizeId" type="numeric" default="0">
	<cfproperty name="GarageDoorLocationId" type="numeric" default="0">
	<cfproperty name="CoveredPorchId" type="numeric" default="0">
	<cfproperty name="LivingArrangementId" type="numeric" default="0">
	<cfproperty name="Den" type="numeric" default="0">
	<cfproperty name="CopyrightNumber" type="string" default="">
	<cfproperty name="Animation" type="string" default="">
	<cfproperty name="Animation360" type="string" default="">
	<cfproperty name="Video" type="string" default="">
    <cfproperty name="YouTube" type="string" default="">
	<cfproperty name="LaundryRoomMain" type="numeric" default="0">
	<cfproperty name="LaundryRoomUpper" type="numeric" default="0">
	<cfproperty name="LaundryRoomLower" type="numeric" default="0">
	<cfproperty name="BonusRecRoomMain" type="numeric" default="0">
	<cfproperty name="BonusRecRoomUpper" type="numeric" default="0">
	<cfproperty name="BonusRecRoomLower" type="numeric" default="0">
	<cfproperty name="BonusRecRoomThird" type="numeric" default="0">
	<cfproperty name="MainFloorPlan" type="string" default="">
	<cfproperty name="MainFloorPlanWidth" type="numeric" default="0">
	<cfproperty name="MainFloorPlanHeight" type="numeric" default="0">
	<cfproperty name="MainFloorPlanThuWidth" type="numeric" default="0">
	<cfproperty name="MainFloorPlanThuHeight" type="numeric" default="0">
	<cfproperty name="UpperFloorPlan" type="string" default="">
	<cfproperty name="UpperFloorPlanWidth" type="numeric" default="0">
	<cfproperty name="UpperFloorPlanHeight" type="numeric" default="0">
	<cfproperty name="UpperFloorPlanThuWidth" type="numeric" default="0">
	<cfproperty name="UpperFloorPlanThuHeight" type="numeric" default="0">
	<cfproperty name="LowerFloorPlan" type="string" default="">
	<cfproperty name="LowerFloorPlanWidth" type="numeric" default="0">
	<cfproperty name="LowerFloorPlanHeight" type="numeric" default="0">
	<cfproperty name="LowerFloorPlanThuWidth" type="numeric" default="0">
	<cfproperty name="LowerFloorPlanThuHeight" type="numeric" default="0">
	<cfproperty name="ThirdFloorPlan" type="string" default="">
	<cfproperty name="ThirdFloorPlanWidth" type="numeric" default="0">
	<cfproperty name="ThirdFloorPlanHeight" type="numeric" default="0">
	<cfproperty name="ThirdFloorPlanThuWidth" type="numeric" default="0">
	<cfproperty name="ThirdFloorPlanThuHeight" type="numeric" default="0">
	<cfproperty name="HandDrawn" type="numeric" default="0">
	<cfproperty name="DisplayPlan" type="numeric" default="0">
	<cfproperty name="HasExistingMaterialList" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.PlanId = 0;
		this.PlanNumber = "";
		this.PlanTitle = "";
		this.PlanShortTitle = "";
		this.PlanDescription = "";
		this.PlanDesignFeatures = "";
		this.PlanTypeId = 0;
		this.PriceCategoryId = 0;
		this.DesignerId = 0;
		this.Stories = 0;
		this.TotalSF = 0;
		this.MainFloorSF = 0;
		this.UnitTotalSF = 0;
		this.UpperFloorSF = 0;
		this.LowerFloorSF = 0;
		this.ThirdFloorSF = 0;
		this.GarageSF = 0;
		this.BonusRmSF = 0;
		this.StorageSF = 0;
		this.CoveredPorchSF = 0;
		this.DeckSF = 0;
		this.CoveredPatioSF = 0;
		this.FullBathroomId = 0;
		this.HalfBathroomId = 0;
		this.BedroomId = 0;
		this.MasterBedroomLocationId = 0;
		this.FoundationTypeId = 0;
		this.LotSlopeId = 0;
		this.HouseDimensionWidthFt = 0;
		this.HouseDimensionWidthIn = 0;
		this.HouseDimensionDepthFt = 0;
		this.HouseDimensionDepthIn = 0;
		this.HouseDimensionHeightFt = 0;
		this.HouseDimensionHeightIn = 0;
		this.CeilingHeightMainFloor = 0;
		this.CeilingHeightUpperFloor = 0;
		this.CeilingHeightThirdFloor = 0;
		this.CeilingHeightLowerFloor = 0;
		this.RoofLive = 0;
		this.RoofDead = 0;
		this.MaxWind = 0;
		this.RoofPrimary = 0;
		this.RoofSecondary = 0;
		this.RoofFramingId = 0;
		this.FloorLive = 0;
		this.FloorDead = 0;
		this.GarageSizeId = 0;
		this.GarageDoorLocationId = 0;
		this.CoveredPorchId = 0;
		this.LivingArrangementId = 0;
		this.Den = 0;
		this.CopyrightNumber = "";
		this.Animation = "";
		this.Animation360 = "";
		this.Video = "";
		this.YouTube = "";
		this.LaundryRoomMain = 0;
		this.LaundryRoomUpper = 0;
		this.LaundryRoomLower = 0;
		this.BonusRecRoomMain = 0;
		this.BonusRecRoomUpper = 0;
		this.BonusRecRoomLower = 0;
		this.BonusRecRoomThird = 0;
		this.MainFloorPlan = "";
		this.MainFloorPlanWidth = 0;
		this.MainFloorPlanHeight = 0;
		this.MainFloorPlanThuWidth = 0;
		this.MainFloorPlanThuHeight = 0;
		this.UpperFloorPlan = "";
		this.UpperFloorPlanWidth = 0;
		this.UpperFloorPlanHeight = 0;
		this.UpperFloorPlanThuWidth = 0;
		this.UpperFloorPlanThuHeight = 0;
		this.LowerFloorPlan = "";
		this.LowerFloorPlanWidth = 0;
		this.LowerFloorPlanHeight = 0;
		this.LowerFloorPlanThuWidth = 0;
		this.LowerFloorPlanThuHeight = 0;
		this.ThirdFloorPlan = "";
		this.ThirdFloorPlanWidth = 0;
		this.ThirdFloorPlanHeight = 0;
		this.ThirdFloorPlanThuWidth = 0;
		this.ThirdFloorPlanThuHeight = 0;
		this.HandDrawn = 0;
		this.DisplayPlan = 0;
		this.HasExistingMaterialList = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="Plan">
		<cfreturn this>
	</cffunction>
	<cffunction name="getPlanId" output="false" access="public" returntype="any">
		<cfreturn this.PlanId>
	</cffunction>

	<cffunction name="setPlanId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.PlanId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPlanNumber" output="false" access="public" returntype="any">
		<cfreturn this.PlanNumber>
	</cffunction>

	<cffunction name="setPlanNumber" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.PlanNumber = arguments.val>
	</cffunction>

	<cffunction name="getPlanTitle" output="false" access="public" returntype="any">
		<cfreturn this.PlanTitle>
	</cffunction>

	<cffunction name="setPlanTitle" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.PlanTitle = arguments.val>
	</cffunction>

	<cffunction name="getPlanShortTitle" output="false" access="public" returntype="any">
		<cfreturn this.PlanShortTitle>
	</cffunction>

	<cffunction name="setPlanShortTitle" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.PlanShortTitle = arguments.val>
	</cffunction>

	<cffunction name="getPlanDescription" output="false" access="public" returntype="any">
		<cfreturn this.PlanDescription>
	</cffunction>

	<cffunction name="setPlanDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.PlanDescription = arguments.val>
	</cffunction>

	<cffunction name="getPlanDesignFeatures" output="false" access="public" returntype="any">
		<cfreturn this.PlanDesignFeatures>
	</cffunction>

	<cffunction name="setPlanDesignFeatures" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.PlanDesignFeatures = arguments.val>
	</cffunction>

	<cffunction name="getPlanTypeId" output="false" access="public" returntype="any">
		<cfreturn this.PlanTypeId>
	</cffunction>

	<cffunction name="setPlanTypeId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.PlanTypeId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPriceCategoryId" output="false" access="public" returntype="any">
		<cfreturn this.PriceCategoryId>
	</cffunction>

	<cffunction name="setPriceCategoryId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.PriceCategoryId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDesignerId" output="false" access="public" returntype="any">
		<cfreturn this.DesignerId>
	</cffunction>

	<cffunction name="setDesignerId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.DesignerId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getStories" output="false" access="public" returntype="any">
		<cfreturn this.Stories>
	</cffunction>

	<cffunction name="setStories" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.Stories = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTotalSF" output="false" access="public" returntype="any">
		<cfreturn this.TotalSF>
	</cffunction>

	<cffunction name="setTotalSF" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.TotalSF = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMainFloorSF" output="false" access="public" returntype="any">
		<cfreturn this.MainFloorSF>
	</cffunction>

	<cffunction name="setMainFloorSF" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.MainFloorSF = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getUnitTotalSF" output="false" access="public" returntype="any">
		<cfreturn this.UnitTotalSF>
	</cffunction>

	<cffunction name="setUnitTotalSF" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.UnitTotalSF = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getUpperFloorSF" output="false" access="public" returntype="any">
		<cfreturn this.UpperFloorSF>
	</cffunction>

	<cffunction name="setUpperFloorSF" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.UpperFloorSF = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLowerFloorSF" output="false" access="public" returntype="any">
		<cfreturn this.LowerFloorSF>
	</cffunction>

	<cffunction name="setLowerFloorSF" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.LowerFloorSF = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getThirdFloorSF" output="false" access="public" returntype="any">
		<cfreturn this.ThirdFloorSF>
	</cffunction>

	<cffunction name="setThirdFloorSF" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.ThirdFloorSF = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getGarageSF" output="false" access="public" returntype="any">
		<cfreturn this.GarageSF>
	</cffunction>

	<cffunction name="setGarageSF" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.GarageSF = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getBonusRmSF" output="false" access="public" returntype="any">
		<cfreturn this.BonusRmSF>
	</cffunction>

	<cffunction name="setBonusRmSF" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.BonusRmSF = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getStorageSF" output="false" access="public" returntype="any">
		<cfreturn this.StorageSF>
	</cffunction>

	<cffunction name="setStorageSF" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.StorageSF = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCoveredPorchSF" output="false" access="public" returntype="any">
		<cfreturn this.CoveredPorchSF>
	</cffunction>

	<cffunction name="setCoveredPorchSF" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.CoveredPorchSF = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDeckSF" output="false" access="public" returntype="any">
		<cfreturn this.DeckSF>
	</cffunction>

	<cffunction name="setDeckSF" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.DeckSF = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCoveredPatioSF" output="false" access="public" returntype="any">
		<cfreturn this.CoveredPatioSF>
	</cffunction>

	<cffunction name="setCoveredPatioSF" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.CoveredPatioSF = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFullBathroomId" output="false" access="public" returntype="any">
		<cfreturn this.FullBathroomId>
	</cffunction>

	<cffunction name="setFullBathroomId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.FullBathroomId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getHalfBathroomId" output="false" access="public" returntype="any">
		<cfreturn this.HalfBathroomId>
	</cffunction>

	<cffunction name="setHalfBathroomId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.HalfBathroomId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getBedroomId" output="false" access="public" returntype="any">
		<cfreturn this.BedroomId>
	</cffunction>

	<cffunction name="setBedroomId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.BedroomId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMasterBedroomLocationId" output="false" access="public" returntype="any">
		<cfreturn this.MasterBedroomLocationId>
	</cffunction>

	<cffunction name="setMasterBedroomLocationId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.MasterBedroomLocationId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFoundationTypeId" output="false" access="public" returntype="any">
		<cfreturn this.FoundationTypeId>
	</cffunction>

	<cffunction name="setFoundationTypeId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.FoundationTypeId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLotSlopeId" output="false" access="public" returntype="any">
		<cfreturn this.LotSlopeId>
	</cffunction>

	<cffunction name="setLotSlopeId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.LotSlopeId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getHouseDimensionWidthFt" output="false" access="public" returntype="any">
		<cfreturn this.HouseDimensionWidthFt>
	</cffunction>

	<cffunction name="setHouseDimensionWidthFt" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.HouseDimensionWidthFt = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getHouseDimensionWidthIn" output="false" access="public" returntype="any">
		<cfreturn this.HouseDimensionWidthIn>
	</cffunction>

	<cffunction name="setHouseDimensionWidthIn" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.HouseDimensionWidthIn = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getHouseDimensionDepthFt" output="false" access="public" returntype="any">
		<cfreturn this.HouseDimensionDepthFt>
	</cffunction>

	<cffunction name="setHouseDimensionDepthFt" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.HouseDimensionDepthFt = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getHouseDimensionDepthIn" output="false" access="public" returntype="any">
		<cfreturn this.HouseDimensionDepthIn>
	</cffunction>

	<cffunction name="setHouseDimensionDepthIn" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.HouseDimensionDepthIn = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getHouseDimensionHeightFt" output="false" access="public" returntype="any">
		<cfreturn this.HouseDimensionHeightFt>
	</cffunction>

	<cffunction name="setHouseDimensionHeightFt" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.HouseDimensionHeightFt = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getHouseDimensionHeightIn" output="false" access="public" returntype="any">
		<cfreturn this.HouseDimensionHeightIn>
	</cffunction>

	<cffunction name="setHouseDimensionHeightIn" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.HouseDimensionHeightIn = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCeilingHeightMainFloor" output="false" access="public" returntype="any">
		<cfreturn this.CeilingHeightMainFloor>
	</cffunction>

	<cffunction name="setCeilingHeightMainFloor" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.CeilingHeightMainFloor = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCeilingHeightUpperFloor" output="false" access="public" returntype="any">
		<cfreturn this.CeilingHeightUpperFloor>
	</cffunction>

	<cffunction name="setCeilingHeightUpperFloor" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.CeilingHeightUpperFloor = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCeilingHeightThirdFloor" output="false" access="public" returntype="any">
		<cfreturn this.CeilingHeightThirdFloor>
	</cffunction>

	<cffunction name="setCeilingHeightThirdFloor" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.CeilingHeightThirdFloor = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCeilingHeightLowerFloor" output="false" access="public" returntype="any">
		<cfreturn this.CeilingHeightLowerFloor>
	</cffunction>

	<cffunction name="setCeilingHeightLowerFloor" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.CeilingHeightLowerFloor = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRoofLive" output="false" access="public" returntype="any">
		<cfreturn this.RoofLive>
	</cffunction>

	<cffunction name="setRoofLive" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.RoofLive = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRoofDead" output="false" access="public" returntype="any">
		<cfreturn this.RoofDead>
	</cffunction>

	<cffunction name="setRoofDead" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.RoofDead = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMaxWind" output="false" access="public" returntype="any">
		<cfreturn this.MaxWind>
	</cffunction>

	<cffunction name="setMaxWind" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.MaxWind = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRoofPrimary" output="false" access="public" returntype="any">
		<cfreturn this.RoofPrimary>
	</cffunction>

	<cffunction name="setRoofPrimary" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.RoofPrimary = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRoofSecondary" output="false" access="public" returntype="any">
		<cfreturn this.RoofSecondary>
	</cffunction>

	<cffunction name="setRoofSecondary" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.RoofSecondary = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRoofFramingId" output="false" access="public" returntype="any">
		<cfreturn this.RoofFramingId>
	</cffunction>

	<cffunction name="setRoofFramingId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.RoofFramingId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFloorLive" output="false" access="public" returntype="any">
		<cfreturn this.FloorLive>
	</cffunction>

	<cffunction name="setFloorLive" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.FloorLive = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFloorDead" output="false" access="public" returntype="any">
		<cfreturn this.FloorDead>
	</cffunction>

	<cffunction name="setFloorDead" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.FloorDead = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getGarageSizeId" output="false" access="public" returntype="any">
		<cfreturn this.GarageSizeId>
	</cffunction>

	<cffunction name="setGarageSizeId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.GarageSizeId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getGarageDoorLocationId" output="false" access="public" returntype="any">
		<cfreturn this.GarageDoorLocationId>
	</cffunction>

	<cffunction name="setGarageDoorLocationId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.GarageDoorLocationId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCoveredPorchId" output="false" access="public" returntype="any">
		<cfreturn this.CoveredPorchId>
	</cffunction>

	<cffunction name="setCoveredPorchId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.CoveredPorchId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLivingArrangementId" output="false" access="public" returntype="any">
		<cfreturn this.LivingArrangementId>
	</cffunction>

	<cffunction name="setLivingArrangementId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.LivingArrangementId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDen" output="false" access="public" returntype="any">
		<cfreturn this.Den>
	</cffunction>

	<cffunction name="setDen" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.Den = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCopyrightNumber" output="false" access="public" returntype="any">
		<cfreturn this.CopyrightNumber>
	</cffunction>

	<cffunction name="setCopyrightNumber" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.CopyrightNumber = arguments.val>
	</cffunction>

	<cffunction name="getAnimation" output="false" access="public" returntype="any">
		<cfreturn this.Animation>
	</cffunction>

	<cffunction name="setAnimation" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Animation = arguments.val>
	</cffunction>

	<cffunction name="getAnimation360" output="false" access="public" returntype="any">
		<cfreturn this.Animation360>
	</cffunction>

	<cffunction name="setAnimation360" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Animation360 = arguments.val>
	</cffunction>

	<cffunction name="getVideo" output="false" access="public" returntype="any">
		<cfreturn this.Video>
	</cffunction>

	<cffunction name="setVideo" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Video = arguments.val>
	</cffunction>
    
    <cffunction name="getYouTube" output="false" access="public" returntype="any">
		<cfreturn this.YouTube>
	</cffunction>

	<cffunction name="setYouTube" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.YouTube = arguments.val>
	</cffunction>

	<cffunction name="getLaundryRoomMain" output="false" access="public" returntype="any">
		<cfreturn this.LaundryRoomMain>
	</cffunction>

	<cffunction name="setLaundryRoomMain" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.LaundryRoomMain = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLaundryRoomUpper" output="false" access="public" returntype="any">
		<cfreturn this.LaundryRoomUpper>
	</cffunction>

	<cffunction name="setLaundryRoomUpper" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.LaundryRoomUpper = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLaundryRoomLower" output="false" access="public" returntype="any">
		<cfreturn this.LaundryRoomLower>
	</cffunction>

	<cffunction name="setLaundryRoomLower" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.LaundryRoomLower = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getBonusRecRoomMain" output="false" access="public" returntype="any">
		<cfreturn this.BonusRecRoomMain>
	</cffunction>

	<cffunction name="setBonusRecRoomMain" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.BonusRecRoomMain = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getBonusRecRoomUpper" output="false" access="public" returntype="any">
		<cfreturn this.BonusRecRoomUpper>
	</cffunction>

	<cffunction name="setBonusRecRoomUpper" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.BonusRecRoomUpper = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getBonusRecRoomLower" output="false" access="public" returntype="any">
		<cfreturn this.BonusRecRoomLower>
	</cffunction>

	<cffunction name="setBonusRecRoomLower" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.BonusRecRoomLower = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getBonusRecRoomThird" output="false" access="public" returntype="any">
		<cfreturn this.BonusRecRoomThird>
	</cffunction>

	<cffunction name="setBonusRecRoomThird" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.BonusRecRoomThird = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMainFloorPlan" output="false" access="public" returntype="any">
		<cfreturn this.MainFloorPlan>
	</cffunction>

	<cffunction name="setMainFloorPlan" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.MainFloorPlan = arguments.val>
	</cffunction>

	<cffunction name="getMainFloorPlanWidth" output="false" access="public" returntype="any">
		<cfreturn this.MainFloorPlanWidth>
	</cffunction>

	<cffunction name="setMainFloorPlanWidth" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.MainFloorPlanWidth = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMainFloorPlanHeight" output="false" access="public" returntype="any">
		<cfreturn this.MainFloorPlanHeight>
	</cffunction>

	<cffunction name="setMainFloorPlanHeight" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.MainFloorPlanHeight = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMainFloorPlanThuWidth" output="false" access="public" returntype="any">
		<cfreturn this.MainFloorPlanThuWidth>
	</cffunction>

	<cffunction name="setMainFloorPlanThuWidth" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.MainFloorPlanThuWidth = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMainFloorPlanThuHeight" output="false" access="public" returntype="any">
		<cfreturn this.MainFloorPlanThuHeight>
	</cffunction>

	<cffunction name="setMainFloorPlanThuHeight" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.MainFloorPlanThuHeight = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getUpperFloorPlan" output="false" access="public" returntype="any">
		<cfreturn this.UpperFloorPlan>
	</cffunction>

	<cffunction name="setUpperFloorPlan" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.UpperFloorPlan = arguments.val>
	</cffunction>

	<cffunction name="getUpperFloorPlanWidth" output="false" access="public" returntype="any">
		<cfreturn this.UpperFloorPlanWidth>
	</cffunction>

	<cffunction name="setUpperFloorPlanWidth" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.UpperFloorPlanWidth = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getUpperFloorPlanHeight" output="false" access="public" returntype="any">
		<cfreturn this.UpperFloorPlanHeight>
	</cffunction>

	<cffunction name="setUpperFloorPlanHeight" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.UpperFloorPlanHeight = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getUpperFloorPlanThuWidth" output="false" access="public" returntype="any">
		<cfreturn this.UpperFloorPlanThuWidth>
	</cffunction>

	<cffunction name="setUpperFloorPlanThuWidth" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.UpperFloorPlanThuWidth = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getUpperFloorPlanThuHeight" output="false" access="public" returntype="any">
		<cfreturn this.UpperFloorPlanThuHeight>
	</cffunction>

	<cffunction name="setUpperFloorPlanThuHeight" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.UpperFloorPlanThuHeight = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLowerFloorPlan" output="false" access="public" returntype="any">
		<cfreturn this.LowerFloorPlan>
	</cffunction>

	<cffunction name="setLowerFloorPlan" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.LowerFloorPlan = arguments.val>
	</cffunction>

	<cffunction name="getLowerFloorPlanWidth" output="false" access="public" returntype="any">
		<cfreturn this.LowerFloorPlanWidth>
	</cffunction>

	<cffunction name="setLowerFloorPlanWidth" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.LowerFloorPlanWidth = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLowerFloorPlanHeight" output="false" access="public" returntype="any">
		<cfreturn this.LowerFloorPlanHeight>
	</cffunction>

	<cffunction name="setLowerFloorPlanHeight" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.LowerFloorPlanHeight = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLowerFloorPlanThuWidth" output="false" access="public" returntype="any">
		<cfreturn this.LowerFloorPlanThuWidth>
	</cffunction>

	<cffunction name="setLowerFloorPlanThuWidth" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.LowerFloorPlanThuWidth = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLowerFloorPlanThuHeight" output="false" access="public" returntype="any">
		<cfreturn this.LowerFloorPlanThuHeight>
	</cffunction>

	<cffunction name="setLowerFloorPlanThuHeight" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.LowerFloorPlanThuHeight = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getThirdFloorPlan" output="false" access="public" returntype="any">
		<cfreturn this.ThirdFloorPlan>
	</cffunction>

	<cffunction name="setThirdFloorPlan" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.ThirdFloorPlan = arguments.val>
	</cffunction>

	<cffunction name="getThirdFloorPlanWidth" output="false" access="public" returntype="any">
		<cfreturn this.ThirdFloorPlanWidth>
	</cffunction>

	<cffunction name="setThirdFloorPlanWidth" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.ThirdFloorPlanWidth = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getThirdFloorPlanHeight" output="false" access="public" returntype="any">
		<cfreturn this.ThirdFloorPlanHeight>
	</cffunction>

	<cffunction name="setThirdFloorPlanHeight" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.ThirdFloorPlanHeight = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getThirdFloorPlanThuWidth" output="false" access="public" returntype="any">
		<cfreturn this.ThirdFloorPlanThuWidth>
	</cffunction>

	<cffunction name="setThirdFloorPlanThuWidth" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.ThirdFloorPlanThuWidth = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getThirdFloorPlanThuHeight" output="false" access="public" returntype="any">
		<cfreturn this.ThirdFloorPlanThuHeight>
	</cffunction>

	<cffunction name="setThirdFloorPlanThuHeight" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.ThirdFloorPlanThuHeight = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getHandDrawn" output="false" access="public" returntype="any">
		<cfreturn this.HandDrawn>
	</cffunction>

	<cffunction name="setHandDrawn" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.HandDrawn = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDisplayPlan" output="false" access="public" returntype="any">
		<cfreturn this.DisplayPlan>
	</cffunction>

	<cffunction name="setDisplayPlan" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.DisplayPlan = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>
	
	<cffunction name="getHasExistingMaterialList" output="false" access="public" returntype="any">
		<cfreturn this.HasExistingMaterialList>
	</cffunction>

	<cffunction name="setHasExistingMaterialList" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.HasExistingMaterialList = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>
</cfcomponent>