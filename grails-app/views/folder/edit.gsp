<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="layout" content="main" />
        <title>Edytuj folder</title>
    </head>
    <body>
    <div id="main">
        <div id="wrapper">
            <g:render template="/shared/menu" />
        <div class="body">
            <h1>Edytuj folder</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${folderInstance}">
            <div class="errors">
                <g:renderErrors bean="${folderInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${folderInstance?.id}" />
                <input type="hidden" name="version" value="${folderInstance?.version}" />
                <input type="hidden" name="investmentid" value="${investmentInstance.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Nazwa:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:folderInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:folderInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="Update" value="Zmień"/></span>
                    <span class="button"><g:link controller="folder" action="list" id="${investmentInstance.id}">Powrót</g:link></span>
                </div>
            </g:form>
            <g:render template="/shared/footer" />
        </div>
    </div>
</body>
</html>
