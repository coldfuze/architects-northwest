<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>File Upload Test with CFFileUpload</title>
</head>

<cfscript>
	writeOutput(ExpandPath('/assets/tempPhotos'));
</cfscript>
<body>
	 <cf_dcCom debug="true" themeColor="blue" uploadFile="#Application.ProFlashUploadPath#" component="ProFlashUpload" width="800" folder="D:\home\architectsnw.com\wwwroot\assets\tempphotos" fileListVariable="PlanImages" nameConflict="MakeUnique"></cf_dcCom>
</body>
</html>
