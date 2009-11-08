<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Dodaj inwestycję</title>
        <meta name="layout" content="main" />
    </head>
    <body>
    <div id="main">
        <div id="wrapper">
            <g:render template="/shared/menu" />
        <div class="body">
            <h1>Dodaj inwestycję</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${investmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${investmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
            </div>
            <g:render template="/shared/footer" />
        </div>
    </div>
</body>
</html>
