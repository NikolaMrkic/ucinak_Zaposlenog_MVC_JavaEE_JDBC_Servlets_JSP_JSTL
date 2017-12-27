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
    SELECT  z.id, z.Ime,z.Prezime,z.Pozicija ,t.nazivTima ,p.naziv_projekta ,p.br_radnih_sati
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
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Dodavanje tima u projekat</title>
    </head>
    <body>

        <div class="pozadinaDodavanjeTimaUProjekat">
            <div class="header">Projekat</div>
            <div class="divZaposleniTim">
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
                            <td>${y.br_radnih_sati}</td>

                            <td><a href="EditServletZaposlenog?id=${y.id}">Azuriraj</a></td>
                            <td><a href="DeleteFormaZaposlenog?id=${y.id}">Obrisi</a></td>

                        </tr>
                    </c:forEach>
                </table>



            </div>

        </div>
        <div class="footer"><h6>© 2017 made by Nikola Mrkic </h6></div>
    </div>



</body>
</html>
