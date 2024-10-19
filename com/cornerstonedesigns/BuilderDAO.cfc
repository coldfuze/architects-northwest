<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.Builder">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	BuilderId, Builder, Link
			from dbo.Builder
			where BuilderId = <cfqueryparam cfsqltype="CF_SQL_SMALLINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.Builder").init();
			obj.setBuilderId(qRead.BuilderId);
			obj.setBuilder(qRead.Builder);
			obj.setLink(qRead.Link);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.Builder">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getBuilder()>
		<cfset var local2=arguments.bean.getLink()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="getId">
				insert into dbo.Builder(Builder, Link)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setBuilderId(getID.IDENTITYCOL);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="update" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.Builder">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			update dbo.Builder
			set Builder = <cfqueryparam value="#arguments.bean.getBuilder()#" cfsqltype="CF_SQL_VARCHAR" />,
				Link = <cfqueryparam value="#arguments.bean.getLink()#" cfsqltype="CF_SQL_VARCHAR" />
			where BuilderId = <cfqueryparam value="#arguments.bean.getBuilderId()#" cfsqltype="CF_SQL_SMALLINT">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.Builder">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			delete
			from dbo.Builder
			where BuilderId = <cfqueryparam cfsqltype="CF_SQL_SMALLINT" value="#arguments.bean.getBuilderId()#" />
		</cfquery>
	</cffunction>
</cfcomponent>