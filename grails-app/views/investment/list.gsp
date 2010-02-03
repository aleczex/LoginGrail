<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="layout" content="main" />
        <title>Lista inwestycji</title>
    </head>
    <body>

        <div id="main">
            <div id="wrapper">
                <g:render template="/shared/menu" />

        <div class="body">
            <h1>Inwestycje
                <jsec:isLoggedIn>
                    <jsec:hasRole name="Administrator">
				        <g:link class="create" action="create">(Dodaj nową inwestycję)</g:link>
                    </jsec:hasRole>
				</jsec:isLoggedIn>
            </h1>    
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                   	        <th></th>
                   	        <th align="center">Ostatnio dodane zdjęcia:</th>
                   	        <th align="center">Ostatnie wpisy do dziennika:</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${investmentInstanceList}" status="i" var="investmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>		                    
                           <g:grep in="${userInvestmentList}" filter="investmentInstance">
                               <g:form method="post" >
	                               <input type="hidden" name="id" value="${investmentInstance?.id}" />
	                               <div class="buttons">
	                                   <span class="button"><g:actionSubmit action="edit" value="Edytuj" /></span>
                                       <span class="button"><g:actionSubmit action="delete" onclick="return confirm('Jesteś pewien? Możesz usunąć tylko taki folder, w którym nie ma zdjęć');" value="Usuń" /></span>
    	                            </div>
    	                        </g:form>
                            </g:grep>
	                        <g:link action="show" id="${investmentInstance.id}">${fieldValue(bean:investmentInstance, field:'name')}<br/> 
(<g:formatDate format="yyyy-MM-dd" date="${investmentInstance.dateCreated}"/> - ${fieldValue(bean:investmentInstance, field:'user.username')})</g:link></td>
                            <td><ul>
                            <g:each in="${investmentInstance.folders}" status="j" var="folderInstance">
                                <g:if test="${j < 3}">
<li><g:link controller="picture" action="list" id="${folderInstance.id}">${folderInstance.name}</g:link></li>
                                </g:if>
                            </g:each>
                            </ul>
                            <td><ul>
		                    <g:each in="${investmentInstance.newsy}" status="j" var="newsInstance">
                                <g:if test="${j < 3}">
<li><g:link controller="news" action="list" id="${investmentInstance.id}">${newsInstance.description}</g:link></li>
                                </g:if>
		                    </g:each>
                            </ul>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="clear"></div>
            <div class="paginateButtons">
                <g:paginate next="Następny" previous="Poprzedni" total="${investmentInstanceTotal}" />
            </div>
            <g:render template="/shared/footer" />
        </div>
    </div>
</body>
</html>
