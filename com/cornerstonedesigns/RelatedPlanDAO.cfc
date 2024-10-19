<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.RelatedPlan">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	PlanToRelatedPlanId, PlanId, RelatedPlanId
			from dbo.RelatedPlan
			where PlanToRelatedPlanId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.RelatedPlan").init();
			obj.setPlanToRelatedPlanId(qRead.PlanToRelatedPlanId);
			obj.setPlanId(qRead.PlanId);
			obj.setRelatedPlanId(qRead.RelatedPlanId);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.RelatedPlan">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getPlanId()>
		<cfset var local2=arguments.bean.getRelatedPlanId()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="getId">
				insert into dbo.RelatedPlan(PlanId, RelatedPlanId)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setPlanToRelatedPlanId(getID.IDENTITYCOL);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="update" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.RelatedPlan">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			update dbo.RelatedPlan
			set PlanId = <cfqueryparam value="#arguments.bean.getPlanId()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getPlanId() eq ""), de("yes"), de("no"))#" />,
				RelatedPlanId = <cfqueryparam value="#arguments.bean.getRelatedPlanId()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getRelatedPlanId() eq ""), de("yes"), de("no"))#" />
			where PlanToRelatedPlanId = <cfqueryparam value="#arguments.bean.getPlanToRelatedPlanId()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="delete" output="false" access="public" returntype="void" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.RelatedPlan">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			delete
			from dbo.RelatedPlan
			where PlanToRelatedPlanId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getPlanToRelatedPlanId()#" />
		</cfquery>
	</cffunction>
</cfcomponent>