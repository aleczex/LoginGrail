<div id="header">
	<div id="user">
		<g:if test="${session.user != null}"><g:link class="list" controller="user" action="doLogout">Wyloguj|</g:link>Zalogowany ${session.user.nick}. </g:if>
        <g:else><g:link class="list" controller="user" action="login">Zaloguj się</g:link></g:else>
			Ostatnia aktualizacja: 22-09-2009
	</div>
	<div class="logo"><a href="#" class="logo"><span>Nasza</span>Inwestycja</a></div>
	<div id="top">
		<div id="nav">
			<div id="navcontainer">
				<ul id="navlist">
                    <g:if test="${params.controller == null}">
                        <li id="current"><a href="${grailsApplication.config.grails.serverURL}">Start</a></li>
                        <li><g:link controller="investment">Inwestycje</g:link></li>
                    </g:if>
                    <g:else>
                        <li><a href="${grailsApplication.config.grails.serverURL}">Start</a></li>
                        <li id="current"><g:link controller="investment">Inwestycje</g:link></li>
                    </g:else>
					<g:if test="${session.user != null}">
	            		<g:if test="${params.controller == 'comment' && params.action == 'list'}">
				            <li id="subcurrent"><g:link class="list" controller="comment" action="list">Lista komentarzy</g:link></li>
	            		</g:if>
	            		<g:if test="${params.controller == 'picture' && params.action == 'list'}">
				            <li id="sub"><g:link class="list" controller="comment" action="list">Lista komentarzy</g:link></li>
	            		</g:if>
					</g:if> 					
                	<g:if test="${session.user != null}">
						<g:if test="${params.controller == 'user' && params.action == 'list'}">
	                		<li id="current"><g:link class="list" controller="user" action="list">Użytkownicy</g:link></li>
	            		</g:if>
	            		<g:else>
	                		<li><g:link class="list" controller="user" action="list">Użytkownicy</g:link></li>
	            		</g:else>
					</g:if> 
            		<g:if test="${session.user != null}">
	            		<g:if test="${params.controller == 'user' && params.action == 'create'}">
	                		<li id="subcurrent"><g:link class="create" action="create">Nowy użytkownik</g:link></li>
	            		</g:if>
	            		<g:if test="${params.controller == 'user' && params.action == 'list'}">
	                		<li id="sub"><g:link class="create" action="create">Nowy użytkownik</g:link></li>
	            		</g:if>
            		</g:if>
				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>               		
