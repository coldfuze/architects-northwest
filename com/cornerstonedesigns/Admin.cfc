<cfcomponent output="false" alias="com.cornerstonedesigns.Admin">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="AdminId" type="numeric" default="0">
	<cfproperty name="FName" type="string" default="">
	<cfproperty name="LName" type="string" default="">
	<cfproperty name="EMail" type="string" default="">
	<cfproperty name="Login" type="string" default="">
	<cfproperty name="Password" type="string" default="">
	<cfproperty name="LastLogin" type="date" default="">
	<cfproperty name="Active" type="numeric" default="0">
	<cfproperty name="PermissionLevelId" type="numeric" default="0">
	<cfproperty name="Role" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.AdminId = 0;
		this.FName = "";
		this.LName = "";
		this.EMail = "";
		this.Login = "";
		this.Password = "";
		this.LastLogin = "";
		this.Active = 0;
		this.PermissionLevelId = 0;
		this.Role = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Admin">
		<cfreturn this>
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

	<cffunction name="getFName" output="false" access="public" returntype="any">
		<cfreturn this.FName>
	</cffunction>

	<cffunction name="setFName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.FName = arguments.val>
	</cffunction>

	<cffunction name="getLName" output="false" access="public" returntype="any">
		<cfreturn this.LName>
	</cffunction>

	<cffunction name="setLName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.LName = arguments.val>
	</cffunction>

	<cffunction name="getEMail" output="false" access="public" returntype="any">
		<cfreturn this.EMail>
	</cffunction>

	<cffunction name="setEMail" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.EMail = arguments.val>
	</cffunction>

	<cffunction name="getLogin" output="false" access="public" returntype="any">
		<cfreturn this.Login>
	</cffunction>

	<cffunction name="setLogin" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Login = arguments.val>
	</cffunction>

	<cffunction name="getPassword" output="false" access="public" returntype="any">
		<cfreturn this.Password>
	</cffunction>

	<cffunction name="setPassword" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Password = arguments.val>
	</cffunction>

	<cffunction name="getLastLogin" output="false" access="public" returntype="any">
		<cfreturn this.LastLogin>
	</cffunction>

	<cffunction name="setLastLogin" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.LastLogin = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getActive" output="false" access="public" returntype="any">
		<cfreturn this.Active>
	</cffunction>

	<cffunction name="setActive" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.Active = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPermissionLevelId" output="false" access="public" returntype="any">
		<cfreturn this.PermissionLevelId>
	</cffunction>

	<cffunction name="setPermissionLevelId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.PermissionLevelId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRole" output="false" access="public" returntype="any">
		<cfreturn this.Role>
	</cffunction>

	<cffunction name="setRole" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Role = arguments.val>
	</cffunction>



</cfcomponent>