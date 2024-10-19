<!------------------------------------------------------------------------------------------------
Component:            ProFlashUpload
Programmers:          Peter Coppinger aka Topper <peter@digital-crew.com>
Version:              1.2
Ending Tag:           Not Required
Styleable?:           No
dcCom Dependencies:   None
Browser Specific:     No. Needs Flash 8
Copyright:            Copyright (c) 2006 Digital Crew

Purpose:
--------------------------------------------------------------------------------------------------
Renders a flash component that allows the user to upload batches of files to
the server in one go. The type of files can be limited.


Usage:
--------------------------------------------------------------------------------------------------
<cf_dccom component="ProFlashUpload" folder="[full path to directory on server]"
	[width=(NUMBER:The display width,default=300)]
	[height=(NUMBER:The display height,default=200)]

	[filter=(String:File extension filter,default="All Files,*.*")]
	[maxFileSize=(NUMBER:Maximum file size in KB,default=0(unlimited))]
	[minFileSize=(NUMBER:Minimum file size in KB,default=0(unlimited))]
	[maxfiles=(NUMBER:Maximum number of files allowed in upload,default=0(unlimited))]

	[jsOnComplete=(String:Name of javascript function to call when upload complete)]
	[jsReturnFiles=(Boolean:Should the list of uploaded files be returned to the javascript?,default:no)]

	[showUploadButton=(Should the upload button be shown?,default:yes)]
	[showResetButton=(Should the reset button be shown?,default:yes)]

	[color=(Text colour,default=0x000000)]
	[themeColor=(Theme to use,one of:{"Green","Blue","Orange"},Default="Green")]
	[headerBGColor=(Replacement background color,default=none(set from theme))]
	[headerTextColor=(Replacement background color,default=none(set from theme))]
	[txtBrowse=(Text for browse button,default="Browse")]
	[txtRemove=(Text for remove button,default="Remove")]
	[txtReset=(Text for reset button,default="Reset")]
	[txtUpload=(Text for upload button,default="Upload")]
	[txtStop=(Text for stop button,default="Stop")]
	[txtChoose=(Text for stop button,default="Choose file to upload")]

	[redirectURL=(The URL that the user should be redirected to once complete,default:none)]
	[nameconflict=(Action to take if uploaded file already exists in folder on server. Options are Skip, Overwrite and MakeUnique. Default is MakeUnique.)]
	[includeOnUpload=("Name of file to cfinclude to perform additional processing on uploaded file")]
	[includeBeforeUpload=("Name of file to cfinclude BEFORE uploading the file to perform additional processing on uploaded file")]
	[fileListVariable=("If provided, the list of uploaded files will be stored in SESSION[fileListVariable]")]
	[debug=("BOOLEAN,If true, teh debugging status bar will be enabled,default:false")]

></cf_dccom>


Examples:
--------------------------------------------------------------------------------------------------
	Example 1 - Simple Example
	<cf_dccom component="ProFlashUpload" folder="#ExpandPath('userUploads')#"></cf_dccom>
	
	Example 2 - Using the callback feature
	<cf_dccom component="ProFlashUpload" folder="#ExpandPath('userUploads')#" jsOnComplete="callWhenComplete" jsReturnFiles="yes"></cf_dccom>
	
	<script>
	function callWhenComplete( bWasSuccessful, fileList )
	{
		if( bWasSuccessful ) alert("Success, all files uploaded.\n\nThe uploaded files are:\n"+fileList);
		else alert("There was a problem uploading the files.\n\nThe uploaded files are:\n"+fileList);
	}
	</script>

Description:	
--------------------------------------------------------------------------------------------------



CHANGE LOG:
--------------------------------------------------------------------------------------------------
[DATE]		[INITIALS]	[ACTION]

------------------------------------------------------------------------------------------------------>
<!--- IMPORTANT: In components enableCFOutputOnly="Yes" by default so theres no need to use <cfsetting enableCFOutputOnly="Yes"> --->
<cfif isdefined("URL.checkLic")>

	<cfset ATTRIBUTES.component = "ProFlashUpload">
	<cfset ATTRIBUTES.version = "1.5">

	<cfoutput>&auth=Y</cfoutput>
	<cfexit>

</cfif>
<cfif ThisTag.ExecutionMode IS "Start">
	<cfexit method="EXITTEMPLATE">
</cfif>

<!--- RECOMMENDED: Perform URL Variable Passing Security Test --->
<cfinclude template="../../engine/urlsecurity.cfm">

<cfparam name="ATTRIBUTES.RelSharedPath"  default= "#ATTRIBUTES.dcCom_RelPath#components/#ATTRIBUTES.component#/">

<!--- Use ATTRIBUTE variables as normal e.g.  --->
<cfparam name="ATTRIBUTES.folder" type="string">
<cfif NOT DirectoryExists(ATTRIBUTES.folder)>
	<cfthrow type="#ATTRIBUTES.component#" message="Folder '#ATTRIBUTES.folder#' not found.">
</cfif>
<cfset ATTRIBUTES.folder = replace(ATTRIBUTES.folder,"\","/","ALL")>
<cfif Right(ATTRIBUTES.folder, 1) NEQ "/">
	<cfset ATTRIBUTES.folder = ATTRIBUTES.folder & "/">
</cfif>

<cfparam name="ATTRIBUTES.width" default="300">
<cfparam name="ATTRIBUTES.height" default="200">
<cfparam name="ATTRIBUTES.wmode" default="transparent">

<cfparam name="ATTRIBUTES.uploadAccept" default="">
<cfparam name="ATTRIBUTES.blockExtensions" default="cfm,cfml,exe,cgi,php,php3,asp,aspx,cmd,sys">

<cfparam name="ATTRIBUTES.nameconflict" default="makeUnique" type="string">
<cfif Len(ATTRIBUTES.nameconflict) IS 0><cfset ATTRIBUTES.nameconflict = "overwrite"></cfif>
<cfif NOT ListFindNoCase("Error,Skip,Overwrite,MakeUnique",ATTRIBUTES.nameconflict)>
	<cfthrow type="#ATTRIBUTES.component#" message="nameconflict must be one of 'Error', 'Skip', 'Overwrite' or 'MakeUnique'">
</cfif>

<!--- Passing CFID & CFTOKEN if saving list in session --->
<cfset ATTRIBUTES.CFID = COOKIE.CFID>
<cfset ATTRIBUTES.CFTOKEN = COOKIE.CFTOKEN>

<cfif StructKeyExists( ATTRIBUTES, "fileListVariable" )>
	<cfif NOT StructKeyExists( SESSION, ATTRIBUTES["fileListVariable"] ) OR NOT IsArray( SESSION[ ATTRIBUTES["fileListVariable"] ] )>
		<cfset SESSION[ATTRIBUTES.fileListVariable] = ArrayNew(1)>
	<cfelse>
		<cfset ArrayClear( SESSION[ ATTRIBUTES["fileListVariable"] ])>
	</cfif> 
</cfif>
<cfif StructKeyExists( ATTRIBUTES, "originalNameFileListVariable" )>
	<cfif NOT StructKeyExists( SESSION, ATTRIBUTES["originalNameFileListVariable"] ) OR NOT IsArray( SESSION[ ATTRIBUTES["originalNameFileListVariable"] ] )>
		<cfset SESSION[ATTRIBUTES.fileListVariable] = ArrayNew(1)>
	<cfelse>
		<cfset ArrayClear( SESSION[ ATTRIBUTES["originalNameFileListVariable"] ] )>
	</cfif> 
</cfif>


<!--- Save the reference data --->
<cfwddx action="CFML2WDDX" input="#ATTRIBUTES#" output="attribsAsString">
<cfset ref = Hash( attribsAsString & CGI.REMOTE_ADDR )>
<cfmodule template="serializeAttributes.cfm" scope="SESSION" method="save" uid="#ref#">

<cfparam name="ATTRIBUTES.displaymode" default="script">

<!--- Count how many instances we have on page --->
<cfparam name="REQUEST.dcCom_ProFlashUploadCount" default="0">
<cfset REQUEST.dcCom_ProFlashUploadCount = REQUEST.dcCom_ProFlashUploadCount + 1>
<cfset n = REQUEST.dcCom_ProFlashUploadCount>

<!--- Include the FlashObject file --->
<cfif REQUEST.dcCom_ProFlashUploadCount IS 1>
	<cfif ATTRIBUTES.displaymode EQ "script">
		<cfoutput><script src="#ATTRIBUTES.RelSharedPath#FlashObject.js" type="text/javascript"></script></cfoutput>
	</cfif>
</cfif>

<cfdirectory action="LIST" directory="#GetDirectoryFromPath(GetCurrentTemplatePath())#images\filetypes\" name="fileIconDir">
<cfset fileIconList = "">
<cfloop query="fileIconDir">
	<cfif ListLen(Name,".") IS 2 AND ListLast(Name,".") EQ "gif">
		<cfset fileIconList = ListAppend( fileIconList, ListGetAt(Name,1,".") )>
	</cfif>
</cfloop>


<!--- Write code for starting the uploading --->
<!--- 
<cfif REQUEST.dcCom_ProFlashUploadCount IS 1>
<cfoutput>
<script>
var ProFlashUpload = {
	GetMovie:function(no){
		if( no == null ) no = 1;
		if (navigator.appName.indexOf ("Microsoft") !=-1) {
			return window["ProFlashUpload"+no];
		} else {
			return document["ProFlashUpload"+no];
		}
	},
	Browse:function(no){
		var movie = this.GetMovie(no);
		movie.Play();
	},
	Upload:function(no){
		var movie = this.GetMovie(no);
		movie.upload();
	}
};
</script>
<input type="button" value="Start Browse" onclick="ProFlashUpload.Browse(1)">
<input type="button" value="Start Upload" onclick="ProFlashUpload.Upload(1)">
</cfoutput>
</cfif>
 --->
 
<cfif isDefined("ATTRIBUTES.baseUrl")>
	<cfset baseUrl = ATTRIBUTES.baseUrl>
<cfelse>	
	<cfset baseUrl = CGI.server_name>
	<cfif CGI.SERVER_PORT IS NOT "80" AND CGI.SERVER_PORT IS NOT "443">
		<cfset baseUrl = baseUrl & ":" & CGI.SERVER_PORT>
	</cfif>
	<cfset baseUrl = replace( baseUrl & "/" & GetDirectoryFromPath(cgi.SCRIPT_NAME),"\","")>
	<cfset baseUrl = replace( baseUrl & ATTRIBUTES.RelSharedPath, "//", "/", "ALL" )>
	<cfif Len(CGI.HTTPS) AND (CGI.HTTPS EQ "on" OR (IsBoolean(CGI.HTTPS) AND CGI.HTTPS))>
		<cfset baseUrl = "https://" & baseUrl>
	<cfelse>
		<cfset baseUrl = "http://" & baseUrl>
	</cfif>
</cfif>

<!--- Write the code to invoke the component --->
<cfoutput>
<div id="ProFlashUploadDiv#n#">
</cfoutput>

<cfparam name="ATTRIBUTES.displaymode" default="script">
<cfset REQUEST.pfuDisplaymode = ATTRIBUTES.displaymode>

<cfif NOT StructKeyExists( REQUEST, "pfuAddVariable" )>
	<cfinclude template="inc_fn_pfuAddVariable.cfm">
</cfif>

<cfif ATTRIBUTES.displaymode EQ "script">
	<cfoutput>
	<script>
	var jsProFlashUpload#n# = new FlashObject ("#JSStringFormat(ATTRIBUTES.RelSharedPath)#ProFlashUpload2.swf", "ProFlashUpload#n#", "#ATTRIBUTES.width#", "#ATTRIBUTES.height#", 8, "##FFFFFF", true);
	jsProFlashUpload#n#.addParam("wmode", "#JSStringFormat(ATTRIBUTES.wmode)#");
	jsProFlashUpload#n#.addParam("swLiveConnect","true");
	</cfoutput>
</cfif>

<!--- Pass in the baseURL --->
<cfset REQUEST.pfuAddVariable("baseUrl", "#JSStringFormat(baseUrl)#")>

<!--- Pass in the ref --->
<cfset REQUEST.pfuAddVariable("ref", "#JSStringFormat(ref)#")>

<!--- Pass in the icon list --->
<cfset REQUEST.pfuAddVariable("fileIconList", "#JSStringFormat(fileIconList)#")>

<!--- CFID & CFTOKEN --->
<cfif isdefined("COOKIE.CFID")>
	<cfset REQUEST.pfuAddVariable("cfid", "#URLEncodedFormat( COOKIE.CFID )#")>
</cfif>
<cfif isdefined("COOKIE.CFTOKEN")>
	<cfset REQUEST.pfuAddVariable("cftoken", "#URLEncodedFormat( COOKIE.CFTOKEN )#")>
</cfif>
<cfif isdefined("COOKIE.JSESSIONID")>
	<cfset REQUEST.pfuAddVariable("jSessionId", "#URLEncodedFormat( COOKIE.JSESSIONID )#")>
</cfif>

<!--- Limits --->
<cfif StructKeyExists(ATTRIBUTES,"maxFileSize") AND isNumeric(ATTRIBUTES.maxFileSize)><cfset REQUEST.pfuAddVariable("maxFileSize", "#JSStringFormat(ATTRIBUTES.maxFileSize)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"minFileSize") AND isNumeric(ATTRIBUTES.minFileSize)><cfset REQUEST.pfuAddVariable("minFileSize", "#JSStringFormat(ATTRIBUTES.minFileSize)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"maxfiles") AND isNumeric(ATTRIBUTES.maxfiles)><cfset REQUEST.pfuAddVariable("maxFiles", "#JSStringFormat(ATTRIBUTES.maxFiles)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"maxTotalFileSize") AND isNumeric(ATTRIBUTES.maxTotalFileSize)><cfset REQUEST.pfuAddVariable("maxTotalFileSize", "#JSStringFormat(ATTRIBUTES.maxTotalFileSize)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"maxFileSize") AND isNumeric(ATTRIBUTES.maxFileSize)><cfset REQUEST.pfuAddVariable("maxFileSize", "#JSStringFormat(ATTRIBUTES.maxFileSize)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"maxfiles") AND isNumeric(ATTRIBUTES.maxfiles)><cfset REQUEST.pfuAddVariable("maxFiles", "#JSStringFormat(ATTRIBUTES.maxFiles)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"maxTotalFileSize") AND isNumeric(ATTRIBUTES.maxTotalFileSize)><cfset REQUEST.pfuAddVariable("maxTotalFileSize", "#JSStringFormat(ATTRIBUTES.maxTotalFileSize)#")></cfif>

<!--- Filter --->	
<cfif StructKeyExists(ATTRIBUTES,"filter")><cfset REQUEST.pfuAddVariable("filter", "#JSStringFormat(ATTRIBUTES.filter)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"blockExtensions")><cfset REQUEST.pfuAddVariable("blockExtensions", "#JSStringFormat(ATTRIBUTES.blockExtensions)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"filter")><cfset REQUEST.pfuAddVariable("filter", "#JSStringFormat(ATTRIBUTES.filter)#")></cfif>

<!--- Color Customisation --->
<cfif StructKeyExists(ATTRIBUTES,"themeColor") AND Len(ATTRIBUTES.themeColor)>
	<cfif Left(ATTRIBUTES.themeColor,4) NEQ "halo">
		<cfset ATTRIBUTES.themeColor = "halo" & ATTRIBUTES.themeColor>
	</cfif>
	<cfset REQUEST.pfuAddVariable("themeColor", "#JSStringFormat( ATTRIBUTES.themeColor )#")>
</cfif>
<cfif StructKeyExists(ATTRIBUTES,"statusTextColor") AND Len(ATTRIBUTES.statusTextColor)><cfset REQUEST.pfuAddVariable("statusTextColor", "#JSStringFormat(ATTRIBUTES.statusTextColor)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"headerBGColor") AND Len(ATTRIBUTES.headerBGColor)><cfset REQUEST.pfuAddVariable("headerBGColor", "#JSStringFormat(ATTRIBUTES.headerBGColor)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"headerTextColor") AND Len(ATTRIBUTES.headerTextColor)><cfset REQUEST.pfuAddVariable("headerTextColor", "#JSStringFormat(ATTRIBUTES.headerTextColor)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"rowColor1") AND Len(ATTRIBUTES.rowColor1)><cfset REQUEST.pfuAddVariable("rowColor1", "#JSStringFormat(ATTRIBUTES.rowColor1)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"rowColor2") AND Len(ATTRIBUTES.rowColor2)><cfset REQUEST.pfuAddVariable("rowColor2", "#JSStringFormat(ATTRIBUTES.rowColor2)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"selectionColor") AND Len(ATTRIBUTES.selectionColor)><cfset REQUEST.pfuAddVariable("selectionColor", "#JSStringFormat(ATTRIBUTES.selectionColor)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"rollOverColor") AND Len(ATTRIBUTES.rollOverColor)><cfset REQUEST.pfuAddVariable("rollOverColor", "#JSStringFormat(ATTRIBUTES.rollOverColor)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"rollOverTextColor") AND Len(ATTRIBUTES.rollOverTextColor)><cfset REQUEST.pfuAddVariable("rollOverTextColor", "#JSStringFormat(ATTRIBUTES.rollOverTextColor)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"barColor") AND Len(ATTRIBUTES.barColor)><cfset REQUEST.pfuAddVariable("barColor", "#JSStringFormat(ATTRIBUTES.barColor)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"trackColor") AND Len(ATTRIBUTES.trackColor)><cfset REQUEST.pfuAddVariable("trackColor", "#JSStringFormat(ATTRIBUTES.trackColor)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"statusTextColor") AND Len(ATTRIBUTES.statusTextColor)><cfset REQUEST.pfuAddVariable("statusTextColor", "#JSStringFormat(ATTRIBUTES.statusTextColor)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"headerBGColor") AND Len(ATTRIBUTES.headerBGColor)><cfset REQUEST.pfuAddVariable("headerBGColor", "#JSStringFormat(ATTRIBUTES.headerBGColor)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"headerTextColor") AND Len(ATTRIBUTES.headerTextColor)><cfset REQUEST.pfuAddVariable("headerTextColor", "#JSStringFormat(ATTRIBUTES.headerTextColor)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"rowColor1") AND Len(ATTRIBUTES.rowColor1)><cfset REQUEST.pfuAddVariable("rowColor1", "#JSStringFormat(ATTRIBUTES.rowColor1)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"rowColor2") AND Len(ATTRIBUTES.rowColor2)><cfset REQUEST.pfuAddVariable("rowColor2", "#JSStringFormat(ATTRIBUTES.rowColor2)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"selectionColor") AND Len(ATTRIBUTES.selectionColor)><cfset REQUEST.pfuAddVariable("selectionColor", "#JSStringFormat(ATTRIBUTES.selectionColor)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"rollOverColor") AND Len(ATTRIBUTES.rollOverColor)><cfset REQUEST.pfuAddVariable("rollOverColor", "#JSStringFormat(ATTRIBUTES.rollOverColor)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"rollOverTextColor") AND Len(ATTRIBUTES.rollOverTextColor)><cfset REQUEST.pfuAddVariable("rollOverTextColor", "#JSStringFormat(ATTRIBUTES.rollOverTextColor)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"barColor") AND Len(ATTRIBUTES.barColor)><cfset REQUEST.pfuAddVariable("barColor", "#JSStringFormat(ATTRIBUTES.barColor)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"trackColor") AND Len(ATTRIBUTES.trackColor)><cfset REQUEST.pfuAddVariable("trackColor", "#JSStringFormat(ATTRIBUTES.trackColor)#")></cfif>


<!--- Extra Options --->
<cfif StructKeyExists(ATTRIBUTES,"showUploadButton") AND IsBoolean(ATTRIBUTES.showUploadButton)><cfset REQUEST.pfuAddVariable("showUploadButton", "#IIF(ATTRIBUTES.showUploadButton,DE("yes"),DE("no"))#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"showResetButton") AND IsBoolean(ATTRIBUTES.showResetButton)><cfset REQUEST.pfuAddVariable("showResetButton", "#IIF(ATTRIBUTES.showResetButton,DE("yes"),DE("no"))#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"showSizeColumn") AND IsBoolean(ATTRIBUTES.showSizeColumn)><cfset REQUEST.pfuAddVariable("showSizeColumn", "#IIF(ATTRIBUTES.showSizeColumn,DE("yes"),DE("no"))#")></cfif>

<!--- Text Customisation --->
<cfif StructKeyExists(ATTRIBUTES,"txtBrowse") AND Len(ATTRIBUTES.txtBrowse)><cfset REQUEST.pfuAddVariable("txtBrowse", "#JSStringFormat(ATTRIBUTES.txtBrowse)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"txtRemove") AND Len(ATTRIBUTES.txtRemove)><cfset REQUEST.pfuAddVariable("txtRemove", "#JSStringFormat(ATTRIBUTES.txtRemove)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"txtReset") AND Len(ATTRIBUTES.txtReset)><cfset REQUEST.pfuAddVariable("txtReset", "#JSStringFormat(ATTRIBUTES.txtReset)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"txtUpload") AND Len(ATTRIBUTES.txtUpload)><cfset REQUEST.pfuAddVariable("txtUpload", "#JSStringFormat(ATTRIBUTES.txtUpload)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"txtStop") AND Len(ATTRIBUTES.txtStop)><cfset REQUEST.pfuAddVariable("txtStop", "#JSStringFormat(ATTRIBUTES.txtStop)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"txtBrowse") AND Len(ATTRIBUTES.txtBrowse)><cfset REQUEST.pfuAddVariable("txtBrowse", "#JSStringFormat(ATTRIBUTES.txtBrowse)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"txtRemove") AND Len(ATTRIBUTES.txtRemove)><cfset REQUEST.pfuAddVariable("txtRemove", "#JSStringFormat(ATTRIBUTES.txtRemove)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"txtReset") AND Len(ATTRIBUTES.txtReset)><cfset REQUEST.pfuAddVariable("txtReset", "#JSStringFormat(ATTRIBUTES.txtReset)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"txtUpload") AND Len(ATTRIBUTES.txtUpload)><cfset REQUEST.pfuAddVariable("txtUpload", "#JSStringFormat(ATTRIBUTES.txtUpload)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"txtStop") AND Len(ATTRIBUTES.txtStop)><cfset REQUEST.pfuAddVariable("txtStop", "#JSStringFormat(ATTRIBUTES.txtStop)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"txtChoose") AND Len(ATTRIBUTES.txtChoose)><cfset REQUEST.pfuAddVariable("txtChoose", "#JSStringFormat(ATTRIBUTES.txtChoose)#")></cfif>

<!--- JS Callbacks --->
<cfif StructKeyExists(ATTRIBUTES,"jsOnComplete") AND Len(ATTRIBUTES.jsOnComplete)><cfset REQUEST.pfuAddVariable("jsOnComplete", "#JSStringFormat(ATTRIBUTES.jsOnComplete)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"jsOnFileUpload") AND Len(ATTRIBUTES.jsOnFileUpload)><cfset REQUEST.pfuAddVariable("jsOnFileUpload", "#JSStringFormat(ATTRIBUTES.jsOnFileUpload)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"redirectURL") AND Len(ATTRIBUTES.redirectURL)><cfset REQUEST.pfuAddVariable("redirectURL", "#JSStringFormat( URLEncodedFormat( ATTRIBUTES.redirectURL ) )#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"jsOnComplete") AND Len(ATTRIBUTES.jsOnComplete)><cfset REQUEST.pfuAddVariable("jsOnComplete", "#JSStringFormat(ATTRIBUTES.jsOnComplete)#")></cfif>
<cfif StructKeyExists(ATTRIBUTES,"jsOnFileUpload") AND Len(ATTRIBUTES.jsOnFileUpload)><cfset REQUEST.pfuAddVariable("jsOnFileUpload", "#JSStringFormat(ATTRIBUTES.jsOnFileUpload)#")></cfif>

<!--- Upload URL --->
<cfif StructKeyExists(ATTRIBUTES,"uploadUrl") AND Len(ATTRIBUTES.uploadUrl)><cfset REQUEST.pfuAddVariable("uploadUrl", "#JSStringFormat( URLEncodedFormat( ATTRIBUTES.uploadUrl ) )#")></cfif>

<!--- Debug --->
<cfif StructKeyExists(ATTRIBUTES,"debug") AND IsBoolean(ATTRIBUTES.debug)><cfset REQUEST.pfuAddVariable("debug", "#IIF(ATTRIBUTES.debug,DE("yes"),DE("no"))#")></cfif>

<cfif ATTRIBUTES.displaymode EQ "script">
<cfoutput>	
jsProFlashUpload#n#.write("ProFlashUploadDiv#n#");
//jsProFlashUpload#n#.debug();
// -->
</script>
</cfoutput>

<cfelse>
	<cfif find( "MSIE", CGI.HTTP_USER_AGENT )>
		<cfoutput><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="100%" height="#ATTRIBUTES.height#" id="ProFlashUpload1"></cfoutput>
		<cfoutput><param name="movie" value="dccom/components/ProFlashUpload/ProFlashUpload2.swf" /></cfoutput>
		<cfoutput><param name="bgcolor" value="##FFFFFF" /><param name="quality" value="high" /><param name="swLiveConnect" value="true" /></cfoutput>
		<cfoutput><param name="flashvars" value="#ATTRIBUTES.flashvars#" /></cfoutput>
		<cfoutput></object></cfoutput>
	<cfelse>
		<cfoutput><embed type="application/x-shockwave-flash" src="dccom/components/ProFlashUpload/ProFlashUpload2.swf" width="100%" height="#ATTRIBUTES.height#" name="ProFlashUpload1" bgcolor="##FFFFFF" quality="high" <cfif NOT findNoCase( "Firefox/4.0b10" , CGI.user_agent )>wmode="transparent"</cfif> swLiveConnect="true"</cfoutput>
		<cfoutput> flashvars="#ATTRIBUTES.flashvars#"></cfoutput>
		<cfoutput></embed></cfoutput>
	</cfif>
</cfif>

<cfoutput>
</div>
</cfoutput>