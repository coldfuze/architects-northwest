<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.ImageType">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	ImageTypeId, ImageType
			from dbo.ImageType
			where ImageTypeId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.ImageType").init();
			obj.setImageTypeId(qRead.ImageTypeId);
			obj.setImageType(qRead.ImageType);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>