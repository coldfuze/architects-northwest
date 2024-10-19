<cfset VARIABLES.checkForVideo = "0">
<cfif IsDefined("URL.PlanId")>
	<cfif IsNumeric(URL.PLanId)>
    	<cfset VARIABLES.checkForVideo = "1">
    </cfif>
</cfif>

<cfif VARIABLES.checkForVideo EQ 1>
<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="pi">
	SELECT YouTube,
    		PlanTitle + ' - Plan Number ' + PlanNumber As PlanTitle
    FROM [Plan]
    WHERE PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#URL.PlanId#">
</cfquery>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<cfoutput query="pi"><title>#EncodeForHTML(PlanTitle)#</title></cfoutput>
	<style type="text/css">
		* {
			margin:0;
			padding:0;	
		}
	</style>
</head>

	<body>
		<iframe width="1280" height="675" src="<cfoutput>#pi.YouTube#</cfoutput>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</body>
</html>
	
</cfif>