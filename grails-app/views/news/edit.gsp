

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit News</title>
    </head>
    <body>
        <div class="nav">
            <g:render template="/shared/menu" />
            <span class="menuButton"><g:link class="list" action="list">News List</g:link></span>
            <g:if test="${session.user != null}">
                <span class="menuButton"><g:link class="create" action="create">New News</g:link></span>
            </g:if>
        </div>
        <div class="body">
            <h1>Edit News</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${newsInstance}">
            <div class="errors">
                <g:renderErrors bean="${newsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${newsInstance?.id}" />
                <input type="hidden" name="version" value="${newsInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${newsInstance?.dateCreated}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:newsInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsInstance,field:'user','errors')}">
                                    <g:select optionKey="id" from="${User.list()}" name="user.id" value="${newsInstance?.user?.id}" ></g:select>
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
