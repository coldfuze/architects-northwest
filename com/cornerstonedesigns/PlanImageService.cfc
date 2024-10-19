<cfcomponent extends="PlanImageGateway">
	<cffunction name="prepareFloorPlanImagesForPlan" access="public" returntype="string" roles="admin" hint="This method resizes floor plan images from those in the original directory and puts those images in the full and normal folders">
    	<cfargument name="fpi" type="struct" hint="This argument expects a structure of information related to resizing floor plans">			
            <cfscript>
				VARIABLES.floorPlanName = ARGUMENTS.fpi.FloorPlan & '.gif';
				VARIABLES.fullPlanUploadPath = ARGUMENTS.fpi.FullUploadPath & '\' & VARIABLES.floorPlanName;
				VARIABLES.fullPlanReverseUploadPath = ARGUMENTS.fpi.FullReverseUploadPath & '\' & ARGUMENTS.fpi.FloorPlan & '.gif';
				VARIABLES.normalPlanUploadPath = ARGUMENTS.fpi.NormalUploadPath & '\' & ARGUMENTS.fpi.FloorPlan & '.gif';
				VARIABLES.normalPlanReverseUploadPath = ARGUMENTS.fpi.NormalReverseUploadPath & '\' & ARGUMENTS.fpi.FloorPlan & '.gif';
				VARIABLES.fullWidthField = ARGUMENTS.fpi.FloorPlan & 'Width';
				VARIABLES.fullHeightField = ARGUMENTS.fpi.FloorPlan & 'Height';
				VARIABLES.thuWidthField = ARGUMENTS.fpi.FloorPlan & 'ThuWidth';
				VARIABLES.thuHeightField = ARGUMENTS.fpi.FloorPlan & 'ThuHeight';
			</cfscript>
            
            <cfif NOT DirectoryExists(ARGUMENTS.fpi.FullUploadPath)>
                <cfdirectory action="create" directory="#ARGUMENTS.fpi.FullUploadPath#">
            </cfif>
            
            <cfif NOT DirectoryExists(ARGUMENTS.fpi.FullReverseUploadPath)>
                <cfdirectory action="create" directory="#ARGUMENTS.fpi.FullReverseUploadPath#">
            </cfif>
            
            <cfif NOT DirectoryExists(ARGUMENTS.fpi.NormalUploadPath)>
                <cfdirectory action="create" directory="#ARGUMENTS.fpi.NormalUploadPath#">
            </cfif>
            
            <cfif NOT DirectoryExists(ARGUMENTS.fpi.NormalReverseUploadPath)>
                <cfdirectory action="create" directory="#ARGUMENTS.fpi.NormalReverseUploadPath#">
            </cfif>
            
            <cfimage action="read" name="baseImage" source="#ARGUMENTS.fpi.OriginalFilePath#">
            
            <cfimage action="info" source="#baseImage#" structName="originalFileInfo">
            
            <!--- Re-size and save the full-size file --->
				<cfif originalFileInfo.width gt 1000>
                    <!--- Size the image to 1000 pixels wide --->
                    <cfimage action="resize" width="1000" height="" source="#baseImage#" name="fullImage"> 
                    
                    <!--- Put the new photo in the full-size images folder --->
                    <cfimage action="write" source="#fullImage#" destination="#VARIABLES.fullPlanUploadPath#" overwrite="yes">
                    
                    <!--- Flip the image 180 degrees --->
                    <cfscript>
						ImageFlip(fullImage,"horizontal");
					</cfscript>
                    
                    <!--- Put the new photo in the full reverse images folder --->
                    <cfimage action="write" source="#fullImage#" destination="#VARIABLES.fullPlanReverseUploadPath#" overwrite="yes">
                <cfelse>
                    <!--- Put the new photo in the large images folder --->
                    <cfimage action="write" source="#baseImage#" destination="#VARIABLES.fullPlanUploadPath#" overwrite="yes">

                    <!--- Flip the image 180 degrees --->
                    <cfscript>
						VARIABLES.ReverseImage = ImageRead(VARIABLES.fullPlanUploadPath);
						ImageFlip(VARIABLES.ReverseImage,"horizontal");
					</cfscript>
                    
                    <!--- Put the new photo in the full reverse images folder --->
                    <cfimage action="write" source="#VARIABLES.ReverseImage#" destination="#VARIABLES.fullPlanReverseUploadPath#" overwrite="yes">
                </cfif>
			
				<!--- Get  information about the full size image --->
                <cfimage action="info" source="#FullPlanUploadPath#" structName="fullFileInfo">
            
            <!--- Re-size and save the normal-size file --->
            <cfif originalFileInfo.width gt 650>
                <!--- Size the image to 650 pixels wide --->
                <cfimage action="resize" width="650" height="" source="#baseImage#" name="normalImage"> 
                
                <!--- Put the new photo in the normal images folder --->
                <cfimage action="write" source="#normalImage#" destination="#VARIABLES.normalPlanUploadPath#" overwrite="yes">
                
                <!--- Flip the image 180 degrees --->
                    <cfscript>
						ImageFlip(normalImage,"horizontal");
					</cfscript>
                    
                <!--- Put the new photo in the full reverse images folder --->
                    <cfimage action="write" source="#normalImage#" destination="#VARIABLES.normalPlanReverseUploadPath#" overwrite="yes">
            <cfelse>
                <!--- Put the new photo in the large images folder --->
                <cfimage action="write" source="#baseImage#" destination="#VARIABLES.normalPlanUploadPath#" overwrite="yes">
                
                <!--- Flip the image 180 degrees --->
                    <cfscript>
						VARIABLES.ReverseNormalImage = ImageRead(VARIABLES.normalPlanUploadPath);
						ImageFlip(VARIABLES.ReverseNormalImage,"horizontal");
					</cfscript>
                    
                <!--- Put the new photo in the full reverse images folder --->
                    <cfimage action="write" source="#VARIABLES.ReverseNormalImage#" destination="#VARIABLES.normalPlanReverseUploadPath#" overwrite="yes">
            </cfif>
			
            <!--- Get  information about the full size image --->
            <cfimage action="info" source="#VARIABLES.fullPlanUploadPath#" structName="fullFileInfo">
            
            <!--- Get  information about the normal size image --->
            <cfimage action="info" source="#VARIABLES.normalPlanUploadPath#" structName="normalFileInfo">
            
            <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="ui">
            	UPDATE [Plan]
                SET 	#ARGUMENTS.fpi.FloorPlan# = <cfqueryparam cfsqltype="cf_sql_varchar" value="#VARIABLES.floorPlanName#">,
                		#VARIABLES.fullWidthField# = <cfqueryparam cfsqltype="cf_sql_smallint" value="#fullFileInfo.width#">,
                        #VARIABLES.fullHeightField# = <cfqueryparam cfsqltype="cf_sql_smallint" value="#fullFileInfo.height#">,
                        #VARIABLES.thuWidthField# = <cfqueryparam cfsqltype="cf_sql_smallint" value="#normalFileInfo.width#">,
                        #VARIABLES.thuHeightField# = <cfqueryparam cfsqltype="cf_sql_smallint" value="#normalFileInfo.height#">
                WHERE 	PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.fpi.PlanId#">
            </cfquery>
    </cffunction>
    
    <cffunction name="getPlanImages" access="public" returntype="query" hint="This method returns images for a plan">
    	<cfargument name="PlanId" type="numeric" required="yes" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	*
            FROM	PlanImage
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.PlanId#">
            ORDER BY DisplayOrder
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="deletePlanImage" access="public" returntype="void" roles="admin" hint="This method deletes a Plan Image record and it's corresponding plan image files">
    	<cfargument name="ImageId" type="numeric" required="yes" hint="This argument expects a numeric ImageId">
        
        <cfscript>
			// Get plan image information
			VARIABLES.ii = Application.PlanImageService.getById(ARGUMENTS.ImageId);
			
			// Delete the image record
			VARIABLES.delImageRecord = Application.PlanImageService.deleteById(ARGUMENTS.ImageId);
			
			// Set the plan image paths
			VARIABLES.tempBasePath = '/assets/planImages/' & VARIABLES.II.PlanId;
			VARIABLES.basePath = ExpandPath(VARIABLES.tempBasePath);
			VARIABLES.thumbnailPath = VARIABLES.basePath & '\thu\' & VARIABLES.ii.ImageFile;
			VARIABLES.originalPath = VARIABLES.basePath & '\original\' & VARIABLES.ii.ImageFile;
			VARIABLES.normalPath = VARIABLES.basePath & '\normal\' & VARIABLES.ii.ImageFile;
			VARIABLES.planListPath = VARIABLES.basePath & '\planList\' & VARIABLES.ii.ImageFile;
			VARIABLES.detailViewPath = VARIABLES.basePath & '\detailView\' & VARIABLES.ii.ImageFile;
		</cfscript>
        
        <cfif FileExists(VARIABLES.thumbnailPath)>
        	<cffile action="delete" file="#VARIABLES.thumbnailPath#">
        </cfif>
        
        <cfif FileExists(VARIABLES.originalPath)>
        	<cffile action="delete" file="#VARIABLES.originalPath#">
        </cfif>
        
        <cfif FileExists(VARIABLES.normalPath)>
        	<cffile action="delete" file="#VARIABLES.normalPath#">
        </cfif>
        
        <cfif FileExists(VARIABLES.planListPath)>
        	<cffile action="delete" file="#VARIABLES.planListPath#">
        </cfif>
        
        <cfif FileExists(VARIABLES.detailViewPath)>
        	<cffile action="delete" file="#VARIABLES.detailViewPath#">
        </cfif>
    </cffunction>
    
    <cffunction name="deleteByPlanId" access="public" roles="admin" returntype="void" hint="This method deletes all of the image records in the PlanImage folder for a plan">
    	<cfargument name="PlanId" required="yes" type="numeric" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="dpi">
        	DELETE FROM PlanImage
            WHERE PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.PlanId#">
        </cfquery>
    </cffunction>
    
    <cffunction name="generateSSPXMLbyId" access="public" returntype="any" roles="admin" hint="This method generates an XML file for use with SlideshowPro when passed the Id for a Property">
    	<cfargument name="Id" required="yes" type="numeric" hint="This argument expects a numeric PlanId to be passed to it">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="pli">
            SELECT	PlanTitle
            FROM	[Plan]
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.Id#">
        </cfquery>
              
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="getPhotosForPlan">
            SELECT 	*
            FROM 	PlanImage
            WHERE 	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.Id#">
            ORDER BY DisplayOrder
        </cfquery>
        
        <cfquery dbtype="query" name="getMainTNImage" maxrows="1">
            SELECT 	*
            FROM 	getPhotosForPlan
            WHERE 	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.Id#">
        </cfquery>
                
		<cfscript>
            // Set gallery description
            gDesc = 'Gallery of Photos for ' & pli.PlanTitle;
            
            // Set gallery large image path
            lgPath = Application.BasePath & '/assets/planImages/' & ARGUMENTS.Id & '/normal/';
            
            // Set gallery thumbnail image path
            tnPath = Application.BasePath & '/assets/planImages/' & ARGUMENTS.Id & '/thu/';
            
            // Set gallery thumbnail image
            tn = Application.BasePath & '/assets/planImages/' & ARGUMENTS.Id & '/thu/' & getMainTNImage.ImageFile;
            
            // Set Tab Character
            tab = Chr(9);
            doubletab = tab & tab;
            tripletab = doubletab & tab;
            
            // Set Line Feed
            linefeed = Chr(13) & Chr(10);
            
            // Set Prolog 
            prolog = "<?xml version='1.0' encoding='utf-8'?>" & linefeed;
        </cfscript>
                
<cfsavecontent variable="xml">
<cfoutput>#prolog#</cfoutput>
<cfoutput><gallery>#linefeed#</cfoutput>
<cfoutput>#tab#<album title="#pli.PlanTitle#" description="#gDesc#" lgpath="#lgPath#" tnpath="#tnPath#" tn="#tn#">#linefeed#</cfoutput>
<cfoutput query="getPhotosForPlan">#doubletab#<img src="#ImageFile#" title="#gDesc#" caption="#Caption#" link="" />#linefeed#</cfoutput>   
<cfoutput>#tab#</album>#linefeed#</cfoutput>
<cfoutput></gallery>#linefeed#</cfoutput>
</cfsavecontent>
                
			<!--- Write the file to the /assets/photoXML/ directory --->
            <cfscript>
                xmlFilePath = '/assets/photoXML/';
                xmlFile = ExpandPath("#xmlFilePath#") & ARGUMENTS.Id & '.xml';
            </cfscript>
            <cffile action="write" file="#Trim(xmlFile)#" output="#xml#">
           
            <cfset result = IsXML(xml)>
        
        <cfreturn result>
    </cffunction>
    
    <cffunction name="generateSSPXML" access="public" returntype="any" roles="admin" hint="This method generates an XML file for use with SlideshowPro for all Plans">       
      	<cfsetting requesttimeout="600">
        <cfquery name="qRead" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#">
        	SELECT 	*
            FROM 	PlanImage
            ORDER 	BY PlanId, DisplayOrder
        </cfquery>
                
        <cfif qRead.RecordCount GT 0>
     		<cfscript>
				VARIABLES.PlanList = ValueList(qRead.PlanId);
			</cfscript>	
            
        	<cfloop list="#VARIABLES.PlanList#" index="i" delimiters=",">
            	<cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="pli">
                	SELECT	PlanTitle
                    FROM	[Plan]
                    WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#i#">
                </cfquery>      
                <cfquery dbtype="query" name="getPhotosForPlan">
                    SELECT 	*
                    FROM 	qRead
                    WHERE 	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#i#">
                    ORDER BY DisplayOrder
                </cfquery>
                
                <cfquery dbtype="query" name="getMainTNImage" maxrows="1">
                    SELECT 	*
                    FROM 	getPhotosForPlan
                    WHERE 	PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#i#">
                </cfquery>
                
                <cfscript>
                    // Set gallery description
                    gDesc = 'Gallery of Photos for ' & pli.PlanTitle;
                    
                    // Set gallery large image path
                    lgPath = '/assets/planImages/' & i & '/normal/';
                    
                    // Set gallery thumbnail image path
                    tnPath = '/assets/planImages/' & i & '/thu/';
                    
                    // Set gallery thumbnail image
                    tn = '/assets/planImages/' & i & '/thu/' & getMainTNImage.ImageFile;
                    
                    // Set Tab Character
                    tab = Chr(9);
                    doubletab = tab & tab;
                    tripletab = doubletab & tab;
                    
                    // Set Line Feed
                    linefeed = Chr(13) & Chr(10);
                    
                    // Set Prolog 
                    prolog = "<?xml version='1.0' encoding='utf-8'?>" & linefeed;
                </cfscript>
                
<cfsavecontent variable="xml">
<cfoutput>#prolog#</cfoutput>
<cfoutput><gallery>#linefeed#</cfoutput>
<cfoutput>#tab#<album title="#pli.PlanTitle#" description="#gDesc#" lgpath="#lgPath#" tnpath="#tnPath#" tn="#tn#">#linefeed#</cfoutput>
<cfoutput query="getPhotosForPlan">#doubletab#<img src="#ImageFile#" title="#gDesc#" caption="#Caption#" link="" />#linefeed#</cfoutput>   
<cfoutput>#tab#</album>#linefeed#</cfoutput>
<cfoutput></gallery>#linefeed#</cfoutput>
</cfsavecontent>
                
                <!--- Write the file to the /assets/photoXML/ directory --->
                <cfscript>
                    xmlFilePath = '/assets/photoXML/';
                    xmlFile = ExpandPath("#xmlFilePath#") & i & '.xml';
                </cfscript>
                <cffile action="write" file="#Trim(xmlFile)#" output="#xml#">
            </cfloop>   
            <cfset result = IsXML(xml)>
        <cfelse>
            <cfset result = "no">
        </cfif>
        
        <cfreturn result>
    </cffunction>
    
    <cffunction name="deleteSSPXML" access="public" roles="admin" returntype="void" hint="This method deletes a SlideShow Pro XML file for a plan">
    	<cfargument name="PlanId" type="numeric" required="yes" hint="This argument expects a numeric PlanId">
        
        <cfscript>
        	xmlFilePath = '/assets/photoXML/';
            xmlFile = ExpandPath("#xmlFilePath#") & ARGUMENTS.PlanId & '.xml';
		</cfscript>
        
        <cffile action="delete" file="#xmlFile#">
    </cffunction>
    
    <cffunction name="generateGalleriaCode" returntype="any" access="public" hint="This method returns code to display a slideshow using Galleria">
    	<cfargument name="PlanId" type="numeric" required="yes" hint="This argument expects a numeric PlanId">
        
        <cfscript>
			VARIABLES.planImages = Application.PlanImageService.getPlanImages(ARGUMENTS.PlanId);
			VARIABLES.galleriaScript = "";
			VARIABLES.normalPath = '/assets/planImages/' & ARGUMENTS.PlanId & '/normal/';
			
			// Set Tab Character
			tab = Chr(9);
			doubletab = tab & tab;
			tripletab = doubletab & tab;
			
			// Set Line Feed
			linefeed = Chr(13) & Chr(10);
			
			// galleriaDivId
			VARIABLES.divIdName = "galleriaDiv";
			
			// gelleriaDivNo
			VARIABLES.divIdNo = 0;
		</cfscript>
        
        <cfif VARIABLES.planImages.recordCount GT 0>
            <cfloop query="VARIABLES.PlanImages">
                <cfscript>
                    VARIABLES.divIdNo = VARIABLES.divIdNo + 1;
                    VARIABLES.divId = VARIABLES.divIdName & VARIABLES.divIdNo;
                    VARIABLES.galleriaScript = VARIABLES.galleriaScript & '<div id="' & VARIABLES.divId & '" style="margin:0;padding:0;"><img src="' & VARIABLES.normalPath & ImageFile & '" alt="' & Caption & '"></div>';
                    if (VARIABLES.PlanImages.currentRow LT VARIABLES.PlanImages.recordCount) {
                        VARIABLES.galleriaScript = VARIABLES.galleriaScript & linefeed;
                    }
                </cfscript>
            </cfloop>
        <cfelse>
        	<cfscript>
				VARIABLES.galleriaScript = "";
			</cfscript>
        </cfif>
        
        <cfreturn VARIABLES.galleriaScript>
    </cffunction>
    
    <cffunction name="getPlanImageForPrintPlan" access="public" returntype="string" hint="This method returns the main image for a plan for use in the Print Plan feature">
    	<cfargument name="PlanId" type="numeric" required="yes" hint="This argument expects a numeric PlanId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	SELECT	ImageFile
            FROM	PlanImage
            WHERE	PlanId = <cfqueryparam cfsqltype="cf_sql_smallint" value="#ARGUMENTS.PlanId#">
            		AND isPlanThumbnail = 1
        </cfquery>
        
        <cfscript>
			VARIABLES.mainImagePath = '/assets/planImages/' & ARGUMENTS.PlanId & '/detailView/' & gi.ImageFile;
			VARIABLES.mainImageAbsolutePath = ExpandPath(VARIABLES.mainImagePath);
			VARIABLES.mainImage = 'https://' & CGI.HTTP_HOST & VARIABLES.mainImagePath;
		</cfscript>
        
        <cfreturn VARIABLES.mainImage>
    </cffunction>
</cfcomponent>