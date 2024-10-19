<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.Transaction" roles="admin">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	TransactionId, TransactionTitle
			from dbo.Transaction
			where TransactionId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.Transaction").init();
			obj.setTransactionId(qRead.TransactionId);
			obj.setTransactionTitle(qRead.TransactionTitle);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>