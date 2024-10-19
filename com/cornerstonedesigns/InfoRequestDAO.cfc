<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.InfoRequest">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	InfoRequestId, InfoRequestTypeId, FName, LName, Address, Address2, 
					City, StateId, ZipCode, Email, Phone, 
					PlanNameNumber, Comments, RequestDate, WebSite
			from dbo.InfoRequest
			where InfoRequestId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.InfoRequest").init();
			obj.setInfoRequestId(qRead.InfoRequestId);
			obj.setInfoRequestTypeId(qRead.InfoRequestTypeId);
			obj.setFName(qRead.FName);
			obj.setLName(qRead.LName);
			obj.setAddress(qRead.Address);
			obj.setAddress2(qRead.Address2);
			obj.setCity(qRead.City);
			obj.setStateId(qRead.StateId);
			obj.setZipCode(qRead.ZipCode);
			obj.setEmail(qRead.Email);
			obj.setPhone(qRead.Phone);
			obj.setPlanNameNumber(qRead.PlanNameNumber);
			obj.setComments(qRead.Comments);
			obj.setRequestDate(qRead.RequestDate);
			obj.setWebSite(qRead.WebSite);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.InfoRequest">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getInfoRequestTypeId()>
		<cfset var local2=arguments.bean.getFName()>
		<cfset var local3=arguments.bean.getLName()>
		<cfset var local4=arguments.bean.getAddress()>
		<cfset var local5=arguments.bean.getAddress2()>
		<cfset var local6=arguments.bean.getCity()>
		<cfset var local7=arguments.bean.getStateId()>
		<cfset var local8=arguments.bean.getZipCode()>
		<cfset var local9=arguments.bean.getEmail()>
		<cfset var local10=arguments.bean.getPhone()>
		<cfset var local11=arguments.bean.getPlanNameNumber()>
		<cfset var local12=arguments.bean.getComments()>
		<cfset var local13=arguments.bean.getRequestDate()>
		<cfset var local14=arguments.bean.getWebSite()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="getId">
				insert into dbo.InfoRequest(InfoRequestTypeId, FName, LName, Address, Address2, City, StateId, ZipCode, Email, Phone, PlanNameNumber, Comments, RequestDate, WebSite)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_TINYINT" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local13 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setInfoRequestId(getID.IDENTITYCOL);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.InfoRequest">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			update dbo.InfoRequest
			set InfoRequestTypeId = <cfqueryparam value="#arguments.bean.getInfoRequestTypeId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getInfoRequestTypeId() eq ""), de("yes"), de("no"))#" />,
				FName = <cfqueryparam value="#arguments.bean.getFName()#" cfsqltype="CF_SQL_VARCHAR" />,
				LName = <cfqueryparam value="#arguments.bean.getLName()#" cfsqltype="CF_SQL_VARCHAR" />,
				Address = <cfqueryparam value="#arguments.bean.getAddress()#" cfsqltype="CF_SQL_VARCHAR" />,
				Address2 = <cfqueryparam value="#arguments.bean.getAddress2()#" cfsqltype="CF_SQL_VARCHAR" />,
				City = <cfqueryparam value="#arguments.bean.getCity()#" cfsqltype="CF_SQL_VARCHAR" />,
				StateId = <cfqueryparam value="#arguments.bean.getStateId()#" cfsqltype="CF_SQL_VARCHAR" />,
				ZipCode = <cfqueryparam value="#arguments.bean.getZipCode()#" cfsqltype="CF_SQL_VARCHAR" />,
				Email = <cfqueryparam value="#arguments.bean.getEmail()#" cfsqltype="CF_SQL_VARCHAR" />,
				Phone = <cfqueryparam value="#arguments.bean.getPhone()#" cfsqltype="CF_SQL_VARCHAR" />,
				PlanNameNumber = <cfqueryparam value="#arguments.bean.getPlanNameNumber()#" cfsqltype="CF_SQL_VARCHAR" />,
				Comments = <cfqueryparam value="#arguments.bean.getComments()#" cfsqltype="CF_SQL_VARCHAR" />,
				RequestDate = <cfqueryparam value="#arguments.bean.getRequestDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getRequestDate() eq ""), de("yes"), de("no"))#" />,
				WebSite = <cfqueryparam value="#arguments.bean.getWebSite()#" cfsqltype="CF_SQL_VARCHAR" />
			where InfoRequestId = <cfqueryparam value="#arguments.bean.getInfoRequestId()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.InfoRequest">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			delete
			from dbo.InfoRequest
			where InfoRequestId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getInfoRequestId()#" />
		</cfquery>
	</cffunction>
</cfcomponent>