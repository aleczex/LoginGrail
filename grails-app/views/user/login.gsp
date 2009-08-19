<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="layout" content="main" />
        <title>Zaloguj</title>
    </head>
    <body>
    <div id="main">
        <div id="wrapper">
            <g:render template="/shared/menu" />
            <g:if test="${session.user != null}">
                <li><g:link class="create" action="create">Nowy użytkownik</g:link></li>
            </g:if>
            <g:render template="/shared/menuend" />
            <div class="body">
			<g:form action="doLogin" method="post">
				<div class="dialog">
				<p>Wpisz nazwę użytkownika (Twój adres email) i hasło:</p>
				<table class="userForm">
					<tr class='prop'>
						<td valign='top' style='text-align: left;' width='20%'><label
							for='email'>Adres email:</label></td>
						<td valign='top' style='text-align: left;' width='80%'><input
							id="email" type='text' name='email' value='${user?.email}' /></td>
					</tr>
					<tr class='prop'>
						<td valign='top' style='text-align: left;' width='20%'><label
							for='password'>Haslo:</label></td>
						<td valign='top' style='text-align: left;' width='80%'><input
							id="password" type='password' name='password'
							value='${user?.password}' /></td>
					</tr>
				</table>
				</div>
				<div class="buttons"><span class="formButton"> <input
					type="submit" value="Login"></input> </span></div>
			</g:form> 
		</div>
	</body>
</html>