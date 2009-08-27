<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
        <meta name="layout" content="main" />	
		<title>Foldery</title>
	</head>
	<body>
    <div id="main">
        <div id="wrapper">
			<g:render template="/shared/menu" />
			<div id="folder">
				<g:if test="${flash.message}">
					<div class="message">${flash.message}</div>
				</g:if>
				<g:each in="${folderInstanceList}" status="i" var="folderInstance">
					<g:if test="${session.user != null}">
						<g:form method="post" >
			                <input type="hidden" name="id" value="${folderInstance?.id}" />
			                <input type="hidden" name="version" value="${folderInstance?.version}" />
			                <div class="buttons">
			                	<span class="button"><g:actionSubmit action="edit" value="Edytuj" /></span>
			                    <span class="button"><g:actionSubmit action="delete" onclick="return confirm('Jesteś pewien?');" value="Usuń" /></span>
			                </div>
			            </g:form>
					</g:if>
					<g:link controller="picture" action="list" id="${folderInstance.id}"><h1>${fieldValue(bean:folderInstance, field:'name')}</h1></g:link>
				</g:each>
			</div>
			<div class="clear"/>
			<div id="footer"><a href="http://www.freecss.info">Free CSS Templates </a></div>
        </div>
	</body>
</html>
