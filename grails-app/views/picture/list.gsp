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
                <h1><g:link controller="investment">Inwestycja</g:link>-><g:link controller="investment" action="show" id="${investmentInstance.id}">${investmentInstance.name}</g:link>->
                <g:link controller="folder" action="list" id="${investmentInstance.id}">Galeria</g:link>->${folderInstance.name}
                    <g:if test="${session.user != null}">
                       <g:link class="create" action="create" id="${folderInstance.id}"> (Dodaj nowe zdjęcie)</g:link>
                    </g:if></h1>
				<div id="imagelist">
					<g:each in="${pictureInstanceList}" status="i" var="pictureInstance">
						<div>
							<div id="imageframe">
								<g:if test="${session.user != null}">
									<g:form method="post" >
						                <input type="hidden" name="id" value="${pictureInstance?.id}" />
						                <input type="hidden" name="version" value="${pictureInstance?.version}" />
						                <div class="buttons">
						                	<span class="button"><g:actionSubmit action="edit" value="Edytuj" /></span>
						                    <span class="button"><g:actionSubmit action="delete" onclick="return confirm('Czy jesteś pewien? Zostaną usunięte wszystkie komentarze dodane do tego zdjęcia.');" value="Usuń" /></span>
						                </div>
						            </g:form>									
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
						</div>
						<div class="clear"></div>
					</g:each>
            </div>
            <g:render template="/shared/footer" />
        </div>
    </div>
</body>
</html>
