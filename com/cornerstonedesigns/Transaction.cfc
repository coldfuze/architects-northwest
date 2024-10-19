<cfcomponent output="false" alias="com.cornerstonedesigns.Transaction">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="TransactionId" type="numeric" default="0">
	<cfproperty name="TransactionTitle" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.TransactionId = 0;
		this.TransactionTitle = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Transaction">
		<cfreturn this>
	</cffunction>
	<cffunction name="getTransactionId" output="false" access="public" returntype="any">
		<cfreturn this.TransactionId>
	</cffunction>

	<cffunction name="setTransactionId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.TransactionId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTransactionTitle" output="false" access="public" returntype="any">
		<cfreturn this.TransactionTitle>
	</cffunction>

	<cffunction name="setTransactionTitle" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.TransactionTitle = arguments.val>
	</cffunction>



</cfcomponent>