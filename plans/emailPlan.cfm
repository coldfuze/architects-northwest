<cfscript>
	VARIABLES.PlanId = Session.PlanId;

	if (isDefined("Form.RecipientEMail")) {		
		if (IsValid('email',Form.RecipientEMail) AND IsNumeric(VARIABLES.PlanId)) {
			VARIABLES.sm = StructNew();
			VARIABLES.sm.PlanId = VARIABLES.PlanId;
			VARIABLES.sm.fromName= Form.FromName;
			VARIABLES.sm.RecipientEMail = Form.RecipientEMail;
			VARIABLES.sm.RecipientName = Form.RecipientName;
			VARIABLES.sm.Comments = Form.Comments;
			if (CGI.HTTP_HOST CONTAINS "cornerstone") {
				VARIABLES.sm.Site = "cornerstone";	
			}
			else {
				VARIABLES.sm.Site = "anw";
			}
			VARIABLES.SendMail = Application.MailService.emailPlanInformation(VARIABLES.sm);
		}
	}

	if (IsNumeric(VARIABLES.PlanId)) {
		VARIABLES.PlanLabel = Application.PlanService.getPlanTitleWithTitleFirst(VARIABLES.PlanId);
	}
	else {
		VARIABLES.PlanLabel = "Unknown Plan";
		VARIABLES.UnknownPlan = 1;
	}
	if (CGI.HTTP_HOST CONTAINS "cornerstone") {
		VARIABLES.BannerImage = Application.BasePath & '/assets/mailImages/CornerStoneDesignsMailBanner.jpg';
		VARIABLES.company = "CornerStone Designs";
	}
	else {
		VARIABLES.BannerImage = Application.BasePath & '/assets/mailImages/ArchitectsNorthwestMailBanner.jpg';
		VARIABLES.company = "Architects Northwest";
	}
	VARIABLES.Title = 'E-mail ' & VARIABLES.PlanLabel;
</cfscript>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<cfoutput><title>#VARIABLES.Title#</title></cfoutput>
<style type="text/css">
	BODY {
		margin:0;
		padding:0;
		font-family:arial,"Century Gothic","Trebuchet MS",verdana,sans-serif;
		font-size:14px;
		color:black;
	}
	.greenTitleBar {
		position:relative;
		width:560px;
		height:30px;
		padding-top:14px;
		background-image:URL(/assets/images/titleGreenBar.jpg);
		text-align:center;
		color:white;
		font-weight:bold;
		margin-bottom:10px;
	}
	.successMessage {
		width:500px;
		background-color:#C8E4C5;
		color:black;
		font-size:12px;
		margin-top:15px;
		padding:5px;
		border:thin dashed black;
		margin-bottom:10px;
	}
	.clearFloat {
		clear:both;
		margin-bottom:10px;
	}
	div.title {
		float:left;
		width:125px;
		font-weight:bold;
		margin:0 0 10px; 0;
		vertical-align:middle;
	}
	div.formField {
		float:left;
		width:320px;
		font-weight:bold;
		vertical-align:middle;
		margin:0 0 10px; 0;
	}
	div.container {
		margin:20px;	
	}
</style>
</head>

<body>
	<cfoutput><img src="#VARIABLES.BannerImage#" alt="#VARIABLES.company#" /></cfoutput>
    <div class="container">
        <div class="greenTitleBar">
            E-mail Plan To A Friend
        </div>
        <div style="margin-bottom:20px;">
            E-mail plan <cfoutput><strong>#VARIABLES.PlanLabel#</strong></cfoutput> by completing the information in the form below, then select the <strong>E-mail Plan</strong> button.
        </div>
        
        <cfif IsDefined("VARIABLES.sm")>
            <div class="successMessage">
                Plan successfully sent to <cfoutput>#Form.RecipientName#</cfoutput>
            </div>
        </cfif>
        <cfform method="post" action="#CGI.SCRIPT_NAME#" name="emailForm">
            <div class="title">
                Your Name:
            </div>
            <div class="formField">
                <cfinput type="text" name="FromName" maxlength="30" size="20" required="yes" message="Please enter your name" validate="regular_expression" pattern="^[a-zA-Z\s']+$" style="width:300px">
            </div>
            <div class="clearFloat"></div>
            <div class="title">
                Friend's Name:
            </div>
            <div style="float:left;width:400px;font-weight:bold;">
                <cfinput type="text" name="RecipientName" maxlength="30" size="20" required="yes" message="Please enter the recipient's Name" validate="regular_expression" pattern="^[a-zA-Z\s']+$" style="width:300px">
            </div>
            <div class="clearFloat"></div>
            <div class="title">
                Friend's E-mail:
            </div>
            <div style="float:left;width:400px;font-weight:bold;">
                <cfinput type="text" name="RecipientEMail" maxlength="30" size="20" required="yes" message="Please enter the recipient's e-mail address" validate="email" style="width:300px">
            </div>
            <div class="clearFloat"></div>
            <div class="title">
                Comments:
            </div>
            <div style="float:left;width:400px;font-weight:bold;">
                <cftextarea wrap="virtual" name="Comments" rows=3 cols=30 style="width:300px"></cftextarea>
            </div>
            <div class="clearFloat"></div>
            <div class="title">&nbsp;</div>
            <div style="float:left;width:400px;font-weight:bold;margin-top:10px;">
                <cfinput type="submit" name="submit" value="E-mail Plan" style="width:300px;">
            </div>
            <div class="clearFloat"></div>
        </cfform>
    </div>
</body>
</html>