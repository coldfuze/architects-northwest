<cfsilent>
<cfparam name="URL.ref">
<cftry>

	<cfif isdefined("URL.sessionid")>
		<cfset SESSION.sessionid = URL.sessionid>
	</cfif>
	<cfif isdefined("URL.urltoken")>
		<cfset SESSION.urltoken = URL.urltoken>
	</cfif>

	<cfsavecontent variable="debugMsg"><cfdump var="#SESSION#"></cfsavecontent>	
	<cfsavecontent variable="debugMsg"><cfdump var="#COOKIE#"></cfsavecontent>	
	<cffile action="WRITE" nameconflict="OVERWRITE" file="#GetDirectoryFromPath(GetCurrentTemplatePath())#debug.html" output="#debugMsg#">

	<!--- Load all saved vars --->
	<cfmodule template="serializeAttributes.cfm" scope="SESSION" uid="#URL.ref#" method="load" />
	
	<!--- Perform some action if requested --->
	<cfif isdefined("ATTRIBUTES.includeBeforeUpload")>
		<cfinclude template="../../../#ATTRIBUTES.includeBeforeUpload#">
	</cfif>
	
	<!--- Files are uploaded into the userUploads folder. --->
	<cfif len(ATTRIBUTES.uploadAccept)>
		<cffile action="upload" accept="#ATTRIBUTES.uploadAccept#" filefield="Filedata" destination="#ATTRIBUTES.folder#" nameconflict="#ATTRIBUTES.nameconflict#" />
	<cfelse>
		<cffile action="upload" filefield="Filedata" destination="#ATTRIBUTES.folder#" nameconflict="#ATTRIBUTES.nameconflict#" />
	</cfif>
	
	<cfparam name="ATTRIBUTES.blockExtensions" default="">
	<cfif listLen( File.ServerFile, "." ) GT 1>
		<cfset extension = listLast( File.ServerFile, "." )>
		<cfif listFindNoCase( ATTRIBUTES.blockExtensions, extension )>
			<cftry><cffile action="DELETE" file="#ATTRIBUTES.folder##File.ServerFile#"><cfcatch type="Any"></cfcatch></cftry>
			<cfthrow message="Not allowed">
		</cfif>
	</cfif>
	
	<!--- Remember which files were uploaded --->
	<cfif structKeyExists( ATTRIBUTES, "fileListVariable" )>

		<cfset COOKIE.CFID = ATTRIBUTES.CFID>
		<cfset COOKIE.CFTOKEN = ATTRIBUTES.CFTOKEN>

		<cfif NOT isdefined("SESSION.#ATTRIBUTES.fileListVariable#") OR NOT IsArray( SESSION[ATTRIBUTES.fileListVariable] )>
			<cfset SESSION[ATTRIBUTES.fileListVariable] = ArrayNew(1)>
		</cfif> 
		<cfset ArrayAppend( SESSION[ATTRIBUTES.fileListVariable], File.ServerFile )>

	</cfif>
	<cfif StructKeyExists( ATTRIBUTES, "originalNameFileListVariable" )>
	
		<cfset COOKIE.CFID = ATTRIBUTES.CFID>
		<cfset COOKIE.CFTOKEN = ATTRIBUTES.CFTOKEN>
	
		<cfif NOT isdefined("SESSION.#ATTRIBUTES.originalNameFileListVariable#") OR NOT IsArray( SESSION[ATTRIBUTES.originalNameFileListVariable] )>
			<cfset SESSION[ATTRIBUTES.originalNameFileListVariable] = ArrayNew(1)>
		</cfif> 
		<cfset ArrayAppend( SESSION[ATTRIBUTES.originalNameFileListVariable], File.ClientFile  )>
	</cfif>

	<!--- Perform some action if requested --->
	<cfif isdefined("ATTRIBUTES.includeOnUpload")>
		<cfinclude template="../../../#ATTRIBUTES.includeOnUpload#">
	</cfif>
	
	<cfcatch type="Any">
	
		<cfparam name="APPLICATION.ProFlashUploadErrorCount" default="0">
		<cfset APPLICATION.ProFlashUploadErrorCount = APPLICATION.ProFlashUploadErrorCount + 1>
		
		<cfsavecontent variable="err"><cfdump var="#cfcatch#"></cfsavecontent>
		<cffile action="WRITE" nameconflict="OVERWRITE" file="#GetDirectoryFromPath(GetCurrentTemplatePath())#error#APPLICATION.ProFlashUploadErrorCount#.html" output="#err#">
		
		<!--- Delete old error files so we don't end up with hundreds --->
		<cfif FileExists( "#GetDirectoryFromPath(GetCurrentTemplatePath())#error#(APPLICATION.ProFlashUploadErrorCount-5)#.html" )>
			<cffile action="DELETE" file="#GetDirectoryFromPath(GetCurrentTemplatePath())#error#(APPLICATION.ProFlashUploadErrorCount-5)#.html">
		</cfif>
	
		<cfrethrow>
	
	</cfcatch>

</cftry>
</cfsilent>