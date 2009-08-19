<html>
    <head>
        <meta name="layout" content="main" />
        <title>Create Picture</title>         
    </head>
    <body>
        <div class="nav">
            <g:render template="/shared/menu" />
            <span class="menuButton"><g:link class="list" action="list">Picture List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Picture</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${pictureInstance}">
            <div class="errors">
                <g:renderErrors bean="${pictureInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="filename">File name:</label>
                                </td>
                                <td valign="top" class="value">
                                    <input type="file" id="myFile" name="myFile" />
                                </td>
                            </tr>
                            
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
                                <td valign="top" class="name" class="value ${hasErrors(bean:pictureInstance,field:'folder','errors')}>
                                    <label for="folder">Folder:</label>
                                </td>
                                <td valign="top" class="name">
                                	<label for="folder">${folderInstance.name}</label>
								</td>                                
								<input type="hidden" id="folder.id" name="folder.id" value="${folderInstance.id}"/>                                    
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name" class="value ${hasErrors(bean:pictureInstance,field:'user','errors')}>
                                    <label for="user">User:</label>
                                </td>
                                <td valign="top" class="name">
                                	<label for="user">${session.user.nick}</label>
								</td>                                
								<input type="hidden" id="user.id" name="user.id" value="${session.user.id}"/>                                    
                            </tr> 
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
