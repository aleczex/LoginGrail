<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
        <meta name="layout" content="main" />
        <title>Dodaj komentarz</title>         
    </head>
    <body>
    <div id="main">
        <div id="wrapper">
            <g:render template="/shared/menu" />
        <div class="body">
            <h1>Dodaj komentarz</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${commentInstance}">
            <div class="errors">
                <g:renderErrors bean="${commentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
								<g:set var="now" value="${new Date()}" />
                                <td valign="top" class="name">
                                    <label for="dateCreated">Data utworzenia:</label>
                                </td>
                                <td valign="top">
									<g:formatDate format="dd-MM-yyyy HH:mm" date="${now}"/>
                                </td>
								<input type="hidden" name="dateCreated" value="struct" />
								<input type="hidden" name="dateCreated_day" id="dateCreated_day" value='<g:formatDate format="dd" date="${now}"/>' />
								<input type="hidden" name="dateCreated_month" id="dateCreated_month" value='<g:formatDate format="MM" date="${now}"/>' />
								<input type="hidden" name="dateCreated_year" id="dateCreated_year" value='<g:formatDate format="yyyy" date="${now}"/>' />
								<input type="hidden" name="dateCreated_hour" id="dateCreated_hour" value='<g:formatDate format="HH" date="${now}"/>' />
								<input type="hidden" name="dateCreated_minute" id="dateCreated_minute" value='<g:formatDate format="mm" date="${now}"/>' />
                            </tr> 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Treść komentarza:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commentInstance,field:'description','errors')}">
                                    <input type="text" id="description" maxlength="100" size="80" name="description" value="${fieldValue(bean:commentInstance,field:'description')}"/>
                                </td>
                            </tr> 
                            <tr class="prop">
                                <td valign="top" class="name" class="value ${hasErrors(bean:commentInstance,field:'picture','errors')}>
                                    <label for="folder">Obrazek:</label>
                                </td>
                                <td valign="top" class="name">
                                	<label for="folder">${pictureInstance.caption}</label>
								</td>                                
								<input type="hidden" id="picture.id" name="picture.id" value="${pictureInstance.id}"/>                                    
                            </tr> 
                         	<tr class="prop">
                                <td valign="top" class="name" class="value ${hasErrors(bean:pictureInstance,field:'user','errors')}>
                                    <label for="user">Użytkownik:</label>
                                </td>
	                            <td valign="top" class="name">
									<jsec:isLoggedIn>
	                                	<label for="user"><jsec:principal/></label>
									</jsec:isLoggedIn>
									<jsec:isNotLoggedIn>
	                                	<label for="user">~anonim</label>
									</jsec:isNotLoggedIn>                           
								</td>      
								<input type="hidden" id="folderid" name="folderid" value="${params.folderid}"/>                                    
                            </tr>                         
                        </tbody>
                    </table>
                </div>
                <br/>
                <g:render template="/shared/captcha" />
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" action="Create" value="Dodaj" /></span>
                </div>
            </g:form>
            <g:render template="/shared/footer" />
        </div>
    </div>
</body>
</html>