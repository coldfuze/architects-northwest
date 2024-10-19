<cfcomponent extends="PlanGateway">
	<cffunction name="getPicklist" access="public" returntype="query" roles="admin" hint="This method returns a picklist of Plans">
    	<cfscript>
			var gi="";
		</cfscript>
        
    	<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	CASE WHEN LEN(RTrim(LTrim(PlanTitle))) > 0 THEN PlanNumber + ' - ' + PlanTitle
            		ELSE PlanNumber
                    END AS PlanTitle,
                    PlanId
            FROM	[Plan]
            ORDER BY PlanNumber
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="getPulldownFromPlanNumber" access="remote" returntype="array" hint="This method returns a query to be used in an auto-suggest pulldown of plans">
        <cfargument name="PlanNumber" required="yes" type="string" hont="This argument expects a string to be used to search for a plan number">
        <cfscript>
			var gi="";
			var plans = "";
		</cfscript>
        
    	<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	PlanNumber
            FROM	[Plan]
            WHERE	PlanNumber LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.PlanNumber#%" maxlength="20">
            ORDER BY PlanNumber
        </cfquery>
        
        <cfscript>
			if (gi.recordCount GT 0) {
				plans = ValueList(gi.PlanNumber);
				plans = ListToArray(VARIABLES.Plans);
			}
			else {
				plans = ArrayNew(1);	
			}
		</cfscript>
        
        <cfreturn plans>
    </cffunction>
    
    <cffunction name="getPlanTitle" access="public" returntype="string" hint="This method returns the plan title for a plan">
    	<cfargument name="PlanId" type="numeric" required="yes" hint="This argument expects a numeric PlanId">
        <cfscript>
			var gi="";
			var planTitle = "";
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	CASE WHEN LEN(RTrim(LTrim(PlanTitle))) > 0 THEN PlanNumber + ' - ' + PlanTitle
            		ELSE PlanNumber
                    END AS PlanTitle
            FROM	[Plan]
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.PlanId#">
        </cfquery>
        
        <cfscript>
			if (gi.recordCount EQ 1) {
				planTitle = gi.PlanTitle;	
			}
			else {
				planTitle = "Plan does not exist or has been deleted";
			}
		</cfscript>
        
        <cfreturn planTitle>
    </cffunction>
    
    <cffunction name="getPlanTitleWithTitleFirst" access="public" returntype="string" hint="This method returns the plan title for a plan">
    	<cfargument name="PlanId" type="numeric" required="yes" hint="This argument expects a numeric PlanId">
        <cfscript>
			var gi="";
			var planTitle = "";
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	CASE WHEN LEN(RTrim(LTrim(PlanTitle))) > 0 THEN PlanTitle + ' - Plan ' + PlanNumber
            		ELSE PlanNumber
                    END AS PlanTitle
            FROM	[Plan]
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.PlanId#">
        </cfquery>
        
        <cfscript>
			if (gi.recordCount EQ 1) {
				planTitle = gi.PlanTitle;	
			}
			else {
				planTitle = "Plan does not exist or has been deleted";
			}
		</cfscript>
        
        <cfreturn planTitle>
    </cffunction>
    
    <cffunction name="getPlanTitlePicklistforQuickSearch" access="public" returntype="query" hint="This method returns a query for use in the Quick Search plan title picklist">
    	<cfscript>
			var gi="";
		</cfscript>
        
    	<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
            SELECT PlanTitle, PlanId
            FROM [Plan]
            WHERE PlanTitle IS NOT NULL AND DisplayPlan = 1
            ORDER BY PlanTitle
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="getPlanNumberPicklistforQuickSearch" access="public" returntype="query" hint="This method returns a query for use in the Quick Search plan title picklist">
    	<cfscript>
			var gi = "";
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
            SELECT PlanId, PlanNumber
            FROM [Plan]
            WHERE DisplayPlan = <cfqueryparam cfsqltype="cf_sql_bit" value="1">
            ORDER BY PlanNumber
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="getTotalPlansLoaded" access="public" returntype="numeric" hint="This method returns the total number of plans loaded to the database">
    	<cfscript>
			var gi = "";
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
            SELECT COUNT(*) AS PlanCount
            FROM [Plan]
        </cfquery>
        
        <cfreturn gi.PlanCount>
    </cffunction>
    
    <cffunction name="getPlanInfo" access="public" roles="" returntype="query" hint="This method returns detailed information about a plan">
    	<cfargument name="PlanId" required="yes" type="numeric" hint="This argument expects a numeric PlanId">
        <cfscript>
			var gi="";
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	a.PlanId,
            		a.PlanNumber,
                    a.PlanTitle,
                    LTRIM(RTRIM(a.PlanDescription)) AS PlanDescription,
                    LTRIM(RTRIM(a.PlanDesignFeatures)) AS PlanDesignFeatures,
            		b.PlanType,
                    a.PlanTypeId,
                    c.PriceCategory,
                    a.PriceCategoryId,
                    d.Designer,
                    a.Stories,
                    a.TotalSF,
                    a.MainFloorSF,
                    a.UnitTotalSF,
                    a.UpperFloorSF,
                    a.LowerFloorSF,
                    a.ThirdFloorSF,
                    a.GarageSF,
                    a.BonusRmSF,
                    a.StorageSF,
                    a.CoveredPorchSF,
                    a.DeckSF,
                    a.CoveredPatioSF,
                    e.FullBathroom,
                    f.HalfBathroom,
                    g.Bedroom,
                    h.MasterBedroomLocation,
                    i.FoundationType,
                    j.LotSlope,
                    a.HouseDimensionWidthFt,
                    a.HouseDimensionWidthIn,
                    a.HouseDimensionDepthFt,
                    a.HouseDimensionDepthIn,
                    a.HouseDimensionHeightFt,
                    a.HouseDimensionHeightIn,
                    a.CeilingHeightMainFloor,
                    a.CeilingHeightUpperFloor,
                    a.CeilingHeightThirdFloor,
                    a.CeilingHeightLowerFloor,
                    a.RoofLive,
                    a.RoofDead,
                    a.MaxWind,
                    a.RoofPrimary,
                    a.RoofSecondary,
                    k.RoofFraming,
                    a.FloorLive,
                    a.FloorDead,
                    a.GarageSizeId,
                    l.GarageSize,
                    l.GarageSizeAbbr,
                    m.GarageDoorLocationAbbr,
                    n.CoveredPorch,
                    o.LivingArrangement,
                    a.Den,
                    a.CopyrightNumber,
                    a.LaundryRoomMain,
                    a.LaundryRoomUpper,
                    a.LaundryRoomLower,
                    a.BonusRecRoomMain,
                    a.BonusRecRoomUpper,
                    a.BonusRecRoomLower,
                    a.BonusRecRoomThird,
                    a.MainFloorPlan,
                    a.MainFloorPlanWidth,
                    a.MainFloorPlanHeight,
                    a.MainFloorPlanThuWidth,
                    a.MainFloorPlanThuHeight,
                    a.UpperFloorPlan,
                    a.UpperFloorPlanWidth,
                    a.UpperFloorPlanHeight,
                    a.UpperFloorPlanThuWidth,
                    a.UpperFloorPlanThuHeight,
                    a.LowerFloorPlan,
                    a.LowerFloorPlanWidth,
                    a.LowerFloorPlanHeight,
                    a.LowerFloorPlanThuWidth,
                    a.LowerFloorPlanThuHeight,
                    a.ThirdFloorPlan,
                    a.ThirdFloorPlanWidth,
                    a.ThirdFloorPlanHeight,
                    a.ThirdFloorPlanThuWidth,
                    a.ThirdFloorPlanThuHeight,
                    a.HandDrawn,
                    a.DisplayPlan,
                    '/assets/planImages/' + CAST(a.PlanId AS VARCHAR(5)) + '/planThu/' + CAST(p.ImageFile AS VARCHAR(70)) AS PlanThumbnail
            FROM	[Plan] a
            		LEFT JOIN PlanType b ON a.PlanTypeId = b.PlanTypeId
                    LEFT JOIN PriceCategory c ON a.PriceCategoryId = c.PriceCategoryId
                    LEFT JOIN Designer d ON a.DesignerId = d.DesignerId
                    LEFT JOIN FullBathroom e ON a.FullBathroomId = e.FullBathroomId
                    LEFT JOIN HalfBathroom f ON a.HalfBathroomId = f.HalfBathroomId
                    LEFT JOIN Bedroom g ON a.BedroomId = g.BedroomId
                    LEFT JOIN MasterBedroomLocation h ON a.MasterBedroomLocationId = h.MasterBedroomLocationId
                    LEFT JOIN FoundationType i ON a.FoundationTypeId = i.FoundationTypeId
                    LEFT JOIN LotSlope j ON a.LotSlopeId = j.LotSlopeId
                    LEFT JOIN RoofFraming k ON a.RoofFramingId = k.RoofFramingId
                    LEFT JOIN GarageSize l ON a.GarageSizeId = l.GarageSizeId
                    LEFT JOIN GarageDoorLocation m ON a.GarageDoorLocationId = m.GarageDoorLocationId
                    LEFT JOIN CoveredPorch n ON a.CoveredPorchId = n.CoveredPorchId
                    LEFT JOIN LivingArrangement o ON a.LivingArrangementId = o.LivingArrangementId
                    LEFT JOIN PlanImage p ON a.PlanId = p.PlanId
             WHERE	a.PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.PlanId#">
             		AND p.isPlanThumbnail = 1
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="getPlanDesignFeatures" access="public" returntype="any" hint="This method returns the design features for a plan as a sorted, bulleted list">
    	<cfargument name="PlanId" required="yes" type="numeric" hint="This argument expects a numeric PlanId">
        <cfscript>
			// Get House Plan Collection and Popular Search Items for a Plan
			var hpcps = Application.SearchSubGroupingService.getHousePlanCollectionAndPopularSearchItemsforPlan(ARGUMENTS.PlanId);
			var gi2 = "";
			var gi3 = "";
			var thisRow = 0;
			var newRow = "";
			var newValue = "";
			var planDesignFeatures = QueryNew("PlanDesignFeature","varchar");
			var LaundryRoom = "";
			var BonusSpace = "";
			var DesignFeatures = "";
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi2">
        	SELECT	CASE WHEN LEN(RTRIM(LTRIM(h.MasterBedroomLocation)))  > 0 THEN 
            			'Master Bedroom @ ' + h.MasterBedroomLocation
                    ELSE h.MasterBedroomLocation
                    END AS MasterBedroomLocation,
                    CASE WHEN LEN(RTRIM(LTRIM(n.CoveredPorch))) > 0 THEN
                    	n.CoveredPorch + ' Porch'
                    ELSE n.CoveredPorch
                    END AS CoveredPorch,
                    o.LivingArrangement,
                    a.Den,
                    a.LaundryRoomMain,
                    a.LaundryRoomUpper,
                    a.LaundryRoomLower,
                    a.BonusRecRoomMain,
                    a.BonusRecRoomUpper,
                    a.BonusRecRoomLower,
                    a.BonusRecRoomThird
            FROM	[Plan] a
                    LEFT JOIN MasterBedroomLocation h ON a.MasterBedroomLocationId = h.MasterBedroomLocationId
                    LEFT JOIN CoveredPorch n ON a.CoveredPorchId = n.CoveredPorchId
                    LEFT JOIN LivingArrangement o ON a.LivingArrangementId = o.LivingArrangementId
            WHERE	a.PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.PlanId#">
        </cfquery>
        
        <cfif gi2.LaundryRoomMain EQ 1>
        	<cfif gi2.LaundryRoomUpper EQ 1>
            	<cfif gi2.LaundryRoomLower EQ 1>
                	<cfscript>
						LaundryRoom = 'Laundry Room @ Main, Upper &amp; Lower Floor';
					</cfscript>
                <cfelse>
                	<cfscript>
						LaundryRoom = 'Laundry Room @ Main &amp; Upper Floor';
					</cfscript>
                </cfif>
            <cfelse>
            	<cfscript>
					LaundryRoom = 'Laundry Room @ Main Floor';
				</cfscript>
            </cfif>
        <cfelseif gi2.LaundryRoomUpper EQ 1>
        	<cfif gi2.LaundryRoomLower EQ 1>
				<cfscript>
                    LaundryRoom = 'Laundry Room @ Upper &amp; Lower Floor';
                </cfscript>
            <cfelse>
                <cfscript>
                    LaundryRoom = 'Laundry Room @ Upper Floor';
                </cfscript>
            </cfif>
        <cfelseif gi2.LaundryRoomLower EQ 1>
			<cfscript>
                LaundryRoom = 'Laundry Room @ Lower Floor';
            </cfscript>
        <cfelse>
        	<cfscript>
				LaundryRoom = '';
			</cfscript>
        </cfif>
        
        <cfif gi2.BonusRecRoomMain EQ 1>
        	<cfif gi2.BonusRecRoomUpper EQ 1>
            	<cfif gi2.BonusRecRoomLower EQ 1>
                	<cfif gi2.BonusRecRoomThird EQ 1>
                    	<cfscript>
                    		BonusSpace = 'Bonus Space @ Main Floor, Upper Floor, Lower Floor &amp; Third Floor';
						</cfscript>
                    <cfelse>
                    	<cfscript>
                    		BonusSpace = 'Bonus Space @ Main Floor, Upper Floor &amp; Lower Floor';
						</cfscript>
                    </cfif>
                <cfelse>
                	<cfscript>
						BonusSpace = 'Bonus Space @ Main Floor &amp; Upper Floor';
					</cfscript>
                </cfif>
            <cfelse>
            	<cfscript>
					BonusSpace = 'Bonus Space @ Main Floor';
				</cfscript>
            </cfif>
        <cfelseif gi2.BonusRecRoomUpper EQ 1>
        	<cfif gi2.BonusRecRoomLower EQ 1>
				<cfif gi2.BonusRecRoomThird EQ 1>
                    <cfscript>
                        BonusSpace = 'Bonus Space @ Upper Floor, Lower Floor &amp; Third Floor';
                    </cfscript>
                <cfelse>
                    <cfscript>
                        BonusSpace = 'Bonus Space @ Upper Floor &amp; Lower Floor';
                    </cfscript>
                </cfif>
            <cfelse>
                <cfscript>
                    BonusSpace = 'Bonus Space @ Upper Floor';
                </cfscript>
            </cfif>
        <cfelseif gi2.BonusRecRoomLower EQ 1>
        	<cfif gi2.BonusRecRoomThird EQ 1>
				<cfscript>
                    BonusSpace = 'Bonus Space @ Lower Floor &amp; Third Floor';
                </cfscript>
            <cfelse>
                <cfscript>
                    BonusSpace = 'Bonus Space @ Lower Floor';
                </cfscript>
            </cfif>
        <cfelseif gi2.BonusRecRoomThird EQ 1>
			<cfscript>
                BonusSpace = 'Bonus Space @ Third Floor';
            </cfscript>
        <cfelse>
        	<cfscript>
                BonusSpace = '';
            </cfscript>
        </cfif>
        
        <cfscript>
			if (LEN(TRIM(LaundryRoom)) GT 0) {
				newRow = QueryAddRow(planDesignFeatures,1);
				thisRow = thisRow + 1;
				newValue = QuerySetCell(planDesignFeatures,"PlanDesignFeature",LaundryRoom,thisRow);
			}
			if (LEN(TRIM(BonusSpace)) GT 0) {
				newRow = QueryAddRow(planDesignFeatures,1);
				thisRow = thisRow + 1;
				newValue = QuerySetCell(planDesignFeatures,"PlanDesignFeature",BonusSpace,thisRow);
			}
			if (LEN(TRIM(gi2.MasterBedroomLocation)) GT 0) {
				newRow = QueryAddRow(planDesignFeatures,1);
				thisRow = thisRow + 1;
				newValue = QuerySetCell(planDesignFeatures,"PlanDesignFeature",gi2.MasterBedroomLocation,thisRow);
			}
			if (LEN(TRIM(gi2.CoveredPorch)) GT 0) {
				newRow = QueryAddRow(planDesignFeatures,1);
				thisRow = thisRow + 1;
				newValue = QuerySetCell(planDesignFeatures,"PlanDesignFeature",gi2.CoveredPorch,thisRow);
			}
			if (LEN(TRIM(gi2.LivingArrangement)) GT 0) {
				newRow = QueryAddRow(planDesignFeatures,1);
				thisRow = thisRow + 1;
				newValue = QuerySetCell(planDesignFeatures,"PlanDesignFeature",gi2.LivingArrangement,thisRow);
			}
			if (gi2.Den EQ 1) {
				newRow = QueryAddRow(planDesignFeatures,1);
				thisRow = thisRow + 1;
				newValue = QuerySetCell(planDesignFeatures,"PlanDesignFeature","Den/Office",thisRow);
			}
		</cfscript>

        <cfquery name="gi3" dbtype="query">
        	SELECT *
            FROM hpcps
            UNION
            SELECT *
            FROM planDesignFeatures
            ORDER BY PlanDesignFeature
        </cfquery>
        
        <cfsavecontent variable="DesignFeatures">
        	<ul type="square" style="margin-top:0px;margin-left:15px;">
            	<cfoutput query="gi3"><li>#PlanDesignFeature#</li></cfoutput>
            </ul>
        </cfsavecontent>
        
        <cfreturn DesignFeatures>
    </cffunction>
    
    <cffunction name="getAnimationForPlan" access="public" returntype="string" hont="This method returns an animation file for a plan">
    	<cfargument name="PlanId" required="yes" type="numeric" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT 	Animation
            FROM	[Plan]
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.PlanId#">
        </cfquery>
        
        <cfreturn gi.Animation>
    </cffunction>
    
    <cffunction name="getVideoForPlan" access="public" returntype="string" hont="This method returns an video file for a plan">
    	<cfargument name="PlanId" required="yes" type="numeric" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT 	Video
            FROM	[Plan]
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.PlanId#">
        </cfquery>
        
        <cfreturn gi.Video>
    </cffunction>
    
    <cffunction name="doesPlanHaveMedia" access="public" returntype="struct" hont="This method returns a boolean value as to whether a plan has video or audio, or a 360 degree animation">
    	<cfargument name="PlanId" required="yes" type="numeric" hint="This argument expects a numeric PlanId">
        <cfscript>
			var mediaInfo = "";
			var videoPath = '/assets/videos';
			var animationPath = '/assets/animations';
			var animation360Path = '/assets/animation360/' & ARGUMENTS.PlanId & '/default.htm';
			var videoUploadPath = ExpandPath(videoPath);
			var animationUploadPath = ExpandPath(animationPath);
			var existingAnimation360 = ExpandPath(animation360Path);
			var mi = StructNew();
			var existingVideo = "";
			var existingAnimation = "";
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="mediaInfo">
        	SELECT 	Video, Animation, Animation360
            FROM	[Plan]
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.PlanId#">
        </cfquery>
        
        <cfscript>			
			mi.hasMedia = 0;
			mi.hasVideo = 0;
			mi.hasAnimation = 0;
			mi.hasAnimation360 = 0;
			mi.animation360Path = animation360Path;
			mi.animationPath = animationPath & '/' & mediaInfo.Animation;
			mi.videoPath = videoPath & '/' & mediaInfo.Video;
			
			if (LEN(TRIM(mediaInfo.Video)) GT 0) {
				existingVideo = videoUploadPath & '\' & mediaInfo.Video;
				
				if (FileExists(existingVideo)) {
					mi.hasVideo = 1;
					mi.hasMedia = 1;
				}
			}
			
			if (LEN(TRIM(mediaInfo.Animation)) GT 0) {
				existingAnimation = animationUploadPath & '\' & mediaInfo.Animation;
				
				if (FileExists(existingAnimation)) {
					mi.hasAnimation = 1;
					mi.hasMedia = 1;
				}
			}
			
			if (LEN(TRIM(mediaInfo.Animation360)) GT 0) {				
				if (FileExists(existingAnimation360)) {
					mi.hasAnimation360 = 1;
					mi.hasMedia = 1;
				}
			}
		</cfscript>
        
        <cfreturn mi>
    </cffunction>
    
    <cffunction name="updateAnimationForPlan" access="public" roles="admin" returntype="void" hint="This method updates the animation record for a plan">
    	<cfargument name="pi" required="yes" type="struct" hint="This argument expects a structure containing the PlanId and the Animation file name">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	UPDATE	[Plan]
            SET		Animation = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.pi.Animation#">
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.pi.PlanId#">
        </cfquery>
    </cffunction>
    
    <cffunction name="updateVideoForPlan" access="public" roles="admin" returntype="void" hint="This method updates the video record for a plan">
    	<cfargument name="pi" required="yes" type="struct" hint="This argument expects a structure containing the PlanId and the Animation file name">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	UPDATE	[Plan]
            SET		Video = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.pi.Video#">
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.pi.PlanId#">
        </cfquery>
    </cffunction>
    
    <cffunction name="getPreviousAndNextPlanForSiteManagement" access="public" returntype="struct" hint="This method returns the previous and next plan (by number) to assist in updating plans">
    	<cfargument name="PlanId" required="yes" type="numeric" hint="This argument expects a numeric PlanId">
        <cfscript>
			var getAllPlanIds = "";
			var PlanList = "";
			var thisPlanPosition = "";
			var nextPlanPosition = "";
			var nextPlanId = 0;
			var previousPlanId = 0;
			var previousPlanPosition = "";
			var pp = "";
			var np = "";
			var nppi = StructNew();
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="getAllPlanIds">
        	SELECT 	PlanId
            FROM	[Plan]
            ORDER BY PlanNumber
        </cfquery>
        
        <cfscript>
			PlanList = ValueList(getAllPlanIds.PlanId);
			thisPlanPosition = ListFind(PlanList,ARGUMENTS.PlanId);
			if (thisPlanPosition LT getAllPlanIds.recordCount) {
				nextPlanPosition = thisPlanPosition + 1;
				nextPlanId = ListGetAt(PlanList,nextPlanPosition);
			}
			if (thisPlanPosition GT 1) {
				previousPlanPosition = thisPlanPosition - 1;
				previousPlanId = ListGetAt(PlanList,previousPlanPosition);
			}
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="pp">
        	SELECT 	PlanTitle + ' - ' + PlanNumber AS PlanTitle
            FROM 	[Plan]
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#previousPlanId#">
        </cfquery>
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="np">
        	SELECT 	PlanTitle + ' - ' + PlanNumber AS PlanTitle
            FROM 	[Plan]
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#nextPlanId#">
        </cfquery>
        
   		<cfscript>
			nppi.previousPlanId = previousPlanId;
			nppi.previousPlanTitle = pp.PlanTitle;
			nppi.nextPlanId = nextPlanId;
			nppi.nextPlanTitle = np.PlanTitle;
			nppi.thisPlanPosition = thisPlanPosition;
			nppi.PlanList = PlanList;
		</cfscript>
        
        <cfreturn nppi>
    </cffunction>
    
    <cffunction name="getRelatedPlansForPlan" access="public" returntype="query" hint="This method returns related plans for a plan">
    	<cfargument name="PlanId" required="yes" type="numeric" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	a.RelatedPlanId,
            		CASE WHEN LEN(RTRIM(LTRIM(b.PlanTitle))) > 0 THEN 'Click to View Plan ' + b.PlanNumber + ' - '  + b.PlanTitle
                    ELSE 'Click to View Plan ' +  b.PlanTitle
                    END AS PlanTitleLong,
                    CASE WHEN LEN(RTRIM(LTRIM(b.PlanShortTitle))) > 0 THEN b.PlanShortTitle
                    ELSE b.PlanTitle
                    END AS PlanTitle,
                    c.ImageFile
             FROM	RelatedPlan a
             		INNER JOIN [Plan] b ON a.RelatedPlanId = b.PlanId
                    INNER JOIN PlanImage c ON b.PlanId = c.PlanId
             WHERE	a.PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.PlanId#">
             		AND c.isPlanThumbnail = 1
             ORDER BY b.PlanNumber ASC
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="getSimilarPlans" access="public" returntype="query" hint="This method returns related plans for a plan">
    	<cfargument name="PlanId" required="yes" type="numeric" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="getRelatedPlanList">
        	SELECT	RelatedPlanId
            FROM	RelatedPlan a
             		INNER JOIN [Plan] b ON a.RelatedPlanId = b.PlanId
            WHERE	b.DisplayPlan = 1
            		AND a.PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.PlanId#">
            ORDER BY b.PlanNumber ASC
        </cfquery>
        
        <cfscript>
			if (getRelatedPlanList.recordCount GT 0) {
				VARIABLES.RelatedPlanList = ValueList(getRelatedPlanList.relatedPlanId);
			}
			else {
				VARIABLES.RelatedPLanList = 0;
			}
		</cfscript>

        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="getRelatedPlanInfo">
            SELECT	b.PlanId As RelatedPlanId,
                    CASE WHEN LEN(RTRIM(LTRIM(b.PlanTitle))) > 0 THEN 'Click to View Plan ' + b.PlanNumber + ' - '  + b.PlanTitle
                    ELSE 'Click to View Plan ' +  b.PlanTitle
                    END AS PlanTitleLong,
                    b.PlanTitle,
                    b.PlanNumber,
                    b.TotalSF,
                    b.Stories,
                    c.Bedroom,
                    d.FullBathroom,
                    a.ImageFile
             FROM	PlanImage a
                    INNER JOIN [Plan] b ON a.PlanId = b.PlanId
                    LEFT JOIN Bedroom c ON b.BedroomId = c.BedroomId
                    LEFT JOIN FullBathroom d ON b.FullBathroomId = d.FullBathroomId
             WHERE	a.isPlanThumbnail = 1
                    AND a.PlanId IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#VARIABLES.RelatedPlanList#">)
                    AND b.DisplayPlan = 1
        </cfquery>
        
        <cfreturn getRelatedPlanInfo>
    </cffunction>
    
    <cffunction name="getRecentlyViewedPlans" access="public" returntype="query" hint="This method returns recently viewed plans">
    	<cfargument name="Plans" required="yes" type="array" hint="This argument expects an array of numeric PlanIds">
        <cfscript>
			var local = {};
			local.Plans = ArrayToList(ARGUMENTS.Plans);
			if (ListLen(local.Plans) EQ 0) {
				local.Plans = 0;
			}
		</cfscript>

        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="local.rvpi">
            SELECT	b.PlanId,
                    CASE WHEN LEN(RTRIM(LTRIM(b.PlanTitle))) > 0 THEN 'Click to View Plan ' + b.PlanNumber + ' - '  + b.PlanTitle
                    ELSE 'Click to View Plan ' +  b.PlanTitle
                    END AS PlanTitleLong,
                    b.PlanTitle,
                    b.PlanNumber,
                    b.TotalSF,
                    b.Stories,
                    c.Bedroom,
                    d.FullBathroom,
                    a.ImageFile
             FROM	PlanImage a
                    INNER JOIN [Plan] b ON a.PlanId = b.PlanId
                    LEFT JOIN Bedroom c ON b.BedroomId = c.BedroomId
                    LEFT JOIN FullBathroom d ON b.FullBathroomId = d.FullBathroomId
             WHERE	a.isPlanThumbnail = 1
                    AND a.PlanId IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#local.Plans#">)
                    AND b.DisplayPlan = 1
        </cfquery>
        
        <cfreturn local.rvpi>
    </cffunction>
    
    <cffunction name="getPlanInfoForDetailedSearchResults" returntype="struct" access="public" hint="This method returns a query of plan information for display in detailed search results when passed an array of plans">
    	<cfargument name="PlanInfo" type="struct" required="yes" hint="This method expects an structure of plan info to display detailed information for search results">
        
        <cfscript>
			VARIABLES.ThisPage = ARGUMENTS.PlanInfo.thisPage;
			VARIABLES.PlansPerPage = ARGUMENTS.PlanInfo.plansPerPage;
			VARIABLES.EndRow = VARIABLES.ThisPage * VARIABLES.PlansPerPage;
			VARIABLES.StartRow = VARIABLES.EndRow - (VARIABLES.PlansPerPage - 1);
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="tgi">
        	SELECT	a.PlanId,
            		a.PlanNumber,
                    a.PlanTitle,
                    a.Stories,
                    a.TotalSF,
                    a.GarageSF,
                    e.FullBathroom,
                    f.HalfBathroom,
                    g.Bedroom,
                    h.FoundationTypeSName AS FoundationType,
                    CAST(a.HouseDimensionWidthFt AS VARCHAR(3)) + '''-' + CAST(a.HouseDimensionWidthIn AS VARCHAR(2)) + '"' AS Width,
                    CAST(a.HouseDimensionDepthFt AS VARCHAR(3)) + '''-' + CAST(a.HouseDimensionDepthIn AS VARCHAR(2)) + '"' AS Depth,
                    CAST(a.HouseDimensionHeightFt AS VARCHAR(3)) + '''-' + CAST(a.HouseDimensionHeightIn AS VARCHAR(2)) + '"' AS Height,
                    i.GarageSizeAbbr AS GarageSize,
                    j.CoveredPorch,
                    '/assets/planImages/' + CAST(a.PlanId AS VARCHAR(5)) + '/detailView/' + CAST(k.ImageFile AS VARCHAR(70)) AS PlanThumbnail,
                    row_number() OVER (ORDER BY a.TotalSF<cfif ARGUMENTS.PlanInfo.PlanSortOption EQ 1> DESC</cfif>) as RowNumber
            FROM	[Plan] a 
            		LEFT JOIN PlanType b ON a.PlanTypeId = b.PlanTypeId
                    LEFT JOIN PriceCategory c ON a.PriceCategoryId = c.PriceCategoryId
                    LEFT JOIN Designer d ON a.DesignerId = d.DesignerId
                    LEFT JOIN FullBathroom e ON a.FullBathroomId = e.FullBathroomId
                    LEFT JOIN HalfBathroom f ON a.HalfBathroomId = f.HalfBathroomId
                    LEFT JOIN Bedroom g ON a.BedroomId = g.BedroomId 
                    LEFT JOIN FoundationType h ON a.FoundationTypeId = h.FoundationTypeId
                    LEFT JOIN GarageSize i ON a.GarageSizeId = i.GarageSizeId
                    LEFT JOIN CoveredPorch j ON a.CoveredPorchId = j.CoveredPorchId
                    LEFT JOIN PlanImage k ON a.PlanId = k.PlanId
            WHERE   (a.DisplayPlan = 1) AND (k.isPlanThumbnail = 1)
            		AND a.PlanId IN (<cfqueryparam cfsqltype="cf_sql_smallint" list="yes" value="#ARGUMENTS.PlanInfo.Plans#">)
            ORDER BY a.TotalSF <cfif ARGUMENTS.PlanInfo.PlanSortOption EQ 1>DESC</cfif>
        </cfquery>
        
        <cfscript>
			if (VARIABLES.EndRow GT tgi.recordCount) {
				VARIABLES.EndRow = tgi.recordCount;
			}
		</cfscript>
        
        <cfquery dbtype="query" name="gi">
        	SELECT 	*
            FROM	tgi
            WHERE	RowNumber BETWEEN #VARIABLES.StartRow# AND #VARIABLES.EndRow#
        </cfquery>

		<cfscript>
            VARIABLES.planInfo = StructNew();
            VARIABLES.planInfo.planList = ValueList(tgi.PlanId);
            VARIABLES.planInfo.plans = VARIABLES.gi;
        </cfscript>
        
        <cfreturn VARIABLES.planInfo>
    </cffunction>
    
    <cffunction name="getPlanInfoForGallerySearchResults" returntype="struct" access="public" hint="This method returns a query of plan information for display in detailed search results when passed an array of plans">
    	<cfargument name="PlanInfo" type="struct" required="yes" hint="This method expects an structure of plan info to display detailed information for search results">
        
        <cfscript>
			VARIABLES.ThisPage = ARGUMENTS.PlanInfo.thisPage;
			VARIABLES.PlansPerPage = ARGUMENTS.PlanInfo.plansPerPage;
			VARIABLES.EndRow = VARIABLES.ThisPage * VARIABLES.PlansPerPage;
			VARIABLES.StartRow = VARIABLES.EndRow - (VARIABLES.PlansPerPage - 1);
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="tgi">
        	SELECT	a.PlanId,
            		a.PlanNumber,
                    CASE WHEN LEN(a.PlanShortTitle) > 0 THEN a.PlanShortTitle
                    ELSE a.PlanTitle
                    END AS PlanTitle,
                    a.TotalSF,
                    a.Stories,
                    e.FullBathroom,
                    g.Bedroom,
                    '/assets/planImages/' + CAST(a.PlanId AS VARCHAR(5)) + '/planThu/' + CAST(k.ImageFile AS VARCHAR(70)) AS PlanThumbnail,
                    row_number() OVER (ORDER BY a.TotalSF<cfif ARGUMENTS.PlanInfo.PlanSortOption EQ 1> DESC</cfif>) as RowNumber
            FROM	[Plan] a 
            		LEFT JOIN PlanType b ON a.PlanTypeId = b.PlanTypeId
                    LEFT JOIN FullBathroom e ON a.FullBathroomId = e.FullBathroomId
                    LEFT JOIN Bedroom g ON a.BedroomId = g.BedroomId 
                    LEFT JOIN PlanImage k ON a.PlanId = k.PlanId
            WHERE   (a.DisplayPlan = 1) AND (k.isPlanThumbnail = 1)
            		AND a.PlanId IN (<cfqueryparam cfsqltype="cf_sql_smallint" list="yes" value="#ARGUMENTS.PlanInfo.Plans#">)
                    ORDER BY a.TotalSF <cfif ARGUMENTS.PlanInfo.PlanSortOption EQ 1>DESC</cfif>
        </cfquery>
        
        <cfscript>
			if (VARIABLES.EndRow GT tgi.recordCount) {
				VARIABLES.EndRow = tgi.recordCount;
			}
		</cfscript>
        
        <cfquery dbtype="query" name="gi">
        	SELECT 	*
            FROM	tgi
            WHERE	RowNumber BETWEEN #VARIABLES.StartRow# AND #VARIABLES.EndRow#
        </cfquery>
        
        <cfscript>
			VARIABLES.planInfo = StructNew();
			VARIABLES.planInfo.planList = ValueList(tgi.PlanId);
			VARIABLES.planInfo.plans = VARIABLES.gi;
		</cfscript>
        
        <cfreturn VARIABLES.planInfo>
    </cffunction>
    
    <cffunction name="getPlanInfoBySearchSubGrouping" access="public" returntype="string" hint="This method returns plans by search sub grouping">
    	<cfargument name="PlanInfo" required="yes" type="struct" hint="This argument expects a structure containing the PlanToSearchSubGroupingId, the current page of records to display, the number of records per page, and the sort option">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	PlanId
  			FROM	PlanToSearchSubGrouping
  			WHERE	SearchSubGroupingId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.PlanInfo.SearchSubGroupingId#">
        </cfquery>
        
        <cfscript>
			VARIABLES.pi = StructNew();
			VARIABLES.pi.Plans = ValueList(gi.PlanId);
			VARIABLES.pi.CurrentPage = ARGUMENTS.PlanInfo.currentPage;
			VARIABLES.pi.PlansPerPage = ARGUMENTS.PlanInfo.PlansPerPage;
			VARIABLES.pi.SortOption = ARGUMENTS.PlanInfo.SortOption;
			VARIABLES.PlanInfo = Application.PlanService.getPlanInfoForDetailedSearchResults(VARIABLES.pi);
		</cfscript>
        
        <cfreturn VARIABLES.PlanInfo>
    </cffunction>
    
    <cffunction name="getPlanIdFromTitle" access="public" returntype="numeric" hint="This method returns the PlanId corresponding to a plan">
    	<cfargument name="PlanTitle" required="yes" type="string" hint="This argument expects a textual Plan Title">
        
        <cfscript>
			// Set the default returned value for the PlanId
			VARIABLES.PlanId = 0;
			VARIABLES.useSearch = 0;
			
			// Make sure that the Plan Title is safe to query
			if (IsValid("regular_expression",ARGUMENTS.PlanTitle,"^[a-zA-Z\s'-]+$")) {
				VARIABLES.useSearch = 1;	
			}
		</cfscript>
        
        <cfif VARIABLES.useSearch EQ 1>
            <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
                SELECT 	PlanId
                FROM	[Plan]
                WHERE	PlanTitle = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.PlanTitle#">
            </cfquery>
            
            <cfscript>
                if (gi.recordCount GT 0) {
					VARIABLES.PlanId = gi.PlanId;
				}
            </cfscript>
        </cfif>
        
        <cfreturn VARIABLES.PlanId>
    </cffunction>
    
    <cffunction name="getQuickSearchPlans" access="public" returntype="string" hint="This method returns a list of PlanIds that match quick search criteria">
    	<cfargument name="qsc" type="struct" required="yes" hint="This argument expects a structure of QuickSearch criteria">
        
        <cfscript>
			if (IsNumeric(ARGUMENTS.qsc.FullBathId)) {
				if (ARGUMENTS.qsc.FullBathId EQ 6) {
					VARIABLES.FullBathId = 5;	
				}
				else {
					VARIABLES.FullBathId = ARGUMENTS.qsc.FullBathId;
				}
			}
			else {
				VARIABLES.FullBathId = 100;
			}
			
			if (IsNumeric(ARGUMENTS.qsc.BedroomId)) {
				VARIABLES.BedroomId = ARGUMENTS.qsc.BedroomId;
			}
			else {
				VARIABLES.BedroomId = 100;
			}
			
			if (IsNumeric(ARGUMENTS.qsc.TotalSFLow)) {
				if (IsNumeric(ARGUMENTS.qsc.TotalSFHigh)) {
					if (ARGUMENTS.qsc.TotalSFLow LTE ARGUMENTS.qsc.TotalSFHigh) {
						VARIABLES.TotalSFLow = ARGUMENTS.qsc.TotalSFLow;
						VARIABLES.TotalSFHigh = ARGUMENTS.qsc.TotalSFHigh;
					}
					else {
						VARIABLES.TotalSFLow = 0;
						VARIABLES.TotalSFHigh = ARGUMENTS.qsc.TotalSFHigh;
					}
				}
				else {
					VARIABLES.TotalSFLow = ARGUMENTS.qsc.TotalSFLow;
					VARIABLES.TotalSFHigh = 11000;
				}
			}
			else {
				VARIABLES.TotalSFLow = 0;
				if (IsNumeric(ARGUMENTS.qsc.TotalSFHigh)) {
					VARIABLES.TotalSFHigh = ARGUMENTS.qsc.TotalSFHigh;
				}
			}
			
			if (IsNumeric(ARGUMENTS.qsc.PlanTypeId)) {
				VARIABLES.PlanTypeId = 	ARGUMENTS.qsc.PlanTypeId;
			}
			else {
				VARIABLES.PlanTypeId = 0;
			}
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT  PlanId
    		FROM 	[Plan] 
    		WHERE	DisplayPlan = 1
    				AND TotalSF BETWEEN <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.TotalSFLow#"> AND <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.TotalSFHigh#">
    				<cfif VARIABLES.PlanTypeId NEQ 0>AND PlanTypeId = <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.PlanTypeId#"></cfif>
            		<cfif VARIABLES.BedroomId NEQ 100>AND BedroomId >= <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.BedroomId#"></cfif>
            		<cfif VARIABLES.FullBathId NEQ 100>AND FullBathId >= <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.FullBathId#"></cfif>
        </cfquery>
    </cffunction>
    
    <cffunction name="getAllPlansList" access="public" returntype="string" hint="This method return all of the plans currently set to display in the database">
    	<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT 	PlanId
            FROM	[Plan]
            WHERE	DisplayPlan = 1
            ORDER BY TotalSF
        </cfquery>
        
        <cfscript>
			VARIABLES.PlanList = ValueList(gi.PlanId);
		</cfscript>
        
        <cfreturn VARIABLES.PlanList>
    </cffunction>
    
    <cffunction name="getPreviousNextPlan" access="public" returntype="struct" hint="This method returns a structure containing the previous and next plan to be viewed">
    	<cfargument name="pn" type="struct" required="yes" hint="This argument expects a structure containing a a plan list and the ID of the currently viewed plan">
        
        <cfscript>
			VARIABLES.thisPlanIndex = ListFind(ARGUMENTS.pn.PlanList,ARGUMENTS.pn.PlanId);
			
			if (VARIABLES.thisPlanIndex EQ 0) {
				VARIABLES.thisPlanIndex = 1;
			}
			
			if (ListLen(ARGUMENTS.pn.PlanList) EQ 1) {
				VARIABLES.previousPlan = ARGUMENTS.pn.PlanId;
				VARIABLES.nextPlan = ARGUMENTS.pn.PlanId;
			}
			else {
				if (VARIABLES.thisPlanIndex EQ ListLen(ARGUMENTS.pn.PlanList) OR VARIABLES.thisPlanIndex EQ 1) {
					if (VARIABLES.thisPlanIndex EQ ListLen(ARGUMENTS.pn.PlanList)) {
						VARIABLES.nextPlan = ListFirst(ARGUMENTS.pn.PlanList);
						VARIABLES.previousPlanIndex = VARIABLES.thisPlanIndex - 1;
						VARIABLES.previousPlan = ListGetAt(ARGUMENTS.pn.PlanList,VARIABLES.previousPlanIndex);
					}
					if (VARIABLES.thisPlanIndex EQ 1) {
						VARIABLES.previousPlan = ListLast(ARGUMENTS.pn.PlanList);
						VARIABLES.nextPlanIndex = VARIABLES.thisPlanIndex + 1;
						VARIABLES.nextPlan = ListGetAt(ARGUMENTS.pn.PlanList,VARIABLES.nextPlanIndex);
					}
				}
				else {
					VARIABLES.previousPlanIndex = VARIABLES.thisPlanIndex - 1;
					VARIABLES.previousPlan = ListGetAt(ARGUMENTS.pn.PlanList,VARIABLES.previousPlanIndex);
					VARIABLES.nextPlanIndex = VARIABLES.thisPlanIndex + 1;
					VARIABLES.nextPlan = ListGetAt(ARGUMENTS.pn.PlanList,VARIABLES.nextPlanIndex);
				}
			}
			VARIABLES.pn = StructNew();
			VARIABLES.pn.previousPlan = VARIABLES.previousPlan;
			VARIABLES.pn.nextPlan = VARIABLES.nextPlan;
		</cfscript>
        
        <cfreturn VARIABLES.pn>
    </cffunction>
    
    <cffunction name="getFeaturedPlanInfoForSearchSubGrouping" returntype="query" access="public" hint="This method returns a single plan to display for a particular Search Sub Grouping">
    	<cfargument name="Id" type="numeric" required="yes" hint="This argument expects a numeric PlanTypeId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi" maxrows="1">
        	SELECT	a.PlanId,
            		a.PlanNumber,
                    CASE WHEN LEN(a.PlanShortTitle) > 0 THEN UPPER(a.PlanShortTitle)
                    ELSE UPPER(a.PlanTitle)
                    END AS PlanTitle,
                    a.TotalSF,
                    a.Stories,
                    c.FullBathroom,
                    d.Bedroom,
                    '/assets/planImages/' + CAST(a.PlanId AS VARCHAR(5)) + '/planThu/' + CAST(e.ImageFile AS VARCHAR(70)) AS PlanThumbnail,
                    row_number() OVER (ORDER BY a.TotalSF DESC) as RowNumber
            FROM	[Plan] a
            		INNER JOIN PlanToSearchSubGrouping b ON a.PlanId = b.PlanId
                    LEFT JOIN FullBathroom c ON a.FullBathroomId = c.FullBathroomId
                    LEFT JOIN Bedroom d ON a.BedroomId = d.BedroomId 
                    LEFT JOIN PlanImage e ON a.PlanId = e.PlanId
            WHERE   (a.DisplayPlan = 1) AND (e.isPlanThumbnail = 1)
					AND b.SearchSubGroupingId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.Id#">
			ORDER BY NEWID()
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="getGalleryViewPlanInfoByArray" returntype="any" access="public" hint="This method returns a single plan to display for a particular Search Sub Grouping">
    	<cfargument name="PlanList" type="array" required="yes" hint="This argument expects an array PlanIds">
		
        <cfif ArrayLen(ARGUMENTS.PlanList) GT 0>
        	<cfscript>
				VARIABLES.PLanList = ArrayToList(ARGUMENTS.PlanList);
			</cfscript>
        	<cfloop list="#VARIABLES.PlanList#" index="i" delimiters=",">
            	<cfif NOT IsNumeric(i)>
                	<cfset VARIABLES.getPlans = 0>
                    <cfbreak>
                <cfelse>
                	<cfset VARIABLES.getPlans = 1>
                </cfif>
            </cfloop>
        <cfelse>
        	<cfset VARIABLES.getPlans = 0>
        </cfif>
        
        <cfif VARIABLES.getPlans EQ 1>
            <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
                SELECT	a.PlanId,
                        a.PlanNumber,
                        CASE WHEN LEN(a.PlanShortTitle) > 0 THEN UPPER(a.PlanShortTitle)
                        ELSE UPPER(a.PlanTitle)
                        END AS PlanTitle,
                        a.TotalSF,
                        a.Stories,
                        e.FullBathroom,
                        g.Bedroom,
                        '/assets/planImages/' + CAST(a.PlanId AS VARCHAR(5)) + '/planThu/' + CAST(k.ImageFile AS VARCHAR(70)) AS ImageFile,
                        row_number() OVER (ORDER BY a.TotalSF DESC) as RowNumber
                FROM	[Plan] a
                        INNER JOIN PlanToSearchSubGrouping b ON a.PlanId = b.PlanId
                        LEFT JOIN FullBathroom e ON a.FullBathroomId = e.FullBathroomId
                        LEFT JOIN Bedroom g ON a.BedroomId = g.BedroomId 
                        LEFT JOIN PlanImage k ON a.PlanId = k.PlanId
                WHERE   (a.DisplayPlan = 1) AND (k.isPlanThumbnail = 1)
                        AND a.PlanId IN (<cfqueryparam cfsqltype="cf_sql_smallint" list="yes" value="#VARIABLES.PlanList#">)
            </cfquery>
        </cfif>
        
        <cfif VARIABLES.getPlans EQ 1>
        	<cfreturn gi>
        <cfelse>
        	<cfreturn VARIABLES.getPlans>
        </cfif>
    </cffunction>
</cfcomponent> 