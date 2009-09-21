<div id="header">
	<div id="user">
		<g:if test="${session.user != null}">Witaj ${session.user.nick}.</g:if>
			Ostatnia aktualizacja: 27-08-2009
	</div>
	<div class="logo"><a href="#" class="logo"><span>Nasza</span>Inwestycja</a></div>
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

                    <g:if test="${(params.controller == 'investment') && params.action == 'list'}">
                        <li id="current"><g:link controller="investment">Inwestycja</g:link></li>
                    </g:if>
                    <g:else>
                        <li><g:link controller="investment">Inwestycja</g:link></li>
                    </g:else>

                    <g:if test="${session.user != null}">
	                    <g:if test="${params.controller == 'investment' && params.action =='create'}">
	                        <li id="subcurrent"><g:link class="create" action="create">Nowa inwestycja</g:link></li>
	                    </g:if>
                        <g:if test="${params.controller == 'investment' && params.action =='list'}">
                            <li id="sub"><g:link class="create" action="create">Nowa inwestycja</g:link></li>
                        </g:if>
                    </g:if>             
                    <g:if test="${(params.controller == 'folder' ||params.controller == 'picture') && params.action == 'list'}">
                        <li id="current"><g:link controller="folder">Galeria</g:link></li>
                    </g:if>
                    <g:else>
                        <li><g:link controller="folder">Galeria</g:link></li>
                    </g:else>
					<g:if test="${session.user != null}">
		                <g:if test="${params.controller == 'folder' && params.action =='create'}">
		                    <li id="subcurrent"><g:link class="create" action="create">Nowy folder</g:link></li>
		                </g:if>
		                <g:if test="${params.controller == 'folder' && params.action =='list'}">
		                    <li id="sub"><g:link class="create" action="create">Nowy folder</g:link></li>
		                </g:if>
					</g:if>             
                	<g:if test="${session.user != null}">
                    	<g:if test="${params.controller == 'picture' && params.action == 'list'}">
							<li id="sub"><g:link class="create" action="create" id="${folderInstance.id}">Nowy obrazek</g:link></li>
						</g:if>	
                    	<g:if test="${params.controller == 'picture' && params.action == 'create'}">
							<li id="subcurrent"><g:link class="create" action="create" id="${folderInstance.id}">Nowy obrazek</g:link></li>
						</g:if>	
					</g:if> 
					<g:if test="${session.user != null}">
	            		<g:if test="${params.controller == 'comment' && params.action == 'list'}">
				            <li id="subcurrent"><g:link class="list" controller="comment" action="list">Lista komentarzy</g:link></li>
	            		</g:if>
	            		<g:if test="${params.controller == 'picture' && params.action == 'list'}">
				            <li id="sub"><g:link class="list" controller="comment" action="list">Lista komentarzy</g:link></li>
	            		</g:if>
					</g:if> 					
					<g:if test="${params.controller == 'news' && params.action == 'list'}">
    					<li id="current"><g:link controller="news">Dziennik budowy</g:link></li>
                    </g:if>
                    <g:else>
                        <li><g:link controller="news">Dziennik budowy</g:link></li>
                    </g:else>
					<g:if test="${session.user != null}">
                    	<g:if test="${params.controller == 'news' && params.action == 'create'}">
                        	<li id="subcurrent"><g:link class="create" action="create">Nowy wpis</g:link></li>
                    	</g:if>
                    	<g:if test="${params.controller == 'news' && params.action == 'list'}">
                        	<li id="sub"><g:link class="create" action="create">Nowy wpis</g:link></li>
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
					<g:if test="${session.user != null}">
                        <li><g:link class="list" controller="user" action="doLogout">Wyloguj</g:link></li>
					</g:if> 
					<g:else>
	                    <g:if test="${(params.controller == 'user') && params.action == 'login'}">
	                        <li id="current"><g:link class="list" controller="user" action="login">Zaloguj</g:link></li>
	                    </g:if>
	                    <g:else>
	                        <li><g:link class="list" controller="user" action="login">Zaloguj</g:link></li>
	                    </g:else>
					</g:else>
				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>               		
