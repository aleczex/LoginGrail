<html>
    <head>
        <meta name="layout" content="main" />
        <title>Edycja uzytkownika</title>
    </head>
    <body>
        <div class="nav">
            <g:render template="/shared/menu" />
            <span class="menuButton"><g:link class="list" action="list">Lista uzytkownikow</g:link></span>
            <g:if test="${session.user != null}">
                <span class="menuButton"><g:link class="create" action="create">Nowy uzytkownik</g:link></span>
            </g:if>
        </div>
        <div class="body">
            <h1>Edit User</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
            <div class="errors">
                <g:renderErrors bean="${userInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${userInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nick">Nick:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'nick','errors')}">
                                    <input type="text" id="nick" name="nick" value="${fieldValue(bean:userInstance,field:'nick')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'email','errors')}">
                                    <input type="text" id="email" name="email" value="${fieldValue(bean:userInstance,field:'email')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password">Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'password','errors')}">
                                    <input type="password" id="password" name="password" value="${fieldValue(bean:userInstance,field:'password')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="newsy">Newsy:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'newsy','errors')}">
                                    
<ul>
<g:each var="n" in="${userInstance?.newsy?}">
    <li><g:link controller="news" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="news" params="['user.id':userInstance?.id]" action="create">Add News</g:link>

                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
