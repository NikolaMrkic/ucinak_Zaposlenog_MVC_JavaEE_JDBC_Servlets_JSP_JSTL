<%-- 
    Document   : dodavanjeTimaUProjekat
    Created on : Dec 26, 2017, 11:59:44 AM
    Author     : nikol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource driver="com.mysql.jdbc.Driver" var="con" url="jdbc:mysql://localhost/ucinak_zaposlenog" user="root" password="" />

<sql:query var="x" dataSource="${con}"> 
    SELECT  p.id, z.Ime,z.Prezime,z.Pozicija ,t.nazivTima ,p.naziv_projekta ,p.br_radnih_sati
    FROM zaposleni AS z 
    INNER JOIN tim AS t 
    ON
    z.id = t.id_Zaposleni
    INNER JOIN projekat AS p 
    ON
    t.id= p.id_Tim;
</sql:query>
<sql:query var="select" dataSource="${con}">
    SELECT DISTINCT nazivTima FROM tim;
</sql:query>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Dodavanje tima u projekat</title>
    </head>
    <body>
        <header>
            <div class="container">
                <div id="logo">
                    <h1>Project Menagment System</h1>
                </div>
                <nav>
                    <ul>
                        <li><a href="pocetna.jsp">Home</a></li>
                        <li><a href="unosZaposlenog.jsp">Employee</a></li>
                        <li class="current"><a href="dodavanjeZaposlenogUtim.jsp">Team</a></li>
                        <li><a href="dodavanjeTimaUProjekat.jsp">Project</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <img src='img/img.jpg' style='position:fixed;top:0px;left:0px;width:100%;height:100%;z-index:-1;'>
        <form action="dodavanjeTimaUProjekat" method="get"> 
            <select name="cbTim" style="margin-top: 50px;
                    margin-bottom: 10px;"  >
                <option>NAZIV TIMA</option> 
                <c:forEach var="result" items="${select.rows}"> 
                    <option>${result.nazivTima}</option>
                </c:forEach>
            </select>
            <input type="text" name="nazivProjektaa" placeholder="NAZIV PROJEKTA" />
            <input type="text" name="brRadihSati" placeholder="BROJ RADNIH SATI NA PROJEKTU" />
            <input type="submit"  class="btnZaposleniTim" value="Dodaj" />
        </form>
    </div>
    <div id="tabelaPrikazZaposlenogINjegovogUcinka">
        <table id="tabelaPrikazZaposlenihth">
            <tr>
                <th>Br.</th>
                <th>Ime</th>
                <th>Prezime</th>
                <th>Pozicija</th>
                <th>Naziv tima</th>
                <th>Projekat</th>
                <th>Br. radnih sati na projektu</th>
                <th style="color: red;">AZURIRAJ</th>
                <th style="color: red;">OBRISI</th>
            </tr>
            <c:forEach var="y" items="${x.rows}">
                <tr>
                    <td>${y.id}</td>
                    <td>${y.Ime}</td>
                    <td>${y.Prezime}</td>
                    <td>${y.Pozicija}</td>
                    <td>${y.nazivTima}</td>
                    <td>${y.naziv_projekta}</td>
                    <td style="border: 1px;
                        color: red;">${y.br_radnih_sati}</td>
                    <td><a href="EditServletTimaUProjektu?id=${y.id}">Azuriranje</a></td>
                    <td><a href="DeleteOdredjeniProjekat?id=${y.id}">Obrisi</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="footer"><h6>© 2017 made by Nikola Mrkic </h6></div>
</div>
</body>
</html>
