<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Ania i Alek buduja Zurawinke 2</title>
		<link rel="stylesheet" type="text/css" href="freecss/style.css"/>
	</head>
	<body>
	<div id="main">
		<div id="wrapper">
            <g:render template="/shared/menu" />
            <g:if test="${session.user != null}">
                <li><g:link class="list" controller="user" action="list">Lista uzytkownikow</g:link></li>
            </g:if> 
            <g:render template="/shared/menuend" />
			<div id="bannerbg">
				<div id="banner">
					<h1>Nowosci na stronie</h1>
					<div class="leftcontent">Dodane powiekszanie zdjec. <br/>Newsy wyswietlane od najnowszego do najstarszego.</div>
					<div class="rightcontent"><img src="freecss/logo.jpg" alt="woodland" width="200" class="image" /></div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="contentmain">
				<div class="leftcolumn">
					<h2>Na skroty </h2>
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
                        <iframe id="shortnews" height="200" name="auto" src="news/shortlist" scrolling="no" frameborder="0">
                        </iframe>
				</div>
                    <div class="clear"></div>
			</div>
			<div id="footer"><a href="http://www.freecss.info">Free CSS Templates</a></div>
		</div>
	</div>
</body>
</html>

