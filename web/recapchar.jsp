<%-- 
    Document   : recapchar
    Created on : Mar 3, 2022, 7:59:46 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Recapchar</title>
        <script>
            grecaptcha.ready(function () {
                grecaptcha.execute('6LdZp8IeAAAAAF727ndDx1-Mh4eo-9P13jc-H28u', {action: 'register'}).then(function (token) {
                    $('#captchatoken').val(token)
                });
            });
        </script>
    </head>
    <body>
        <form action="Test" method="POST">
          
            <br>
            <input type="hidden" id="captchatoken" name="captchatoken" size="1" value=""/>
            <input type="submit" value="submit">

        </form>
        <script src="https://www.google.com/recaptcha/api.js?render=6LdZp8IeAAAAAF727ndDx1-Mh4eo-9P13jc-H28u"></script>
    </body>
</html>
