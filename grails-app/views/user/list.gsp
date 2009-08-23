<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="layout" content="main" />
        <title>Lista uzytkownikow</title>
    </head>
    <body>
    <div id="main">
        <div id="wrapper">
            <g:render template="/shared/menu" />
            <g:if test="${session.user != null}">
	            <g:if test="${params.controller == 'user' && params.action == 'list'}">
	                <li id="current"><g:link class="create" action="create">Nowy uzytkownik</g:link></li>
	            </g:if>
	            <g:else>
	                <li><g:link class="create" action="create">Nowy uzytkownik</g:link></li>
	            </g:else>
            </g:if>

            <g:render template="/shared/menuend" />
        <div class="body">
            <h1>User List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                   	        <g:sortableColumn property="id" title="Id" />
                   	        <g:sortableColumn property="nick" title="Nick" />
                   	        <g:sortableColumn property="email" title="Email" />
                   	        <g:sortableColumn property="password" title="Password" />
                   	        <th>Newsy</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userInstanceList}" status="i" var="userInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean:userInstance, field:'id')}</g:link></td>
                            <td>${fieldValue(bean:userInstance, field:'nick')}</td>
                            <td>${fieldValue(bean:userInstance, field:'email')}</td>
                            <td>${fieldValue(bean:userInstance, field:'password')}</td>
                            <td>${fieldValue(bean:userInstance, field:'newsy')}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${userInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
