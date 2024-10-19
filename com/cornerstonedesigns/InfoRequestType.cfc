<cfcomponent output="false" alias="com.cornerstonedesigns.InfoRequestType">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="InfoRequestTypeId" type="numeric" default="0">
	<cfproperty name="InfoRequestType" type="string" default="">
	<cfproperty name="InfoRequestTypeSubject" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.InfoRequestTypeId = 0;
		this.InfoRequestType = "";
		this.InfoRequestTypeSubject = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="InfoRequestType">
		<cfreturn this>
	</cffunction>
	<cffunction name="getInfoRequestTypeId" output="false" access="public" returntype="any">
		<cfreturn this.InfoRequestTypeId>
	</cffunction>

	<cffunction name="setInfoRequestTypeId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.InfoRequestTypeId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getInfoRequestType" output="false" access="public" returntype="any">
		<cfreturn this.InfoRequestType>
	</cffunction>

	<cffunction name="setInfoRequestType" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.InfoRequestType = arguments.val>
	</cffunction>

	<cffunction name="getInfoRequestTypeSubject" output="false" access="public" returntype="any">
		<cfreturn this.InfoRequestTypeSubject>
	</cffunction>

	<cffunction name="setInfoRequestTypeSubject" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.InfoRequestTypeSubject = arguments.val>
	</cffunction>



</cfcomponent>