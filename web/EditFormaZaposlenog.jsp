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

        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Promena Zaposlenog</title>
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
        

            <form action="updateZaposlenog" method="POST">

                <c:forEach var="vehicle" items="${list}">
                    <input type="hidden" name="id" value="${Zaposleni.id}"/>


                    <section id="showcase">
                        <div class="editZaposlenog">
                            <img src="img/zaposleni.png" class="zaposleni">


                            <form action="unosZaposlenog" method="POST">

                                <div class="input-filed">
                                    <label class="active"for="name">Name</label>
                                    <input type="text" id="name" name="tfIme" value="${Zaposleni.ime}">

                                </div>
                                <div class="input-filed">
                                    <label class="active" for="name">Surname</label>
                                    <input type="text"id="name" name="tfPrezime" value="${Zaposleni.prezime}" >
                                </div>
                                <div class="input-filed">
                                    <label class="active" for="name">Id card</label>
                                    <input type="text"id="name" name="tfJmbg" value="${Zaposleni.jmbg}" >
                                </div>
                                <div class="input-filed">
                                    <label class="active" for="name">Position</label>
                                    <input type="text" id="name" name="tfPozicija" value="${Zaposleni.pozicija}" >

                                </div>

                                <button class="btnUnesiZaposlenog">Change</button>


                            </form>
                        </div>

                    </section>

            </form>



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
