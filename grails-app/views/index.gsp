<!--<html>
    <head>
        <title>Zurawinka</title>
		<meta name="layout" content="main" />
    </head>
    <body>
        <div class="nav">
            <g:render template="/shared/menu" />
        </div>
        <h1 style="margin-left:20px;">Menu</h1>
        <p style="margin-left:20px;width:80%">:</p>
        <div class="dialog" style="margin-left:20px;width:60%;">
            <ul>
              <g:each var="c" in="${grailsApplication.controllerClasses}">
                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
              </g:each>
            </ul>
        </div>
    </body>
</html>-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ania i Alek buduj2</title>
<link rel="stylesheet" type="text/css" href="freecss/style.css"/>
</head>

<body>
<div id="main">
  <div id="wrapper">
  <div id="header">
    <div class="logo"><a href="#" class="logo"><span>Nasz</span>Domek</a></div>
    <div id="top">
    <div id="user">Ostatnia aktualizacja: 10-07-2009</div>
    <div id="nav">
  <div id="navcontainer">
<ul id="navlist">
<li><a href="index.html">Home</a></li>
<li><g:link controller="folder">Galeria</g:link></li>
<li><a href="diary.html">Dziennik budowy</a></li>
<li><a href="kontakt.html">Kontakt</a></li>
</ul>
</div>
</div>
    </div>
    <div class="clear"></div>
    </div>
  <div id="bannerbg">
    <div id="banner">
      <h1>Krtki opis co to ma by  </h1>
      <div class="leftcontent">
      zurawinka 2 odbicie lustrzane</div>
       <div class="rightcontent"><img src="photos/logo.jpg" alt="woodland" width="372" class="image" /></div>
       <div class="clear"></div>
    </div>
    </div>
    <div class="contentmain">
      <div class="leftcolumn">
        <h2>Free CSS Template </h2>
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
        <h3>Nowa wiadomosc</h3>
          <p> Na razie jeszcze nic nowego tutaj nie ma :)</p>
        <div class="body">
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="dateCreated" title="Date Created" />
                            <g:sortableColumn property="description" title="Description" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${newsInstanceList}" status="i" var="newsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${fieldValue(bean:newsInstance, field:'dateCreated')}</td>
                            <td>${fieldValue(bean:newsInstance, field:'description')}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>

      </div>
      <div class="clear"></div>
  </div>
  <div id="footer"><a href="http://www.freecss.info">Free CSS Templates </a></div>
  </div>
</div>
</body>
</html>