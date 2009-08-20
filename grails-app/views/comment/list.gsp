

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Comment List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Comment</g:link></span>
        </div>
        <div class="body">
            <h1>Comment List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="dateCreated" title="Date Created" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <th>Picture</th>
                   	    
                   	        <th>User</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${commentInstanceList}" status="i" var="commentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${commentInstance.id}">${fieldValue(bean:commentInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:commentInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:commentInstance, field:'description')}</td>
                        
                            <td>${fieldValue(bean:commentInstance, field:'picture')}</td>
                        
                            <td>${fieldValue(bean:commentInstance, field:'user')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${commentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
