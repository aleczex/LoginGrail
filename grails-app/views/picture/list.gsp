<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Galeria</title>
		<link rel="stylesheet" type="text/css" href="../../freecss/style.css"/>
	</head>
	<body>
	    <div id="main">
	        <div id="wrapper">
	        	<g:render template="/shared/menu" />
				<g:if test="${session.user != null}">
	            	<li><g:link class="create" action="create" id="${folderInstance.id}">Nowy obrazek</g:link></li>
				</g:if>
	            <g:render template="/shared/menuend" />
	
	            <div id="bannerbg">
	                <div id="banner">
						<h1>${folderInstance.name}</h1>
                        <div class="contentmain">
<div class="leftcolumn">
						<g:each in="${pictureInstanceList}" status="i" var="pictureInstance">
							<g:if test="${session.user != null}">
								<g:link action="show" id="${pictureInstance.id}">Edytuj</g:link>
							</g:if>
							<img width="320" class="image"
								src="/LoginGrail/images/upload/${fieldValue(bean:pictureInstance, field:'filename')}"
								alt="${fieldValue(bean:pictureInstance, field:'caption')}" />
							<p>${pictureInstance.caption} (dodano ${pictureInstance.dateAdded})</p>
						</g:each>
	            		<div class="clear"/>
	                </div>
	                <div id="footer"><a href="http://www.freecss.info">Free CSS Templates </a></div>
	            </div>
	        </div>
	    </div>
	</body>
</html>



