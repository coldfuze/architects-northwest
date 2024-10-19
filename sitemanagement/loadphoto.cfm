<cfif IsDefined("Form.PPTY_Id")>
	<cfset Session.PPTY_Id = Form.PPTY_Id>
    <cfset Session.PhotoPath = ExpandPath("/assets/propertyPhotos/") & Session.PPTY_Id>
    
    <cfif NOT DirectoryExists(Session.PhotoPath)>
        <cfdirectory action="create" directory="#Session.PhotoPath#">
    </cfif>
</cfif>

<cfset uploadPath = ExpandPath("/assets/tempPhotos")>

<cfif IsDefined("Form.PhotoId")>
	<cfset pid = Form.PhotoId>
</cfif>
<cfif IsDefined("Form.delPhotoId")>
	<cfloop list="#Form.delPhotoId#" index="i" delimiters=",">
    	<cfscript>
			tp = Application.PropertyPhotoService.getById(i);
			thisFileName = tp.photoFile;
			thisLargeFile = Session.PhotoPath & '\large\' & thisFileName;
			thisThuFile = Session.PhotoPath & '\thu\' & thisFileName;
			dp = Application.PropertyPhotoService.deleteById(i);
			thisPId = ListFind(pid,i);
			delPId = ListDeleteAt(pid,thisPid);
		</cfscript>
        
        <cfif FileExists(thisLargeFile)>
        	<cffile action="delete" file="#thisLargeFile#">
        </cfif>
        <cfif FileExists(thisThuFile)>
        	<cffile action="delete" file="#thisThuFile#">
        </cfif>
    </cfloop>
</cfif>

<cfif IsDefined("pid")>
	<cfloop list="#pid#" index="i" delimiters=",">
    	<cfscript>
			thisOrder = Form["PhotoOrder" & i];
			thisCaption = Form["PhotoCaption" & i];
			up = Application.PropertyPhotoService.updatePhotoOrderAndCaption(i,thisCaption,thisOrder);
		</cfscript>
    </cfloop>
</cfif>

<cfscript>
	pi = Application.PropertyService.getPropertyTitle(Session.PPTY_Id);
	photos = Application.PropertyPhotoService.getPhotosForProperty(Session.PPTY_Id);
</cfscript>

<cfmodule template="#Application.CTPath#Layout.cfm" 
	title="Load and Prepare Property Photos - Site Management - Dupre + Scott Apartment Advisors"
	description="User login form for DSAA Site Management functionality"
	keywords="admin login"
    PageTitle="Load and Prepare Property Photos">
    
    <p class="bc">
        <a href="/default.cfm" class="breadcrumb">Home</a> &gt; <a href="default.cfm" class="breadcrumb">Site Management</a> &gt; <a href="managecontent.cfm">Manage Content</a> &gt; Load And Prepare Property Photos
    </p>

    <p class="indent">
        Prepare property photo(s) for <strong><cfoutput>#pi.PPTY#</cfoutput></strong> by following the steps listed below:
    </p>
    
    <cfif photos.recordCount GT 0>
    	<cfform action="#CGI.SCRIPT_NAME#" method="post" name="up">
        <cfinput type="hidden" name="PhotoId" value="#ValueList(photos.PhotoId)#">
        <table border=0 cellpadding=5 cellspacing=0 width="600" style="margin-left:45px;">
        	<tr>
            	<td class="rowheading">
                	Photo
                </td>
                <td class="rowheading">
                	Caption
                </td>
                <td class="rowheading">
                	Display Order
                </td>
                <td class="rowheading">
                	Delete
                </td>
            </tr>
        	<cfoutput query="photos">
            <cfif photos.currentrow MOD(2)>
        	<tr>
            	<td class="row1">
                	<img src="#Application.PropertyPhotoPath#/#Session.PPTY_Id#/thu/#PhotoFile#" />
                </td>
                <td class="row1">
                	<cfinput type="text" name="PhotoCaption#PhotoId#" value="#PhotoCaption#" required="yes" size=15 style="width:250px;" maxlength="300">
                </td>
                <td class="row1">
                	<cfinput type="text" name="PhotoOrder#PhotoId#" value="#PhotoOrder#" required="yes" validate="integer" size=2 style="width:25px;" maxlength="2">
                </td>
                <td class="row1">
                	<cfinput type="checkbox" name="delPhotoId" value="#PhotoId#">
                </td>
            </tr>
            <cfelse>
            <tr>
            	<td class="row2">
                	<img src="#Application.PropertyPhotoPath#/#Session.PPTY_Id#/thu/#PhotoFile#" />
                </td>
                <td class="row2">
                	<cfinput type="text" name="PhotoCaption#PhotoId#" value="#PhotoCaption#" required="yes" size=15 style="width:250px;" maxlength="300">
                </td>
                <td class="row2">
                	<cfinput type="text" name="PhotoOrder#PhotoId#" value="#PhotoOrder#" required="yes" validate="integer" size=2 style="width:25px;" maxlength="2">
                </td>
                <td class="row2">
                	<cfinput type="checkbox" name="delPhotoId" value="#PhotoId#">
                </td>
            </tr>
            </cfif>
            </cfoutput>
            <tr>
            	<td colspan=4 class="rowheading">
                	<cfinput type="submit" name="submit" value="Update Photos">
                </td>
            </tr>
        </table>
        </cfform>
    </cfif>
    
	<table border=0 cellpadding=5 cellspacing=0 width="600" style="margin-left:45px;margin-top:20px;">
		<tr>
			<td class="rowheading">
				Browse for and Add Photos
			</td>
		</tr>
		<tr>
			<td class="row1">
            	<cf_dcCom themeColor="blue" uploadFile="/sitemanagement/dccom/components/proflashupload/uploadfile.cfm" component="ProFlashUpload" width="800" folder="#ExpandPath("/assets/tempphotos")#" fileListVariable="Photos" includeOnUpload="processPhotos.cfm" redirectURL="loadphoto.cfm" nameConflict="MakeUnique"></cf_dcCom>
			</td>
		</tr>
        <tr>
			<td class="hdrRow">&nbsp;
				
			</td>
		</tr>
	</table>			
</cfmodule>