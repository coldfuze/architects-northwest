<cfcomponent output="false" alias="com.cornerstonedesigns.ImageType">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="ImageTypeId" type="numeric" default="0">
	<cfproperty name="ImageType" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.ImageTypeId = 0;
		this.ImageType = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="ImageType">
		<cfreturn this>
	</cffunction>
	<cffunction name="getImageTypeId" output="false" access="public" returntype="any">
		<cfreturn this.ImageTypeId>
	</cffunction>

	<cffunction name="setImageTypeId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.ImageTypeId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getImageType" output="false" access="public" returntype="any">
		<cfreturn this.ImageType>
	</cffunction>

	<cffunction name="setImageType" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.ImageType = arguments.val>
	</cffunction>



</cfcomponent>