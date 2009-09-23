<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="layout" content="main" />
        <title>Lista news�w</title>
    </head>
    <body>
        <div id="main">
            <div id="wrapper">
                <g:render template="/shared/menu" />

        <div class="body">
            <h1>Inwestycje
                    <g:if test="${session.user != null}">
                            <g:link class="create" action="create">(Nowa inwestycja)</g:link>
                    </g:if></h1>    

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                   	        <g:sortableColumn property="name" title="Nazwa inwestycji" />
                   	        <g:sortableColumn property="dateCreated" title="Data utworzenia" />
                   	        <th>Galeria</th>
                   	        <th>Nowosci</th>
                   	        <th>Uzytkownik</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${investmentInstanceList}" status="i" var="investmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${investmentInstance.id}">${fieldValue(bean:investmentInstance, field:'name')}</g:link></td>
                            <td>${fieldValue(bean:investmentInstance, field:'dateCreated')}</td>
                            <td>${fieldValue(bean:investmentInstance, field:'folders')}</td>
                            <td>${fieldValue(bean:investmentInstance, field:'newsy')}</td>
                            <td>${fieldValue(bean:investmentInstance, field:'user.nick')}</td>
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
