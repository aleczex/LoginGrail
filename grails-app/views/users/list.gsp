<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="layout" content="main" />
        <title>Lista użytkowników</title>         
    </head>
    <body>
    <div id="main">
        <div id="wrapper">
            <g:render template="/shared/menu" />
        <div class="body">
            <h1>Users List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="username" title="Username" />
                        
                   	        <g:sortableColumn property="email" title="Email" />
                        
                   	        <g:sortableColumn property="dateCreated" title="Date Created" />
                        
                   	        <th>Investments</th>
                   	    
                   	        <g:sortableColumn property="passwordHash" title="Password Hash" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${usersInstanceList}" status="i" var="usersInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${usersInstance.id}">${fieldValue(bean:usersInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:usersInstance, field:'username')}</td>
                        
                            <td>${fieldValue(bean:usersInstance, field:'email')}</td>
                        
                            <td>${fieldValue(bean:usersInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:usersInstance, field:'investments')}</td>
                        
                            <td>${fieldValue(bean:usersInstance, field:'passwordHash')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${usersInstanceTotal}" />
            </div>
            <g:render template="/shared/footer" />
        </div>
    </body>
</html>
