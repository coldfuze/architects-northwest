<cfcomponent output="false" alias="com.cornerstonedesigns.BuildingProductCompany">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="BuildingProductCompanyId" type="numeric" default="0">
	<cfproperty name="BuildingProductTypeId" type="numeric" default="0">
	<cfproperty name="BuildingProductCompany" type="string" default="">
	<cfproperty name="WebSite" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.BuildingProductCompanyId = 0;
		this.BuildingProductTypeId = 0;
		this.BuildingProductCompany = "";
		this.WebSite = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="BuildingProductCompany">
		<cfreturn this>
	</cffunction>
	<cffunction name="getBuildingProductCompanyId" output="false" access="public" returntype="any">
		<cfreturn this.BuildingProductCompanyId>
	</cffunction>

	<cffunction name="setBuildingProductCompanyId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.BuildingProductCompanyId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getBuildingProductTypeId" output="false" access="public" returntype="any">
		<cfreturn this.BuildingProductTypeId>
	</cffunction>

	<cffunction name="setBuildingProductTypeId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.BuildingProductTypeId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getBuildingProductCompany" output="false" access="public" returntype="any">
		<cfreturn this.BuildingProductCompany>
	</cffunction>

	<cffunction name="setBuildingProductCompany" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.BuildingProductCompany = arguments.val>
	</cffunction>

	<cffunction name="getWebSite" output="false" access="public" returntype="any">
		<cfreturn this.WebSite>
	</cffunction>

	<cffunction name="setWebSite" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.WebSite = arguments.val>
	</cffunction>



</cfcomponent>