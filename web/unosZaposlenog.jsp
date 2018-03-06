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
                        <li><a href="pocetna.jsp">Home</a></li>
                        <li class="current"><a href="unosZaposlenog.jsp">Employee</a></li>
                        <li><a href="dodavanjeZaposlenogUtim.jsp">Team</a></li>
                        <li><a href="dodavanjeTimaUProjekat.jsp">Project</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        
        
        <img src='img/img.jpg' style='position:fixed;top:0px;left:0px;width:100%;height:100%;z-index:-1;'>

        <section id="showcase">
            <div class="unosZaposlenog">
                <img src="img/zaposleni.png" class="zaposleni">


                     <form action="unosZaposlenog" method="POST">

                    <div class="input-filed">
                        <label class="active"for="name">Name</label>
                        <input type="text" id="name" name="tfIme" value="">

                    </div>
                    <div class="input-filed">
                        <label class="active" for="name">Surname</label>
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

        </section>

        <div class="tabelaZaposlenih">
            <table id="tabelaPrikazZaposlenihth">

                <tr>
                   
                    <th>Name</th>
                    <th>Surname</th>
                    <th>Id card</th>
                    <th>Position</th>
                    <th>Edit</th>
                    <th>Delete</th>

                </tr>
                <c:forEach var="y" items="${x.rows}">
                    <tr>

                       
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
                </div>


                        </footer>
                        </body>
                        </html>
