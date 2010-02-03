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
	</head>
	<body>
	<div id="main">
		<div id="wrapper">
            <g:render template="/shared/menu" />
			<div id="bannerbg">
				<div id="banner">
					<h1>Nowości na stronie</h1>
					<div class="leftcontent">
						<br/><b>Już teraz możesz dodać swoją inwestycję i podzielić się swoimi zdjęciami z innymi!</b><br/><a href="users/register" title="Zarejestruj się" style="margin: 0 0 10px 15px">Kliknij tutaj.</b></a>

               		</div>
					<div class="rightcontent">
                        <a href="${resource(dir:'images', file:'logo.jpg')}" class="image" onclick="return hs.expand(this)"
                            title="Nasza Żurawinka 2 lustrzane odbicie - wizualizacja na podstawie planu domu zmienionego przez architekta" style="margin: 0 0 10px 15px">
                            <img src="${resource(dir:'images', file:'logo_200.jpg')}" alt="" width="200" onclick="return hs.expand(this)"/>
                        </a>
                    </div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="contentmain">
				<div class="leftcolumn"> 
					<h2>Ostatnie wpisy w dzienniku budowy:</h2>
                    <div id="shortnews">
                    <g:each in="${newsInstanceList}" var="newsInfo">
						<g:set var="newsInstance" value="${newsInfo.get(0)}" />
                        <p><h4>${fieldValue(bean:newsInstance, field:'description')}</h4></p>
						Inwestycja: ${newsInfo.get(1)} - (<g:formatDate format="yyyy-MM-dd" date="${newsInstance?.dateCreated}"/>)
                    </g:each>
                    </div>
					<h2>Nowe komentarze:</h2>
                    <div id="shortnews">
                    <g:each in="${latestCommentsList}" var="commentInfo">
						<g:set var="commentInstance" value="${commentInfo.get(0)}" />
						<g:set var="pictureInstance" value="${commentInfo.get(2)}" />
                        <p><h4>${fieldValue(bean:commentInstance, field:'description')}</h4></p>
                        <a href="picture/list/${pictureInstance?.folderId?.encodeAsHTML() + '#' + pictureInstance?.id.encodeAsHTML()}" 
                         	title="Zobacz komentowane zdjęcie" style="margin: 0 0 10px 15px">
						Inwestycja: ${commentInfo.get(1)} - (<g:formatDate format="yyyy-MM-dd" date="${commentInstance.dateCreated}"/>)
                         	
                         	</a>
                    </g:each>
                    </div>					
				</div>
				<div class="rightcolumn">
                    <h2>Najnowsze zdjęcia:</h2>
			        <div id="shortnews">
			        <g:each in="${latestPicturesList}" var="pictureInfo">
                        <g:set var="pictureInstance" value="${pictureInfo.get(0)}" />
                         <g:set var="path" value="${fieldValue(bean:pictureInstance, field:'filename')+'_100.jpg'}" />
                         <g:set var="res" value="${resource(dir:'/images/upload')}" />
                         <a href="picture/list/${pictureInstance?.folderId?.encodeAsHTML() + '#' + pictureInstance?.id.encodeAsHTML()}" 
                         	title="${fieldValue(bean:pictureInstance, field:'caption')}" style="margin: 0 0 10px 15px">
                              <img src="${res}/${path}" alt="" width="100" />
                         </a>
                         <p>Inwestycja: ${pictureInfo.get(1)} - ${pictureInstance?.caption} (<g:formatDate format="yyyy-MM-dd" date="${pictureInstance?.dateCreated}"/> [${pictureInstance?.user.username}])</p>
			        </g:each>
			        </div>
				</div>
				<div class="clear"></div>
			</div>
            <g:render template="/shared/footer" />
		</div>
	</div>
</body>
</html>

