<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.ProfessionalAssociation">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	ProfessionalAssociationId, ProfessionalAssociationTypeId, ProfessionalAssociation, WebSite
			from dbo.ProfessionalAssociation
			where ProfessionalAssociationId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.ProfessionalAssociation").init();
			obj.setProfessionalAssociationId(qRead.ProfessionalAssociationId);
			obj.setProfessionalAssociationTypeId(qRead.ProfessionalAssociationTypeId);
			obj.setProfessionalAssociation(qRead.ProfessionalAssociation);
			obj.setWebSite(qRead.WebSite);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.ProfessionalAssociation">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getProfessionalAssociationTypeId()>
		<cfset var local2=arguments.bean.getProfessionalAssociation()>
		<cfset var local3=arguments.bean.getWebSite()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="getId">
				insert into dbo.ProfessionalAssociation(ProfessionalAssociationTypeId, ProfessionalAssociation, WebSite)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_TINYINT" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setProfessionalAssociationId(getID.IDENTITYCOL);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="update" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.ProfessionalAssociation">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			update dbo.ProfessionalAssociation
			set ProfessionalAssociationTypeId = <cfqueryparam value="#arguments.bean.getProfessionalAssociationTypeId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getProfessionalAssociationTypeId() eq ""), de("yes"), de("no"))#" />,
				ProfessionalAssociation = <cfqueryparam value="#arguments.bean.getProfessionalAssociation()#" cfsqltype="CF_SQL_VARCHAR" />,
				WebSite = <cfqueryparam value="#arguments.bean.getWebSite()#" cfsqltype="CF_SQL_VARCHAR" />
			where ProfessionalAssociationId = <cfqueryparam value="#arguments.bean.getProfessionalAssociationId()#" cfsqltype="CF_SQL_TINYINT">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="delete" output="false" access="public" returntype="void" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.ProfessionalAssociation">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			delete
			from dbo.ProfessionalAssociation
			where ProfessionalAssociationId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.bean.getProfessionalAssociationId()#" />
		</cfquery>
	</cffunction>
</cfcomponent>