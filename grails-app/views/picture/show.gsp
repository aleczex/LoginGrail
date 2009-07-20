

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Picture</title>
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
            <h1>Show Picture</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:pictureInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Caption:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:pictureInstance, field:'caption')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Added:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:pictureInstance, field:'dateAdded')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Filename:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:pictureInstance, field:'filename')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Folder:</td>
                            
                            <td valign="top" class="value"><g:link controller="folder" action="show" id="${pictureInstance?.folder?.id}">${pictureInstance?.folder?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">User:</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${pictureInstance?.user?.id}">${pictureInstance?.user?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${pictureInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
