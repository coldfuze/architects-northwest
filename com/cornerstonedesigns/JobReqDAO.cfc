<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.JobReq">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	JobReqId, Title, JobReqOpen, DateOpened, DateClosed, Description, 
					Requirements, LocationId
			from dbo.JobReq
			where JobReqId = <cfqueryparam cfsqltype="CF_SQL_SMALLINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.JobReq").init();
			obj.setJobReqId(qRead.JobReqId);
			obj.setTitle(qRead.Title);
			obj.setJobReqOpen(qRead.JobReqOpen);
			obj.setDateOpened(qRead.DateOpened);
			obj.setDateClosed(qRead.DateClosed);
			obj.setDescription(qRead.Description);
			obj.setRequirements(qRead.Requirements);
			obj.setLocationId(qRead.LocationId);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.JobReq">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getTitle()>
		<cfset var local2=arguments.bean.getJobReqOpen()>
		<cfset var local3=arguments.bean.getDateOpened()>
		<cfset var local4=arguments.bean.getDateClosed()>
		<cfset var local5=arguments.bean.getDescription()>
		<cfset var local6=arguments.bean.getRequirements()>
		<cfset var local7=arguments.bean.getLocationId()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="getId">
				insert into dbo.JobReq(Title, JobReqOpen, DateOpened, DateClosed, Description, Requirements, LocationId)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_BIT" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local3 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_TINYINT" null="#iif((local7 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setJobReqId(getID.IDENTITYCOL);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="update" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.JobReq">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			update dbo.JobReq
			set Title = <cfqueryparam value="#arguments.bean.getTitle()#" cfsqltype="CF_SQL_VARCHAR" />,
				JobReqOpen = <cfqueryparam value="#arguments.bean.getJobReqOpen()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getJobReqOpen() eq ""), de("yes"), de("no"))#" />,
				DateOpened = <cfqueryparam value="#arguments.bean.getDateOpened()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getDateOpened() eq ""), de("yes"), de("no"))#" />,
				DateClosed = <cfqueryparam value="#arguments.bean.getDateClosed()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getDateClosed() eq ""), de("yes"), de("no"))#" />,
				Description = <cfqueryparam value="#arguments.bean.getDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				Requirements = <cfqueryparam value="#arguments.bean.getRequirements()#" cfsqltype="CF_SQL_VARCHAR" />,
				LocationId = <cfqueryparam value="#arguments.bean.getLocationId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getLocationId() eq ""), de("yes"), de("no"))#" />
			where JobReqId = <cfqueryparam value="#arguments.bean.getJobReqId()#" cfsqltype="CF_SQL_SMALLINT">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="delete" output="false" access="public" returntype="void" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.JobReq">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			delete
			from dbo.JobReq
			where JobReqId = <cfqueryparam cfsqltype="CF_SQL_SMALLINT" value="#arguments.bean.getJobReqId()#" />
		</cfquery>
	</cffunction>
</cfcomponent>