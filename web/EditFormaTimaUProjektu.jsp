<%-- 
    Document   : EditFormaTimaUProjektu
    Created on : Dec 27, 2017, 12:18:56 PM
    Author     : nikol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <title>Edit Tima u Projektu</title>
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
                        <li><a href="dodavanjeZaposlenogUtim.jsp">Team</a></li>
                        <li class="current"><a href="dodavanjeTimaUProjekat.jsp">Project</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <img src='img/img.jpg' style='position:fixed;top:0px;left:0px;width:100%;height:100%;z-index:-1;'>
                <form action="updateZaposlenog" method="POST">
                    <c:forEach var="vehicle" items="${list}">
                        <input type="hidden" name="id" value="${Projekat.id}"/>
                        <table  id="tabelaUnosZaposlenih"> 
                            <tr>
                                <td>Naziv Projekta :</td>
                                <td><input type="text"  name="tfImeZ" value="${Projekat.nazivProjekta}"</td>
                            </tr>
                            <tr>
                                <td>Ukupan broj radnih sati:</td>
                                <td><input type="text"  name="tfPZ" style="border: 1px;
                                           color: red;" value="${Projekat.brRadihSai}"</td>
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
