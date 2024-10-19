<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.Customer">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	CustomerId, FName, LName, EMail, Login, Password, 
					AccountCreated, LastLogin, Role, SavedPlans
			from dbo.Customer
			where CustomerId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.Customer").init();
			obj.setCustomerId(qRead.CustomerId);
			obj.setFName(qRead.FName);
			obj.setLName(qRead.LName);
			obj.setEMail(qRead.EMail);
			obj.setLogin(qRead.Login);
			obj.setPassword(qRead.Password);
			obj.setAccountCreated(qRead.AccountCreated);
			obj.setLastLogin(qRead.LastLogin);
			obj.setRole(qRead.Role);
			obj.setSavedPlans(qRead.SavedPlans);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.Customer">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getFName()>
		<cfset var local2=arguments.bean.getLName()>
		<cfset var local3=arguments.bean.getEMail()>
		<cfset var local4=arguments.bean.getLogin()>
		<cfset var local5=arguments.bean.getPassword()>
		<cfset var local6=arguments.bean.getAccountCreated()>
		<cfset var local7=arguments.bean.getLastLogin()>
		<cfset var local8=arguments.bean.getRole()>
		<cfset var local9=arguments.bean.getSavedPlans()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="getId">
				insert into dbo.Customer(FName, LName, EMail, Login, Password, AccountCreated, LastLogin, Role, SavedPlans)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local7 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setCustomerId(getID.IDENTITYCOL);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="update" output="false" access="public" roles="general,admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.Customer">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			update dbo.Customer
			set FName = <cfqueryparam value="#arguments.bean.getFName()#" cfsqltype="CF_SQL_VARCHAR" />,
				LName = <cfqueryparam value="#arguments.bean.getLName()#" cfsqltype="CF_SQL_VARCHAR" />,
				EMail = <cfqueryparam value="#arguments.bean.getEMail()#" cfsqltype="CF_SQL_VARCHAR" />,
				Password = <cfqueryparam value="#arguments.bean.getPassword()#" cfsqltype="CF_SQL_VARCHAR" />
			where CustomerId = <cfqueryparam value="#arguments.bean.getCustomerId()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="delete" output="false" access="public" returntype="void" roles="general,admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.Customer">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			delete
			from dbo.Customer
			where CustomerId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getCustomerId()#" />
		</cfquery>
	</cffunction>
</cfcomponent>