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