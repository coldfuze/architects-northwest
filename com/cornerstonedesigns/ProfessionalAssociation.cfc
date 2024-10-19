<cfcomponent output="false" alias="com.cornerstonedesigns.ProfessionalAssociation">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="ProfessionalAssociationId" type="numeric" default="0">
	<cfproperty name="ProfessionalAssociationTypeId" type="numeric" default="0">
	<cfproperty name="ProfessionalAssociation" type="string" default="">
	<cfproperty name="WebSite" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.ProfessionalAssociationId = 0;
		this.ProfessionalAssociationTypeId = 0;
		this.ProfessionalAssociation = "";
		this.WebSite = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="ProfessionalAssociation">
		<cfreturn this>
	</cffunction>
	<cffunction name="getProfessionalAssociationId" output="false" access="public" returntype="any">
		<cfreturn this.ProfessionalAssociationId>
	</cffunction>

	<cffunction name="setProfessionalAssociationId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.ProfessionalAssociationId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getProfessionalAssociationTypeId" output="false" access="public" returntype="any">
		<cfreturn this.ProfessionalAssociationTypeId>
	</cffunction>

	<cffunction name="setProfessionalAssociationTypeId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.ProfessionalAssociationTypeId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getProfessionalAssociation" output="false" access="public" returntype="any">
		<cfreturn this.ProfessionalAssociation>
	</cffunction>

	<cffunction name="setProfessionalAssociation" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.ProfessionalAssociation = arguments.val>
	</cffunction>

	<cffunction name="getWebSite" output="false" access="public" returntype="any">
		<cfreturn this.WebSite>
	</cffunction>

	<cffunction name="setWebSite" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.WebSite = arguments.val>
	</cffunction>



</cfcomponent>