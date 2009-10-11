<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="layout" content="main" />
        <title>Lista inwestycji</title>
    </head>
    <body>
        <div id="main">
            <div id="wrapper">
                <g:render template="/shared/menu" />

        <div class="body">
            <h1>Inwestycje
                    <g:if test="${session.user != null}">
                            <g:link class="create" action="create">(Dodaj nową inwestycję)</g:link>
                    </g:if></h1>    

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                   	        <th></th>
                   	        <th>Najnowsze zdjęcia w folderach:</th>
                   	        <th>Najnowsze wpisy do dziennika:</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${investmentInstanceList}" status="i" var="investmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${investmentInstance.id}">${fieldValue(bean:investmentInstance, field:'name')} 
(<g:formatDate format="yyyy-MM-dd" date="${investmentInstance.dateCreated}"/> - ${fieldValue(bean:investmentInstance, field:'user.nick')})</g:link></td>
                            <td><ul>
                            <g:each in="${investmentInstance.folders}" status="j" var="folderInstance">
                                <g:if test="${j < 3}">
<li><g:link controller="picture" action="list" id="${folderInstance.id}">${folderInstance.name}</g:link></li>
                                </g:if>
                            </g:each>
                            </ul>


                            <td><ul>
		                    <g:each in="${investmentInstance.newsy}" status="j" var="newsInstance">
                                <g:if test="${j < 3}">
<li><g:link controller="news" action="list" id="${investmentInstance.id}">${newsInstance.description}</g:link></li>
                                </g:if>
		                    </g:each>
                            </ul>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${investmentInstanceTotal}" />
            </div>
            <g:render template="/shared/footer" />
        </div>
    </div>
</body>
</html>
