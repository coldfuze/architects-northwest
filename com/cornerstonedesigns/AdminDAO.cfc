<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.Admin" roles="admin">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	AdminId, FName, LName, EMail, Login, Password, 
					LastLogin, Active, PermissionLevelId, Role
			from dbo.Admin
			where AdminId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.Admin").init();
			obj.setAdminId(qRead.AdminId);
			obj.setFName(qRead.FName);
			obj.setLName(qRead.LName);
			obj.setEMail(qRead.EMail);
			obj.setLogin(qRead.Login);
			obj.setPassword(qRead.Password);
			obj.setLastLogin(qRead.LastLogin);
			obj.setActive(qRead.Active);
			obj.setPermissionLevelId(qRead.PermissionLevelId);
			obj.setRole(qRead.Role);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.Admin">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getFName()>
		<cfset var local2=arguments.bean.getLName()>
		<cfset var local3=arguments.bean.getEMail()>
		<cfset var local4=arguments.bean.getLogin()>
		<cfset var local5=arguments.bean.getPassword()>
		<cfset var local6=arguments.bean.getLastLogin()>
		<cfset var local7=arguments.bean.getActive()>
		<cfset var local8=arguments.bean.getPermissionLevelId()>
		<cfset var local9=arguments.bean.getRole()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="getId">
				insert into dbo.Admin(FName, LName, EMail, Login, Password, Active, PermissionLevelId, Role)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_BIT" null="#iif((local7 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_TINYINT" null="#iif((local8 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setAdminId(getID.IDENTITYCOL);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="update" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.Admin">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			update dbo.Admin
			set FName = <cfqueryparam value="#arguments.bean.getFName()#" cfsqltype="CF_SQL_VARCHAR" />,
				LName = <cfqueryparam value="#arguments.bean.getLName()#" cfsqltype="CF_SQL_VARCHAR" />,
				EMail = <cfqueryparam value="#arguments.bean.getEMail()#" cfsqltype="CF_SQL_VARCHAR" />,
				Login = <cfqueryparam value="#arguments.bean.getLogin()#" cfsqltype="CF_SQL_VARCHAR" />,
				Password = <cfqueryparam value="#arguments.bean.getPassword()#" cfsqltype="CF_SQL_VARCHAR" />,
				Active = <cfqueryparam value="#arguments.bean.getActive()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getActive() eq ""), de("yes"), de("no"))#" />,
				PermissionLevelId = <cfqueryparam value="#arguments.bean.getPermissionLevelId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getPermissionLevelId() eq ""), de("yes"), de("no"))#" />,
				Role = <cfqueryparam value="#arguments.bean.getRole()#" cfsqltype="CF_SQL_VARCHAR" />
			where AdminId = <cfqueryparam value="#arguments.bean.getAdminId()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>
</cfcomponent>