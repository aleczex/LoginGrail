<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Ania i Alek buduja Zurawinke 2</title>
        <link rel="stylesheet" type="text/css" href="../freecss/style.css"/>
    </head>
    <body>
        <div id="main">
            <div id="wrapper">
                <g:render template="/shared/menu" />
                <g:if test="${session.user != null}">
                    <li><g:link class="create" action="create">Nowy news</g:link></li>
                </g:if>
                <g:render template="/shared/menuend" />
		        <div id="bannerbg">
		            <div id="banner">
		                <h1>Dziennik budowy</h1>
		               <g:if test="${flash.message}">
		                    <div class="message">${flash.message}</div>
		               </g:if>
		                <table>
		                    <tbody>
		                    <g:each in="${newsInstanceList}" status="i" var="newsInstance">
		                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
									<g:if test="${session.user != null}">
										<td><g:link action="show" id="${newsInstance.id}">Edytuj</g:link></td>
									</g:if>
		                            <td>${fieldValue(bean:newsInstance, field:'dateCreated')}</td>
		                            <td>${fieldValue(bean:newsInstance, field:'description')}</td>
		                            <td>${fieldValue(bean:newsInstance, field:'user.nick')}</td>
		                        </tr>
		                    </g:each>
		                    </tbody>
		                </table>
	                </div>
	            </div>
	            <div class="clear"></div>
	            <div class="paginateButtons">
	                <g:paginate total="${newsInstanceTotal}" />
	            </div>
            </div>
        </div>
    </body>
</html>
