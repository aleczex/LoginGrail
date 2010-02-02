<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
        <meta name="layout" content="main" />	
		<title>Galeria: ${investmentInstance.name}</title>
	</head>
	<body>
    <div id="main">
        <div id="wrapper">
			<g:render template="/shared/menu" />
            <h1><g:link controller="investment">Inwestycja</g:link>->
				<g:link controller="investment" action="show" id="${investmentInstance.id}">${investmentInstance.name}</g:link>->Galeria
                <g:if test="${investmentOwner}">				
				    <g:link class="create" action="create" id="${investmentInstance.id}"> (Dodaj nowy folder)</g:link>
				</g:if>
			</h1>

			<div id="folder">
				<g:if test="${flash.message}">
					<div class="message">${flash.message}</div>
				</g:if>
				<g:each in="${folderInstanceList}" status="i" var="folderInstance">
                    <g:grep in="${userFolderList}" filter="folderInstance">
						<g:form method="post" >
	                        <input type="hidden" name="id" value="${folderInstance?.id}" />
	                        <input type="hidden" name="investmentid" value="${investmentInstance.id}" />
				            <input type="hidden" name="version" value="${folderInstance?.version}" />
                            <div class="buttons">
                                <span class="button"><g:actionSubmit action="edit" value="Edytuj" /></span>
				                <span class="button"><g:actionSubmit action="delete" onclick="return confirm('Jesteś pewien? Możesz usunąć tylko taki folder, w którym nie ma zdjęć');" value="Usuń" /></span>
				            </div>
                        </g:form>
					</g:grep>
					<g:link controller="picture" action="list" id="${folderInstance.id}"><h1>${fieldValue(bean:folderInstance, field:'name')}</h1></g:link>
				</g:each>
            </div>
            <g:render template="/shared/footer" />
        </div>
    </div>
</body>
</html>
