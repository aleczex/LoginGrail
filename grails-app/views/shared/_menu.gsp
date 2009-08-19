<div id="header">
	<div id="user">
		<g:if test="${session.user != null}">Witaj ${session.user.nick}.</g:if>
			Ostatnia aktualizacja: 18-08-2009
	</div>
	<div class="logo"><a href="#" class="logo"><span>Nasz</span>Domek</a></div>
	<div id="top">
		<div id="nav">
			<div id="navcontainer">
				<ul id="navlist">
					<li><a href="${grailsApplication.config.grails.serverURL}">Start</a></li>
					<li><g:link controller="folder">Galeria</g:link></li>
					<li><g:link controller="news">Dziennik budowy</g:link></li>
                            
                              