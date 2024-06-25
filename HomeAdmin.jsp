<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Health Plus || Your Personal Health Assistant</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <!-- Responsive stylesheet  -->
    <link rel="stylesheet" type="text/css" href="css/responsive.css">

    <!-- Favicon -->
    <link href="img/favicon.png" rel="shortcut icon" type="image/png">
</head>
 
<body>

    <div class="preloader"></div>

    <!-- Header navbar start -->
    <!-- <div class="header-topbar style-2">
        <div class="container padding-none">
            <div class="row">
                <div class="col-md-8 col-sm-6 welcome-top">
                    <ul class="list-inline top-icon">
                        <li><i class="fa fa-envelope"></i> contact@youdomain.com</li>
                        <li><i class="fa fa-clock-o"></i> Mon - Sat 8.00 - 18.00</li>
                    </ul>
                </div>
                <div class="col-md-4 col-sm-6">
                    <ul class="list-inline text-right icon-style-1">
                        <li class=" hvr-rectangle-out"><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                        <li class=" hvr-rectangle-out"><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                        <li class=" hvr-rectangle-out"><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                        <li class=" hvr-rectangle-out"><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                        <li class=" hvr-rectangle-out"><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div> -->

    <div class="main-navbar conner-style style-2 position-fixed">
        <div class="container padding-none">
            <div class="row">
                <div class="col-md-12">
                    <nav class="navbar navbar-default">
                        <!-- <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand dis-block" href="index-2.html"><img src="img/health-plus.jpeg" alt="">
                                </a>
                        </div> -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" data-hover="dropdown" data-animations-delay="1.8s" data-animations="fadeInUp">
                            <ul class="nav navbar-nav bg-none navbar-right style-3">
                                <li><a href="HomeAdmin.jsp">Home</a></li>
                                <li><a href="signup.jsp">Add User</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span data-hover="Services"></span>Manage Appointments</span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Book Appointment</a></li>
                                        <li><a href="#">Update Appointment</a></li>
                                        <li><a href="#">Cancel Appointment</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <div class="dropdown-buttons">
                                        <div class="btn-group">
                                            <button type="button" class="btn dropdown-toggle" id="header-drop-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span>Hi, <%= session.getAttribute("currentUserFirstname") %></span>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-right cart dropdown-animation" aria-labelledby="header-drop-4">
                                                <li><a href="Account.jsp">Account</a></li>
                                                <li><a href="ChangePassword.jsp">Change Password</a></li>
                                                <li><a href="Logout">Logout</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- Header navbar end -->

   <!-- divider start -->
    <section class="service-area over-layer-default" style="background-image:url(img/bg/5.jpg);">
        <div class="container padding-bottom-none padding-top-40">
            <div class="section-content">
                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <div class="service-item style-1 text-white border-right">
                            <div class="service-icon">
                                <i class="pe-7s-call"></i>
                            </div>
                            <div class="content">
                                <h5><a href="#">Give us a Call</a></h5>
                                <p>+1-773-555-9922</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6">
                        <div class="service-item style-1 text-white">
                            <div class="">
                                <i class="pe-7s-mail-open"></i>
                            </div>
                            <div class="content">
                                <h5><a href="#">Send us a Message</a></h5>
                                <p>healthplus@gmail.com</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- divider end -->

    <!-- Footer Style start -->
    <footer class="bg-faded">
        <div class="container">
            <div class="section-content">
                <div class="row margin-top-30">
                    <div class="col-md-4">
                      <div class="footer-item footer-widget-one">
                          <!-- <img alt="" src="img/logo.png" class="footer-logo"> -->
                          <p>Facing Problems? Have questions? Contact us.</p>

                          <ul class="address">
                            <li><i class="pe-7s-call"></i>Phone: +1-773-555-9922</li>
                            <li><i class="pe-7s-mail"></i><a href="mailto:">Email: healthplus@gmail.com</a></li>
                          </ul>
                          
                          <hr>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
  
    <a href="#" class="scrollup"><i class="pe-7s-up-arrow" aria-hidden="true"></i></a>
    <!-- jQuery -->
    <script type="text/javascript" src="js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <!-- all plugins and JavaScript -->
    <script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="js/css3-animate-it.js"></script>
    <script type="text/javascript" src="js/bootstrap-dropdownhover.min.js"></script>
    <script type="text/javascript" src="js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="js/gallery.js"></script>
    <script type="text/javascript" src="js/player.min.js"></script>
    <script type="text/javascript" src="js/retina.js"></script>
    <script type="text/javascript" src="js/comming-soon.js"></script>

    <!-- Main Custom JS -->
    <script type="text/javascript" src="js/script.js"></script>
</body>



</html>

