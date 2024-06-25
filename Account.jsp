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
                                <% if(session.getAttribute("currentUserType").equals("customer")) { %>
                                <li><a href="HomeUser.jsp">Home</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span data-hover="Services"></span>Services</span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="SearchLocations?method=All">All Services</a></li>
                                        <li><a href="SearchLocations?method=hospital">Hospitals</a></li>
                                        <li><a href="SearchLocations?method=dental_clinic,dentist,doctor,medical_lab,physiotherapist">Clinics</a></li>
                                        <li><a href="SearchLocations?method=pharmacy,drugstore">Pharmacies</a></li>
                                        <li><a href="SearchLocations?method=fitness_center,spa,gym,sports_club,swimming_pool">Health Clubs</a></li>
                                        <li><a href="#">Recommended</a></li>
                                    </ul>
                                </li>
                                <li><a href="AboutUs.jsp">About Us</a></li>

                                <li>
                                    <div class="dropdown-buttons">
                                        <div class="btn-group menu-search-box">
                                            <button type="button" class="btn dropdown-toggle" id="header-drop-3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon icon-Search"></i></button>
                                            <ul class="dropdown-menu dropdown-menu-right dropdown-animation" aria-labelledby="header-drop-3">
                                                <li>
                                                    <form role="search" class="search-box">
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" id="searchBox" placeholder="Search">
                                                            <i class="icon icon-Search form-control-feedback"></i>
                                                        </div>
                                                        <div class="form-group" id="resultContainer"></div>
                                                    </form>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="btn-group">
                                            <button type="button" class="btn dropdown-toggle" id="header-drop-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span>Hi, <%= session.getAttribute("currentUserFirstname") %></span>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-right cart dropdown-animation" aria-labelledby="header-drop-4">
                                                <li><a href="Account.jsp">Account</a></li>
                                                <li><a href="ViewAppointment">Appointments</a></li>
                                                <li><a href="ChangePassword.jsp">Change Password</a></li>
                                                <li><a href="Logout">Logout</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
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

    <!-- Counter start -->
    <div class="section-title">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 text-center">
                <h2>Your <span class="color-defult">Account</span></h2>
                <div class="line-border-center bg-defult"></div>
            </div>
        </div>
    </div>
    <section class="funfact-field over-layer-default" style="background-image: url('img/bg/6.jpg')">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 col-sm-6 col-xs-6">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4>First Name</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 col-sm-6 col-xs-6">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4>:</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6" style="border-right: 1px solid #FFF;">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4><%= session.getAttribute("currentUserFirstname") %></h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 col-sm-6 col-xs-6">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4>Last Name</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 col-sm-6 col-xs-6">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4>:</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4><%= session.getAttribute("currentUserLastname") %></h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2 col-sm-6 col-xs-6">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4>Email</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 col-sm-6 col-xs-6">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4>:</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6" style="border-right: 1px solid #FFF;">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4><%= session.getAttribute("currentUserEmail") %></h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 col-sm-6 col-xs-6">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4>Contact:</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 col-sm-6 col-xs-6">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4>:</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4><%= session.getAttribute("currentUserContact") %></h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2 col-sm-6 col-xs-6">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4>Address:</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 col-sm-6 col-xs-6">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4>:</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6" style="border-right: 1px solid #FFF;">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4><%= session.getAttribute("currentUserAddress") %></h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 col-sm-6 col-xs-6">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4>User Type:</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 col-sm-6 col-xs-6">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4>:</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="counter-col text-center">
                        <div class="count">
                            <h4><%= session.getAttribute("currentUserType") %></h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Counter end -->

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
                    <div class="col-md-4">
                      <div class="footer-item">
                        <div class="footer-title">
                          <h4>Our Pages</h4>
                          <div class="border-style-2"></div>
                        </div>
                        <ul class="footer-list border-deshed color-icon">
                          <li><i class="pe-7s-angle-right"></i><a href="AboutUs.jsp">About Us</a></li>
                          <li><i class="pe-7s-angle-right"></i><a href="SearchLocations?method=All">Services</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="footer-item">
                        <div class="footer-title">
                          <h4>Our Services </h4>
                          <div class="border-style-2"></div>
                        </div>
                        <ul class="footer-list border-deshed color-icon">
                          <li><i class="pe-7s-angle-right"></i><a href="SearchLocations?method=hospital">Hospitals</a></li>
                          <li><i class="pe-7s-angle-right"></i><a href="SearchLocations?method=dental_clinic,dentist,doctor,medical_lab,physiotherapist">Clinics</a></li>
                          <li><i class="pe-7s-angle-right"></i><a href="SearchLocations?method=pharmacy,drugstore">Pharmacies</a></li>
                          <li><i class="pe-7s-angle-right"></i><a href="SearchLocations?method=fitness_center,spa,gym,sports_club,swimming_pool">Health Clubs</a></li>
                        </ul>
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Style End -->

  
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

    <script>
        $(document).ready(function () {
            $("#searchBox").keyup(function () {
                var query = $(this).val();

                if(query != "") {
                    console.log('query: ', query);

                    $.ajax({
                        url: "/Health_Plus/AutoComplete",
                        method: "GET",
                        data: { query: query },
                        dataType: "json",
                        success: function (data) {
                            displayResults(data);
                        }
                    });
                } else {
                    var resultsContainer = $("#resultContainer");
                    resultsContainer.empty();
                }
            });
        });

        function displayResults(results) {
            var resultsContainer = $("#resultContainer");
            resultsContainer.empty();

            if (results.length > 0) {
                for (var i = 0; i < results.length; i++) {
                    var result = results[i];
                    var resultElement = $("<div><a href='SearchServices?id=" + result.id + "'>" + result.name + "</a></div>");
                    resultsContainer.append(resultElement);

                    // Handle click event
                    resultElement.click(function () {
                        window.location.href = $(this).find("a").attr("href");
                    });
                }

                resultsContainer.show();
            } else {
                resultsContainer.hide();
            }
        }
    </script>
</body>
</html>