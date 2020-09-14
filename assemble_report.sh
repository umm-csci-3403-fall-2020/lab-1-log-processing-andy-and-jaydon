#!/bin/bash

header=$(cat username_dist.html)  #Create variables for to call files
body=$(cat country_dist.html)
footer=$(cat hours_dist.html)

#The failed_login_summary.html file was not loading so I compared it to the html that worked in the prelab and saw that our html was missing this.

cat > initiate.html <<- _EOF_ 

        <script type='text/javascript' src='https://www.google.com/jsapi'></script>
        <script type='text/javascript'>
        google.load('visualization', '1', {'packages':['corechart']});
_EOF_

initiate=$(cat initiate.html)

#Creates the final html file.

cat > failed_login_summary.html <<- _EOF_ 
<html>
<head>
<meta content="text/html;charset=utf-8" http-equiv="Content-Type">
<meta content="utf-8" http-equiv="encoding">
$initiate
$header
         </script>
</head>
<body>
$initiate
$body
         </script>
</body>
<foot>
$initiate
$footer
         </script>
</foot>
</html>
_EOF_

#Failed_login_summary is not working. Console keeps saying "Uncaught (in promise) Error: Container is not defined" and after a fair amount of googling, I still can't fix this.

rm initiate.html
