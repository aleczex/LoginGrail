<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Utworz news</title>
        <meta name="layout" content="main" />
    </head>
    <body>
    <div id="main">
        <div id="wrapper">
            <g:render template="/shared/menu" />
                <g:if test="${session.user != null}">
                    <g:if test="${params.controller == 'news' && params.action == 'create'}">
                        <li id="current"><g:link class="create" action="create">Nowy news</g:link></li>
                    </g:if>
                    <g:else>
                        <li><g:link class="create" action="create">Nowy news</g:link></li>
                    </g:else>
                </g:if>
            <g:render template="/shared/menuend" />
        <div class="body">
            <h1>Utworz News</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${newsInstance}">
            <div class="errors">
                <g:renderErrors bean="${newsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${newsInstance?.dateCreated}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:newsInstance,field:'description')}"/>
                                </td>
                            </tr> 
                            <tr class="prop">
                                <td valign="top" class="name" class="value ${hasErrors(bean:newsInstance,field:'user','errors')}>
                                    <label for="user">User:</label>
                                </td>
                                <td valign="top" class="name">
                                	<label for="user">${session.user.nick}</label>
								</td>                                
								<input type="hidden" id="user.id" name="user.id" value="${session.user.id}"/>                                    
                            </tr>                         
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
