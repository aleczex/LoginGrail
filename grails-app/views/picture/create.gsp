<html>
    <head>
        <meta name="layout" content="main" />
        <title>Create Picture</title>         
    </head>
    <body>
	    <div id="main">
	        <div id="wrapper">
	            <g:render template="/shared/menu" />
        <div class="body">
            <h1>Dodaj obrazek</h1>
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
                                    <label for="filename">Nazwa pliku ze zdjęciem:</label>
                                </td>
                                <td valign="top" class="value">
                                    <input type="file" id="myFile" name="myFile" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="caption">Podpis zdjęcia:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:pictureInstance,field:'caption','errors')}">
                                    <input type="text" id="caption" name="caption" value="${fieldValue(bean:pictureInstance,field:'caption')}"/>
                                </td>
                            </tr> 
					        <tr class="prop">
								<g:set var="now" value="${new Date()}" />
					            <td valign="top" class="name">
					                <label for="dateCreated">Data utworzenia:</label>
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
					        </tr> 
                            <tr class="prop">
                                <td valign="top" class="name" class="value ${hasErrors(bean:pictureInstance,field:'folder','errors')}>
                                    <label for="folder">Nazwa folderu:</label>
                                </td>
                                <td valign="top" class="name">
                                	<label for="folder">${folderInstance.name}</label>
								</td>                                
								<input type="hidden" id="folder.id" name="folder.id" value="${folderInstance.id}"/>                                    
                            </tr> 
                            <tr class="prop">
                                <td valign="top" class="name" class="value ${hasErrors(bean:pictureInstance,field:'user','errors')}>
                                    <label for="user">Użytkownik:</label>
                                </td>
                                <td valign="top" class="name">
                                	<label for="user"><jsec:principal/></label>
								</td>                                
								<input type="hidden" id="user.id" name="user.id" value="${userInstance.id}"/>                                    
                            </tr> 
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" action="Create" value="Utwórz" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
