<cfcomponent output="false" alias="com.cornerstonedesigns.History">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="HistoryId" type="numeric" default="0">
	<cfproperty name="AdminId" type="numeric" default="0">
	<cfproperty name="TransactionId" type="numeric" default="0">
	<cfproperty name="TransactionDate" type="date" default="">
	<cfproperty name="ccFName" type="string" default="">
	<cfproperty name="ccLName" type="string" default="">
	<cfproperty name="ccLast4" type="string" default="">
	<cfproperty name="UserFName" type="string" default="">
	<cfproperty name="UserLName" type="string" default="">
	<cfproperty name="IPAddress" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.HistoryId = 0;
		this.AdminId = 0;
		this.TransactionId = 0;
		this.TransactionDate = "";
		this.ccFName = "";
		this.ccLName = "";
		this.ccLast4 = "";
		this.UserFName = "";
		this.UserLName = "";
		this.IPAddress = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="History">
		<cfreturn this>
	</cffunction>
	<cffunction name="getHistoryId" output="false" access="public" returntype="any">
		<cfreturn this.HistoryId>
	</cffunction>

	<cffunction name="setHistoryId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.HistoryId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAdminId" output="false" access="public" returntype="any">
		<cfreturn this.AdminId>
	</cffunction>

	<cffunction name="setAdminId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.AdminId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
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

	<cffunction name="getTransactionDate" output="false" access="public" returntype="any">
		<cfreturn this.TransactionDate>
	</cffunction>

	<cffunction name="setTransactionDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.TransactionDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getCcFName" output="false" access="public" returntype="any">
		<cfreturn this.CcFName>
	</cffunction>

	<cffunction name="setCcFName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.CcFName = arguments.val>
	</cffunction>

	<cffunction name="getCcLName" output="false" access="public" returntype="any">
		<cfreturn this.CcLName>
	</cffunction>

	<cffunction name="setCcLName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.CcLName = arguments.val>
	</cffunction>

	<cffunction name="getCcLast4" output="false" access="public" returntype="any">
		<cfreturn this.CcLast4>
	</cffunction>

	<cffunction name="setCcLast4" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.CcLast4 = arguments.val>
	</cffunction>

	<cffunction name="getUserFName" output="false" access="public" returntype="any">
		<cfreturn this.UserFName>
	</cffunction>

	<cffunction name="setUserFName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.UserFName = arguments.val>
	</cffunction>

	<cffunction name="getUserLName" output="false" access="public" returntype="any">
		<cfreturn this.UserLName>
	</cffunction>

	<cffunction name="setUserLName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.UserLName = arguments.val>
	</cffunction>

	<cffunction name="getIPAddress" output="false" access="public" returntype="any">
		<cfreturn this.IPAddress>
	</cffunction>

	<cffunction name="setIPAddress" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.IPAddress = arguments.val>
	</cffunction>



</cfcomponent>