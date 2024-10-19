<cfsetting showdebugoutput="yes">
<cfif IsDefined("Form.planImages")>
<cftry>
	<cfscript>
		if (NOT IsNumeric(Session.PlanId)) {
        	abort;
        }
        // Set the base photo upload path
        VARIABLES.PlanPhotoPath = 'D:\home\architectsnw.com\wwwroot\assets\planImages\' & Session.PlanId;
        
        // Set the Thumbnail Path
		thuPath = VARIABLES.PlanPhotoPath & '\thu';
		
		// Set the Plan Thumbnail Path
		planThuPath = VARIABLES.PlanPhotoPath & '\planthu';
		
		// Set the Normal Path
		normalPath = VARIABLES.PlanPhotoPath & '\normal';
		
		// Set the original-size image path
		originalPath = VARIABLES.PlanPhotoPath &  '\original';
		
		// Set the plan-list size path
		planListPath = VARIABLES.PlanPhotoPath & '\planlist';
		
		//Set the detail view size path
		detailViewPath = VARIABLES.PlanPhotoPath & '\detailview';
        
        // Make sure that directories exist for the photo uploads, and create those if necessary
        if (NOT DirectoryExists(thuPath)) {
        	DirectoryCreate(thuPath);
        }
        if (NOT DirectoryExists(planThuPath)) {
        	DirectoryCreate(planThuPath);
        }
        if (NOT DirectoryExists(planListPath)) {
        	DirectoryCreate(planListPath);
        }
        if (NOT DirectoryExists(normalPath)) {
        	DirectoryCreate(normalPath);
        }
        if (NOT DirectoryExists(originalPath)) {
        	DirectoryCreate(originalPath);
        }
        if (NOT DirectoryExists(detailViewPath)) {
        	DirectoryCreate(detailViewPath);
        }
    </cfscript>

	<!--- Make sure there are no files in the tempphotos directory --->
	<cfdirectory action="list" directory="D:\home\architectsnw.com\wwwroot\assets\tempphotos" name="tempFiles">
    <cfloop query="tempFiles">
        <cfscript>
            VARIABLES.thisFile = 'D:\home\architectsnw.com\wwwroot\assets\tempphotos\' & Name;
            if (FileExists(VARIABLES.thisFile)) {
                FileDelete(VARIABLES.thisFile);
            }
        </cfscript> 
    </cfloop>
    
    <!--- Upload the files to the temp directory --->
	<cffile action="uploadall" destination="D:\home\architectsnw.com\wwwroot\assets\tempphotos" result="PlanImages">
    
    <!--- List the uploaded files in the temp directory --->
    <cfdirectory action="list" directory="D:\home\architectsnw.com\wwwroot\assets\tempphotos" name="tempFiles">
    
    <!--- Process the images in the temp directory --->
    <cfloop query="tempFiles">
    	<cfscript>
            VARIABLES.thisBaseImage = 'D:\home\architectsnw.com\wwwroot\assets\tempphotos\' & Name;
        </cfscript>   
        
        <cfif FileExists(VARIABLES.thisBaseImage)>
        	<cfif IsImageFile(VARIABLES.thisBaseImage)>
            <!--- Read the uploaded image to memory --->
            <cfimage action="read" name="baseImage" source="#thisBaseImage#">
        
            <!--- Get the uploaded image's information --->
            <cfimage action="info" source="#baseImage#" structName="uploadedFileInfo">
        
            <!--- Set the name for the new image --->
            <cfset newImageName = DateFormat(Now(), "YYYYMMDD") & Replace(Name," ","","All")>
            <cfset uploadedPhotos = newImageName>
            <cfset thuImagePath = thuPath & '\' & newImageName>
            <cfset planThuImagePath = planThuPath & '\' & newImageName>
            <cfset normalImagePath = normalPath & '\' & newImageName>
            <cfset detailViewImagePath = detailViewPath & '\' & newImageName>
            <cfset planListImagePath = planListPath & '\' & newImageName>
            <cfset originalImagePath = originalPath & '\' & newImageName>
            
            <!--- Save the original image --->
            <cfimage action="write" source="#baseImage#" destination="#originalImagePath#" overwrite="yes">
    
            <!--- Constrain the image to a maximum of 600 pixels wide, and get the resized image's information --->
            <cfif uploadedFileInfo.width gt uploadedFileInfo.height>           
                 <cfif uploadedFileInfo.width gt 536>   
                    <!--- Create and store the normal-sized photo --->
                    <cfimage action="resize" width="536" height="" source="#baseImage#" name="normalImage"> 
                    
                    <!--- Put the new photo in the normal images folder --->
                    <cfimage action="write" source="#normalImage#" destination="#normalImagePath#" overwrite="yes">
                    
                    <!--- Create and store the detail view-sized photo --->
                    <cfimage action="resize" width="379" height="" source="#baseImage#" name="detailViewImage"> 
                    
                    <!--- Put photo in the detailview images folder --->
                    <cfimage action="write" source="#detailViewImage#" destination="#detailViewImagePath#" overwrite="yes">
                    
                    <!--- Create and store the plan list photo --->
                    <cfimage action="resize" width="183" height="" source="#baseImage#" name="planListImage"> 
                    
                    <!--- Put photo in the plan list images folder --->
                    <cfimage action="write" source="#planListImage#" destination="#planListImagePath#" overwrite="yes">
                    
                    <!--- Create and store the plan thumbnail photo --->
                    <cfimage action="resize" width="165" height="" source="#baseImage#" name="planThuImage"> 
                    
                    <!--- Put photo in the plan thumbnail images folder --->
                    <cfimage action="write" source="#planThuImage#" destination="#planThuImagePath#" overwrite="yes">
                    
                    <!--- Create and store the thumbnail --->
                    <cfimage action="resize" width="100" height="" source="#baseImage#" name="thuImage"> 
                    
                    <!--- Put the new photo in the thumbnail images folder --->
                    <cfimage action="write" source="#thuImage#" destination="#thuImagePath#" overwrite="yes">
                <cfelse>                
                    <!--- Create and store the normal-sized photo --->
                    <cfimage action="resize" width="350" height="" source="#baseImage#" name="normalImage"> 
                    
                    <!--- Put the new photo in the normal images folder --->
                    <cfimage action="write" source="#normalImage#" destination="#normalImagePath#" overwrite="yes">
                    
                    <!--- Create and store the detail view-sized photo --->
                    <cfimage action="resize" width="379" height="" source="#baseImage#" name="detailViewImage"> 
                    
                    <!--- Put photo in the detailview images folder --->
                    <cfimage action="write" source="#detailViewImage#" destination="#detailViewImagePath#" overwrite="yes">
                    
                    <!--- Create and store the plan list photo --->
                    <cfimage action="resize" width="183" height="" source="#baseImage#" name="planListImage"> 
                    
                    <!--- Put photo in the plan list images folder --->
                    <cfimage action="write" source="#planListImage#" destination="#planListImagePath#" overwrite="yes">
                    
                    <!--- Create and store the plan thumbnail photo --->
                    <cfimage action="resize" width="165" height="" source="#baseImage#" name="planThuImage"> 
                    
                    <!--- Put photo in the plan thumbnail images folder --->
                    <cfimage action="write" source="#planThuImage#" destination="#planThuImagePath#" overwrite="yes">
                    
                    <!--- Create and store the thumbnail (Galleria) --->
                    <cfimage action="resize" width="100" height="" source="#baseImage#" name="thuImage"> 
                    
                    <!--- Put the new photo in the thumbnail images folder --->
                    <cfimage action="write" source="#thuImage#" destination="#thuImagePath#" overwrite="yes">
                </cfif>
            <cfelse>
                <cfif uploadedFileInfo.height gt 302>                 
                    <!--- Create and store the normal-sized photo --->
                    <cfimage action="resize" width="" height="302" source="#baseImage#" name="normalImage"> 
                    
                    <!--- Put the new photo in the normal images folder --->
                    <cfimage action="write" source="#normalImage#" destination="#normalImagePath#" overwrite="yes">
                    
                    <!--- Create and store the detail view-sized photo --->
                    <cfimage action="resize" width="379" height="" source="#baseImage#" name="detailViewImage"> 
                    
                    <!--- Put photo in the detail view images folder --->
                    <cfimage action="write" source="#detailViewImage#" destination="#detailViewImagePath#" overwrite="yes">
                    
                    <!--- Create and store the plan list photo --->
                    <cfimage action="resize" width="183" height="" source="#baseImage#" name="planListImage"> 
                    
                    <!--- Put photo in the plan list images folder --->
                    <cfimage action="write" source="#planListImage#" destination="#planListImagePath#" overwrite="yes">
                    
                    <!--- Create and store the plan thumbnail photo --->
                    <cfimage action="resize" width="" height="121" source="#baseImage#" name="planThuImage"> 
                    
                    <!--- Put photo in the plan thumbnail images folder --->
                    <cfimage action="write" source="#planThuImage#" destination="#planThuImagePath#" overwrite="yes">
                    
                    <!--- Create and store the thumbnail (Galleria) --->
                    <cfimage action="resize" width="" height="56" source="#baseImage#" name="thuImage"> 
                
                    <!--- Put the new photo in the thumbnail images folder --->
                    <cfimage action="write" source="#thuImage#" destination="#thuImagePath#" overwrite="yes">
                <cfelse>                
                    <!--- Create and store the normal-sized photo --->
                    <cfimage action="resize" width="" height="302" source="#baseImage#" name="normalImage"> 
                    
                    <!--- Put the new photo in the normal images folder --->
                    <cfimage action="write" source="#normalImage#" destination="#normalImagePath#" overwrite="yes">
                    
                    <!--- Create and store the detail view-sized photo --->
                    <cfimage action="resize" width="379" height="" source="#baseImage#" name="detailViewImage"> 
                    
                    <!--- Put photo in the detailview images folder --->
                    <cfimage action="write" source="#detailViewImage#" destination="#detailViewImagePath#" overwrite="yes">
                    
                    <!--- Create and store the plan list photo --->
                    <cfimage action="resize" width="183" height="" source="#baseImage#" name="planListImage"> 
                    
                    <!--- Put photo in the plan list images folder --->
                    <cfimage action="write" source="#planListImage#" destination="#planListImagePath#" overwrite="yes">
                    
                    <!--- Create and store the plan thumbnail photo --->
                    <cfimage action="resize" width="" height="121" source="#baseImage#" name="planThuImage"> 
                    
                    <!--- Put photo in the plan thumbnail images folder --->
                    <cfimage action="write" source="#planThuImage#" destination="#planThuImagePath#" overwrite="yes">
                    
                    <!--- Create and store the thumbnail (Galleria) --->
                    <cfimage action="resize" width="" height="56" source="#baseImage#" name="thuImage"> 
                    
                    <!--- Put the new photo in the thumbnail images folder --->
                    <cfimage action="write" source="#thuImage#" destination="#thuImagePath#" overwrite="yes">
                </cfif>
            </cfif>
            
            <cfscript>
                fi = CreateObject("component", "com.cornerstonedesigns.PlanImage").init();
                fi.PlanId = Session.PlanId;
                fi.ImageFile = newImageName;
                fi.DisplayOrder = 1;
                fi.Caption = 'Plan Image';
                fi.isPlanThumbnail = 0;
                fi.displayInGallery = 0;
                fi.isGalleryThumbnail = 0;
                newPhoto = Application.PlanImageService.save(fi);
            </cfscript>
        </cfif></cfif>
    </cfloop>
    <!--- Make sure there are no files in the tempphotos directory --->
	<cfdirectory action="list" directory="D:\home\architectsnw.com\wwwroot\assets\tempphotos" name="tempFiles">
    <cfloop query="tempFiles">
        <cfscript>
            VARIABLES.thisFile = 'D:\home\architectsnw.com\wwwroot\assets\tempphotos\' & Name;
            if (FileExists(VARIABLES.thisFile)) {
                FileDelete(VARIABLES.thisFile);
            }
        </cfscript> 
    </cfloop>
    <cfcatch type="any">
    	<cfscript>
        	writeDump(cfCatch);
        </cfscript>
    </cfcatch>
</cftry>
</cfif>
<cflocation url="managePlanImages.cfm?lp=1" addtoken="no">