<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="layout" content="main" />
        <title>Inwestycja: ${investmentInstance.name}</title>
    </head>
    <body>
        <div id="main">
            <div id="wrapper">
                <g:render template="/shared/menu" />
        <div class="body">
            <h1><g:link controller="investment">Inwestycja</g:link>->${investmentInstance.name}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                    <li><g:link controller="folder" action="list" id="${investmentInstance.id}">Galeria</g:link></li>
                                    <li><g:link controller="news" action="list" id="${investmentInstance.id}">Dziennik budowy</g:link></li>
                                </ul>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <g:render template="/shared/footer" />
        </div>
    </div>
</body>
</html>
