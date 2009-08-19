<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
        <meta name="layout" content="main" />
		<title>Ania i Alek budują Żurawinkę 2</title>
	</head>
	<body>
	<div id="main">
		<div id="wrapper">
            <g:render template="/shared/menu" />
            <g:if test="${session.user != null}">
                <li><g:link class="list" controller="user" action="list">Lista użytkowników</g:link></li>
            </g:if> 
            <g:render template="/shared/menuend" />
			<div id="bannerbg">
				<div id="banner">
					<h1>Nowości na stronie</h1>
					<div class="leftcontent">Dodane powiększanie zdjęć. <br/>Newsy wyświetlane są teraz od najnowszego do najstarszego.<br/>Polskie literki w menu.<br/>Wreszcie style poprawione :-)</div>
					<div class="rightcontent"><img src="freecss/logo.jpg" alt="obrazek" width="200" class="image" /></div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="contentmain">
				<div class="leftcolumn">
					<h2>Na skróty:</h2>
					<div id="navvy">
						<ul id="navvylist">
							<li><a href="#">Home</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">About</a></li>
							<li><a href="#">Sitemap</a></li>
							<li><a href="#">Templates</a></li>
						</ul>
					</div>
					<h2>This Template </h2>
This is yet another free release from www.freecss.info.  If you downloaded it from a site other than www.freecss.info or www.webmaster-files.com please email me at info@freecss.info.     
				</div>
				<div class="rightcolumn">
                    <h2>Co nowego?</h2>
                    <object height="250" data="news/shortlist" type="text/html" width="100%">
                        <a href="news/shortlist">ten dokument</a>
                    </object>
				</div>
				<div class="clear"></div>
			</div>
			<div id="footer"><a href="http://www.freecss.info">Free CSS Templates</a></div>
		</div>
	</div>
</body>
</html>

