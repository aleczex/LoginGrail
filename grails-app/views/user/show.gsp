<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="layout" content="main" />
        <title>Pokaz uzytkownika</title>
    </head>
    <body>
    <div id="main">
        <div id="wrapper">
            <g:render template="/shared/menu" />
        <div class="body">
            <h1>Show User</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'id')}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Email:</td>
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'email')}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Password:</td>
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'password')}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Inwestycje:</td>
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="n" in="${userInstance.investments}">
                                    <li><g:link controller="investment" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${userInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
            <g:render template="/shared/footer" />
        </div>
    </div>
</body>
</html>
