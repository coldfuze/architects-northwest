<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.PlanToGarageType">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	PlanToGarageType, PlanId, GarageTypeId
			from dbo.PlanToGarageType
			where PlanToGarageType = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.PlanToGarageType").init();
			obj.setPlanToGarageType(qRead.PlanToGarageType);
			obj.setPlanId(qRead.PlanId);
			obj.setGarageTypeId(qRead.GarageTypeId);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.PlanToGarageType">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getPlanId()>
		<cfset var local2=arguments.bean.getGarageTypeId()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="getId">
				insert into dbo.PlanToGarageType(PlanId, GarageTypeId)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_TINYINT" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setPlanToGarageType(getID.IDENTITYCOL);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="update" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.PlanToGarageType">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			update dbo.PlanToGarageType
			set PlanId = <cfqueryparam value="#arguments.bean.getPlanId()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getPlanId() eq ""), de("yes"), de("no"))#" />,
				GarageTypeId = <cfqueryparam value="#arguments.bean.getGarageTypeId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getGarageTypeId() eq ""), de("yes"), de("no"))#" />
			where PlanToGarageType = <cfqueryparam value="#arguments.bean.getPlanToGarageType()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="delete" output="false" access="public" returntype="void" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.PlanToGarageType">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			delete
			from dbo.PlanToGarageType
			where PlanToGarageType = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getPlanToGarageType()#" />
		</cfquery>
	</cffunction>
</cfcomponent>