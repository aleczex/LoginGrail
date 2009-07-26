            <div id="header">
                <div class="logo"><a href="#" class="logo"><span>Nasz</span>Domek</a></div>
                <div id="top">
                    <div id="user">
                        <g:if test="${session.user != null}">
                            Witaj ${session.user}.
                        </g:if>
                        Ostatnia aktualizacja: 10-07-2009
                    </div>
                    <div id="nav">
                        <div id="navcontainer">
                            <ul id="navlist">
                                <li><a href="${resource(dir:'')}">Home</a></li>
                                <li><g:link controller="folder">Galeria</g:link></li>
                                <li><g:link controller="news">Dziennik budowy</g:link></li>
                                <g:if test="${session.user != null}">
                                    <li><g:link class="list" controller="user" action="doLogout">Wyloguj</g:link></li>
                                </g:if> 
                                <g:else>
                                    <li><g:link class="list" controller="user" action="doLogin">Zaloguj</g:link></li>
                                </g:else>
                            