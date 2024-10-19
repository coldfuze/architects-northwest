<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.PlanToSearchSubGrouping">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	PlanToSearchSubGroupingId, PlanId, SearchSubGroupingId
			from dbo.PlanToSearchSubGrouping
			where PlanToSearchSubGroupingId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.PlanToSearchSubGrouping").init();
			obj.setPlanToSearchSubGroupingId(qRead.PlanToSearchSubGroupingId);
			obj.setPlanId(qRead.PlanId);
			obj.setSearchSubGroupingId(qRead.SearchSubGroupingId);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.PlanToSearchSubGrouping">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getPlanId()>
		<cfset var local2=arguments.bean.getSearchSubGroupingId()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="getId">
				insert into dbo.PlanToSearchSubGrouping(PlanId, SearchSubGroupingId)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_TINYINT" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setPlanToSearchSubGroupingId(getID.IDENTITYCOL);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="update" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.PlanToSearchSubGrouping">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			update dbo.PlanToSearchSubGrouping
			set PlanId = <cfqueryparam value="#arguments.bean.getPlanId()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getPlanId() eq ""), de("yes"), de("no"))#" />,
				SearchSubGroupingId = <cfqueryparam value="#arguments.bean.getSearchSubGroupingId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getSearchSubGroupingId() eq ""), de("yes"), de("no"))#" />
			where PlanToSearchSubGroupingId = <cfqueryparam value="#arguments.bean.getPlanToSearchSubGroupingId()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="delete" output="false" access="public" returntype="void" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.PlanToSearchSubGrouping">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			delete
			from dbo.PlanToSearchSubGrouping
			where PlanToSearchSubGroupingId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getPlanToSearchSubGroupingId()#" />
		</cfquery>
	</cffunction>
</cfcomponent>