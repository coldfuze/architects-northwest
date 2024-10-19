<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.Plan">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	PlanId, PlanNumber, PlanTitle, PlanShortTitle, PlanDescription, PlanDesignFeatures, 
					PlanTypeId, PriceCategoryId, DesignerId, Stories, TotalSF, 
					MainFloorSF, UnitTotalSF, UpperFloorSF, LowerFloorSF, ThirdFloorSF, 
					GarageSF, BonusRmSF, StorageSF, CoveredPorchSF, DeckSF, 
					CoveredPatioSF, FullBathroomId, HalfBathroomId, BedroomId, MasterBedroomLocationId, 
					FoundationTypeId, LotSlopeId, HouseDimensionWidthFt, HouseDimensionWidthIn, HouseDimensionDepthFt, 
					HouseDimensionDepthIn, HouseDimensionHeightFt, HouseDimensionHeightIn, CeilingHeightMainFloor, CeilingHeightUpperFloor, 
					CeilingHeightThirdFloor, CeilingHeightLowerFloor, RoofLive, RoofDead, MaxWind, 
					RoofPrimary, RoofSecondary, RoofFramingId, FloorLive, FloorDead, 
					GarageSizeId, GarageDoorLocationId, CoveredPorchId, LivingArrangementId, Den, 
					CopyrightNumber, Animation, Animation360, Video, YouTube, LaundryRoomMain, 
					LaundryRoomUpper, LaundryRoomLower, BonusRecRoomMain, BonusRecRoomUpper, BonusRecRoomLower, 
					BonusRecRoomThird, MainFloorPlan, MainFloorPlanWidth, MainFloorPlanHeight, MainFloorPlanThuWidth, 
					MainFloorPlanThuHeight, UpperFloorPlan, UpperFloorPlanWidth, UpperFloorPlanHeight, UpperFloorPlanThuWidth, 
					UpperFloorPlanThuHeight, LowerFloorPlan, LowerFloorPlanWidth, LowerFloorPlanHeight, LowerFloorPlanThuWidth, 
					LowerFloorPlanThuHeight, ThirdFloorPlan, ThirdFloorPlanWidth, ThirdFloorPlanHeight, ThirdFloorPlanThuWidth, 
					ThirdFloorPlanThuHeight, HandDrawn, DisplayPlan, HasExistingMaterialList
			from dbo.[Plan]
			where PlanId = <cfqueryparam cfsqltype="CF_SQL_SMALLINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.Plan").init();
			obj.setPlanId(qRead.PlanId);
			obj.setPlanNumber(qRead.PlanNumber);
			obj.setPlanTitle(qRead.PlanTitle);
			obj.setPlanShortTitle(qRead.PlanShortTitle);
			obj.setPlanDescription(qRead.PlanDescription);
			obj.setPlanDesignFeatures(qRead.PlanDesignFeatures);
			obj.setPlanTypeId(qRead.PlanTypeId);
			obj.setPriceCategoryId(qRead.PriceCategoryId);
			obj.setDesignerId(qRead.DesignerId);
			obj.setStories(qRead.Stories);
			obj.setTotalSF(qRead.TotalSF);
			obj.setMainFloorSF(qRead.MainFloorSF);
			obj.setUnitTotalSF(qRead.UnitTotalSF);
			obj.setUpperFloorSF(qRead.UpperFloorSF);
			obj.setLowerFloorSF(qRead.LowerFloorSF);
			obj.setThirdFloorSF(qRead.ThirdFloorSF);
			obj.setGarageSF(qRead.GarageSF);
			obj.setBonusRmSF(qRead.BonusRmSF);
			obj.setStorageSF(qRead.StorageSF);
			obj.setCoveredPorchSF(qRead.CoveredPorchSF);
			obj.setDeckSF(qRead.DeckSF);
			obj.setCoveredPatioSF(qRead.CoveredPatioSF);
			obj.setFullBathroomId(qRead.FullBathroomId);
			obj.setHalfBathroomId(qRead.HalfBathroomId);
			obj.setBedroomId(qRead.BedroomId);
			obj.setMasterBedroomLocationId(qRead.MasterBedroomLocationId);
			obj.setFoundationTypeId(qRead.FoundationTypeId);
			obj.setLotSlopeId(qRead.LotSlopeId);
			obj.setHouseDimensionWidthFt(qRead.HouseDimensionWidthFt);
			obj.setHouseDimensionWidthIn(qRead.HouseDimensionWidthIn);
			obj.setHouseDimensionDepthFt(qRead.HouseDimensionDepthFt);
			obj.setHouseDimensionDepthIn(qRead.HouseDimensionDepthIn);
			obj.setHouseDimensionHeightFt(qRead.HouseDimensionHeightFt);
			obj.setHouseDimensionHeightIn(qRead.HouseDimensionHeightIn);
			obj.setCeilingHeightMainFloor(qRead.CeilingHeightMainFloor);
			obj.setCeilingHeightUpperFloor(qRead.CeilingHeightUpperFloor);
			obj.setCeilingHeightThirdFloor(qRead.CeilingHeightThirdFloor);
			obj.setCeilingHeightLowerFloor(qRead.CeilingHeightLowerFloor);
			obj.setRoofLive(qRead.RoofLive);
			obj.setRoofDead(qRead.RoofDead);
			obj.setMaxWind(qRead.MaxWind);
			obj.setRoofPrimary(qRead.RoofPrimary);
			obj.setRoofSecondary(qRead.RoofSecondary);
			obj.setRoofFramingId(qRead.RoofFramingId);
			obj.setFloorLive(qRead.FloorLive);
			obj.setFloorDead(qRead.FloorDead);
			obj.setGarageSizeId(qRead.GarageSizeId);
			obj.setGarageDoorLocationId(qRead.GarageDoorLocationId);
			obj.setCoveredPorchId(qRead.CoveredPorchId);
			obj.setLivingArrangementId(qRead.LivingArrangementId);
			obj.setDen(qRead.Den);
			obj.setCopyrightNumber(qRead.CopyrightNumber);
			obj.setAnimation(qRead.Animation);
			obj.setAnimation360(qRead.Animation360);
			obj.setVideo(qRead.Video);
			obj.setYouTube(qRead.YouTube);
			obj.setLaundryRoomMain(qRead.LaundryRoomMain);
			obj.setLaundryRoomUpper(qRead.LaundryRoomUpper);
			obj.setLaundryRoomLower(qRead.LaundryRoomLower);
			obj.setBonusRecRoomMain(qRead.BonusRecRoomMain);
			obj.setBonusRecRoomUpper(qRead.BonusRecRoomUpper);
			obj.setBonusRecRoomLower(qRead.BonusRecRoomLower);
			obj.setBonusRecRoomThird(qRead.BonusRecRoomThird);
			obj.setMainFloorPlan(qRead.MainFloorPlan);
			obj.setMainFloorPlanWidth(qRead.MainFloorPlanWidth);
			obj.setMainFloorPlanHeight(qRead.MainFloorPlanHeight);
			obj.setMainFloorPlanThuWidth(qRead.MainFloorPlanThuWidth);
			obj.setMainFloorPlanThuHeight(qRead.MainFloorPlanThuHeight);
			obj.setUpperFloorPlan(qRead.UpperFloorPlan);
			obj.setUpperFloorPlanWidth(qRead.UpperFloorPlanWidth);
			obj.setUpperFloorPlanHeight(qRead.UpperFloorPlanHeight);
			obj.setUpperFloorPlanThuWidth(qRead.UpperFloorPlanThuWidth);
			obj.setUpperFloorPlanThuHeight(qRead.UpperFloorPlanThuHeight);
			obj.setLowerFloorPlan(qRead.LowerFloorPlan);
			obj.setLowerFloorPlanWidth(qRead.LowerFloorPlanWidth);
			obj.setLowerFloorPlanHeight(qRead.LowerFloorPlanHeight);
			obj.setLowerFloorPlanThuWidth(qRead.LowerFloorPlanThuWidth);
			obj.setLowerFloorPlanThuHeight(qRead.LowerFloorPlanThuHeight);
			obj.setThirdFloorPlan(qRead.ThirdFloorPlan);
			obj.setThirdFloorPlanWidth(qRead.ThirdFloorPlanWidth);
			obj.setThirdFloorPlanHeight(qRead.ThirdFloorPlanHeight);
			obj.setThirdFloorPlanThuWidth(qRead.ThirdFloorPlanThuWidth);
			obj.setThirdFloorPlanThuHeight(qRead.ThirdFloorPlanThuHeight);
			obj.setHandDrawn(qRead.HandDrawn);
			obj.setDisplayPlan(qRead.DisplayPlan);
			obj.setHasExistingMaterialList(qRead.HasExistingMaterialList);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.Plan">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getPlanNumber()>
		<cfset var local2=arguments.bean.getPlanTitle()>
		<cfset var local3=arguments.bean.getPlanShortTitle()>
		<cfset var local4=arguments.bean.getPlanDescription()>
		<cfset var local5=arguments.bean.getPlanDesignFeatures()>
		<cfset var local6=arguments.bean.getPlanTypeId()>
		<cfset var local7=arguments.bean.getPriceCategoryId()>
		<cfset var local8=arguments.bean.getDesignerId()>
		<cfset var local9=arguments.bean.getStories()>
		<cfset var local10=arguments.bean.getTotalSF()>
		<cfset var local11=arguments.bean.getMainFloorSF()>
		<cfset var local12=arguments.bean.getUnitTotalSF()>
		<cfset var local13=arguments.bean.getUpperFloorSF()>
		<cfset var local14=arguments.bean.getLowerFloorSF()>
		<cfset var local15=arguments.bean.getThirdFloorSF()>
		<cfset var local16=arguments.bean.getGarageSF()>
		<cfset var local17=arguments.bean.getBonusRmSF()>
		<cfset var local18=arguments.bean.getStorageSF()>
		<cfset var local19=arguments.bean.getCoveredPorchSF()>
		<cfset var local20=arguments.bean.getDeckSF()>
		<cfset var local21=arguments.bean.getCoveredPatioSF()>
		<cfset var local22=arguments.bean.getFullBathroomId()>
		<cfset var local23=arguments.bean.getHalfBathroomId()>
		<cfset var local24=arguments.bean.getBedroomId()>
		<cfset var local25=arguments.bean.getMasterBedroomLocationId()>
		<cfset var local26=arguments.bean.getFoundationTypeId()>
		<cfset var local27=arguments.bean.getLotSlopeId()>
		<cfset var local28=arguments.bean.getHouseDimensionWidthFt()>
		<cfset var local29=arguments.bean.getHouseDimensionWidthIn()>
		<cfset var local30=arguments.bean.getHouseDimensionDepthFt()>
		<cfset var local31=arguments.bean.getHouseDimensionDepthIn()>
		<cfset var local32=arguments.bean.getHouseDimensionHeightFt()>
		<cfset var local33=arguments.bean.getHouseDimensionHeightIn()>
		<cfset var local34=arguments.bean.getCeilingHeightMainFloor()>
		<cfset var local35=arguments.bean.getCeilingHeightUpperFloor()>
		<cfset var local36=arguments.bean.getCeilingHeightThirdFloor()>
		<cfset var local37=arguments.bean.getCeilingHeightLowerFloor()>
		<cfset var local38=arguments.bean.getRoofLive()>
		<cfset var local39=arguments.bean.getRoofDead()>
		<cfset var local40=arguments.bean.getMaxWind()>
		<cfset var local41=arguments.bean.getRoofPrimary()>
		<cfset var local42=arguments.bean.getRoofSecondary()>
		<cfset var local43=arguments.bean.getRoofFramingId()>
		<cfset var local44=arguments.bean.getFloorLive()>
		<cfset var local45=arguments.bean.getFloorDead()>
		<cfset var local46=arguments.bean.getGarageSizeId()>
		<cfset var local47=arguments.bean.getGarageDoorLocationId()>
		<cfset var local48=arguments.bean.getCoveredPorchId()>
		<cfset var local49=arguments.bean.getLivingArrangementId()>
		<cfset var local50=arguments.bean.getDen()>
		<cfset var local51=arguments.bean.getCopyrightNumber()>
		<cfset var local52=arguments.bean.getAnimation()>
		<cfset var local53=arguments.bean.getAnimation360()>
		<cfset var local54=arguments.bean.getVideo()>
		<cfset var local55=arguments.bean.getLaundryRoomMain()>
		<cfset var local56=arguments.bean.getLaundryRoomUpper()>
		<cfset var local57=arguments.bean.getLaundryRoomLower()>
		<cfset var local58=arguments.bean.getBonusRecRoomMain()>
		<cfset var local59=arguments.bean.getBonusRecRoomUpper()>
		<cfset var local60=arguments.bean.getBonusRecRoomLower()>
		<cfset var local61=arguments.bean.getBonusRecRoomThird()>
		<cfset var local82=arguments.bean.getHandDrawn()>
		<cfset var local83=arguments.bean.getDisplayPlan()>
        <cfset var local84=arguments.bean.getYouTube()>
		<cfset var local85=arguments.bean.getHasExistingMaterialList()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="getId">
				insert into dbo.[Plan](PlanNumber, PlanTitle, PlanShortTitle, PlanDescription, PlanDesignFeatures, PlanTypeId, PriceCategoryId, DesignerId, Stories, TotalSF, MainFloorSF, UnitTotalSF, UpperFloorSF, LowerFloorSF, ThirdFloorSF, GarageSF, BonusRmSF, StorageSF, CoveredPorchSF, DeckSF, CoveredPatioSF, FullBathroomId, HalfBathroomId, BedroomId, MasterBedroomLocationId, FoundationTypeId, LotSlopeId, HouseDimensionWidthFt, HouseDimensionWidthIn, HouseDimensionDepthFt, HouseDimensionDepthIn, HouseDimensionHeightFt, HouseDimensionHeightIn, CeilingHeightMainFloor, CeilingHeightUpperFloor, CeilingHeightThirdFloor, CeilingHeightLowerFloor, RoofLive, RoofDead, MaxWind, RoofPrimary, RoofSecondary, RoofFramingId, FloorLive, FloorDead, GarageSizeId, GarageDoorLocationId, CoveredPorchId, LivingArrangementId, Den, CopyrightNumber, Animation, Animation360, Video, LaundryRoomMain, LaundryRoomUpper, LaundryRoomLower, BonusRecRoomMain, BonusRecRoomUpper, BonusRecRoomLower, BonusRecRoomThird, HandDrawn, DisplayPlan,YouTube,HasExistingMaterialList)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_TINYINT" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_TINYINT" null="#iif((local7 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_TINYINT" null="#iif((local8 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_TINYINT" null="#iif((local9 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local10 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local11 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local12 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local13 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local14 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local15#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local15 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local16#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local16 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local17#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local17 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local18#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local18 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local19#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local19 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local20#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local20 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local21#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local21 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local22#" cfsqltype="CF_SQL_TINYINT" null="#iif((local22 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local23#" cfsqltype="CF_SQL_TINYINT" null="#iif((local23 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local24#" cfsqltype="CF_SQL_TINYINT" null="#iif((local24 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local25#" cfsqltype="CF_SQL_TINYINT" null="#iif((local25 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local26#" cfsqltype="CF_SQL_TINYINT" null="#iif((local26 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local27#" cfsqltype="CF_SQL_TINYINT" null="#iif((local27 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local28#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local28 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local29#" cfsqltype="CF_SQL_TINYINT" null="#iif((local29 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local30#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local30 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local31#" cfsqltype="CF_SQL_TINYINT" null="#iif((local31 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local32#" cfsqltype="CF_SQL_TINYINT" null="#iif((local32 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local33#" cfsqltype="CF_SQL_TINYINT" null="#iif((local33 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local34#" cfsqltype="CF_SQL_TINYINT" null="#iif((local34 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local35#" cfsqltype="CF_SQL_TINYINT" null="#iif((local35 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local36#" cfsqltype="CF_SQL_TINYINT" null="#iif((local36 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local37#" cfsqltype="CF_SQL_TINYINT" null="#iif((local37 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local38#" cfsqltype="CF_SQL_TINYINT" null="#iif((local38 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local39#" cfsqltype="CF_SQL_TINYINT" null="#iif((local39 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local40#" cfsqltype="CF_SQL_TINYINT" null="#iif((local40 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local41#" cfsqltype="CF_SQL_TINYINT" null="#iif((local41 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local42#" cfsqltype="CF_SQL_TINYINT" null="#iif((local42 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local43#" cfsqltype="CF_SQL_TINYINT" null="#iif((local43 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local44#" cfsqltype="CF_SQL_TINYINT" null="#iif((local44 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local45#" cfsqltype="CF_SQL_TINYINT" null="#iif((local45 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local46#" cfsqltype="CF_SQL_TINYINT" null="#iif((local46 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local47#" cfsqltype="CF_SQL_TINYINT" null="#iif((local47 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local48#" cfsqltype="CF_SQL_TINYINT" null="#iif((local48 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local49#" cfsqltype="CF_SQL_TINYINT" null="#iif((local49 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local50#" cfsqltype="CF_SQL_BIT" null="#iif((local50 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local51#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local52#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local53#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local54#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local55#" cfsqltype="CF_SQL_BIT" null="#iif((local55 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local56#" cfsqltype="CF_SQL_BIT" null="#iif((local56 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local57#" cfsqltype="CF_SQL_BIT" null="#iif((local57 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local58#" cfsqltype="CF_SQL_BIT" null="#iif((local58 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local59#" cfsqltype="CF_SQL_BIT" null="#iif((local59 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local60#" cfsqltype="CF_SQL_BIT" null="#iif((local60 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local61#" cfsqltype="CF_SQL_BIT" null="#iif((local61 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local82#" cfsqltype="CF_SQL_BIT" null="#iif((local82 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local83#" cfsqltype="CF_SQL_BIT" null="#iif((local83 eq ""), de("yes"), de("no"))#" />,
                    <cfqueryparam value="#local84#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local85#" cfsqltype="CF_SQL_BIT" null="#iif((local85 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setPlanId(getID.IDENTITYCOL);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="update" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.Plan">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#"result="status">
			update dbo.[Plan]
			set PlanNumber = <cfqueryparam value="#arguments.bean.getPlanNumber()#" cfsqltype="CF_SQL_VARCHAR" />,
				PlanTitle = <cfqueryparam value="#arguments.bean.getPlanTitle()#" cfsqltype="CF_SQL_VARCHAR" />,
				PlanShortTitle = <cfqueryparam value="#arguments.bean.getPlanShortTitle()#" cfsqltype="CF_SQL_VARCHAR" />,
				PlanDescription = <cfqueryparam value="#arguments.bean.getPlanDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				PlanDesignFeatures = <cfqueryparam value="#arguments.bean.getPlanDesignFeatures()#" cfsqltype="CF_SQL_VARCHAR" />,
				PlanTypeId = <cfqueryparam value="#arguments.bean.getPlanTypeId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getPlanTypeId() eq ""), de("yes"), de("no"))#" />,
				PriceCategoryId = <cfqueryparam value="#arguments.bean.getPriceCategoryId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getPriceCategoryId() eq ""), de("yes"), de("no"))#" />,
				DesignerId = <cfqueryparam value="#arguments.bean.getDesignerId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getDesignerId() eq ""), de("yes"), de("no"))#" />,
				Stories = <cfqueryparam value="#arguments.bean.getStories()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getStories() eq ""), de("yes"), de("no"))#" />,
				TotalSF = <cfqueryparam value="#arguments.bean.getTotalSF()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getTotalSF() eq ""), de("yes"), de("no"))#" />,
				MainFloorSF = <cfqueryparam value="#arguments.bean.getMainFloorSF()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getMainFloorSF() eq ""), de("yes"), de("no"))#" />,
				UnitTotalSF = <cfqueryparam value="#arguments.bean.getUnitTotalSF()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getUnitTotalSF() eq ""), de("yes"), de("no"))#" />,
				UpperFloorSF = <cfqueryparam value="#arguments.bean.getUpperFloorSF()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getUpperFloorSF() eq ""), de("yes"), de("no"))#" />,
				LowerFloorSF = <cfqueryparam value="#arguments.bean.getLowerFloorSF()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getLowerFloorSF() eq ""), de("yes"), de("no"))#" />,
				ThirdFloorSF = <cfqueryparam value="#arguments.bean.getThirdFloorSF()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getThirdFloorSF() eq ""), de("yes"), de("no"))#" />,
				GarageSF = <cfqueryparam value="#arguments.bean.getGarageSF()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getGarageSF() eq ""), de("yes"), de("no"))#" />,
				BonusRmSF = <cfqueryparam value="#arguments.bean.getBonusRmSF()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getBonusRmSF() eq ""), de("yes"), de("no"))#" />,
				StorageSF = <cfqueryparam value="#arguments.bean.getStorageSF()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getStorageSF() eq ""), de("yes"), de("no"))#" />,
				CoveredPorchSF = <cfqueryparam value="#arguments.bean.getCoveredPorchSF()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getCoveredPorchSF() eq ""), de("yes"), de("no"))#" />,
				DeckSF = <cfqueryparam value="#arguments.bean.getDeckSF()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getDeckSF() eq ""), de("yes"), de("no"))#" />,
				CoveredPatioSF = <cfqueryparam value="#arguments.bean.getCoveredPatioSF()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getCoveredPatioSF() eq ""), de("yes"), de("no"))#" />,
				FullBathroomId = <cfqueryparam value="#arguments.bean.getFullBathroomId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getFullBathroomId() eq ""), de("yes"), de("no"))#" />,
				HalfBathroomId = <cfqueryparam value="#arguments.bean.getHalfBathroomId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getHalfBathroomId() eq ""), de("yes"), de("no"))#" />,
				BedroomId = <cfqueryparam value="#arguments.bean.getBedroomId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getBedroomId() eq ""), de("yes"), de("no"))#" />,
				MasterBedroomLocationId = <cfqueryparam value="#arguments.bean.getMasterBedroomLocationId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getMasterBedroomLocationId() eq ""), de("yes"), de("no"))#" />,
				FoundationTypeId = <cfqueryparam value="#arguments.bean.getFoundationTypeId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getFoundationTypeId() eq ""), de("yes"), de("no"))#" />,
				LotSlopeId = <cfqueryparam value="#arguments.bean.getLotSlopeId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getLotSlopeId() eq ""), de("yes"), de("no"))#" />,
				HouseDimensionWidthFt = <cfqueryparam value="#arguments.bean.getHouseDimensionWidthFt()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getHouseDimensionWidthFt() eq ""), de("yes"), de("no"))#" />,
				HouseDimensionWidthIn = <cfqueryparam value="#arguments.bean.getHouseDimensionWidthIn()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getHouseDimensionWidthIn() eq ""), de("yes"), de("no"))#" />,
				HouseDimensionDepthFt = <cfqueryparam value="#arguments.bean.getHouseDimensionDepthFt()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getHouseDimensionDepthFt() eq ""), de("yes"), de("no"))#" />,
				HouseDimensionDepthIn = <cfqueryparam value="#arguments.bean.getHouseDimensionDepthIn()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getHouseDimensionDepthIn() eq ""), de("yes"), de("no"))#" />,
				HouseDimensionHeightFt = <cfqueryparam value="#arguments.bean.getHouseDimensionHeightFt()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getHouseDimensionHeightFt() eq ""), de("yes"), de("no"))#" />,
				HouseDimensionHeightIn = <cfqueryparam value="#arguments.bean.getHouseDimensionHeightIn()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getHouseDimensionHeightIn() eq ""), de("yes"), de("no"))#" />,
				CeilingHeightMainFloor = <cfqueryparam value="#arguments.bean.getCeilingHeightMainFloor()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getCeilingHeightMainFloor() eq ""), de("yes"), de("no"))#" />,
				CeilingHeightUpperFloor = <cfqueryparam value="#arguments.bean.getCeilingHeightUpperFloor()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getCeilingHeightUpperFloor() eq ""), de("yes"), de("no"))#" />,
				CeilingHeightThirdFloor = <cfqueryparam value="#arguments.bean.getCeilingHeightThirdFloor()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getCeilingHeightThirdFloor() eq ""), de("yes"), de("no"))#" />,
				CeilingHeightLowerFloor = <cfqueryparam value="#arguments.bean.getCeilingHeightLowerFloor()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getCeilingHeightLowerFloor() eq ""), de("yes"), de("no"))#" />,
				RoofLive = <cfqueryparam value="#arguments.bean.getRoofLive()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getRoofLive() eq ""), de("yes"), de("no"))#" />,
				RoofDead = <cfqueryparam value="#arguments.bean.getRoofDead()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getRoofDead() eq ""), de("yes"), de("no"))#" />,
				MaxWind = <cfqueryparam value="#arguments.bean.getMaxWind()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getMaxWind() eq ""), de("yes"), de("no"))#" />,
				RoofPrimary = <cfqueryparam value="#arguments.bean.getRoofPrimary()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getRoofPrimary() eq ""), de("yes"), de("no"))#" />,
				RoofSecondary = <cfqueryparam value="#arguments.bean.getRoofSecondary()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getRoofSecondary() eq ""), de("yes"), de("no"))#" />,
				RoofFramingId = <cfqueryparam value="#arguments.bean.getRoofFramingId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getRoofFramingId() eq ""), de("yes"), de("no"))#" />,
				FloorLive = <cfqueryparam value="#arguments.bean.getFloorLive()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getFloorLive() eq ""), de("yes"), de("no"))#" />,
				FloorDead = <cfqueryparam value="#arguments.bean.getFloorDead()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getFloorDead() eq ""), de("yes"), de("no"))#" />,
				GarageSizeId = <cfqueryparam value="#arguments.bean.getGarageSizeId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getGarageSizeId() eq ""), de("yes"), de("no"))#" />,
				GarageDoorLocationId = <cfqueryparam value="#arguments.bean.getGarageDoorLocationId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getGarageDoorLocationId() eq ""), de("yes"), de("no"))#" />,
				CoveredPorchId = <cfqueryparam value="#arguments.bean.getCoveredPorchId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getCoveredPorchId() eq ""), de("yes"), de("no"))#" />,
				LivingArrangementId = <cfqueryparam value="#arguments.bean.getLivingArrangementId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getLivingArrangementId() eq ""), de("yes"), de("no"))#" />,
				Den = <cfqueryparam value="#arguments.bean.getDen()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getDen() eq ""), de("yes"), de("no"))#" />,
				CopyrightNumber = <cfqueryparam value="#arguments.bean.getCopyrightNumber()#" cfsqltype="CF_SQL_VARCHAR" />,
				Animation = <cfqueryparam value="#arguments.bean.getAnimation()#" cfsqltype="CF_SQL_VARCHAR" />,
				Animation360 = <cfqueryparam value="#arguments.bean.getAnimation360()#" cfsqltype="CF_SQL_VARCHAR" />,
				Video = <cfqueryparam value="#arguments.bean.getVideo()#" cfsqltype="CF_SQL_VARCHAR" />,
				LaundryRoomMain = <cfqueryparam value="#arguments.bean.getLaundryRoomMain()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getLaundryRoomMain() eq ""), de("yes"), de("no"))#" />,
				LaundryRoomUpper = <cfqueryparam value="#arguments.bean.getLaundryRoomUpper()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getLaundryRoomUpper() eq ""), de("yes"), de("no"))#" />,
				LaundryRoomLower = <cfqueryparam value="#arguments.bean.getLaundryRoomLower()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getLaundryRoomLower() eq ""), de("yes"), de("no"))#" />,
				BonusRecRoomMain = <cfqueryparam value="#arguments.bean.getBonusRecRoomMain()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getBonusRecRoomMain() eq ""), de("yes"), de("no"))#" />,
				BonusRecRoomUpper = <cfqueryparam value="#arguments.bean.getBonusRecRoomUpper()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getBonusRecRoomUpper() eq ""), de("yes"), de("no"))#" />,
				BonusRecRoomLower = <cfqueryparam value="#arguments.bean.getBonusRecRoomLower()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getBonusRecRoomLower() eq ""), de("yes"), de("no"))#" />,
				BonusRecRoomThird = <cfqueryparam value="#arguments.bean.getBonusRecRoomThird()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getBonusRecRoomThird() eq ""), de("yes"), de("no"))#" />,
				HandDrawn = <cfqueryparam value="#arguments.bean.getHandDrawn()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getHandDrawn() eq ""), de("yes"), de("no"))#" />,
				DisplayPlan = <cfqueryparam value="#arguments.bean.getDisplayPlan()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getDisplayPlan() eq ""), de("yes"), de("no"))#" />,
                YouTube = <cfqueryparam value="#arguments.bean.getYouTube()#" cfsqltype="CF_SQL_VARCHAR" />,
				HasExistingMaterialList = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.bean.getHasExistingMaterialList()#">
			where PlanId = <cfqueryparam value="#arguments.bean.getPlanId()#" cfsqltype="CF_SQL_SMALLINT">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="delete" output="false" access="public" returntype="void" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.Plan">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			delete
			from dbo.[Plan]
			where PlanId = <cfqueryparam cfsqltype="CF_SQL_SMALLINT" value="#arguments.bean.getPlanId()#" />
		</cfquery>
	</cffunction>
</cfcomponent>