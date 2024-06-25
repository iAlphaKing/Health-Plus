<!DOCTYPE html>
<html>

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

    <!-- SignUp Form Validation -->
    <script>
        function validateForm() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            // Validate password and confirm password match
            if (password !== confirmPassword) {
                alert("Password and Confirm Password do not match.");
                return false;
            }

            return true;
        }
    </script>
</head>

<body>

    <div class="preloader"></div>

    <!-- Header navbar start -->
 <!--   <div class="header-topbar style-2">
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
    </div>-->

    <div class="main-navbar conner-style style-2 position-fixed">
        <div class="container padding-none">
            <div class="row">
                <div class="col-md-12">
                    <nav class="navbar navbar-default">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <!-- <a class="navbar-brand dis-none" href=""><img src="img/logo-black.png" alt="">
                                </a>
                            <a class="navbar-brand dis-block" href=""><img src="img/logo-black.png" alt="">
                                </a> -->
                        </div>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" data-hover="dropdown" data-animations-delay="1.8s" data-animations="fadeInUp">
                            <ul class="nav navbar-nav bg-none navbar-right style-3">
                                <% if(session.getAttribute("currentUserType") == null) { %>
                                <li><a href="/Health_Plus">Home</a></li>
                                <li><a href="login.html" class="btn" id="header-drop-4"><span>Login</span></a></li>
                                <% } else { %>
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
                                                <li><a href="#">Change Password</a></li>
                                                <li><a href="Logout">Logout</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <% } %>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- Header navbar end -->

    <div id="bootstrap-touch-slider" class="carousel bs-slider fade  control-round indicators-line" data-ride="carousel" data-pause="hover" data-interval="5000" >
        <div class="carousel-inner" role="listbox">
            <div class="item active" style="margin-left: 50px">
                    <h1 data-animation="animated fadeInRight"><span class="color-defult"> Registration </span>Page</h1>
                    <p data-animation="animated fadeInLeft">Please enter your details:</p>
                    <form action="Signup" method="post" style="margin-right: 100px" class="row g-3" onsubmit="return validateForm()">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="firstname" class="form-label" data-animation="animated fadeInRight"><span class="color-defult">First Name:</span></label>
                                <input type="text" data-animation="animated fadeInRight" id="firstname" name="firstname" class="input-field form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label for="lastname" class="form-label" data-animation="animated fadeInRight"><span class="color-defult">Last Name:</span></label>
                                <input type="text" data-animation="animated fadeInRight" id="lastname" name="lastname" class="input-field form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label for="email" class="form-label" data-animation="animated fadeInRight"><span class="color-defult">Email:</span></label>
                                <input type="text" data-animation="animated fadeInRight" id="email" name="email" class="input-field form-control" pattern="[^\s@]+@[^\s@]+\.[^\s@]+" title="Invalid email format." required>
                            </div>
                            <div class="col-md-6">
                                <label for="address" class="form-label" data-animation="animated fadeInRight"><span class="color-defult">Address:</span></label>
                                <input type="text" data-animation="animated fadeInRight" id="address" name="address" class="input-field form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label for="contact" class="form-label" data-animation="animated fadeInRight"><span class="color-defult">Contact:</span></label>
                                <input type="text" data-animation="animated fadeInRight" id="contact" name="contact" class="input-field form-control" pattern="\d{10}" title="Contact should be exactly 10 digits." required>
                            </div>
                            <div class="col-md-6">
                                <label for="password" class="form-label" data-animation="animated fadeInRight"><span class="color-defult">Password:</span></label>
                                <input type="password" data-animation="animated fadeInRight" id="password" name="password" class="input-field form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label for="confirmPassword" class="form-label" data-animation="animated fadeInRight"><span class="color-defult">Confirm Password:</span></label>
                                <input type="password" data-animation="animated fadeInRight" id="confirmPassword" name="confirmPassword" class="input-field form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label for="usertype" class="form-label" data-animation="animated fadeInRight"><span class="color-defult">User Type:</span></label>
                                <select data-animation="animated fadeInRight" id="usertype" name="usertype" class="input-field form-control" required>
                                    <option class="input-field form-control" value="customer">Customer</option>
                                    <% if(session.getAttribute("currentUserType") == null) { %>
                                    <option class="input-field form-control" value="admin">Administrator</option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <input type="submit" class="btn btn-primary" data-animation="animated fadeInRight" value="Register">
                            </div>
                        </div>
                    </form>
                    <% if(session.getAttribute("currentUserType") == null) { %>
                    <p>Already have an account? <a href="login.html">Login Here</a>.</p>
                    <% } %>
            </div>
        </div>
    </div>

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
