<%-- 
    Document   : dodavanjeZaposlenogUtim
    Created on : Dec 22, 2017, 12:48:09 PM
    Author     : nikol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" var="con" url="jdbc:mysql://localhost/ucinak_zaposlenog" user="root" password="" />

<sql:query var="x" dataSource="${con}"> 
   SELECT z.id, z.Ime ,z.Pozicija ,t.nazivTima ,p.naziv_projekta ,p.br_radnih_sati
FROM zaposleni AS z 
INNER JOIN tim AS t 
ON
z.id = t.id_Zaposleni
INNER JOIN projekat AS p 
ON
t.id= p.id_Tim;
    </sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>JSP Page</title>
    </head>
    <body>
          <div class="header"><h2>Tim</h2></div>
        <div class="pozadinaDodavaneZapolenogUTim">
        <div class="divZaposleniTim">
            
        <select class="combobox" name="cbZaposleni">
            <option>naziv zaposlenog</option>
             </select>
            <br></br>
            <input type="text" name="nazivTima" placeholder="naziv tima"> 
            
           
            <input type="submit" class="btnZaposleniTim" value="Unesi" />
            </div>
             <table id="tabelaPrikazZaposlenogINjegovogUcinka">
            
            <tr>
                <th>Br.</th>
                <th>Ime</th>
                <th>Pozicija</th>
                <th>Naziv tima</th>
                <th>Naziv projekta</th>
                <th>Br. radnih sati na projektu</th>
                
                  <h1>Prikaz ucinka zaposlenog</h1>
            </tr>
            <c:forEach var="y" items="${x.rows}">
            <tr>
            
                <td>${y.id}</td>
                 <td>${y.Ime}</td>
                  <td>${y.Pozicija}</td>
                   <td>${y.nazivTima}</td>
                    <td>${y.naziv_projekta}</td>
                    <td>${y.br_radnih_sati}</td>
                    
            </tr>
             </c:forEach>
        </table>
        <div class="footer"><h6>© 2017 made by Nikola Mrkic </h6></div>
        </div>
    </body>
</html>
