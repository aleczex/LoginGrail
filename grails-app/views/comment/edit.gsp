<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edycja komentarzy</title>
    </head>
    <body>
    <div id="main">
        <div id="wrapper">
            <g:render template="/shared/menu" />
        <div class="body">
            <h1>Edycja komentarzy</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${commentInstance}">
            <div class="errors">
                <g:renderErrors bean="${commentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${commentInstance?.id}" />
                <input type="hidden" name="version" value="${commentInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Treść komentarza:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commentInstance,field:'description','errors')}">
                                    <input type="text" size="100" id="description" name="description" value="${fieldValue(bean:commentInstance,field:'description')}"/>
                                </td>
                            </tr> 

                            <g:set var="path_320" value="${fieldValue(bean:commentInstance.picture, field:'filename')+'_320.jpg'}" />
                            <g:set var="res" value="${resource(dir:'/images/upload')}" />
                            <img src="${res}/${path_320}" alt="" />

                            <input type="hidden" id="user.id" name="user.id" value="${commentInstance?.user?.id}"/> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                </div>
                    <span class="button"><g:actionSubmit class="save" action="update" value="Zmień"/></span>
                    <span class="button"><g:link controller="comment" action="list" id="${commentInstance.id}">Powrót</g:link></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
