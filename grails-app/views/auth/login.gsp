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
            <div class="body">
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:form action="signIn">
			    <input type="hidden" name="targetUri" value="${targetUri}" />
                <div class="dialog">
                <p>Wpisz nazwę użytkownika (Twój adres email) i hasło:</p>
                <table class="userForm">
                    <tr class='prop'>
                        <td valign='top' style='text-align: left;' width='20%'>
                            <label for='username'>Username:</label>
                        </td>
                        <td valign='top' style='text-align: left;' width='80%'>
                            <input id="username" type='text' name='username' value='${username}' />
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' style='text-align: left;' width='20%'>
                            <label for='password'>Hasło:</label>
                        </td>
                        <td valign='top' style='text-align: left;' width='80%'>
                            <input id="password" type='password' name='password' value='${password}' />
                        </td>
                    </tr>
			        <tr>
			          <td>Remember me?:</td>
			          <td><g:checkBox name="rememberMe" value="${rememberMe}" /></td>
			        </tr>
                </table>
                </div>
                <div class="buttons">
                    <span class="button"> <g:actionSubmit action="signIn" value="Zaloguj się"/></input> </span>
                    <span class="button"> <g:actionSubmit action="forgotPassword" onclick="return confirm('Jesteś pewien? Na twój adres email podany podczas rejestracji zostanie wysłany mail z przypomnieniem hasła');" value="Przypomnij hasło"/></input> </span>
                </div>
            </g:form>
        </div>
    </body>
</html>


