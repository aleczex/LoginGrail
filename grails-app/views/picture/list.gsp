<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Galeria</title>
		<link rel="stylesheet" type="text/css" href="../../freecss/style.css"/>
	</head>
	<body>
    	<div class="nav">
        	<g:render template="/shared/menu" />
			<g:if test="${session.user != null}">
            	<span class="menuButton">
            		<g:link class="create" action="create" id="${folderInstance.id}">Nowy obrazek</g:link>
            	</span>
			</g:if>
		</div>

		<div class="center">
			<h3>${folderInstance.name}</h3>
			<g:each in="${pictureInstanceList}" status="i" var="pictureInstance">
				<g:if test="${session.user != null}">
					<g:link action="show" id="${pictureInstance.id}">Edytuj</g:link>
				</g:if>
				<img width="320" class="image"
					src="/LoginGrail/images/upload/${fieldValue(bean:pictureInstance, field:'filename')}"
					alt="${fieldValue(bean:pictureInstance, field:'caption')}" />
				<p>${pictureInstance.caption} (dodano ${pictureInstance.dateAdded})</p>
			</g:each>
		</div>

		<div class="clear"/>
		<div id="footer"><a href="http://www.freecss.info">Free CSS Templates </a></div>
	</body>
</html>



