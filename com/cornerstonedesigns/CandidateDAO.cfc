<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.peaksportsandspinept.Candidate">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	CandidateId, FName, LName, Phone, EMail, Resume, 
					JobReqId, LocationId, DateSubmitted, Comments
			from dbo.Candidate
			where CandidateId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.peaksportsandspinept.Candidate").init();
			obj.setCandidateId(qRead.CandidateId);
			obj.setFName(qRead.FName);
			obj.setLName(qRead.LName);
			obj.setPhone(qRead.Phone);
			obj.setEMail(qRead.EMail);
			obj.setResume(qRead.Resume);
			obj.setJobReqId(qRead.JobReqId);
			obj.setLocationId(qRead.LocationId);
			obj.setDateSubmitted(qRead.DateSubmitted);
			obj.setComments(qRead.Comments);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="com.peaksportsandspinept.Candidate">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getFName()>
		<cfset var local2=arguments.bean.getLName()>
		<cfset var local3=arguments.bean.getPhone()>
		<cfset var local4=arguments.bean.getEMail()>
		<cfset var local5=arguments.bean.getResume()>
		<cfset var local6=arguments.bean.getJobReqId()>
		<cfset var local7=arguments.bean.getLocationId()>
		<cfset var local8=arguments.bean.getDateSubmitted()>
		<cfset var local9=arguments.bean.getComments()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="getId">
				insert into dbo.Candidate(FName, LName, Phone, EMail, Resume, JobReqId, LocationId, Comments)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_SMALLINT" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_TINYINT" null="#iif((local7 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setCandidateId(getID.IDENTITYCOL);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="com.peaksportsandspinept.Candidate">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			update dbo.Candidate
			set FName = <cfqueryparam value="#arguments.bean.getFName()#" cfsqltype="CF_SQL_VARCHAR" />,
				LName = <cfqueryparam value="#arguments.bean.getLName()#" cfsqltype="CF_SQL_VARCHAR" />,
				Phone = <cfqueryparam value="#arguments.bean.getPhone()#" cfsqltype="CF_SQL_VARCHAR" />,
				EMail = <cfqueryparam value="#arguments.bean.getEMail()#" cfsqltype="CF_SQL_VARCHAR" />,
				Resume = <cfqueryparam value="#arguments.bean.getResume()#" cfsqltype="CF_SQL_VARCHAR" />,
				JobReqId = <cfqueryparam value="#arguments.bean.getJobReqId()#" cfsqltype="CF_SQL_SMALLINT" null="#iif((arguments.bean.getJobReqId() eq ""), de("yes"), de("no"))#" />,
				LocationId = <cfqueryparam value="#arguments.bean.getLocationId()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getLocationId() eq ""), de("yes"), de("no"))#" />,
				DateSubmitted = <cfqueryparam value="#arguments.bean.getDateSubmitted()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getDateSubmitted() eq ""), de("yes"), de("no"))#" />,
				Comments = <cfqueryparam value="#arguments.bean.getComments()#" cfsqltype="CF_SQL_VARCHAR" />
			where CandidateId = <cfqueryparam value="#arguments.bean.getCandidateId()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="delete" output="false" access="public" returntype="void" roles="admin">
		<cfargument name="bean" required="true" type="com.peaksportsandspinept.Candidate">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			delete
			from dbo.Candidate
			where CandidateId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getCandidateId()#" />
		</cfquery>
	</cffunction>
</cfcomponent>