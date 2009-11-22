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
                <h1><g:link controller="investment">Inwestycja</g:link>-><g:link controller="investment" action="show" id="${investmentInstance.id}">${investmentInstance.name}</g:link>->
                <g:link controller="folder" action="list" id="${investmentInstance.id}">Galeria</g:link>->${folderInstance.name}(Edycja)
                </h1>
		        <div id="imagelist">
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
                        <input type="hidden" id="filename" name="filename" value="${fieldValue(bean:pictureInstance,field:'filename')}"/>
		                <div class="dialog">
		                    <table>
		                        <tbody>
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                    <label for="caption">Podpis:</label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean:pictureInstance,field:'caption','errors')}">
		                                    <input type="text" id="caption" name="caption" value="${fieldValue(bean:pictureInstance,field:'caption')}"/>
		                                </td>
		                            </tr> 
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                    <label for="folder">Folder:</label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean:pictureInstance,field:'folder','errors')}">
		                                    <g:select optionKey="id" optionValue="name" from="${folderInstanceList}" name="folder.id" value="${folderInstance?.id}" ></g:select>
		                                </td>
		                            </tr> 
		                         	<tr class="prop">
		                                <td valign="top" class="name" class="value ${hasErrors(bean:pictureInstance,field:'user','errors')}>
		                                    <label for="user">Użytkownik:</label>
		                                </td>
		                                <td valign="top" class="name">
		                                	<label for="user"><jsec:principal/></label>
										</td>                                
										<input type="hidden" id="user.id" name="user.id" value="${userInstance.id}"/>                                    
		                            </tr> 		                            
		                        </tbody>
		                    </table>
		                </div>
		                <div class="buttons">
		                    <span class="button"><g:actionSubmit action="update" value="Zmień" /></span>
		                    <span class="button"><g:link controller="picture" action="list" id="${folderInstance.id}">Powrót</g:link></span>
		                </div>
		            </g:form>
            <g:render template="/shared/footer" />
        </div>
    </div>
</body>
</html>