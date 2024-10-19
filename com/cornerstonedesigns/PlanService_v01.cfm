<cfcomponent extends="PlanGateway">
	<cffunction name="getPicklist" access="public" returntype="query" roles="admin" hint="This method returns a picklist of Plans">
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
        
    	<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	PlanNumber
            FROM	[Plan]
            WHERE	PlanNumber LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.PlanNumber#%" maxlength="20">
            ORDER BY PlanNumber
        </cfquery>
        
        
        <cfscript>
			if (gi.recordCount GT 0) {
				VARIABLES.Plans = ValueList(gi.PlanNumber);
				VARIABLES.Plans = ListToArray(VARIABLES.Plans);
			}
			else {
				VARIABLES.Plans = ArrayNew(1);	
			}
		</cfscript>
        
        <cfreturn VARIABLES.Plans>
    </cffunction>
    
    <cffunction name="getPlanTitle" access="public" returntype="string" hint="This method returns the plan title for a plan">
    	<cfargument name="PlanId" type="numeric" required="yes" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	CASE WHEN LEN(RTrim(LTrim(PlanTitle))) > 0 THEN PlanNumber + ' - ' + PlanTitle
            		ELSE PlanNumber
                    END AS PlanTitle
            FROM	[Plan]
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.PlanId#">
        </cfquery>
        
        <cfscript>
			if (gi.recordCount EQ 1) {
				VARIABLES.PlanTitle = gi.PlanTitle;	
			}
			else {
				VARIABLES.PlanTitle = "Plan does not exist or has been deleted";
			}
		</cfscript>
        
        <cfreturn VARIABLES.PlanTitle>
    </cffunction>
    
    <cffunction name="getPlanTitleWithTitleFirst" access="public" returntype="string" hint="This method returns the plan title for a plan">
    	<cfargument name="PlanId" type="numeric" required="yes" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	CASE WHEN LEN(RTrim(LTrim(PlanTitle))) > 0 THEN PlanTitle + ' - Plan ' + PlanNumber
            		ELSE PlanNumber
                    END AS PlanTitle
            FROM	[Plan]
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.PlanId#">
        </cfquery>
        
        <cfscript>
			if (gi.recordCount EQ 1) {
				VARIABLES.PlanTitle = gi.PlanTitle;	
			}
			else {
				VARIABLES.PlanTitle = "Plan does not exist or has been deleted";
			}
		</cfscript>
        
        <cfreturn VARIABLES.PlanTitle>
    </cffunction>
    
    <cffunction name="getPlanTitlePicklistforQuickSearch" access="public" returntype="query" hint="This method returns a query for use in the Quick Search plan title picklist">
    	<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
            SELECT PlanTitle, PlanId
            FROM [Plan]
            WHERE PlanTitle IS NOT NULL AND DisplayPlan = <cfqueryparam cfsqltype="cf_sql_bit" value="1">
            ORDER BY PlanTitle
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="getPlanNumberPicklistforQuickSearch" access="public" returntype="query" hint="This method returns a query for use in the Quick Search plan title picklist">
    	<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
            SELECT PlanId, PlanNumber
            FROM [Plan]
            WHERE DisplayPlan = <cfqueryparam cfsqltype="cf_sql_bit" value="1">
            ORDER BY PlanNumber
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="getTotalPlansLoaded" access="public" returntype="numeric" hint="This method returns the total number of plans loaded to the database">
    	<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
            SELECT COUNT(*) AS PlanCount
            FROM [Plan]
        </cfquery>
        
        <cfreturn gi.PlanCount>
    </cffunction>
    
    <cffunction name="getPlanInfo" access="public" roles="" returntype="query" hint="This method returns detailed information about a plan">
    	<cfargument name="PlanId" required="yes" type="numeric" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
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
			VARIABLES.HPCPS = Application.SearchSubGroupingService.getHousePlanCollectionAndPopularSearchItemsforPlan(ARGUMENTS.PlanId);
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi2">
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
        
        <cfscript>
			VARIABLES.thisRow = 0;
			planDesignFeatures = QueryNew("PlanDesignFeature","varchar");
		</cfscript>
        
        <cfif gi2.LaundryRoomMain EQ 1>
        	<cfif gi2.LaundryRoomUpper EQ 1>
            	<cfif gi2.LaundryRoomLower EQ 1>
                	<cfscript>
						VARIABLES.LaundryRoom = 'Laundry Room @ Main, Upper &amp; Lower Floor';
					</cfscript>
                <cfelse>
                	<cfscript>
						VARIABLES.LaundryRoom = 'Laundry Room @ Main &amp; Upper Floor';
					</cfscript>
                </cfif>
            <cfelse>
            	<cfscript>
					VARIABLES.LaundryRoom = 'Laundry Room @ Main Floor';
				</cfscript>
            </cfif>
        <cfelseif gi2.LaundryRoomUpper EQ 1>
        	<cfif gi2.LaundryRoomLower EQ 1>
				<cfscript>
                    VARIABLES.LaundryRoom = 'Laundry Room @ Upper &amp; Lower Floor';
                </cfscript>
            <cfelse>
                <cfscript>
                    VARIABLES.LaundryRoom = 'Laundry Room @ Upper Floor';
                </cfscript>
            </cfif>
        <cfelseif gi2.LaundryRoomLower EQ 1>
			<cfscript>
                VARIABLES.LaundryRoom = 'Laundry Room @ Lower Floor';
            </cfscript>
        <cfelse>
        	<cfscript>
				VARIABLES.LaundryRoom = '';
			</cfscript>
        </cfif>
        
        <cfif gi2.BonusRecRoomMain EQ 1>
        	<cfif gi2.BonusRecRoomUpper EQ 1>
            	<cfif gi2.BonusRecRoomLower EQ 1>
                	<cfif gi2.BonusRecRoomThird EQ 1>
                    	<cfscript>
                    		VARIABLES.BonusSpace = 'Bonus Space @ Main Floor, Upper Floor, Lower Floor &amp; Third Floor';
						</cfscript>
                    <cfelse>
                    	<cfscript>
                    		VARIABLES.BonusSpace = 'Bonus Space @ Main Floor, Upper Floor &amp; Lower Floor';
						</cfscript>
                    </cfif>
                <cfelse>
                	<cfscript>
						VARIABLES.BonusSpace = 'Bonus Space @ Main Floor &amp; Upper Floor';
					</cfscript>
                </cfif>
            <cfelse>
            	<cfscript>
					VARIABLES.BonusSpace = 'Bonus Space @ Main Floor';
				</cfscript>
            </cfif>
        <cfelseif gi2.BonusRecRoomUpper EQ 1>
        	<cfif gi2.BonusRecRoomLower EQ 1>
				<cfif gi2.BonusRecRoomThird EQ 1>
                    <cfscript>
                        VARIABLES.BonusSpace = 'Bonus Space @ Upper Floor, Lower Floor &amp; Third Floor';
                    </cfscript>
                <cfelse>
                    <cfscript>
                        VARIABLES.BonusSpace = 'Bonus Space @ Upper Floor &amp; Lower Floor';
                    </cfscript>
                </cfif>
            <cfelse>
                <cfscript>
                    VARIABLES.BonusSpace = 'Bonus Space @ Upper Floor';
                </cfscript>
            </cfif>
        <cfelseif gi2.BonusRecRoomLower EQ 1>
        	<cfif gi2.BonusRecRoomThird EQ 1>
				<cfscript>
                    VARIABLES.BonusSpace = 'Bonus Space @ Lower Floor &amp; Third Floor';
                </cfscript>
            <cfelse>
                <cfscript>
                    VARIABLES.BonusSpace = 'Bonus Space @ Lower Floor';
                </cfscript>
            </cfif>
        <cfelseif gi2.BonusRecRoomThird EQ 1>
			<cfscript>
                VARIABLES.BonusSpace = 'Bonus Space @ Third Floor';
            </cfscript>
        <cfelse>
        	<cfscript>
                VARIABLES.BonusSpace = '';
            </cfscript>
        </cfif>
        
        <cfscript>
			if (LEN(TRIM(VARIABLES.LaundryRoom)) GT 0) {
				VARIABLES.newRow = QueryAddRow(planDesignFeatures,1);
				VARIABLES.thisRow = VARIABLES.thisRow + 1;
				VARIABLES.newValue = QuerySetCell(planDesignFeatures,"PlanDesignFeature",VARIABLES.LaundryRoom,VARIABLES.thisRow);
			}
			if (LEN(TRIM(VARIABLES.BonusSpace)) GT 0) {
				VARIABLES.newRow = QueryAddRow(planDesignFeatures,1);
				VARIABLES.thisRow = VARIABLES.thisRow + 1;
				VARIABLES.newValue = QuerySetCell(planDesignFeatures,"PlanDesignFeature",VARIABLES.BonusSpace,VARIABLES.thisRow);
			}
			if (LEN(TRIM(gi2.MasterBedroomLocation)) GT 0) {
				VARIABLES.newRow = QueryAddRow(planDesignFeatures,1);
				VARIABLES.thisRow = VARIABLES.thisRow + 1;
				VARIABLES.newValue = QuerySetCell(planDesignFeatures,"PlanDesignFeature",gi2.MasterBedroomLocation,VARIABLES.thisRow);
			}
			if (LEN(TRIM(gi2.CoveredPorch)) GT 0) {
				VARIABLES.newRow = QueryAddRow(planDesignFeatures,1);
				VARIABLES.thisRow = VARIABLES.thisRow + 1;
				VARIABLES.newValue = QuerySetCell(planDesignFeatures,"PlanDesignFeature",gi2.CoveredPorch,VARIABLES.thisRow);
			}
			if (LEN(TRIM(gi2.LivingArrangement)) GT 0) {
				VARIABLES.newRow = QueryAddRow(planDesignFeatures,1);
				VARIABLES.thisRow = VARIABLES.thisRow + 1;
				VARIABLES.newValue = QuerySetCell(planDesignFeatures,"PlanDesignFeature",gi2.LivingArrangement,VARIABLES.thisRow);
			}
			if (gi2.Den EQ 1) {
				VARIABLES.newRow = QueryAddRow(planDesignFeatures,1);
				VARIABLES.thisRow = VARIABLES.thisRow + 1;
				VARIABLES.newValue = QuerySetCell(planDesignFeatures,"PlanDesignFeature","Den/Office",VARIABLES.thisRow);
			}
		</cfscript>

        <cfquery name="gi3" dbtype="query">
        	SELECT *
            FROM VARIABLES.HPCPS
            UNION
            SELECT *
            FROM planDesignFeatures
            ORDER BY PlanDesignFeature
        </cfquery>
        
        <cfsavecontent variable="designFeatures">
        	<ul type="square" style="margin-top:0px;margin-left:15px;">
            	<cfoutput query="gi3"><li>#PlanDesignFeature#</li></cfoutput>
            </ul>
        </cfsavecontent>
        
        <cfreturn designFeatures>
    </cffunction>
    
    <cffunction name="getAnimationForPlan" access="public" returntype="string" hont="This method returns an animation file for a plan">
    	<cfargument name="PlanId" required="yes" type="numeric" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	SELECT 	Animation
            FROM	[Plan]
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.PlanId#">
        </cfquery>
        
        <cfreturn gi.Animation>
    </cffunction>
    
    <cffunction name="getVideoForPlan" access="public" returntype="string" hont="This method returns an video file for a plan">
    	<cfargument name="PlanId" required="yes" type="numeric" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	SELECT 	Video
            FROM	[Plan]
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.PlanId#">
        </cfquery>
        
        <cfreturn gi.Video>
    </cffunction>
    
    <cffunction name="doesPlanHaveMedia" access="public" returntype="struct" hont="This method returns a boolean value as to whether a plan has video or audio, or a 360 degree animation">
    	<cfargument name="PlanId" required="yes" type="numeric" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	SELECT 	Video, Animation, Animation360
            FROM	[Plan]
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.PlanId#">
        </cfquery>
        
        <cfscript>
			VARIABLES.videoPath = '/assets/videos';
			VARIABLES.animationPath = '/assets/animations';
			VARIABLES.animation360Path = '/assets/animation360/' & ARGUMENTS.PlanId & '/default.htm';
			
			VARIABLES.videoUploadPath = ExpandPath(VARIABLES.videoPath);
			VARIABLES.animationUploadPath = ExpandPath(VARIABLES.animationPath);
			VARIABLES.existingAnimation360 = ExpandPath(VARIABLES.animation360Path);
			
			mi = StructNew();
			mi.hasMedia = 0;
			mi.hasVideo = 0;
			mi.hasAnimation = 0;
			mi.hasAnimation360 = 0;
			mi.animation360Path = VARIABLES.animation360Path;
			mi.animationPath = VARIABLES.animationPath & '/' & gi.Animation;
			mi.videoPath = VARIABLES.videoPath & '/' & gi.Video;
			
			if (LEN(TRIM(gi.Video)) GT 0) {
				VARIABLES.existingVideo = VARIABLES.videoUploadPath & '\' & gi.Video;
				
				if (FileExists(VARIABLES.existingVideo)) {
					mi.hasVideo = 1;
					mi.hasMedia = 1;
				}
			}
			
			if (LEN(TRIM(gi.Animation)) GT 0) {
				VARIABLES.existingAnimation = VARIABLES.animationUploadPath & '\' & gi.Animation;
				
				if (FileExists(VARIABLES.existingAnimation)) {
					mi.hasAnimation = 1;
					mi.hasMedia = 1;
				}
			}
			
			if (LEN(TRIM(gi.Animation360)) GT 0) {				
				if (FileExists(VARIABLES.existingAnimation360)) {
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
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="getAllPlanIds">
        	SELECT 	PlanId
            FROM	[Plan]
            ORDER BY PlanNumber
        </cfquery>
        
        <cfscript>
			VARIABLES.PlanList = ValueList(getAllPlanIds.PlanId);
			VARIABLES.thisPlanPosition = ListFind(VARIABLES.PlanList,ARGUMENTS.PlanId);
			if (VARIABLES.thisPlanPosition LT getAllPlanIds.recordCount) {
				VARIABLES.nextPlanPosition = VARIABLES.thisPlanPosition + 1;
				VARIABLES.nextPlanId = ListGetAt(VARIABLES.PlanList,VARIABLES.nextPlanPosition);
			}
			else {
				VARIABLES.nextPlanId = 0;
			}
			if (VARIABLES.thisPlanPosition GT 1) {
				VARIABLES.previousPlanPosition = VARIABLES.thisPlanPosition -1;
				VARIABLES.previousPlanId = ListGetAt(VARIABLES.PlanList,VARIABLES.previousPlanPosition);
			}
			else {
				VARIABLES.previousPlanId = 0;
			}
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="pp">
        	SELECT 	PlanTitle + ' - ' + PlanNumber AS PlanTitle
            FROM 	[Plan]
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.previousPlanId#">
        </cfquery>
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="np">
        	SELECT 	PlanTitle + ' - ' + PlanNumber AS PlanTitle
            FROM 	[Plan]
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#VARIABLES.nextPlanId#">
        </cfquery>
        
   		<cfscript>
			nppi = StructNew();
			nppi.previousPlanId = VARIABLES.previousPlanId;
			nppi.previousPlanTitle = pp.PlanTitle;
			nppi.nextPlanId = VARIABLES.nextPlanId;
			nppi.nextPlanTitle = np.PlanTitle;
			nppi.thisPlanPosition = VARIABLES.thisPlanPosition;
			nppi.PlanList = VARIABLES.PlanList;
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
    
    <cffunction name="getRecentlyViewedPlans" access="public" returntype="query" hint="This method returns recently viewed plans">
    	<cfargument name="Plans" required="yes" type="array" hint="This argument expects an array of numeric PlanIds">
        
        <cfscript>
			VARIABLES.Plans = ArrayToList(ARGUMENTS.Plans);
			VARIABLES.PlanInfo = QueryNew("PlanId,PlanTitleLong,PlanTitle,ImageFile","integer,varchar,varchar,varchar");
			VARIABLES.thisRow = 0;
		</cfscript>
        
        <cfloop list="#VARIABLES.Plans#" index="i">
            <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
                SELECT	b.PlanId,
                        CASE WHEN LEN(RTRIM(LTRIM(b.PlanTitle))) > 0 THEN 'Click to View Plan ' + b.PlanNumber + ' - '  + b.PlanTitle
                        ELSE 'Click to View Plan ' +  b.PlanTitle
                        END AS PlanTitleLong,
                        CASE WHEN LEN(RTRIM(LTRIM(b.PlanShortTitle))) > 0 THEN b.PlanShortTitle
                        ELSE b.PlanTitle
                        END AS PlanTitle,
                        a.ImageFile
                 FROM	PlanImage a
                        INNER JOIN [Plan] b ON a.PlanId = b.PlanId
                 WHERE	a.isPlanThumbnail = 1
                        AND a.PlanId = (<cfqueryparam cfsqltype="cf_sql_integer" value="#i#">)
            </cfquery>
            
            <cfscript>
				VARIABLES.thisRow = VARIABLES.thisRow + 1;
				VARIABLES.newRow = queryAddRow(VARIABLES.PlanInfo,1);
				VARIABLES.nv = querySetCell(VARIABLES.PlanInfo,"PlanId",gi.PlanId,VARIABLES.thisRow);
				VARIABLES.nv = querySetCell(VARIABLES.PlanInfo,"PlanTitleLong",gi.PlanTitleLong,VARIABLES.thisRow);
				VARIABLES.nv = querySetCell(VARIABLES.PlanInfo,"PlanTitle",gi.PlanTitle,VARIABLES.thisRow);
				VARIABLES.nv = querySetCell(VARIABLES.PlanInfo,"ImageFile",gi.ImageFile,VARIABLES.thisRow);
			</cfscript>
        </cfloop>
        
        <cfreturn VARIABLES.PlanInfo>
    </cffunction>
    
    <cffunction name="getPlanInfoForDetailedSearchResults" returntype="struct" access="public" hint="This method returns a query of plan information for display in detailed search results when passed an array of plans">
    	<cfargument name="PlanInfo" type="struct" required="yes" hint="This method expects an structure of plan info to display detailed information for search results">
        
        <cfscript>
			VARIABLES.ThisPage = ARGUMENTS.PlanInfo.thisPage;
			VARIABLES.PlansPerPage = ARGUMENTS.PlanInfo.plansPerPage;
			VARIABLES.EndRow = VARIABLES.ThisPage * VARIABLES.PlansPerPage;
			VARIABLES.StartRow = VARIABLES.EndRow - (VARIABLES.PlansPerPage - 1);
		</cfscript>
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="tgi">
        	SELECT	a.PlanId,
            		a.PlanNumber,
                    CASE WHEN LEN(a.PlanShortTitle) > 0 THEN a.PlanShortTitle
                    ELSE a.PlanTitle
                    END AS PlanTitle,
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
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gpi">
        	SELECT	PlanId,
            		SearchSubGroupingId
            FROM	PlanToSearchSubGrouping
            WHERE	SearchSubGroupingId IN (27,28)
            		AND PlanId IN (<cfqueryparam cfsqltype="cf_sql_smallint" list="yes" value="#ARGUMENTS.PlanInfo.Plans#">)
        </cfquery>
        
        <cfscript>
			VARIABLES.pi = QueryNew("PlanId,PlanNumber,PlanTitle,Stories,TotalSF,GarageSF,FullBathroom,HalfBathroom,Bedroom,FoundationType,Width,Depth,Height,GarageSize,CoveredPorch,New,GreenPlan,PlanThumbnail","integer,varchar,varchar,integer,integer,integer,integer,integer,integer,varchar,varchar,varchar,varchar,varchar,varchar,bit,bit,varchar");
			VARIABLES.thisRow = 0;
		</cfscript>
        
        <cfloop list="#ValueList(gi.PlanId)#" index="i" delimiters=",">
        	<cfscript>
				VARIABLES.newRow = QueryAddRow(VARIABLES.pi,1);
				VARIABLES.thisRow = VARIABLES.thisRow + 1;
			</cfscript>
            
            <cfquery name="thisPI" dbtype="query">
            	SELECT 	*
                FROM	gi
                WHERE 	PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#i#">
            </cfquery>
            <!---
            <cfquery name="isGreenPlan" dbtype="query">
            	SELECT	*
                FROM	gpi
                WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#i#">
                		AND SearchSubGroupingId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="27">
            </cfquery>
            
            <cfquery name="isNewPlan" dbtype="query">
            	SELECT	*
                FROM	gpi
                WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#i#">
                		AND SearchSubGroupingId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="28">
            </cfquery>--->
            
            <cfscript>
				VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'PlanId',thisPI.PlanId,VARIABLES.thisRow);
				VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'PlanNumber',thisPI.PlanNumber,VARIABLES.thisRow);
				VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'PlanTitle',thisPI.PlanTitle,VARIABLES.thisRow);
				VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'Stories',thisPI.Stories,VARIABLES.thisRow);
				VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'TotalSF',thisPI.TotalSF,VARIABLES.thisRow);
				VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'GarageSF',thisPI.GarageSF,VARIABLES.thisRow);
				VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'FullBathroom',thisPI.FullBathroom,VARIABLES.thisRow);
				VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'HalfBathroom',thisPI.HalfBathroom,VARIABLES.thisRow);
				VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'Bedroom',thisPI.Bedroom,VARIABLES.thisRow);
				VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'FoundationType',thisPI.FoundationType,VARIABLES.thisRow);
				VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'Width',thisPI.Width,VARIABLES.thisRow);
				VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'Depth',thisPI.Depth,VARIABLES.thisRow);
				VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'Height',thisPI.Height,VARIABLES.thisRow);
				VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'GarageSize',thisPI.GarageSize,VARIABLES.thisRow);
				VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'CoveredPorch',thisPI.CoveredPorch,VARIABLES.thisRow);
				/*if (isGreenPlan.recordCount NEQ 0) {
					VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'GreenPlan',1,VARIABLES.thisRow);
				}
				else {
					VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'GreenPlan',0,VARIABLES.thisRow);
				}
				if (isNewPlan.recordCount NEQ 0) {
					VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'New',1,VARIABLES.thisRow);
				}
				else {
					VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'New',0,VARIABLES.thisRow);
				}*/
				VARIABLES.newValue = QuerySetCell(VARIABLES.pi,'PlanThumbnail',thisPI.PlanThumbnail,VARIABLES.thisRow);
				
				VARIABLES.planInfo = StructNew();
				VARIABLES.planInfo.planList = ValueList(tgi.PlanId);
				VARIABLES.planInfo.plans = VARIABLES.pi;
			</cfscript>
        </cfloop>
        
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
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="tgi">
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
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
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
			
			VARIABLES.pn = StructNew();
			VARIABLES.pn.previousPlan = VARIABLES.previousPlan;
			VARIABLES.pn.nextPlan = VARIABLES.nextPlan;
		</cfscript>
        
        <cfreturn VARIABLES.pn>
    </cffunction>
</cfcomponent> 