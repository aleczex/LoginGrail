<html>
    <head>
        <meta name="layout" content="main" />
        <title>Dodaj komentarz</title>         
    </head>
    <body>
    <div id="main">
        <div id="wrapper">
            <g:render template="/shared/menu" />
			<g:if test="${session.user != null}">
	            <li><g:link class="list" action="list">Lista komentarzy</g:link></li>
			</g:if> 
	        <g:render template="/shared/menuend" />
        <div class="body">
            <h1>Dodaj komentarz</h1>
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
								<g:if test="${session.user != null}">
	                                <td valign="top" class="name">
	                                    <label for="dateCreated">Date Created:</label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean:commentInstance,field:'dateCreated','errors')}">
	                                    <g:datePicker type="hidden" name="dateCreated" value="${commentInstance?.dateCreated}" precision="minute" ></g:datePicker>
	                                </td>
                                </g:if>
                                <g:else>
									<g:set var="now" value="${new Date()}" />
	                                <td valign="top" class="name">
	                                    <label for="dateCreated">Date Created:</label>
	                                </td>
	                                <td valign="top">
										<g:formatDate format="dd-MM-yyyy HH:mm" date="${now}"/>
	                                </td>
									<input type="hidden" name="dateCreated" value="struct" />
									<input type="hidden" name="dateCreated_day" id="dateCreated_day" value='<g:formatDate format="dd" date="${now}"/>' />
									<input type="hidden" name="dateCreated_month" id="dateCreated_month" value='<g:formatDate format="MM" date="${now}"/>' />
									<input type="hidden" name="dateCreated_year" id="dateCreated_year" value='<g:formatDate format="yyyy" date="${now}"/>' />
									<input type="hidden" name="dateCreated_hour" id="dateCreated_hour" value='<g:formatDate format="HH" date="${now}"/>' />
									<input type="hidden" name="dateCreated_minute" id="dateCreated_minute" value='<g:formatDate format="mm" date="${now}"/>' />
								</g:else>                                
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
								</g:else>                                    
								<input type="hidden" id="folderid" name="folderid" value="${params.folderid}"/>                                    
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