<cfcomponent output="false" alias="com.cornerstonedesigns.Builder">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="BuilderId" type="numeric" default="0">
	<cfproperty name="Builder" type="string" default="">
	<cfproperty name="Link" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.BuilderId = 0;
		this.Builder = "";
		this.Link = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Builder">
		<cfreturn this>
	</cffunction>
	<cffunction name="getBuilderId" output="false" access="public" returntype="any">
		<cfreturn this.BuilderId>
	</cffunction>

	<cffunction name="setBuilderId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.BuilderId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getBuilder" output="false" access="public" returntype="any">
		<cfreturn this.Builder>
	</cffunction>

	<cffunction name="setBuilder" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Builder = arguments.val>
	</cffunction>

	<cffunction name="getLink" output="false" access="public" returntype="any">
		<cfreturn this.Link>
	</cffunction>

	<cffunction name="setLink" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Link = arguments.val>
	</cffunction>



</cfcomponent>