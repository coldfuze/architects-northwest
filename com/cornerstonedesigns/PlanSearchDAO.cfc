<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.PlanSearch">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	PlanSearchId, PageTitle, FormattedPageTitle, Link, SearchGroupingId, SortOrder, 
					SQL
			from dbo.PlanSearch
			where PlanSearchId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.PlanSearch").init();
			obj.setPlanSearchId(qRead.PlanSearchId);
			obj.setPageTitle(qRead.PageTitle);
			obj.setFormattedPageTitle(qRead.FormattedPageTitle);
			obj.setLink(qRead.Link);
			obj.setSearchGroupingId(qRead.SearchGroupingId);
			obj.setSortOrder(qRead.SortOrder);
			obj.setSQL(qRead.SQL);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.PlanSearch">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getPageTitle()>
		<cfset var local2=arguments.bean.getFormattedPageTitle()>
		<cfset var local3=arguments.bean.getLink()>
		<cfset var local4=arguments.bean.getSearchGroupingId()>
		<cfset var local5=arguments.bean.getSortOrder()>
		<cfset var local6=arguments.bean.getSQL()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="getId">
				insert into dbo.PlanSearch(PageTitle, FormattedPageTitle, Link, SearchGroupingId, SortOrder, SQL)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_TINYINT" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_TINYINT" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setPlanSearchId(getID.IDENTITYCOL);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="update" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.PlanSearch">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			update dbo.PlanSearch
			set PageTitle = <cfqueryparam value="#arguments.bean.getPageTitle()#" cfsqltype="CF_SQL_VARCHAR" />,
				FormattedPageTitle = <cfqueryparam value="#arguments.bean.getFormattedPageTitle()#" cfsqltype="CF_SQL_VARCHAR" />,
				Link = <cfqueryparam value="#arguments.bean.getLink()#" cfsqltype="CF_SQL_VARCHAR" />,
				SearchGroupingId = <cfqueryparam value="#arguments.bean.getSearchGroupingId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getSearchGroupingId() eq ""), de("yes"), de("no"))#" />,
				SortOrder = <cfqueryparam value="#arguments.bean.getSortOrder()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getSortOrder() eq ""), de("yes"), de("no"))#" />,
				SQL = <cfqueryparam value="#arguments.bean.getSQL()#" cfsqltype="CF_SQL_VARCHAR" />
			where PlanSearchId = <cfqueryparam value="#arguments.bean.getPlanSearchId()#" cfsqltype="CF_SQL_TINYINT">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="delete" output="false" access="public" returntype="void" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.PlanSearch">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			delete
			from dbo.PlanSearch
			where PlanSearchId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.bean.getPlanSearchId()#" />
		</cfquery>
	</cffunction>
</cfcomponent>