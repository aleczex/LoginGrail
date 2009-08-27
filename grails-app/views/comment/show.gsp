<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Comment</title>
    </head>
    <body>
    <div id="main">
        <div id="wrapper">
            <g:render template="/shared/menu" />
        <div class="body">
            <h1>Show Comment</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            <td valign="top" class="value">${fieldValue(bean:commentInstance, field:'id')}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            <td valign="top" class="value">${fieldValue(bean:commentInstance, field:'dateCreated')}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            <td valign="top" class="value">${fieldValue(bean:commentInstance, field:'description')}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Picture:</td>
                            <td valign="top" class="value"><g:link controller="picture" action="show" id="${commentInstance?.picture?.id}">${commentInstance?.picture?.encodeAsHTML()}</g:link></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">User:</td>
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${commentInstance?.user?.id}">${commentInstance?.user?.encodeAsHTML()}</g:link></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${commentInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
