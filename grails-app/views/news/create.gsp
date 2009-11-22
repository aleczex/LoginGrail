<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Utworz news</title>
<meta name="layout" content="main" />
</head>
<body>
<div id="main">
<div id="wrapper"><g:render template="/shared/menu" />
<div class="body">
<h1>Utworz News</h1>
<g:if test="${flash.message}">
	<div class="message">${flash.message}</div>
</g:if> <g:hasErrors bean="${newsInstance}">
	<div class="errors"><g:renderErrors bean="${newsInstance}"
		as="list" /></div>
</g:hasErrors> <g:form action="save" method="post">
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
				<td valign="top" class="name"><label for="description">Treść wpisu:</label>
				</td>
				<td valign="top"
					class="value ${hasErrors(bean:newsInstance,field:'description','errors')}">
				<input type="text" id="description" name="description"
					value="${fieldValue(bean:newsInstance,field:'description')}" /></td>
			</tr>
			<tr class="prop">
				<td valign="top" class="name"
					class="value ${hasErrors(bean:newsInstance,field:'user','errors')}>
                                    <label for="user">Użytkownik:</label>
                                </td>
                                <td valign="top" class="name">
                                	<label for="user"><jsec:principal/></label>
								</td>                                
                            </tr>         
                                            <tr class="prop">
                                <td valign="top" class="name" class="value ${hasErrors(bean:investmentInstance,field:'investment','errors')}>
                                    <label for="investment">Inwestycja:</label>
                                </td>
                                <td valign="top" class="name">
                                    <label for="user">${investmentInstance.name}</label>
                                </td>                                
                                <input type="hidden" id="investmentInstance.id" name="investmentInstance.id" value="${investmentInstance.id}"/>                                    
                            </tr>  
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" action="Create" value="Utwórz" /></span>
                </div>
            </g:form>
            </div>
            <g:render template="/shared/footer" />
        </div>
    </div>
</body>
</html>