<cfif ArrayLen(Session.PlanImages) GT 0>
    <cfscript>
		// Set the photoList
		photoList = ArrayToList(Session.PlanImages);
		
		// Set the photo path
		uploadPath = "D:\home\architectsnw.com\wwwroot\assets\tempphotos";
		
		// Set the Thumbnail Path
		thuPath = Session.PhotoPath & '\thu';
		
		// Set the Plan Thumbnail Path
		planThuPath = Session.PhotoPath & '\planthu';
		
		// Set the Normal Path
		normalPath = Session.PhotoPath & '\normal';
		
		// Set the original-size image path
		originalPath = Session.PhotoPath &  '\original';
		
		// Set the plan-list size path
		planListPath = Session.PhotoPath & '\planlist';
		
		//Set the detail view size path
		detailViewPath = Session.PhotoPath & '\detailview';
		
		// Create a variable to store the list of new photos
		uploadedPhotos = "";
	</cfscript>
    
    <!--- Create the thumbnail (Galleria thumbnail) directory - if necessary --->
		<cfif NOT DirectoryExists(thuPath)>
            <cfdirectory action="create" directory="#thuPath#">
        </cfif>
        
    <!--- Create the plan thumbnail directory - if necessary --->
		<cfif NOT DirectoryExists(planThuPath)>
            <cfdirectory action="create" directory="#planThuPath#">
        </cfif>
    
    <!--- Create the normal directory - if necessary --->
		<cfif NOT DirectoryExists(normalPath)>
            <cfdirectory action="create" directory="#normalPath#">
        </cfif>
        
    <!--- Create the planList directory - if necessary --->
		<cfif NOT DirectoryExists(planListPath)>
            <cfdirectory action="create" directory="#planListPath#">
        </cfif>
        
    <!--- Create the detailView directory - if necessary --->
		<cfif NOT DirectoryExists(detailViewPath)>
            <cfdirectory action="create" directory="#detailViewPath#">
        </cfif>
    
    <!--- Create the normal directory - if necessary --->
		<cfif NOT DirectoryExists(normalPath)>
            <cfdirectory action="create" directory="#normalPath#">
        </cfif>
        
    <!--- Create the large path - if necessary --->
		<cfif NOT DirectoryExists(originalPath)>
            <cfdirectory action="create" directory="#originalPath#">
        </cfif>
    <cfset thisImageIndex = 1>
    
    <cfloop list="#photoList#" index="i">
    	<cfscript>
			thisBaseImage = uploadPath & '\' & i;
		</cfscript>
        
		<!--- Read the uploaded image to memory --->
        <cfimage action="read" name="baseImage" source="#thisBaseImage#">
    
		<!--- Get the uploaded image's information --->
        <cfimage action="info" source="#baseImage#" structName="uploadedFileInfo">
    
		<!--- Set the name for the new image --->
        <cfset newImageName = DateFormat(Now(), "YYYYMMDD") & Replace(i," ","","All")>
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
    </cfloop>
    
    <cfloop list="#uploadedPhotos#" index="i" delimiters=",">
		<cfscript>
            fi = CreateObject("component", "com.cornerstonedesigns.PlanImage").init();
            fi.PlanId = Session.PlanId;
            fi.ImageFile = i;
            fi.DisplayOrder = 1;
            fi.Caption = 'Plan Image';
			fi.isPlanThumbnail = 0;
			fi.displayInGallery = 0;
			fi.isGalleryThumbnail = 0;
            newPhoto = Application.PlanImageService.save(fi);
        </cfscript>
    </cfloop>
</cfif>