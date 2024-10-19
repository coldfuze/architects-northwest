<!--- Reload the page if photos have just been uploaded so that the photo management functionality will display/update --->
<cfif IsDefined("URL.lp")>
	<cflocation url="managePlanImages.cfm" addtoken="no">
</cfif>

<!--- Make sure that The PlanId IsNumeric and not equal to zero. Re-direct to the Site Management main page if necessary. Convert the PlanId Session variable to a Local Variable --->
<cfif IsDefined("URL.PlanId")>
	<cfif NOT IsValid('integer',URL.PlanId)>
    	<cflocation url="default.cfm">
    <cfelse> 
    	<cfif URL.PlanId GT 0> 
			<cfscript>
                Session.PlanId = URL.PlanId;
            </cfscript>
        <cfelse>
        	<cflocation url="default.cfm">
        </cfif>
    </cfif>
</cfif>

<!--- Set the PhotoPath Session variable --->
<cfscript>
	VARIABLES.tempPhotoPath = '/assets/planImages/' & Session.PlanId;
	Session.PhotoPath = ExpandPath(VARIABLES.tempPhotoPath);
</cfscript>

<!--- Convert Session to Local Variables --->
<cfscript>
	VARIABLES.AdminId = Session.AdminId;
</cfscript>

<!--- Delete plan photo, if applicable --->
	<cfif IsDefined("Form.delImageId")>
    	<cfloop list="#Form.delImageId#" index="i" delimiters=",">
        	<cfscript>
				if (IsNumeric(i)) {
					VARIABLES.delImage = Application.PlanImageService.deletePlanImage(i);
					VARIABLES.planImageDeleted = 1;
				}
			</cfscript>
        </cfloop>
        
        <cfscript>
			VARIABLES.thisPlanImages = Application.PlanImageService.getPlanImages(Session.PlanId);
			if (VARIABLES.thisPlanImages.recordCount EQ 0) {
				xmlFilePath = '/assets/photoXML/';
                xmlFile = ExpandPath("#xmlFilePath#") & Session.PlanId & '.xml';
				if (FileExists(xmlFile)) {
					VARIABLES.deleteSSPXML = Application.PlanImageService.deleteSSPXML(Session.PlanId);
				}
			}
		</cfscript>
        
        <cfscript>
			// Record Admin Activity
			aa = CreateObject("component","com.cornerstonedesigns.AdminActivity").init();
			aa.AdminId = VARIABLES.AdminId;
			aa.ImpactedAdminId = VARIABLES.AdminId;
			aa.ActivityDate = CreateODBCDateTime(Now());
			aa.TransactionId = 8;
			aa.PlanId=Session.PlanId;
			VARIABLES.adminActivity = Application.AdminActivityService.save(aa);
		</cfscript>
    </cfif>

<!--- Update Plan Image Information --->
	<cfif IsDefined("Form.ImageId")>
    	<cfset VARIABLES.ImageId = Form.ImageId>
    	<cfif IsDefined("Form.delImageId")>
        	<cfloop list="#Form.delImageId#" index="i">
            	<cfscript>
					VARIABLES.thisImageId = ListFind(VARIABLES.ImageId,i);
					VARIABLES.ImageId = ListDeleteAt(VARIABLES.ImageId,VARIABLES.thisImageId);
				</cfscript>
            </cfloop>
        </cfif>
        
        <cfloop list="#VARIABLES.ImageId#" index="i">
        	<cfscript>
				thisImageInfo = Application.PlanImageService.getById(i);
				thisII = CreateObject("component","com.cornerstonedesigns.PlanImage").init();
				thisII.ImageId = i;
				thisII.Caption = Form["Caption" & i];
				thisII.PlanId = Session.PlanId;
				if (IsDefined("Form.displayInGallery#i#")) {
					thisII.displayInGallery = 1;
				}
				else {
					thisII.displayInGallery = 0;
				}
				if (IsDefined("Form.isGalleryThumbnail#i#")) {
					thisII.isGalleryThumbnail = 1;
				}
				else {
					thisII.isGalleryThumbnail = 0;
				}
				if (IsDefined("Form.isPlanThumbnail#i#")) {
					thisII.isPlanThumbnail = 1;
				}
				else {
					thisII.isPlanThumbnail = 0;
				}
				thisII.ImageFile = thisImageInfo.ImageFile;
				thisII.DisplayOrder = Form["DisplayOrder" & i];
				updatedImageInfo = Application.PlanImageService.save(thisII);
			</cfscript>
        </cfloop>
        
        <cfscript>
			VARIABLES.thisPlanImages = Application.PlanImageService.getPlanImages(Session.PlanId);
			
			if (VARIABLES.thisPlanImages.recordCount GT 0) {
				VARIABLES.newXMLFile = Application.PlanImageService.generateSSPXMLbyId(Session.PlanId);
			}
		</cfscript>
        
        <cfscript>
			// Record Admin Activity
			aa = CreateObject("component","com.cornerstonedesigns.AdminActivity").init();
			aa.AdminId = VARIABLES.AdminId;
			aa.ImpactedAdminId = VARIABLES.AdminId;
			aa.ActivityDate = CreateODBCDateTime(Now());
			aa.TransactionId = 10;
			aa.PlanId=Session.PlanId;
			VARIABLES.adminActivity = Application.AdminActivityService.save(aa);
		</cfscript>
    </cfif>

<!--- Get plan information --->
	<cfscript>
        VARIABLES.thisPlan = Application.PlanService.getById(Session.PlanId);
		VARIABLES.thisPlanImage = Application.PlanImageService.getPlanImages(Session.PlanId);
		VARIABLES.thumbnailPath = '/assets/planImages/' & Session.PlanId & '/thu/';
		VARIABLES.detailViewPath = '/assets/planImages/' & Session.PlanId & '/detailView/';
		VARIABLES.prevNextPlanInfo = Application.PlanService.getPreviousAndNextPlanForSiteManagement(Session.PlanId);
    </cfscript>

<!--- Set the Plan Title --->
	<cfscript>	
        if (CGI.HTTP_HOST CONTAINS "CornerStone") {
            VARIABLES.pageTitle = "Plan " & VARIABLES.thisPlan.PlanNumber & " Manage Plan Images - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
        }
        else {
            VARIABLES.pageTitle = "Plan " & VARIABLES.thisPlan.PlanNumber & "Manage Plan Images - Site Management - Your Family Architect - Architects Northwest";		
        }
		VARIABLES.thisPage = "Plan " & VARIABLES.thisPlan.PlanNumber & " - Manage Plan Images";
    </cfscript>
    
    <cfsavecontent variable="head">
    	<meta http-equiv="PRAGMA" content="NO-CACHE">
        <meta http-equiv="cache-control" content="private">        
    </cfsavecontent>
    
    <cfhtmlhead text="#head#">
	
<!--- Refresh this page if plan images have been loaded --->
	<cfif IsDefined("URL.lp")>
    	<cflocation url="managePlanImages.cfm">
    </cfif>
    
<!--- Page Content --->
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainManagePlanImagesContainer">
        	<h1 id="sm">Site Management</h1>
            <h2 id="sm"><cfoutput>#VARIABLES.thisPage#</cfoutput></h2>
            
            <div class="smBreadcrumb">
                <a href="/default.cfm">Home</a> &gt; <a href="default.cfm">Site Management</a> &gt; <cfoutput>#VARIABLES.thisPage#</cfoutput>
            </div>

            <div class="planNavigation">
                <strong>Plan Management Navigation:</strong>
                <a href="addPlan.cfm">Add a plan</a> | <cfoutput><a href="updatePlan.cfm?PlanId=#Session.PlanId#">Update this plan</a></cfoutput> | <a href="relatedPlans.cfm">Related Plans</a> | Load/Manage Plan Images | <cfoutput><a href="/plans/detailedPlanInfo.cfm?PlanId=#Session.PlanId#&nps=1" target="_blank">View Plan</a> | <a href="deletePlan.cfm">Delete Plan</a></cfoutput><cfif VARIABLES.prevNextPlanInfo.previousPlanId NEQ 0> | <cfoutput><a href="#CGI.SCRIPT_NAME#?PlanId=#VARIABLES.prevNextPlanInfo.previousPlanId#" title="#VARIABLES.prevNextPlanInfo.previousPlanTitle#">Previous Plan</a></cfoutput></cfif><cfif VARIABLES.prevNextPlanInfo.nextPlanId NEQ 0> | <cfoutput><a href="#CGI.SCRIPT_NAME#?PlanId=#VARIABLES.prevNextPlanInfo.nextPlanId#" title="#VARIABLES.prevNextPlanInfo.nextPlanTitle#">Next Plan</a></cfoutput></cfif>
            </div>

            <cfif VARIABLES.thisPlanImage.recordCount GT 0>
            <h3>Manage Images</h3>
            <cfform name="mi" method="post" action="#CGI.SCRIPT_NAME#">
            <cfinput name="ImageId" type="hidden" value="#ValueList(VARIABLES.thisPlanImage.ImageId)#">
            <table cellpadding=5 cellspacing=0 border=1>
                <tr>
                    <th style="background-color:#4a5b49;color:#eee;font-size:12px;width:50px;">Delete</th>
                    <th style="background-color:#4a5b49;color:#eee;font-size:12px;width:110px;">Image</th>
                    <th style="background-color:#4a5b49;color:#eee;font-size:12px;width:200px;">Caption</th>
                    <th style="background-color:#4a5b49;color:#eee;font-size:12px;width:75px;">Gallery Photo?</th>
                    <th style="background-color:#4a5b49;color:#eee;font-size:12px;width:75px;">Gallery Thumbnail?</th>
                    <th style="background-color:#4a5b49;color:#eee;font-size:12px;width:75px;">Plan Thumbnail?</th>
                    <th style="background-color:#4a5b49;color:#eee;font-size:12px;width:75px;">Display Order</th>
                </tr>
                <cfloop query="VARIABLES.thisPlanImage">
                    <cfscript>
                        VARIABLES.thisThumbnail = VARIABLES.thumbnailPath & ImageFile;
						VARIABLES.thisDetailView = VARIABLES.detailViewPath & ImageFile;
                    </cfscript>
                    <cfif VARIABLES.thisPlanImage.currentRow MOD(2)><tr style="background-color:#eee;"><cfelse><tr style="background-color:#ddd;"></cfif>
                        <td style="text-align:center;"><cfinput type="checkbox" name="delImageId" value="#ImageId#"></td>
                        <td><cfoutput><a class="planSpec" href="javascript: newWindow = openWin( '#VARIABLES.thisDetailView#', 'thisDetailView', 'width=378,height=277,toolbar=0,location=0,directories=0,status=0,menuBar=0,scrollBars=0,resizable=0' ); newWindow.focus()"><img src="#VARIABLES.thisThumbnail#" border="0" /></a></cfoutput></td>
                        <td><cfinput name="Caption#ImageId#" value="#Caption#" type="text" size="30" maxlength="30" required="yes" style="width:200px;" validate="noblanks" message="Please enter a caption for this plan image"></td>
                        <td style="text-align:center;"><cfif displayInGallery EQ 1><cfinput type="checkbox" name="displayInGallery#ImageId#" value="1" checked><cfelse><cfinput type="checkbox" name="displayInGallery#ImageId#" value="1"></cfif></td>
                        <td style="text-align:center;"><cfif isGalleryThumbnail EQ 1><cfinput type="checkbox" name="isGalleryThumbnail#ImageId#" value="1" checked><cfelse><cfinput type="checkbox" name="isGalleryThumbnail#ImageId#" value="1"></cfif></td>
                        <td style="text-align:center;"><cfif isPlanThumbnail EQ 1><cfinput type="checkbox" name="isPlanThumbnail#ImageId#" value="1" checked><cfelse><cfinput type="checkbox" name="isPlanThumbnail#ImageId#" value="1"></cfif></td>
                        <td><cfinput name="DisplayOrder#ImageId#" value="#DisplayOrder#" type="text" size="2" maxlength="2" required="yes" validate="integer" message="Please enter a numeric display order for this image"></td>
                    </tr>
                </cfloop>
                <tr>
                    <th colspan=7 style="background-color:#4a5b49;color:#eee;font-size:12px;">
                        <cfinput name="submit" type="submit" value="Update Plan Images" style="width:400px;">
                    </th>
                </tr>
            </table>
            </cfform>
            </tr>
            </cfif>
			<cfscript>
				VARIABLES.tempDirectory = ExpandPath("/assets/tempphotos");
			</cfscript>
            <h3>
                Upload Images
            </h3>
            
            <form action="fileUpload.cfm" enctype="multipart/form-data" method="post" name="uploadFilesForm">
                <input type="file" multiple name="planImages" id="planImages">
                <input type="submit" value="Go!">
            </form>
            <!---<cf_dcCom debug="true" themeColor="blue" uploadFile="#Application.ProFlashUploadPath#" component="ProFlashUpload" width="800" folder="D:\home\architectsnw.com\wwwroot\assets\tempphotos" fileListVariable="PlanImages" includeOnUpload="processPhotos.cfm" redirectURL="managePlanImages.cfm?lp=1" nameConflict="MakeUnique"></cf_dcCom>--->
        </div>
    </cfmodule>