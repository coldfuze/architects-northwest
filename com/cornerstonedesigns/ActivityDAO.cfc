<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.peaksportsandspinept.Activity" roles="general,admin">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	ActivityId, Activity
			from dbo.Activity
			where ActivityId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.peaksportsandspinept.Activity").init();
			obj.setActivityId(qRead.ActivityId);
			obj.setActivity(qRead.Activity);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.peaksportsandspinept.Activity">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getActivity()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="getId">
				insert into dbo.Activity(Activity)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setActivityId(getId.IDENTITYCOL);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="update" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.peaksportsandspinept.Activity">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			update dbo.Activity
			set Activity = <cfqueryparam value="#arguments.bean.getActivity()#" cfsqltype="CF_SQL_VARCHAR" />
			where ActivityId = <cfqueryparam value="#arguments.bean.getActivityId()#" cfsqltype="CF_SQL_TINYINT">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="delete" output="false" access="public" returntype="void" roles="admin">
		<cfargument name="bean" required="true" type="com.peaksportsandspinept.Activity">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			delete
			from dbo.Activity
			where ActivityId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.bean.getActivityId()#" />
		</cfquery>

	</cffunction>
</cfcomponent>