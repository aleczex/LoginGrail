<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Picture List</title>
    </head>
    <body>
        <div class="nav">
            <g:render template="/shared/menu" />
            <g:if test="${session.user != null}">
                <span class="menuButton"><g:link class="create" action="create">New Picture</g:link></span>
            </g:if>
        </div>
        <div class="body">
            <h1>Picture List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="caption" title="Caption" />
                        
                   	        <g:sortableColumn property="dateAdded" title="Date Added" />
                        
                   	        <g:sortableColumn property="filename" title="Filename" />
                        
                            <th>Folder</th>
                            <th>Picture</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pictureInstanceList}" status="i" var="pictureInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${pictureInstance.id}">${fieldValue(bean:pictureInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:pictureInstance, field:'caption')}</td>
                        
                            <td>${fieldValue(bean:pictureInstance, field:'dateAdded')}</td>
                        
                            <td>${fieldValue(bean:pictureInstance, field:'filename')}</td>
                        
                            <td>${fieldValue(bean:pictureInstance, field:'folder.name')}</td>
                            <td>
                                <img width="200" src="/LoginGrail/images/${fieldValue(bean:pictureInstance, field:'filename')}" alt="${fieldValue(bean:pictureInstance, field:'caption')}" />
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Galeria</title>
<link rel="stylesheet" type="text/css" href="../freecss/style.css"/>
</head>

<body>
       <div class="body">
            <h1>Picture List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="Id" />
                        
                            <g:sortableColumn property="caption" title="Caption" />
                        
                            <g:sortableColumn property="dateAdded" title="Date Added" />
                        
                            <g:sortableColumn property="filename" title="Filename" />
                        
                            <th>Folder</th>
                            <th>Picture</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pictureInstanceList}" status="i" var="pictureInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${pictureInstance.id}">${fieldValue(bean:pictureInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:pictureInstance, field:'caption')}</td>
                        
                            <td>${fieldValue(bean:pictureInstance, field:'dateAdded')}</td>
                        
                            <td>${fieldValue(bean:pictureInstance, field:'filename')}</td>
                        
                            <td>${fieldValue(bean:pictureInstance, field:'folder.name')}</td>
                            <td>
                                <img width="200" src="/LoginGrail/images/${fieldValue(bean:pictureInstance, field:'filename')}" alt="${fieldValue(bean:pictureInstance, field:'caption')}" />
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
      <div class="center">
         <g:each in="${pictureInstanceList}" status="i" var="pictureInstance">
               <h3>${params.folderid}</h3>
                <g:set var="folder" value="${pictureInstance.folder}" />
                <h2>${folder.id}</h2> 
             <g:if test="${folder.id == params.folderid}">
                 <img width="200" src="/LoginGrail/images/${fieldValue(bean:pictureInstance, field:'filename')}" alt="${fieldValue(bean:pictureInstance, field:'caption')}" />
             </g:if>
         </g:each>
      </div>
      <div class="clear"></div>
  </div>
  <div id="footer"><a href="http://www.freecss.info">Free CSS Templates </a></div>
  </div>
</div>
</body>
</html>