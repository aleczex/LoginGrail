<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${resource(dir:'freecss',file:'style.css')}" />
    </head>
    <body>
        <div id="shortnews">
		<g:each in="${newsInstanceList}" var="newsInstance">
		    ${fieldValue(bean:newsInstance, field:'dateCreated')}
		    <p><h4>${fieldValue(bean:newsInstance, field:'description')}</h4></p>
	    </g:each>
        </div>
    </body>
</html>
