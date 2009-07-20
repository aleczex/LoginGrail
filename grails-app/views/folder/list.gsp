<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Folder List</title>
    </head>
    <body>
        <div class="nav">
            <g:render template="/shared/menu" />
            <g:if test="${session.user != null}">
                <span class="menuButton"><g:link class="create" action="create">New Folder</g:link></span>
            </g:if>
        </div>
        <div class="body">
            <h1>Folder List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                   	        <g:sortableColumn property="id" title="Id" />
                   	        <g:sortableColumn property="name" title="Name" />
                   	        <th>Pictures</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${folderInstanceList}" status="i" var="folderInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${folderInstance.id}">${fieldValue(bean:folderInstance, field:'id')}</g:link></td>
                            <td>${fieldValue(bean:folderInstance, field:'name')}</td>
                            <td>${fieldValue(bean:folderInstance, field:'pictures')}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${folderInstanceTotal}" />
            </div>
        </div>
    </body>
</html>-->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Galeria</title>
<link rel="stylesheet" type="text/css" href="../freecss/style.css"/>
</head>

<body>
        <div class="nav">
            <g:render template="/shared/menu" />
            <g:if test="${session.user != null}">
                <span class="menuButton"><g:link class="create" action="create">New Folder</g:link></span>
            </g:if>
        </div>
        <div class="body">
            <h1>Folder List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="id" title="Id" />
                            <g:sortableColumn property="name" title="Name" />
                            <th>Pictures</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${folderInstanceList}" status="i" var="folderInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${folderInstance.id}">${fieldValue(bean:folderInstance, field:'id')}</g:link></td>
                            <td>${fieldValue(bean:folderInstance, field:'name')}</td>
                            <td>${fieldValue(bean:folderInstance, field:'pictures')}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${folderInstanceTotal}" />
            </div>
        </div>
      <div class="center">
        <g:each in="${folderInstanceList}" status="i" var="folderInstance">
            <g:link controller="picture" action="list" params="[folderid: folderInstance.id]"><h3>${fieldValue(bean:folderInstance, field:'name')}</h3></g:link>
        </g:each>
      </div>
      <div class="clear"></div>
  </div>
  <div id="footer"><a href="http://www.freecss.info">Free CSS Templates </a></div>
  </div>
</div>
</body>
</html>
