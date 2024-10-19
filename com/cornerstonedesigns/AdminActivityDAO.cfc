<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.AdminActivity" roles="admin">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	AdminActivityId, AdminId, TransactionId, ImpactedAdminId, ActivityDate, PlanId
					
			from dbo.AdminActivity
			where AdminActivityId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.AdminActivity").init();
			obj.setAdminActivityId(qRead.AdminActivityId);
			obj.setAdminId(qRead.AdminId);
			obj.setTransactionId(qRead.TransactionId);
			obj.setImpactedAdminId(qRead.ImpactedAdminId);
			obj.setActivityDate(qRead.ActivityDate);
			obj.setPlanId(qRead.PlanId);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.AdminActivity">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getAdminId()>
		<cfset var local2=arguments.bean.getTransactionId()>
		<cfset var local3=arguments.bean.getImpactedAdminId()>
		<cfset var local4=arguments.bean.getActivityDate()>
		<cfset var local5=arguments.bean.getPlanId()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="getId">
				insert into dbo.AdminActivity(AdminId, TransactionId, ImpactedAdminId, ActivityDate, PlanId)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_TINYINT" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_TINYINT" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_TINYINT" null="#iif((local3 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setAdminActivityId(getID.IDENTITYCOL);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>
</cfcomponent>