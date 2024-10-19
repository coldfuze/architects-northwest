<cfcomponent output="false" alias="com.cornerstonedesigns.Designer">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="DesignerId" type="numeric" default="0">
	<cfproperty name="Designer" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.DesignerId = 0;
		this.Designer = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Designer">
		<cfreturn this>
	</cffunction>
	<cffunction name="getDesignerId" output="false" access="public" returntype="any">
		<cfreturn this.DesignerId>
	</cffunction>

	<cffunction name="setDesignerId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.DesignerId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDesigner" output="false" access="public" returntype="any">
		<cfreturn this.Designer>
	</cffunction>

	<cffunction name="setDesigner" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Designer = arguments.val>
	</cffunction>



</cfcomponent>