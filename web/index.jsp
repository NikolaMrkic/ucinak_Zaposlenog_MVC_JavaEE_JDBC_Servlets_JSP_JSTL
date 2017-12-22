<%-- 
    Document   : index
    Created on : Dec 17, 2017, 12:12:24 AM
    Author     : nikol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml"
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Logovanje</title>
    </head>
    <body>
     
        <div class="pozadina">
       
        <div class="divLogIn">
            <form action="logovanjeServlet" method="get">
            <h1>Logovanje</h1>
        <input type="text" name="korisnickoIme" placeholder="korisnocko ime">
        <input type="password" name="lozinka" placeholder="lozinka">
        <button class="btnLogIn">Uloguj se</button>
         </form>
        </div>
            </div>
        <div class="footer"><h6>© 2017 made by Nikola Mrkic </h6></div>
    </body>
</html>
