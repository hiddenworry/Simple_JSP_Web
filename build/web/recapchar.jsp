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
    <script type="text/javascript">
      var onloadCallback = function() {
        grecaptcha.render('html_element', {
          'sitekey' : '6LdGpDIeAAAAAHTRirSJH0-sNapUnWuZXWZ2nuBM'
        });
      };
    </script>
  </head>
  <body>
    <form action="LoginController" method="POST">
      <div id="html_element"></div>
      <br>
      <input type="submit" value="Submit">
    </form>
    <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
        async defer>
    </script>
  </body>
</html>
