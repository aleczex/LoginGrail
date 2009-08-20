<html>
    <head>
        <meta name="layout" content="main" />
        <title>Dodaj komentarz</title>         
    </head>
    <body>
        <div class="nav">
            <g:render template="/shared/menu" />
            <span class="menuButton"><g:link class="list" action="list">Comment List</g:link></span>
        </div>    
        <div class="body">
            <h1>Create Comment</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${commentInstance}">
            <div class="errors">
                <g:renderErrors bean="${commentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commentInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${commentInstance?.dateCreated}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commentInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:commentInstance,field:'description')}"/>
                                </td>
                            </tr> 
                            
                            <tr class="prop">
                                <td valign="top" class="name" class="value ${hasErrors(bean:commentInstance,field:'picture','errors')}>
                                    <label for="folder">Picture:</label>
                                </td>
                                <td valign="top" class="name">
                                	<label for="folder">${pictureInstance.caption}</label>
								</td>                                
								<input type="hidden" id="picture.id" name="picture.id" value="${pictureInstance.id}"/>                                    
                            </tr> 
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name" class="value ${hasErrors(bean:pictureInstance,field:'user','errors')}>
                                    <label for="user">User:</label>
                                </td>
                                <g:if test="${session.user != null}">
	                                <td valign="top" class="name">
	                                	<label for="user">${session.user.nick}</label>
									</td>                                
									<input type="hidden" id="user.id" name="user.id" value="${session.user.id}"/>
								</g:if>
								<g:else>
	                                <td valign="top" class="name">
	                                	<label for="user">~anonim</label>
									</td>                                
									<input type="hidden" id="0" name="0" value="null"/>									
								</g:else>                                    
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
