<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="../freecss/style.css" />
    </head>
    <body class="dd">
        <div id="shortnews">
            <g:each in="${newsInstanceList}" var="newsInstance">
                <p><h4>${fieldValue(bean:newsInstance, field:'description')}</h4>
                	Dodano dnia: ${fieldValue(bean:newsInstance, field:'dateCreated')}
                    [${fieldValue(bean:newsInstance, field:'user.nick')}]<br/>
                    </p>
            </g:each>
		</div>
    </body>
</html>
