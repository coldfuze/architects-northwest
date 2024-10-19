<cfcomponent output="false" alias="com.cornerstonedesigns.JobReq">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="JobReqId" type="numeric" default="0">
	<cfproperty name="Title" type="string" default="">
	<cfproperty name="JobReqOpen" type="numeric" default="0">
	<cfproperty name="DateOpened" type="date" default="">
	<cfproperty name="DateClosed" type="date" default="">
	<cfproperty name="Description" type="string" default="">
	<cfproperty name="Requirements" type="string" default="">
	<cfproperty name="LocationId" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.JobReqId = 0;
		this.Title = "";
		this.JobReqOpen = 0;
		this.DateOpened = "";
		this.DateClosed = "";
		this.Description = "";
		this.Requirements = "";
		this.LocationId = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="JobReq">
		<cfreturn this>
	</cffunction>
	<cffunction name="getJobReqId" output="false" access="public" returntype="any">
		<cfreturn this.JobReqId>
	</cffunction>

	<cffunction name="setJobReqId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.JobReqId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTitle" output="false" access="public" returntype="any">
		<cfreturn this.Title>
	</cffunction>

	<cffunction name="setTitle" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Title = arguments.val>
	</cffunction>

	<cffunction name="getJobReqOpen" output="false" access="public" returntype="any">
		<cfreturn this.JobReqOpen>
	</cffunction>

	<cffunction name="setJobReqOpen" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.JobReqOpen = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDateOpened" output="false" access="public" returntype="any">
		<cfreturn this.DateOpened>
	</cffunction>

	<cffunction name="setDateOpened" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.DateOpened = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getDateClosed" output="false" access="public" returntype="any">
		<cfreturn this.DateClosed>
	</cffunction>

	<cffunction name="setDateClosed" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.DateClosed = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getDescription" output="false" access="public" returntype="any">
		<cfreturn this.Description>
	</cffunction>

	<cffunction name="setDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Description = arguments.val>
	</cffunction>

	<cffunction name="getRequirements" output="false" access="public" returntype="any">
		<cfreturn this.Requirements>
	</cffunction>

	<cffunction name="setRequirements" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Requirements = arguments.val>
	</cffunction>

	<cffunction name="getLocationId" output="false" access="public" returntype="any">
		<cfreturn this.LocationId>
	</cffunction>

	<cffunction name="setLocationId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.LocationId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>