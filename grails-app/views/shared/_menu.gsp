<div id="header">
	<div id="user">
		<g:if test="${session.user != null}">Witaj ${session.user.nick}.</g:if>
			Ostatnia aktualizacja: 23-08-2009
	</div>
	<div class="logo"><a href="#" class="logo"><span>Nasz</span>Domek</a></div>
	<div id="top">
		<div id="nav">
			<div id="navcontainer">
				<ul id="navlist">
                    <g:if test="${params.controller == null}">
                        <li id="current"><a href="${grailsApplication.config.grails.serverURL}">Start</a></li>
                    </g:if>
                    <g:else>
                        <li><a href="${grailsApplication.config.grails.serverURL}">Start</a></li>
                    </g:else>
                    <g:if test="${(params.controller == 'folder' ||params.controller == 'picture') && params.action == 'list'}">
                        <li id="current"><g:link controller="folder">Galeria</g:link></li>
                    </g:if>
                    <g:else>
                        <li><g:link controller="folder">Galeria</g:link></li>
                    </g:else>
                    <g:if test="${params.controller == 'news' && params.action == 'list'}">
    					<li id="current"><g:link controller="news">Dziennik budowy</g:link></li>
                    </g:if>
                    <g:else>
                        <li><g:link controller="news">Dziennik budowy</g:link></li>
                    </g:else>
                            
                              