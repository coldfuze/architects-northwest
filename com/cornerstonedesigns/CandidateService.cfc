<cfcomponent extends="CandidateGateway">
	<cffunction name="getCandidatePicklist" access="public" returntype="query" roles="admin" hint="This method returns an employment candidate picklist">
    	<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	a.CandidateId,
            		a.LName + ', ' + a.FName + ' - Job Req Id:' + CAST(b.JobReqId AS varchar(6)) + ' - ' + b.Title AS Candidate
            FROM 	Candidate a
            		INNER JOIN JobReq b ON a.JobReqId = b.JobReqId
            ORDER BY a.LName, a.FName
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="getCandidateInformation" access="public" returntype="query" roles="admin" hint="This method returns detailed prospective employment candidate information">
    	<cfargument name="CandidateId" type="numeric" required="yes" hint="This argument expects a numeric CandidateId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	a.FName + ' ' + a.LName As CandidateName,
            		a.Phone,
                    a.EMail,
                    a.Resume,
                    a.DateSubmitted,
                    a.Comments,
            		'Job Req Id: ' + CAST(b.JobReqId AS varchar(6)) + ' - ' + b.Title + ' - ' + c.LocationSName AS PositionApplied
            FROM 	Candidate a
            		INNER JOIN JobReq b ON a.JobReqId = b.JobReqId
                    INNER JOIN Location c ON a.LocationId = c.LocationId
            WHERE CandidateId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.CandidateId#">
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
</cfcomponent>