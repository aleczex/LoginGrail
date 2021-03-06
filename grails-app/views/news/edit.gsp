<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="layout" content="main" />
        <title>Edytuj news</title>
    </head>
    <body>
    <div id="main">
        <div id="wrapper">
            <g:render template="/shared/menu" />
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
                <input type="hidden" name="investmentid" value="${investmentInstance.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:newsInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="Zmień"/></span>
                    <span class="button"><g:link controller="news" action="list" id="${investmentInstance.id}">Powrót</g:link></span>
                </div>
            </g:form>
            <g:render template="/shared/footer" />
        </div>
    </div>
</body>
</html>
