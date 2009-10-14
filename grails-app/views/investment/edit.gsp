

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Investment</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Investment List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Investment</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Investment</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${investmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${investmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${investmentInstance?.id}" />
                <input type="hidden" name="version" value="${investmentInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:investmentInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:investmentInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:investmentInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${investmentInstance?.dateCreated}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="folders">Folders:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:investmentInstance,field:'folders','errors')}">
                                    
<ul>
<g:each var="f" in="${investmentInstance?.folders?}">
    <li><g:link controller="folder" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="folder" params="['investment.id':investmentInstance?.id]" action="create">Add Folder</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="newsy">Newsy:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:investmentInstance,field:'newsy','errors')}">
                                    
<ul>
<g:each var="n" in="${investmentInstance?.newsy?}">
    <li><g:link controller="news" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="news" params="['investment.id':investmentInstance?.id]" action="create">Add News</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:investmentInstance,field:'user','errors')}">
                                    <g:select optionKey="id" from="${JsecUser.list()}" name="user.id" value="${investmentInstance?.user?.id}" ></g:select>
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
