<%-- 
    Document   : dodavanjeZaposlenogUtim
    Created on : Dec 22, 2017, 12:48:09 PM
    Author     : nikol
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" var="con" url="jdbc:mysql://localhost/ucinak_zaposlenog" user="root" password="" />

<sql:query var="x" dataSource="${con}"> 
    SELECT z.id, z.Ime ,z.Pozicija ,t.nazivTima 
    FROM zaposleni AS z 
    INNER JOIN tim AS t 
    ON
    z.id = t.id_Zaposleni
   ;
</sql:query>
<sql:query var="select" dataSource="${con}">
    select * from zaposleni
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
                <form action="unosTimaa"method="get">

                    <select name="cbZaposleni">
                        <option>Naziv zaposlenog</option>
                        <c:forEach var="result" items="${select.rows}"> 
                            <option>${result.Ime} ${result.Prezime}</option>
                        </c:forEach>
                        <br></br>
                        <input type="text" name="nazivTima" placeholder="naziv tima"> 


                        <input type="submit" class="btnZaposleniTim" value="Unesi" />
                </form>
            </div>
            <table id="tabelaPrikazZaposlenogINjegovogUcinka">

                <tr>
                    <th>Br.</th>
                    <th>Ime</th>
                    <th>Pozicija</th>
                    <th>Naziv tima</th>
                    

                <h1>Prikaz ucinka zaposlenog</h1>
                </tr>
                <c:forEach var="y" items="${x.rows}">
                    <tr>

                        <td>${y.id}</td>
                        <td>${y.Ime}</td>
                        <td>${y.Pozicija}</td>
                        <td>${y.nazivTima}</td>
                        

                    </tr>
                </c:forEach>
            </table>
            <div class="footer"><h6>© 2017 made by Nikola Mrkic </h6></div>
        </div>
    </body>
</html>
