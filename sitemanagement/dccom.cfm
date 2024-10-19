<!------------------------------------------------------------------------------------------------------
 -----------------------------------------------------------------------------------------------------
 
Application:	Any
Project:		Any
Filename:		dccom.cfm
Programmers:	Peter Coppinger <peter@digital-crew.com>

Description:	Interface to invoke a dccom component.
				Syntax: <cf_dccom component="[COMPONENT NAME]" [...x=y...]>
Version:		1.2
				
CHANGE LOG:
24 Feb 2002		PC - Document created.
07 May 2002		PC - Optimised
23 Jun 2002		PC - Optimised and Improved, Fix Minor Bug with Sub Attributes
06 Mar 2003		PC - The nested generatedContent in subtags is now passed through in
					subtab ATTRIBUTE generatedContent e.g. thisTag.assocAttribs[i].generatedContent
26 Aug 2003		PC - Added code so that the URL path is automatically calculated - got sick of
					 people annoying me over this
24 Feb 2006		PC - Fixed for unix

 ----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------><cfsetting enablecfoutputonly="Yes">

<!--- If ATTRIBUTES.dccom_filePath is not defined then check if the application level
	variable is set for the current directory, if not then search backwards through
	the directories until we find the dccom folder and then assign that to both
	the required ATTRIBUTES.dccom_filePath and the application scope so that it won't
	have to be looked up next time --->
<cfif isdefined("ATTRIBUTES.component") AND NOT isDefined("ATTRIBUTES.dccom_filePath")>
	<cfset dccom_callerdir = replace(GetDirectoryFromPath(GetCurrentTemplatePath()),"\","/","ALL")>
	<cfset dccom_dirHash = Hash(dccom_callerdir)>
	<cfset dccom_DirFilePathVar = "APPLICATION.dccom_" & dccom_dirHash & "_filepath">

	<cfif isdefined(dccom_DirFilePathVar)>
		<!--- Assigned the pre-existing APPLICATION level path information to the required path attributes --->
		<cfset ATTRIBUTES.dccom_filePath = Evaluate(dccom_DirFilePathVar)>
	<cfelse>
		<!--- Now find the relative file path if it is different to that startPath --->
		<cfset startFilePath = GetDirectoryFromPath(GetCurrentTemplatePath())>
		<!--- Drop ending "/" because this will be treated as list --->
		<cfset searchFilePath = Left(dccom_callerdir, Len(dccom_callerdir)-1)>
		<!--- Search this and all parent directories for the dccom directory --->
		<cfset foundDir = false><cfset ATTRIBUTES.dccom_filePath = "">
		<cfloop condition="foundDir EQ false AND ListLen(searchFilePath,'/') GT 0">
			<cfif DirectoryExists(searchFilePath & "/dccom/components/")>
				<cfset foundDir = true>
				<cfset ATTRIBUTES.dccom_filePath = ATTRIBUTES.dccom_filePath & "dccom/">
				<cfscript>Evaluate(dccom_DirFilePathVar & " = ATTRIBUTES.dccom_filePath" );</cfscript>
			<cfelse>
				<!--- move the relative path up one for next loop match search --->
				<cfset ATTRIBUTES.dccom_filePath = "../" & ATTRIBUTES.dccom_filePath>
			</cfif>
			<!--- Remove last directory from the directory list --->
			<cfset searchFilePath = ListDeleteAt(searchFilePath, ListLen(searchFilePath,"/"), "/")>
		</cfloop>
		<!--- Check for error finding the dccom directory --->
		<cfif foundDir EQ false>
			<cfoutput>
			</TD></TD></TD></TH></TH></TH></TR></TR></TR></TABLE></TABLE></TABLE></A></ABBREV></ACRONYM></ADDRESS></APPLET></AU></B></BANNER></BIG></BLINK></BLOCKQUOTE></BQ></CAPTION></CENTER></CITE></CODE></COMMENT></DEL></DFN></DIR></DIV></DL></EM></FIG></FN></FONT></FORM></FRAME></FRAMESET></H1></H2></H3></H4></H5></H6></HEAD></I></INS></KBD></LISTING></MAP></MARQUEE></MENU></MULTICOL></NOBR></NOFRAMES></NOSCRIPT></NOTE></OL></P></PARAM></PERSON></PLAINTEXT></PRE></Q></S></SAMP></SCRIPT></SELECT></SMALL></STRIKE></STRONG></SUB></SUP></TABLE></TD></TEXTAREA></TH></TITLE></TR></TT></U></UL></VAR></WBR></XMP>
			<h3><cfif isdefined("ATTRIBUTES.component")>#ATTRIBUTES.component# </cfif>Error!</h3>
			<p>
				<b>Could not find relative URL path to dccom directory.</b><br><br>
				Please ensure that the dccom folder is place in the same or a URL accessable<br>
				parent directory.
			</p>
			</cfoutput>
			<cfabort>
		</cfif>
	</cfif>
	
</cfif>



<cfif isdefined("ATTRIBUTES.component") AND NOT isdefined("ATTRIBUTES.dccom_RelPath")>
	<cfif isdefined("APPLICATION.dccom_RelPath")>
		<cfset ATTRIBUTES.dccom_RelPath = APPLICATION.dccom_RelPath>
	<cfelse>
		<!--- Save us doing this work again, paths might have been calculated above --->
		<cfif NOT isdefined("dccom_callerdir")>
			<cfset dccom_callerdir = GetDirectoryFromPath(GetCurrentTemplatePath())>
			<cfset dccom_dirHash = Hash(dccom_callerdir)>
		</cfif>
		
		<cfset dccom_DirRelPathVar = "APPLICATION.dccom_" & dccom_dirHash & "_relpath">
	
		<cfif isdefined("#dccom_DirRelPathVar#")>
			<cfset ATTRIBUTES.dccom_RelPath = Evaluate(dccom_DirRelPathVar)>
		<cfelse>
			<!--- Calculate the relative URL path to the dccom directory --->
			<cfset startURLPath = replace( GetDirectoryFromPath(GetBaseTemplatePath()), "\", "/", "ALL")>
			<!--- Drop ending "/" because this will be treated as list --->
			<cfset searchURLPath = Left(startURLPath, Len(startURLPath)-1)>
			<!--- Search this and all parent directories for the dccom directory --->
			<cfset foundDir = false><cfset ATTRIBUTES.dccom_RelPath = "">
			<cfloop condition="foundDir EQ false AND ListLen(searchURLPath,'/') GT 0">
				<cfif DirectoryExists(searchURLPath & "/dccom/components/")>
					<cfset foundDir = true>
					<cfset ATTRIBUTES.dccom_RelPath = ATTRIBUTES.dccom_RelPath & "dccom/">
					<cfscript>Evaluate(dccom_DirRelPathVar & " = ATTRIBUTES.dccom_RelPath" );</cfscript>
				<cfelse>
					<!--- move the relative path up one for next loop match search --->
					<cfset ATTRIBUTES.dccom_RelPath = "../" & ATTRIBUTES.dccom_RelPath>
				</cfif>
				
				<!--- Remove last directory from the directory list --->
				<cfset searchURLPath = ListDeleteAt(searchURLPath, ListLen(searchURLPath,"/"), "/")>
			</cfloop>
			<!--- Check for error finding the dccom directory --->
			<cfif foundDir EQ false>
				<cfoutput>
				</TD></TD></TD></TH></TH></TH></TR></TR></TR></TABLE></TABLE></TABLE></A></ABBREV></ACRONYM></ADDRESS></APPLET></AU></B></BANNER></BIG></BLINK></BLOCKQUOTE></BQ></CAPTION></CENTER></CITE></CODE></COMMENT></DEL></DFN></DIR></DIV></DL></EM></FIG></FN></FONT></FORM></FRAME></FRAMESET></H1></H2></H3></H4></H5></H6></HEAD></I></INS></KBD></LISTING></MAP></MARQUEE></MENU></MULTICOL></NOBR></NOFRAMES></NOSCRIPT></NOTE></OL></P></PARAM></PERSON></PLAINTEXT></PRE></Q></S></SAMP></SCRIPT></SELECT></SMALL></STRIKE></STRONG></SUB></SUP></TABLE></TD></TEXTAREA></TH></TITLE></TR></TT></U></UL></VAR></WBR></XMP>
				<h3><cfif isdefined("ATTRIBUTES.component")>#ATTRIBUTES.component# </cfif>Error!</h3>
				<p>
					<b>Could not find relative URL path to dccom directory.</b><br><br>
					Please ensure that the dccom folder is place in the same or a URL accessable<br>
					parent directory of "#CGI.path_info#".				
				</p>
				</cfoutput>
				<cfabort>
			</cfif>
		</cfif>
	</cfif>
</cfif>


<cfparam name="ATTRIBUTES.comstyle" default="default"><!--- default comstyle is (of course) "default" --->


<cfif NOT isdefined("ATTRIBUTES.component")>
	<!--- Its a parameter, pass along data and exit --->
	<CFIF ThisTag.ExecutionMode IS "End">
		<CFASSOCIATE BASETAG="CF_DCCOM">
		<cfset ATTRIBUTES.generatedContent = ThisTag.generatedContent>
	</cfif>
<cfelse>
	<!--- EXECUTE THE TAG! --->
	<cftry>
		<cfinclude template="#ATTRIBUTES.dccom_filePath#/engine/setup.cfm">
		<cfcatch type="MissingInclude">
			<cfoutput>
			</TD></TD></TD></TH></TH></TH></TR></TR></TR></TABLE></TABLE></TABLE></A></ABBREV></ACRONYM></ADDRESS></APPLET></AU></B></BANNER></BIG></BLINK></BLOCKQUOTE></BQ></CAPTION></CENTER></CITE></CODE></COMMENT></DEL></DFN></DIR></DIV></DL></EM></FIG></FN></FONT></FORM></FRAME></FRAMESET></H1></H2></H3></H4></H5></H6></HEAD></I></INS></KBD></LISTING></MAP></MARQUEE></MENU></MULTICOL></NOBR></NOFRAMES></NOSCRIPT></NOTE></OL></P></PARAM></PERSON></PLAINTEXT></PRE></Q></S></SAMP></SCRIPT></SELECT></SMALL></STRIKE></STRONG></SUB></SUP></TABLE></TD></TEXTAREA></TH></TITLE></TR></TT></U></UL></VAR></WBR></XMP>
			<h3>#ATTRIBUTES.component# Error!</h3>
			<p>
				<b>Path to dccomponent Directory is Incorrect.</b><br><br>
				Attempted path to dccomponents directory was "#Replace(ATTRIBUTES.dccom_filePath,"/","/","ALL")#".
			</p>
			</cfoutput>
			<cfabort>
		</cfcatch>
	</cftry>
	<cfinclude template="#ATTRIBUTES.dccom_filePath#/engine/exec.cfm">
</cfif>

<cfsetting enablecfoutputonly="No">