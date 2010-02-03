<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Lista komentarzy</title>
    </head>
    <body>
    <div id="main">
        <div id="wrapper">
            <g:render template="/shared/menu" />
        <div class="body">
            <h1>Lista komentarzy</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                   	        <th/>
                   	        <g:sortableColumn property="dateCreated" title="Data utworzenia" />
                   	        <g:sortableColumn property="description" title="Opis" />
                   	        <th>Autor komentarza</th>
                   	        <th>Zdjęcie</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${commentInstanceList}" status="i" var="commentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							<td><g:form method="post" >
				                <input type="hidden" name="id" value="${commentInstance?.id}" />
				                <input type="hidden" name="version" value="${commentInstance?.version}" />
				                <div class="buttons">
				                	<span class="button"><g:actionSubmit action="edit" value="Edytuj" /></span>
				                    <span class="button"><g:actionSubmit action="delete" onclick="return confirm('Jesteś pewien?');" value="Usuń" /></span>
				                </div>
				            </g:form>
				            </td>                            
                            <td>${fieldValue(bean:commentInstance, field:'dateCreated')}</td>
                            <td>${fieldValue(bean:commentInstance, field:'description')}</td>
                            <td>${fieldValue(bean:commentInstance, field:'user.username')}</td>
                            <td>


                                <g:set var="path_320" value="${fieldValue(bean:commentInstance.picture, field:'filename')+'_100.jpg'}" />
                                <g:set var="res" value="${resource(dir:'/images/upload')}" />
                                <img src="${res}/${path_320}" alt="" style="margin: 0 0 10px 15px"/>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate next="Następny" previous="Poprzedni" total="${commentInstanceTotal}" />
            </div>
            <g:render template="/shared/footer" />
        </div>
    </div>
</body>
</html>
