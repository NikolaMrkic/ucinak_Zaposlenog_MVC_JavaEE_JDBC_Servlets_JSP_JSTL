<%-- 
    Document   : unosZaposlenog
    Created on : Dec 18, 2017, 12:51:06 PM
    Author     : nikol
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" var="con" url="jdbc:mysql://localhost/ucinak_zaposlenog" user="root" password="" />
 
<sql:query var="x" dataSource="${con}"> 
    SELECT id, Ime, Prezime, jmbg, Pozicija FROM zaposleni
    </sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Zaposleni</title>
    </head>
    <body>
          <div class="header"><h2>Zaposleni</h2></div>
        <div class="pozadinaUnosZaposlenog">
       
        
         <form action="unosZaposlenog"method="get">
            <h2>Unos zaposlenog</h2>
            <table  id="tabelaUnosZaposlenih"> 
                
                
                    <tr>
                        <td>Ime</td>
                        <td><input type="text" name="tfIme" value=""></td>
                    </tr>
                    <tr>
                        <td>Prezime</td>
                        <td><input type="text" name="tfPrezime" value=""></td>
                    </tr>
                    <tr>
                        <td>jmbg</td>
                        <td><input type="text" name="tfJmbg" value=""></td>
                    </tr>
                    <tr>
                        <td>Pozicija</td>
                        <td><input type="text" name="tfPozicija" value=""></td>
                    </tr>
                    <tr>
                     <td colspan="5"> 
                         <input type="submit" class="btnUnesiZaposlenog" value="Upisi" />  </td>
                    
                </tr>
                
            </table>

            
        </form>
         
         <form class="unosIPrikazZaposlenog"
         
         <h2>Prikaz zaposlenih</h2>
         
         <table id="tabelaPrikazZaposlenihth">
            
            <tr>
                <th>Br.</th>
                <th>Ime</th>
                <th>Prezime</th>
                <th>jmbg</th>
                <th>Pozicija</th>
                <th>Promeni</th>
                <th>Obrisi</th>
                
            </tr>
            <c:forEach var="y" items="${x.rows}">
            <tr>
            
                <td>${y.id}</td>
                 <td>${y.Ime}</td>
                  <td>${y.Prezime}</td>
                   <td>${y.jmbg}</td>
                    <td>${y.Pozicija}</td>
                    
                    <td><a href="EditServletZaposlenog?id=${y.id}">Promeni</a></td>
                    <td><a href="DeleteFormaZaposlenog?id=${y.id}">Obrisi</a></td>
                    
            </tr>
             </c:forEach>
        </table>
             </form>
             <div class="footer"><h6>© 2017 made by Nikola Mrkic </h6></div>
         
        </div>
    </body>
</html>
