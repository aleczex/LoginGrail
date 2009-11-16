<div id="header">
	<div id="user">
<jsec:isLoggedIn>
    <g:link controller="auth" action="signOut">Wyloguj|</g:link>Zalogowany <jsec:principal/>.
</jsec:isLoggedIn>
<jsec:isNotLoggedIn>
    <g:link controller="auth" action="login">Zaloguj się</g:link>
</jsec:isNotLoggedIn> 
Ostatnia aktualizacja: 08-11-2009
	</div>
	<div class="logo"><a href="#" class="logo"><span>Nasza</span>Inwestycja</a></div>
	<div id="top">
		<div id="nav">
			<div id="navcontainer">
				<ul id="navlist">
                    <g:if test="${params.controller == 'index'}">
                        <li id="current"><a href="${grailsApplication.config.grails.serverURL}">Start</a></li>
                        <li><g:link controller="investment">Inwestycje</g:link></li>
                    </g:if>
                    <g:else>
                        <li><a href="${grailsApplication.config.grails.serverURL}">Start</a></li>
                        <li id="current"><g:link controller="investment">Inwestycje</g:link></li>
                    </g:else>
                    <jsec:hasRole name="Administrator">
			            <li id="subcurrent"><g:link class="list" controller="comment" action="list">Lista komentarzy</g:link></li>
                		<li id="current"><g:link class="list" controller="users" action="list">Użytkownicy</g:link></li>
                    </jsec:hasRole>
				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>               		
