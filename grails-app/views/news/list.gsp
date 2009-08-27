<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="layout" content="main" />
        <title>Lista newsów</title>
    </head>
    <body>
        <div id="main">
            <div id="wrapper">
                <g:render template="/shared/menu" />
		        <div id="folder">
					<h1>Dziennik budowy</h1>
					<g:if test="${flash.message}">
						<div class="message">${flash.message}</div>
					</g:if>
	                <table>
	                    <tbody>
	                    <g:each in="${newsInstanceList}" status="i" var="newsInstance">
	                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
								<td>
								<g:if test="${session.user != null}">
									<g:form method="post" >
						                <input type="hidden" name="id" value="${newsInstance?.id}" />
						                <input type="hidden" name="version" value="${newsInstance?.version}" />
						                <div class="buttons">
						                	<span class="button"><g:actionSubmit action="edit" value="Edytuj" /></span>
						                    <span class="button"><g:actionSubmit action="delete" onclick="return confirm('Jesteś pewien?');" value="Usuń" /></span>
						                </div>
						            </g:form>	
						        </g:if>
						        </td>
	                            <td>${fieldValue(bean:newsInstance, field:'dateCreated')}</td>
	                            <td>${fieldValue(bean:newsInstance, field:'description')}</td>
	                            <td>${fieldValue(bean:newsInstance, field:'user.nick')}</td>
	                        </tr>
	                    </g:each>
	                    </tbody>
	                </table>
	            </div>
	            <div class="clear"></div>
	            <div class="paginateButtons">
	                <g:paginate total="${newsInstanceTotal}" />
	            </div>
				<div class="clear"/>
				<div id="footer"><a href="http://www.freecss.info">Free CSS Templates </a></div>
            </div>
        </div>
    </body>
</html>
