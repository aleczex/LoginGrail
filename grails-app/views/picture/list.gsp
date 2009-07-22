<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Galeria</title>
<link rel="stylesheet" type="text/css" href="../freecss/style.css"/>
</head>
<body>
       <div class="nav">
            <g:render template="/shared/menu" />
            <g:if test="${session.user != null}">
                <span class="menuButton"><g:link class="create" action="create" id="${folderInstance.id}">New Picture</g:link></span>
            </g:if>
        </div>
<div class="center">
<h3>${folderInstance.name}</h3>
<table>
<tbody>
<g:each in="${pictureInstanceList}" status="i" var="pictureInstance">
	<tr>
	<g:if test="${session.user != null}">
		<td><g:link action="show" id="${pictureInstance.id}">Edit</g:link></td>
	</g:if>
	<td><img width="320" class="image"
		src="/LoginGrail/images/upload/${fieldValue(bean:pictureInstance, field:'filename')}"
		alt="${fieldValue(bean:pictureInstance, field:'caption')}" />
	<p>${fieldValue(bean:pictureInstance, field:'caption')}</p></td>
	</tr>
</g:each></div>
</tbody>
</table>

<div class="clear"></div>
  </div>
  <div id="footer"><a href="http://www.freecss.info">Free CSS Templates </a></div>
  </div>
</div>
</body>
</html>