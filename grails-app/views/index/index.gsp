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
Nowa wersja dostępna, wkrótce możliwość rejestrowania się i dodawania zdjęć z własnych inwestycji.<br/>
Można dodawać komentarze do zdjęć.<br/>
Dodane powiększanie zdjęć. <br/>
Newsy wyświetlane są teraz od najnowszego do najstarszego.<br/>
Polskie literki w menu.<br/>
Wreszcie style poprawione :-)</div>
					<div class="rightcontent">
                        <a href="${resource(dir:'images', file:'logo.jpg')}" class="image" onclick="return hs.expand(this)"
                            title="Nasza Żurawinka 2 lustrzane odbicie - wizualizacja na podstawie planu domu zmienionego przez architekta" style="margin: 0 0 10px 15px">
                            <img src="${resource(dir:'images', file:'logo.jpg')}" alt="" width="200" onclick="return hs.expand(this)"/>
                        </a>
                    </div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="contentmain">
				<div class="leftcolumn"> 
					<h2>Ostatnie wpisy w dzienniku budowy:</h2>
                    <div id="shortnews">
                    <g:each in="${newsInstanceList}" var="newsInstance">
                        ${fieldValue(bean:newsInstance, field:'dateCreated')}
                        <p><h4>${fieldValue(bean:newsInstance, field:'description')}</h4></p>
                    </g:each>
                    </div>
					<h2>Nowe komentarze:</h2>
				</div>
				<div class="rightcolumn">
                    <h2>Najnowsze zdjęcia:</h2>
			        <div id="shortnews">
			        <g:each in="${latestPicturesList}" var="pictureInstance">
                         <g:set var="path" value="${fieldValue(bean:pictureInstance, field:'filename')}" />
                         <g:set var="res" value="${resource(dir:'/images/upload')}" />
                         <a href="picture/list/${pictureInstance.folderId.encodeAsHTML() + '#' + pictureInstance.id.encodeAsHTML()}" title="${fieldValue(bean:pictureInstance, field:'caption')}" style="margin: 0 0 10px 15px">
                              <img src="${res}/${path}" alt="" width="100" />
                         </a>
                         <p>${pictureInstance.caption} (dodano ${pictureInstance.dateCreated} [${pictureInstance.user.username}])</p>
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

