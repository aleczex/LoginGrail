<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Foldery</title>
		<link rel="stylesheet" type="text/css" href="../freecss/style.css"/>
	</head>
	<body>
    <div id="main">
        <div id="wrapper">
			<g:render template="/shared/menu" />
			<g:if test="${session.user != null}">
				<li><g:link class="create" action="create">Nowy folder</g:link></li>
			</g:if>
            <g:render template="/shared/menuend" />
			<div id="folder">
				<g:if test="${flash.message}">
					<div class="message">${flash.message}</div>
				</g:if>
        
				<g:each in="${folderInstanceList}" status="i" var="folderInstance">
					<g:if test="${session.user != null}">
						<g:link action="show" id="${folderInstance.id}">Edytuj</g:link>
					</g:if>
					<g:link controller="picture" action="list" id="${folderInstance.id}"><h1>${fieldValue(bean:folderInstance, field:'name')}</h1></g:link>
				</g:each>
			</div>
			<div class="clear"/>
			<div id="footer"><a href="http://www.freecss.info">Free CSS Templates </a></div>
        </div>
	</body>
</html>
