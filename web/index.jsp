<%-- 
    Document   : index
    Created on : Dec 17, 2017, 12:12:24 AM
    Author     : nikol
--%>
<!DOCTYPE html>
<html>
    <head>
        <!-- My css-->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <!--flaxboxgrid-->
        <link rel="stylesheet" type="text/css" href="css/flexboxgrid.css">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">


        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Login Form</title>

    </head>

    <body>
        <!--Pozicioniranje slike preko celog ekrana -->
        <img src='img/logovanje.jpg' style='position:fixed;top:0px;left:0px;width:100%;height:100%;z-index:-1;'>
        <section id="showcase">
            <div class="container">
                <div class="row center-xs center-sm center-md center-ld middle-xs middle-sm middle-md middle-ld">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 showcase-content">

                        <h3>User Login</h3>
                        <form  action="logovanjeServlet" method="get">
                            <div class="input-filed">
                                <label class="active" for="name">Username</label>
                                <input type="text" id="name" name="korisnickoIme">
                            </div>
                            <div class="input-filed">
                                <label class="active" for="name">Password</label>
                                <input type="password" id="name" name="lozinka">
                            </div>
                            <button class="btnLogIn">Submit</button>
                    </div>

                    </form>

                </div>
            </div>
        </div>
    </div>
</section>




<!--Import jQuery before materialize.js-->
<footer>
    <div class="login-footer">
        <div class="container">
            <div class="row center-xs center-sm center-md center-ld middle-xs middle-sm middle-md middle-ld"
                 <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                    <p> &copy; 2018 | Made by Nikola Mrkic </p>
                </div>

                </footer>
                </body>
                </html>

