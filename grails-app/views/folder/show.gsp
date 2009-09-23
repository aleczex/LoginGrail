<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="layout" content="main" />
        <title>Pokaz folder</title>
    </head>
    <body>
    <div id="main">
        <div id="wrapper">
            <g:render template="/shared/menu" />
        <div class="body">
            <h1>Show Folder</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            <td valign="top" class="value">${fieldValue(bean:folderInstance, field:'id')}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            <td valign="top" class="value">${fieldValue(bean:folderInstance, field:'name')}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Pictures:</td>
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="p" in="${folderInstance.pictures}">
                                    <li><g:link controller="picture" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${folderInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
            <g:render template="/shared/footer" />
        </div>
    </div>
</body>
</html>
