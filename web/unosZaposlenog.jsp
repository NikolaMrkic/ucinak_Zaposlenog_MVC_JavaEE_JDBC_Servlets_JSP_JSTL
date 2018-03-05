<%-- 
    Document   : unosZaposlenog
    Created on : Dec 18, 2017, 12:51:06 PM
    Author     : Nikola
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" var="con" url="jdbc:mysql://localhost/ucinak_zaposlenog" user="root" password="" />

<sql:query var="x" dataSource="${con}"> 
    SELECT id, Ime, Prezime, jmbg, Pozicija FROM zaposleni
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/flexboxgrid.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">



        <title>Wellcome to Project Menagment System</title>
    </head>
    <body>

        <header>
            <div class="container">
                <div id="logo">
                    <h1>Project Menagment System</h1>
                </div>
                <nav>
                    <ul>
                        <li><a href="homePage.html">Home</a></li>
                        <li class="current"><a href="employee.html">Employee</a></li>
                        <li><a href="index.html">Team</a></li>
                        <li><a href="index.html">Project</a></li>
                    </ul>
                </nav>
            </div>
        </header
        <div>
        </div>
        <img src='img/logovanje.jpg' style='position:fixed;top:0px;left:0px;width:100%;height:100%;z-index:-1;'>
        <div class="container">
            <section id="showcase">
                <div class="unosZaposlenog">
                    <img src="img/zaposleni.png" class="zaposleni"


                         <form action="unosZaposlenog" method="POST">

                        <div class="input-filed">
                            <label class="active"for="name">First name</label>
                            <input type="text" id="name" name="tfIme" value="">

                        </div>
                        <div class="input-filed">
                            <label class="active" for="name">Second name</label>
                            <input type="text"id="name" name="tfPrezime" value="" >
                        </div>
                        <div class="input-filed">
                            <label class="active" for="name">Id card</label>
                            <input type="text"id="name" name="tfJmbg" value="" >
                        </div>
                        <div class="input-filed">
                            <label class="active" for="name">Position</label>
                            <input type="text" id="name" name="tfPozicija" value="" >
                        </div>

                        
                         <button class="btnUnesiZaposlenog">Submit</button>
                    </form>
                </div>

            </section

            <div class="tabelaZaposlenih">
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
            </div>
            <footer>
                <div class="homePage-footer">
                    <div class="container">
                        <div class="row center-xs center-sm center-md center-ld middle-xs middle-sm middle-md middle-ld"

                             <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                                <p> &copy; 2018 | Made by Nikola Mrkic </p>
                            </div>



                            </footer>
                            </body>
                            </html>
