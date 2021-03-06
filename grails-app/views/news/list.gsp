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
                <h1><g:link controller="investment">Inwestycja</g:link>-><g:link controller="investment" action="show" id="${investmentInstance.id}">${investmentInstance.name}</g:link>->Dziennik budowy
                    <g:if test="${investmentOwner}">
	                    <g:link class="create" action="create" id="${investmentInstance.id}"> (Dodaj nowy wpis)</g:link>
	                </g:if>
                </h1>
		        <div id="folder">
					<g:if test="${flash.message}">
						<div class="message">${flash.message}</div>
					</g:if>
	                <table>
	                    <tbody>
	                        <g:each in="${newsInstanceList}" status="i" var="newsInstance">
	                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                                <td>
	                                    <g:grep in="${userNewsList}" filter="newsInstance">
		                                    <g:form method="post" >
	                                            <input type="hidden" name="id" value="${newsInstance?.id}" />
	                                            <input type="hidden" name="version" value="${newsInstance?.version}" />
	                                            <input type="hidden" name="investmentid" value="${investmentInstance.id}" />
	                                            <div class="buttons">
	                                                <span class="button"><g:actionSubmit class="edit" action="edit" value="Edytuj" /></span>
	                                                <span class="button"><g:actionSubmit class="delete" action="delete" onclick="return confirm('Czy jesteś pewien?');" value="Usuń" /></span>
	                                            </div>
		                                    </g:form>
			                            </g:grep>
	                                </td>
	                                <td><g:formatDate format="yyyy-MM-dd" date="${newsInstance.dateCreated}"/></td>
	                                <td>${fieldValue(bean:newsInstance, field:'description')}</td>
	                            </tr>
	                            <tr/>
	                            <tr/>
	                        </g:each>
                        </tbody>
                    </table>
	            </div>
	            <div class="clear"></div>
	            <div class="paginateButtons">
	                <g:paginate next="Następny" previous="Poprzedni" total="${newsInstanceTotal}" params="['id': investmentInstance.id]" />
	            </div>
                <g:render template="/shared/footer" />
            </div>
        </div>
    </body>
</html>
