<cfif IsDefined("Form.thisFile")>
	<cffile action="upload" filefield="thisFile" destination="#ExpandPath('/assets/tempPhotos')#" nameconflict="overwrite">
</cfif>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Upload File Test</title>
</head>

<body>
<form action="fileTest.cfm" enctype="multipart/form-data" name="fileUpload" method="post">
	<input type="file" name="thisFile">
    <input type="submit" value="Go!">
</form>
</body>
</html>
