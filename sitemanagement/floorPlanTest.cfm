        <cfscript>
			VARIABLES.PlanId = 27;
			VARIABLES.PlanInfo = Application.PlanService.getById(VARIABLES.PlanId);
			VARIABLES.floorPlanBasePath = 'D:\FTP\archnw\Htdocs\assets\floorplans\' & VARIABLES.PlanId;
			VARIABLES.fullPath = VARIABLES.floorPlanBasePath & '\full\'; 
			VARIABLES.fullReversePath = VARIABLES.floorPlanBasePath & '\fullReverse\'; 
			VARIABLES.normalPath = VARIABLES.floorPlanBasePath & '\normal\'; 
			VARIABLES.normalReversePath = VARIABLES.floorPlanBasePath & '\normalReverse\';
		</cfscript>
        
		<cfif LEN(TRIM(VARIABLES.PlanInfo.MainFloorPlan GT 0))>
            <cfscript>
                VARIABLES.delFullImage = VARIABLES.fullPath & VARIABLES.PlanInfo.MainFloorPlan;
                VARIABLES.delFullReverseImage = VARIABLES.fullReversePath & VARIABLES.PlanInfo.MainFloorPlan;
                VARIABLES.delNormalImage = VARIABLES.normalPath & VARIABLES.PlanInfo.MainFloorPlan;
                VARIABLES.delNormalReverseImage = VARIABLES.normalReversePath & VARIABLES.PlanInfo.MainFloorPlan;
            </cfscript>
            <h2>Main Floor Plan</h2>
            <cfif FileExists(VARIABLES.delFullImage)>
                Full Image Exists = Yes<br />
            <cfelse>
                Full Image Exists = No<br />
            </cfif>
            <cfif FileExists(VARIABLES.delFullReverseImage)>
                Full Reverse Image Exists = Yes<br />
            <cfelse>
                Full Reverse Image Exists = No<br />
            </cfif>
            <cfif FileExists(VARIABLES.delNormalImage)>
                Normal Image Exists = Yes<br />
            <cfelse>
                Normal Image Exists = No<br />
            </cfif>
            <cfif FileExists(VARIABLES.delNormalReverseImage)>
                Normal Reverse Image Exists = Yes<br />
            <cfelse>
                Normal Reverse Image Exists = No<br />
            </cfif>
        </cfif>
			
        <h2>Upper Floor Plan</h2>
        <cfif LEN(TRIM(VARIABLES.PlanInfo.UpperFloorPlan GT 0))>
            <cfscript>
                VARIABLES.delFullImage = VARIABLES.fullPath & VARIABLES.PlanInfo.UpperFloorPlan;
                VARIABLES.delFullReverseImage = VARIABLES.fullReversePath & VARIABLES.PlanInfo.UpperFloorPlan;
                VARIABLES.delNormalImage = VARIABLES.normalPath & VARIABLES.PlanInfo.UpperFloorPlan;
                VARIABLES.delNormalReverseImage = VARIABLES.normalReversePath & VARIABLES.PlanInfo.UpperFloorPlan;
            </cfscript>
            <cfif FileExists(VARIABLES.delFullImage)>
                Full Image Exists = Yes<br />
            <cfelse>
                Full Image Exists = No<br />
            </cfif>
            <cfif FileExists(VARIABLES.delFullReverseImage)>
                Full Reverse Image Exists = Yes<br />
            <cfelse>
                Full Reverse Image Exists = No<br />
            </cfif>
            <cfif FileExists(VARIABLES.delNormalImage)>
                Normal Image Exists = Yes<br />
            <cfelse>
                Normal Image Exists = No<br />
            </cfif>
            <cfif FileExists(VARIABLES.delNormalReverseImage)>
                Normal Reverse Image Exists = Yes<br />
            <cfelse>
                Normal Reverse Image Exists = No<br />
            </cfif>
        </cfif>
		
        <h2>Lower Floor PLan</h2>
        <cfif LEN(TRIM(VARIABLES.PlanInfo.LowerFloorPlan GT 0))>
            <cfscript>
                VARIABLES.delFullImage = VARIABLES.fullPath & VARIABLES.PlanInfo.LowerFloorPlan;
                VARIABLES.delFullReverseImage = VARIABLES.fullReversePath & VARIABLES.PlanInfo.LowerFloorPlan;
                VARIABLES.delNormalImage = VARIABLES.normalPath & VARIABLES.PlanInfo.LowerFloorPlan;
                VARIABLES.delNormalReverseImage = VARIABLES.normalReversePath & VARIABLES.PlanInfo.LowerFloorPlan;
            </cfscript>
            <cfif FileExists(VARIABLES.delFullImage)>
                Full Image Exists = Yes<br />
            <cfelse>
                Full Image Exists = No<br />
            </cfif>
            <cfif FileExists(VARIABLES.delFullReverseImage)>
                Full Reverse Image Exists = Yes<br />
            <cfelse>
                Full Reverse Image Exists = No<br />
            </cfif>
            <cfif FileExists(VARIABLES.delNormalImage)>
                Normal Image Exists = Yes<br />
            <cfelse>
                Normal Image Exists = No<br />
            </cfif>
            <cfif FileExists(VARIABLES.delNormalReverseImage)>
                Normal Reverse Image Exists = Yes<br />
            <cfelse>
                Normal Reverse Image Exists = No<br />
            </cfif>
        </cfif>
		
        <h2>Third Floor PLan</h2>
        <cfif LEN(TRIM(VARIABLES.PlanInfo.ThirdFloorPlan GT 0))>
            <cfscript>
                VARIABLES.delFullImage = VARIABLES.fullPath & VARIABLES.PlanInfo.ThirdFloorPlan;
                VARIABLES.delFullReverseImage = VARIABLES.fullReversePath & VARIABLES.PlanInfo.ThirdFloorPlan;
                VARIABLES.delNormalImage = VARIABLES.normalPath & VARIABLES.PlanInfo.ThirdFloorPlan;
                VARIABLES.delNormalReverseImage = VARIABLES.normalReversePath & VARIABLES.PlanInfo.ThirdFloorPlan;
            </cfscript>
            <cfif FileExists(VARIABLES.delFullImage)>
                Full Image Exists = Yes<br />
            <cfelse>
                Full Image Exists = No<br />
            </cfif>
            <cfif FileExists(VARIABLES.delFullReverseImage)>
                Full Reverse Image Exists = Yes<br />
            <cfelse>
                Full Reverse Image Exists = No<br />
            </cfif>
            <cfif FileExists(VARIABLES.delNormalImage)>
                Normal Image Exists = Yes<br />
            <cfelse>
                Normal Image Exists = No<br />
            </cfif>
            <cfif FileExists(VARIABLES.delNormalReverseImage)>
                Normal Reverse Image Exists = Yes<br />
            <cfelse>
                Normal Reverse Image Exists = No<br />
            </cfif>
        </cfif>