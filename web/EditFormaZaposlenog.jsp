<%-- 
    Document   : EditZaposlenog
    Created on : Dec 20, 2017, 12:10:25 PM
    Author     : nikol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css"/>
        <title>Promena Zaposlenog</title>
    </head>
    <body>
        
        
        <div class="pozadinaEditFormaZaposlenog">
            <div class="header"><h2>Promena  zaposlenog</h2></div>
            
            <div class="promenaZaposlenog">
            
        <form action="updateZaposlenog" method="POST">
            
            <c:forEach var="vehicle" items="${list}">
                <input type="hidden" name="id" value="${Zaposleni.id}"/>
            
           <table  id="tabelaUnosZaposlenih"> 
                <tr>
                    <td>Ime :</td>
                    <td><input type="text"  name="tfImeZ" value="${Zaposleni.ime}"</td>
                </tr>
                <tr>
                    <td>Prezime Zaposlenog:</td>
                    <td><input type="text"  name="tfPZ" value="${Zaposleni.prezime}"</td>
                </tr>
                <tr>
                    <td>JMBG Zaposlenog:</td>
                    <td><input type="text"  name="tfJBMGZ" value="${Zaposleni.jmbg}"</td>
                </tr>
                <tr>
                    <td>Pozicija Zaposlenog:</td>
                    <td><input type="text"  name="tfPoZ" value="${Zaposleni.pozicija}"</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input class="btnPromeniZaposlenog" type="submit" value="PROMENI" /></td>
                </tr>
            </table>
                </div>
                
              
        </form>
                
                </div>
                
                <div class="footer"><h6>© 2017 made by Nikola Mrkic </h6></div>
               
    </body>
</html>
