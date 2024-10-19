<cfscript>
	VARIABLES.pageTitle = "Kitty";
</cfscript>

<cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
    <div id="youTubePageContainer">
    	<div id="youTubeContentContainer">         
        	<iframe width="600" height="358" src="//www.youtube.com/embed/TNIwNKE55j0" frameborder="0" allowfullscreen></iframe>
        </div>
    </div>
</cfmodule>