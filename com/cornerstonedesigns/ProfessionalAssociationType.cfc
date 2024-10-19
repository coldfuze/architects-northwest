<cfcomponent output="false" alias="com.cornerstonedesigns.ProfessionalAssociationType">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="ProfessionalAssociationTypeId" type="numeric" default="0">
	<cfproperty name="ProfessionalAssociationType" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.ProfessionalAssociationTypeId = 0;
		this.ProfessionalAssociationType = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="ProfessionalAssociationType">
		<cfreturn this>
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

	<cffunction name="getProfessionalAssociationType" output="false" access="public" returntype="any">
		<cfreturn this.ProfessionalAssociationType>
	</cffunction>

	<cffunction name="setProfessionalAssociationType" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.ProfessionalAssociationType = arguments.val>
	</cffunction>



</cfcomponent>