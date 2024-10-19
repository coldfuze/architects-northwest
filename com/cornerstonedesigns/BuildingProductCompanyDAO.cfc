<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.BuildingProductCompany">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#">
			select 	BuildingProductCompanyId, BuildingProductTypeId, BuildingProductCompany, WebSite
			from dbo.BuildingProductCompany
			where BuildingProductCompanyId = <cfqueryparam cfsqltype="CF_SQL_SMALLINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.BuildingProductCompany").init();
			obj.setBuildingProductCompanyId(qRead.BuildingProductCompanyId);
			obj.setBuildingProductTypeId(qRead.BuildingProductTypeId);
			obj.setBuildingProductCompany(qRead.BuildingProductCompany);
			obj.setWebSite(qRead.WebSite);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.BuildingProductCompany">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getBuildingProductTypeId()>
		<cfset var local2=arguments.bean.getBuildingProductCompany()>
		<cfset var local3=arguments.bean.getWebSite()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="getId">
				insert into dbo.BuildingProductCompany(BuildingProductTypeId, BuildingProductCompany, WebSite)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_TINYINT" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setBuildingProductCompanyId(getID.IDENTITYCOL);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="update" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.BuildingProductCompany">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			update dbo.BuildingProductCompany
			set BuildingProductTypeId = <cfqueryparam value="#arguments.bean.getBuildingProductTypeId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getBuildingProductTypeId() eq ""), de("yes"), de("no"))#" />,
				BuildingProductCompany = <cfqueryparam value="#arguments.bean.getBuildingProductCompany()#" cfsqltype="CF_SQL_VARCHAR" />,
				WebSite = <cfqueryparam value="#arguments.bean.getWebSite()#" cfsqltype="CF_SQL_VARCHAR" />
			where BuildingProductCompanyId = <cfqueryparam value="#arguments.bean.getBuildingProductCompanyId()#" cfsqltype="CF_SQL_SMALLINT">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="delete" output="false" access="public" returntype="void" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.BuildingProductCompany">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			delete
			from dbo.BuildingProductCompany
			where BuildingProductCompanyId = <cfqueryparam cfsqltype="CF_SQL_SMALLINT" value="#arguments.bean.getBuildingProductCompanyId()#" />
		</cfquery>
	</cffunction>
</cfcomponent>