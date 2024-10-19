<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.History" roles="admin">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	HistoryId, AdminId, TransactionId, TransactionDate, ccFName, ccLName, 
					ccLast4, UserFName, UserLName, IPAddress
			from dbo.History
			where HistoryId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.History").init();
			obj.setHistoryId(qRead.HistoryId);
			obj.setAdminId(qRead.AdminId);
			obj.setTransactionId(qRead.TransactionId);
			obj.setTransactionDate(qRead.TransactionDate);
			obj.setccFName(qRead.ccFName);
			obj.setccLName(qRead.ccLName);
			obj.setccLast4(qRead.ccLast4);
			obj.setUserFName(qRead.UserFName);
			obj.setUserLName(qRead.UserLName);
			obj.setIPAddress(qRead.IPAddress);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.History">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getAdminId()>
		<cfset var local2=arguments.bean.getTransactionId()>
		<cfset var local3=arguments.bean.getTransactionDate()>
		<cfset var local4=arguments.bean.getccFName()>
		<cfset var local5=arguments.bean.getccLName()>
		<cfset var local6=arguments.bean.getccLast4()>
		<cfset var local7=arguments.bean.getUserFName()>
		<cfset var local8=arguments.bean.getUserLName()>
		<cfset var local9=arguments.bean.getIPAddress()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="getId">
				insert into dbo.History(AdminId, TransactionId, TransactionDate, ccFName, ccLName, ccLast4, UserFName, UserLName, IPAddress)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local3 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setHistoryId(getID.IDENTITYCOL);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="update" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.History">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			update dbo.History
			set AdminId = <cfqueryparam value="#arguments.bean.getAdminId()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getAdminId() eq ""), de("yes"), de("no"))#" />,
				TransactionId = <cfqueryparam value="#arguments.bean.getTransactionId()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getTransactionId() eq ""), de("yes"), de("no"))#" />,
				TransactionDate = <cfqueryparam value="#arguments.bean.getTransactionDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getTransactionDate() eq ""), de("yes"), de("no"))#" />,
				ccFName = <cfqueryparam value="#arguments.bean.getccFName()#" cfsqltype="CF_SQL_VARCHAR" />,
				ccLName = <cfqueryparam value="#arguments.bean.getccLName()#" cfsqltype="CF_SQL_VARCHAR" />,
				ccLast4 = <cfqueryparam value="#arguments.bean.getccLast4()#" cfsqltype="CF_SQL_VARCHAR" />,
				UserFName = <cfqueryparam value="#arguments.bean.getUserFName()#" cfsqltype="CF_SQL_VARCHAR" />,
				UserLName = <cfqueryparam value="#arguments.bean.getUserLName()#" cfsqltype="CF_SQL_VARCHAR" />,
				IPAddress = <cfqueryparam value="#arguments.bean.getIPAddress()#" cfsqltype="CF_SQL_VARCHAR" />
			where HistoryId = <cfqueryparam value="#arguments.bean.getHistoryId()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="delete" output="false" access="public" returntype="void" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.History">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			delete
			from dbo.History
			where HistoryId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getHistoryId()#" />
		</cfquery>

	</cffunction>
</cfcomponent>