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
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- Header navbar end -->

    <section class="service-area bg-f8 animatedParent animateOnce">
        <div class="container">
            <div class="section-title">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 text-center">
                        <h2>RESULTS</h2>
                        <div class="line-border-center bg-defult"></div>
                        <!-- <p>Repellendus error placeat numquam doloribus perferendis consequatur maxime molestiae soluta Corporis quidem quaerat accusantium omnis repudiandae nulla recusandae</p> -->
                    </div>
                </div>
            </div>
            <div class="section-content">
                <div class="row">
                    <% for (int i = 0; i < (Integer) request.getAttribute("count"); i++) { %>
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="service-item style-4">
                                <!-- <div>
                                    <img src='https:<%= (String) request.getAttribute("photouri" + i) %>' />
                                </div> -->
                                <h4><a href="#"><%= (String) request.getAttribute("name"+i) %></a></h4>
                                <p><span class="color-defult">Type:</span> <%= (String) request.getAttribute("type"+i) %></p>
                                <p><span class="color-defult">Rating:</span> <%= (Double) request.getAttribute("rating"+i) %></p>
                                <p><span class="color-defult">Rating Count:</span> <%= (Integer) request.getAttribute("ratingcount"+i) %></p>
                                <p><span class="color-defult">Contact:</span> <%= (String) request.getAttribute("contact"+i) %></p>
                                <p><span class="color-defult">Address:</span> <%= (String) request.getAttribute("address"+i) %></p><br />
                                <a href='<%= (String) request.getAttribute("maps"+i) %>' target="_blank" class="margin-bottom-30">Google Maps</a><br />
                                <a href=' <%= (String) request.getAttribute("website"+i) %>' target="_blank" class="margin-bottom-30">Website</a>
                                <form action="BookAppointment.jsp" method="post">
                                    <input type="hidden" name="name" value='<%= (String) request.getAttribute("name"+i) %>' />
                                    <input type="hidden" name="type" value='<%= (String) request.getAttribute("type"+i) %>' />
                                    <input type="hidden" name="contact" value='<%= (String) request.getAttribute("contact"+i) %>' />
                                    <input type="hidden" name="address" value='<%= (String) request.getAttribute("address"+i) %>' />
                                    <input type="hidden" name="maps" value='<%= (String) request.getAttribute("maps"+i) %>' />
                                    <input type="hidden" name="website" value='<%= (String) request.getAttribute("website"+i) %>' />
                                    <input type="submit" class="btn-theme" data-animation="animated fadeInRight" value="Book Appointment" />
                                </form><br/>
                                <form action="ViewReviewsServlet" method="get">
                                    <input type="hidden" name="placeId" value='<%= (String) request.getAttribute("placeId"+i) %>' />
                                    <input type="submit" class="btn-theme" data-animation="animated fadeInRight" value="Read Reviews" />
                                </form>
                                <!-- <form action="" method="get">
                                    <input type="hidden" name="placeId" value='<%= (String) request.getAttribute("placeId"+i) %>' />
                                    <input type="hidden" name="name" value='<%= (String) request.getAttribute("name"+i) %>' />
                                    <input type="hidden" name="username" value='<%= (String) session.getAttribute("currentUserFirstName") %>' />
                                    <input type="hidden" name="type" value='<%= (String) request.getAttribute("type"+i) %>' />
                                    <input type="hidden" name="reviewDate" value='1 minute ago' />
                                    <input type="submit" class="btn-theme" data-animation="animated fadeInRight" value="Write Review" />
                                </form> -->
                            </div>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </section>    

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

