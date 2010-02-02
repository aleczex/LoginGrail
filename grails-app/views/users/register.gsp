<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="layout" content="main" />
        <title>Utwórz użytkownika</title>         
    </head>
    <body>
    <div id="main">
        <div id="wrapper">
            <g:render template="/shared/menu" />
        <div class="body">
            <h1>Utwórz użytkownika</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${usersInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${usersInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:hasErrors bean="${investmentInstance}">
                <div class="errors">
                    <g:renderErrors bean="${investmentInstance}" as="list" />
                </div>
            </g:hasErrors>
            <g:form action="reguser" method="post" >
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
                                    <label for="passwordHash">Hasło:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usersInstance,field:'passwordHash','errors')}">
                                    <input type="text" id="passwordHash" name="passwordHash" value="${fieldValue(bean:usersInstance,field:'passwordHash')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Nazwa mojej inwestycji:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:investmentInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:investmentInstance, field:'name')}"/>
                                </td>
                                </td>
                            </tr> 

                        </tbody>
                    </table>
                </div>
                <g:render template="/shared/captcha" />
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Zarejestruj mnie" /></span>
                </div>
            </g:form>
            <g:render template="/shared/footer" />
        </div>
    </div>
    </body>
</html>
