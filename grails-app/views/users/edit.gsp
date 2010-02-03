<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="layout" content="main" />
        <title>Edycja użytkownika</title>
    </head>
    <body>
    <div id="main">
        <div id="wrapper">
            <g:render template="/shared/menu" />
        <div class="body">
            <h1>Edycja użytkownika</h1>
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
                                    <label for="username">Nazwa użytkownika:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'username','errors')}">
                                    <input type="text" id="username" name="username" value="${fieldValue(bean:usersInstance,field:'username')}"/>
                                </td>
                            </tr> 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Adres email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'email','errors')}">
                                    <input type="text" id="email" name="email" value="${fieldValue(bean:usersInstance,field:'email')}"/>
                                </td>
                            </tr> 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Data utworzenia:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${usersInstance?.dateCreated}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="investments">Inwestycje:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'investments','errors')}">
									<ul>
									<g:each var="i" in="${usersInstance?.investments?}">
									    <li>${i.name}</li>
									</g:each>
									</ul>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="passwordHash">Hasło:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'passwordHash','errors')}">
                                    <input type="text" id="passwordHash" name="passwordHash" value="${fieldValue(bean:usersInstance,field:'passwordHash')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="Update" value="Zmień"/></span>
                    <span class="button"><g:link controller="users" action="list" id="${usersInstance.id}">Powrót</g:link></span>
                </div>
            </g:form>
            <g:render template="/shared/footer" />
        </div>
    </div>
    </body>
</html>
