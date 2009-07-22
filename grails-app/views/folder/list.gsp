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
      <div class="center">
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <table>
        	<tbody>
	        <g:each in="${folderInstanceList}" status="i" var="folderInstance">
	        <tr>
    	        <g:if test="${session.user != null}">
    	        	<td><g:link action="show" id="${folderInstance.id}">Edit</g:link></td>
    	        </g:if>
    	        <td><g:link controller="picture" action="list" id="${folderInstance.id}"><h3>${fieldValue(bean:folderInstance, field:'name')}</h3></g:link></td>
			</tr>    	        
	        </g:each>
	        <tbody>
	    </table>
      </div>
      <div class="clear"></div>
  </div>
  <div id="footer"><a href="http://www.freecss.info">Free CSS Templates </a></div>
  </div>
</div>
</body>
</html>
