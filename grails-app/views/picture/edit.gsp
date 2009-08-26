<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="layout" content="main" />
        <g:javascript src="highslide/highslide.js" />
        <g:javascript src="highslide/highslide.config.js" charset="utf-8"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir:'js/highslide',file:'highslide.css')}" />
        <!--[if lt IE 7]>
	        <link rel="stylesheet" type="text/css" href="${resource(dir:'js/highslide',file:'highslide-ie6.css')}" />
		<![endif]-->    
		<title>Edytuj obrazek</title>
    </head>
    <body>
		<div id="main">
			<div id="wrapper">    
	            <g:render template="/shared/menu" />
	            	<li><g:link class="list" action="list">Lista obrazków</g:link></li>
	            <g:if test="${session.user != null}">
	                <li><g:link class="create" action="create">Nowy obrazek</g:link></span></li>
	            </g:if>
	            <g:render template="/shared/menuend" />
		        <div id="imagelist">
		            <h1>Edytuj obrazek</h1>
		            <g:if test="${flash.message}">
		            	<div class="message">${flash.message}</div>
		            </g:if>
		            <g:hasErrors bean="${pictureInstance}">
			            <div class="errors">
			                <g:renderErrors bean="${pictureInstance}" as="list" />
			            </div>
		            </g:hasErrors>
            
		            <g:set var="path" value="${fieldValue(bean:pictureInstance, field:'filename')}" />
					<g:set var="res" value="${resource(dir:'/images/upload')}" />
					<a href="${res}/${path}" class="highslide" onclick="return hs.expand(this)"
						title="${fieldValue(bean:pictureInstance, field:'caption')}" style="margin: 0 0 10px 15px">
						<img src="${res}/${path}" alt="" width="320" />
					</a>
			            
		            <g:form method="post" >
		                <input type="hidden" name="id" value="${pictureInstance?.id}" />
		                <input type="hidden" name="version" value="${pictureInstance?.version}" />
		                <div class="dialog">
		                    <table>
		                        <tbody>
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                    <label for="caption">Caption:</label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean:pictureInstance,field:'caption','errors')}">
		                                    <input type="text" id="caption" name="caption" value="${fieldValue(bean:pictureInstance,field:'caption')}"/>
		                                </td>
		                            </tr> 
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                    <label for="dateCreated">Date Created:</label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean:pictureInstance,field:'dateCreated','errors')}">
		                                    <g:datePicker name="dateCreated" value="${pictureInstance?.dateCreated}" precision="minute" ></g:datePicker>
		                                </td>
		                            </tr> 
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                    <label for="filename">Filename:</label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean:pictureInstance,field:'filename','errors')}">
		                                    <input type="text" id="filename" name="filename" value="${fieldValue(bean:pictureInstance,field:'filename')}"/>
		                                </td>
		                            </tr> 
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                    <label for="folder">Folder:</label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean:pictureInstance,field:'folder','errors')}">
		                                    <g:select optionKey="id" from="${Folder.list()}" name="folder.id" value="${pictureInstance?.folder?.id}" ></g:select>
		                                </td>
		                            </tr> 
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                    <label for="user">User:</label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean:pictureInstance,field:'user','errors')}">
		                                    <g:select optionKey="id" from="${User.list()}" name="user.id" value="${pictureInstance?.user?.id}" ></g:select>
		                                </td>
		                            </tr> 
		                        </tbody>
		                    </table>
		                </div>
		                <div class="buttons">
		                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
		                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
		                </div>
		            </g:form>
					<div id="footer"><a href="http://www.freecss.info">Free CSS Templates </a></div>
				</div>
			</div>		
		</div>	
	</body>
</html>
