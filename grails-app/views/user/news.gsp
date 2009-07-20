

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>newsy</title>
</head>
<body>
<div class="body">
    <h1>Show User</h1>
    <%=newsy.get(0).description%> 
    <%=newsy.get(1).description%> 
    <g:if test="${session.user != null}">
	    <%=session.user%> 
    </g:if>
 

    <g:set var="num" value="${0}" /> 
    <g:while test="${num < newsy.size }">  
        <p><%=newsy.get(num).description%></p>
        <!--${num++}-->
    </g:while>
</div>

Upload Form: <br />
    <g:form action="upload" method="post" enctype="multipart/form-data">
        <input type="file" name="myFile" />
        <input type="submit" />
    </g:form>

</body>
</html>
