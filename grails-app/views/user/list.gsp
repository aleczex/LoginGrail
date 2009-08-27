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
							<td>
							<g:if test="${session.user != null}">
								<g:form method="post" >
					                <input type="hidden" name="id" value="${userInstance?.id}" />
					                <input type="hidden" name="version" value="${userInstance?.version}" />
					                <div class="buttons">
					                	<span class="button"><g:actionSubmit action="edit" value="Edytuj" /></span>
					                    <span class="button"><g:actionSubmit action="delete" onclick="return confirm('Jesteś pewien?');" value="Usuń" /></span>
					                </div>
					            </g:form>
							</g:if>
							</td>
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
