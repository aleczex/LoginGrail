

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Users</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Users List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Users</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Users</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${usersInstance}">
            <div class="errors">
                <g:renderErrors bean="${usersInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${usersInstance?.id}" />
                <input type="hidden" name="version" value="${usersInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username">Username:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'username','errors')}">
                                    <input type="text" id="username" name="username" value="${fieldValue(bean:usersInstance,field:'username')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'email','errors')}">
                                    <input type="text" id="email" name="email" value="${fieldValue(bean:usersInstance,field:'email')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${usersInstance?.dateCreated}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="investments">Investments:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'investments','errors')}">
                                    
<ul>
<g:each var="i" in="${usersInstance?.investments?}">
    <li><g:link controller="investment" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="investment" params="['users.id':usersInstance?.id]" action="create">Add Investment</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="passwordHash">Password Hash:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'passwordHash','errors')}">
                                    <input type="text" id="passwordHash" name="passwordHash" value="${fieldValue(bean:usersInstance,field:'passwordHash')}"/>
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
