<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Edytuj folder</title>
        <link rel="stylesheet" type="text/css" href="../freecss/style.css"/>
    </head>
    <body>
    <div id="main">
        <div id="wrapper">
            <g:render template="/shared/menu" />
            <li><g:link class="list" action="list">Lista folderow</g:link></li>
            <g:if test="${session.user != null}">
                <li><g:link class="create" action="create">Nowy Folder</g:link></li>
            </g:if>
            <g:render template="/shared/menuend" />
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
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:folderInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:folderInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pictures">Pictures:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:folderInstance,field:'pictures','errors')}">
                                    
<ul>
<g:each var="p" in="${folderInstance?.pictures?}">
    <li><g:link controller="picture" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="picture" params="['folder.id':folderInstance?.id]" action="create">Add Picture</g:link>

                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
