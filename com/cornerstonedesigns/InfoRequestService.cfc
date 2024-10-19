<cfcomponent extends="InfoRequestGateway">
	<cffunction name="getInfoRequestPicklist" returntype="query" access="public" roles="admin" hint="This method returns a query for use with an Information Request Picklist">
    	<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	b.InfoRequestTypeSubject + ' from ' + LTRIM(RTRIM(a.FName)) + ' ' + LTRIM(RTRIM(a.LName)) + ' submitted on ' + CONVERT(varchar(30), a.RequestDate, 101) AS InfoRequest,
            		a.InfoRequestId
            FROM	InfoRequest a
            		INNER JOIN InfoRequestType b ON a.InfoRequestTypeId = b.InfoRequestTypeId
            ORDER BY a.InfoRequestId DESC
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
</cfcomponent>