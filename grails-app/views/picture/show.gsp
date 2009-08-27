<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Show Picture</title>
    </head>
    <body>
		<div id="main">
			<div id="wrapper">    
	            <g:render template="/shared/menu" />
        		<div id="imagelist">
		            <h1>Show Picture</h1>
		            <g:if test="${flash.message}">
		            <div class="message">${flash.message}</div>
		            </g:if>
		            <div class="dialog">
		                <table>
		                    <tbody>
		                        <tr class="prop">
		                            <td valign="top" class="name">Id:</td>
		                            <td valign="top" class="value">${fieldValue(bean:pictureInstance, field:'id')}</td>
		                        </tr>
		                        <tr class="prop">
		                            <td valign="top" class="name">Caption:</td>
		                            <td valign="top" class="value">${fieldValue(bean:pictureInstance, field:'caption')}</td>
		                        </tr>
		                        <tr class="prop">
		                            <td valign="top" class="name">Date Created:</td>
		                            <td valign="top" class="value">${fieldValue(bean:pictureInstance, field:'dateCreated')}</td>
		                        </tr>
		                        <tr class="prop">
		                            <td valign="top" class="name">Filename:</td>
		                            <td valign="top" class="value">${fieldValue(bean:pictureInstance, field:'filename')}</td>
		                        </tr>
		                        <tr class="prop">
		                            <td valign="top" class="name">Folder:</td>
		                            <td valign="top" class="value"><g:link controller="folder" action="show" id="${pictureInstance?.folder?.id}">${pictureInstance?.folder?.encodeAsHTML()}</g:link></td>
		                        </tr>
		                        <tr class="prop">
		                            <td valign="top" class="name">User:</td>
		                            <td valign="top" class="value"><g:link controller="user" action="show" id="${pictureInstance?.user?.id}">${pictureInstance?.user?.encodeAsHTML()}</g:link></td>
		                        </tr>
		                    </tbody>
		                </table>
		            </div>
		            <div class="buttons">
		                <g:form>
		                    <input type="hidden" name="id" value="${pictureInstance?.id}" />
		                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
		                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
		                </g:form>
		            </div>
					<div id="footer"><a href="http://www.freecss.info">Free CSS Templates </a></div>
				</div>
			</div>		
		</div>	
	</body>
</html>
