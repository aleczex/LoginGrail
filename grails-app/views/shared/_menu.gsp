    <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
    <g:if test="${session.user != null}">
	   <span class="menuButton"><g:link class="list" controller="user" action="doLogout">Logout ${session.user}</g:link></span>
    </g:if> 
    <g:else>
	   <span class="menuButton"><g:link class="list" controller="user" action="doLogin">Login</g:link></span>
    </g:else>

