<cfcomponent output="false" alias="com.cornerstonedesigns.GarageSize">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="GarageSizeId" type="numeric" default="0">
	<cfproperty name="GarageSize" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.GarageSizeId = 0;
		this.GarageSize = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="GarageSize">
		<cfreturn this>
	</cffunction>
	<cffunction name="getGarageSizeId" output="false" access="public" returntype="any">
		<cfreturn this.GarageSizeId>
	</cffunction>

	<cffunction name="setGarageSizeId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.GarageSizeId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getGarageSize" output="false" access="public" returntype="any">
		<cfreturn this.GarageSize>
	</cffunction>

	<cffunction name="setGarageSize" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.GarageSize = arguments.val>
	</cffunction>



</cfcomponent>