

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Picture</title>
    </head>
    <body>
        <div class="nav">
            <g:render template="/shared/menu" />
            <span class="menuButton"><g:link class="list" action="list">Picture List</g:link></span>
            <g:if test="${session.user != null}">
                <span class="menuButton"><g:link class="create" action="create">New Picture</g:link></span>
            </g:if>
        </div>
        <div class="body">
            <h1>Edit Picture</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${pictureInstance}">
            <div class="errors">
                <g:renderErrors bean="${pictureInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${pictureInstance?.id}" />
                <input type="hidden" name="version" value="${pictureInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="caption">Caption:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:pictureInstance,field:'caption','errors')}">
                                    <input type="text" id="caption" name="caption" value="${fieldValue(bean:pictureInstance,field:'caption')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateAdded">Date Added:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:pictureInstance,field:'dateAdded','errors')}">
                                    <g:datePicker name="dateAdded" value="${pictureInstance?.dateAdded}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="filename">Filename:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:pictureInstance,field:'filename','errors')}">
                                    <input type="text" id="filename" name="filename" value="${fieldValue(bean:pictureInstance,field:'filename')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="folder">Folder:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:pictureInstance,field:'folder','errors')}">
                                    <g:select optionKey="id" from="${Folder.list()}" name="folder.id" value="${pictureInstance?.folder?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:pictureInstance,field:'user','errors')}">
                                    <g:select optionKey="id" from="${User.list()}" name="user.id" value="${pictureInstance?.user?.id}" ></g:select>
                                </td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
