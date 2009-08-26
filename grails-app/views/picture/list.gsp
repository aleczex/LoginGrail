<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
        <meta name="layout" content="main" />
        <g:javascript src="highslide/highslide.js" />
        <g:javascript src="highslide/highslide.config.js" charset="utf-8"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir:'js/highslide',file:'highslide.css')}" />
        <!--[if lt IE 7]>
	        <link rel="stylesheet" type="text/css" href="${resource(dir:'js/highslide',file:'highslide-ie6.css')}" />
		<![endif]-->          
		<title>Galeria</title>
	</head>
	<body>
		<div id="main">
			<div id="wrapper">
				<g:render template="/shared/menu" />
				<g:if test="${session.user != null}">
					<li><g:link class="create" action="create" id="${folderInstance.id}">Nowy obrazek</g:link></li>
				</g:if>
				<g:render template="/shared/menuend" />
				<div id="imagelist">
				    <div id="folder">
				    	<g:link controller="folder" action="list"><h1>${folderInstance.name}</h1></g:link>
					</div>
					<g:each in="${pictureInstanceList}" status="i" var="pictureInstance">
						<div id="imageframe">
							<g:if test="${session.user != null}">
								<g:link action="show" id="${pictureInstance.id}">Edytuj</g:link>
							</g:if>
							
							
							<g:set var="path" value="${fieldValue(bean:pictureInstance, field:'filename')}" />
							<g:set var="res" value="${resource(dir:'/images/upload')}" />
							<a href="${res}/${path}" class="highslide" onclick="return hs.expand(this)"
							 title="${fieldValue(bean:pictureInstance, field:'caption')}" style="margin: 0 0 10px 15px">
								<img src="${res}/${path}" alt="" width="320" />
							</a>
							<p>${pictureInstance.caption} (dodano ${pictureInstance.dateCreated} [${pictureInstance.user.nick}])</p>
						</div>
						<div id="commentframe">
							<g:link action="create" controller="comment" params="[id: pictureInstance.id, folderid: folderInstance.id]">Skomentuj</g:link>
							<g:findAll in="${commentInstanceList}" expr="it.picture == pictureInstance">
     							<p>${it.description} 
     							<g:if test="${it.user != null}">/${it.user.nick}</g:if>
     							<g:else>/~anonim</g:else></p>
							</g:findAll>
						</div>
						<div class="clear"></div>
					</g:each>
    		    </div>
				<div id="footer"><a href="http://www.freecss.info">Free CSS Templates </a></div>
			</div>
		</div>			
	</body>
</html>
