<%-- 
    Document   : dodavanjeZaposlenogUtim
    Created on : Dec 22, 2017, 12:48:09 PM
    Author     : Nikola
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
    SELECT  z.Ime ,z.Pozicija ,t.nazivTima 
    FROM zaposleni AS z 
    INNER JOIN tim AS t 
    ON
    z.id = t.id_Zaposleni;
</sql:query>
<sql:query var="select" dataSource="${con}">
    select * from zaposleni
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Team</title>
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
        <section id="showcase">
            <div class="unosT">
                <form action="unosTimaa" method="POST">
                    <img src="img/tim.png" class="zaposleni">
                    <div class="select-style"> 
                        <select name="cbZaposleni">
                            <option>Employee name</option>
                            <c:forEach var="result" items="${select.rows}"> 
                                <option>${result.Ime} ${result.Prezime}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <input type="text" name="nazivTima" placeholder="Team name"> 
                    <button class="btnUnesiZaposlenog">Submit</button>
                </form>
            </div>
        </section>
        <div class="tabelaZaposlenih">
            <table id="tabelaPrikazZaposlenihth">
                <tr>
                    <th>Name</th>
                    <th>Position</th>
                    <th>Team name</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <c:forEach var="y" items="${x.rows}">
                    <tr>
                        <td>${y.Ime}</td>
                        <td>${y.Pozicija}</td>
                        <td>${y.nazivTima}</td>
                        <td><a href="EditServletZaposlenog?id=${y.id}">Promeni</a></td>
                        <td><a href="DeleteFormaZaposlenog?id=${y.id}">Obrisi</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <footer>
            <div class="homePage-footer">
                <div class="container">
                    <div class="row center-xs center-sm center-md center-ld middle-xs middle-sm middle-md middle-ld"
                         <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                            <p> &copy; 2018 | Made by Nikola Mrkic </p>
                        </div>
                    </div>
                    </footer>
                    </body>
                    </html>