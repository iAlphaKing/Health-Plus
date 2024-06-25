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
                                <li><a href="#">About Us</a></li>
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

    <div id="bootstrap-touch-slider" class="carousel bs-slider fade  control-round indicators-line" data-ride="carousel" data-pause="hover" data-interval="5000" >
        <ol class="carousel-indicators">
            <li data-target="#bootstrap-touch-slider" data-slide-to="0" class="active"></li>
            <li data-target="#bootstrap-touch-slider" data-slide-to="1"></li>
            <li data-target="#bootstrap-touch-slider" data-slide-to="2"></li>
            <li data-target="#bootstrap-touch-slider" data-slide-to="3"></li>
            <li data-target="#bootstrap-touch-slider" data-slide-to="4"></li>
        </ol>
        
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="img/bg/hp.jpg" alt="Slider Images"  class="slide-image"/>
                <div class="bs-slider-overlay"></div>

                <div class="slide-text slide_style_left">
                    <h1 data-animation="animated fadeInRight"><span class="color-defult"> About </span>Health Plus</h1>
                    <p data-animation="animated fadeInLeft">Welcome to Health Plus, your go-to platform for all your health and wellness needs. At Health, we believe in empowering individuals to take charge of their well-being by providing easy access to healthcare services, personalized appointments, and friendly reminders.</p>
                </div>
            </div>
            <div class="item">
                <img src="img/bg/hp.jpg" alt="Slider Images" class="slide-image"/>
                <div class="bs-slider-overlay"></div>
                
                <div class="slide-text slide_style_center">
                    <h1 data-animation="animated bounceInDown">Our <span class="color-defult">Mission </span></h1>
                    <p data-animation="animated lightSpeedIn">Our mission is to create a seamless and user-friendly experience that connects individuals with nearby healthcare facilities and services. We aim to simplify the process of finding and booking appointments with hospitals, clinics, pharmacies, and health clubs. Through our platform, we aspire to contribute to a healthier and happier community.</p>
                </div>
            </div>
            <div class="item">
                <img src="img/bg/hp.jpg" alt="Slider Images"  class="slide-image"/>
                <div class="bs-slider-overlay"></div>
                
                <div class="slide-text slide_style_left">
                    <h1 data-animation="animated fadeInLeft">What We <span class="color-defult">Offer</span></h1>
                    <p data-animation="animated fadeInRight"><b>Find Nearby Health Facilities</b><br/>
                        Discover a comprehensive list of nearby hospitals, clinics, pharmacies, and health clubs. Whether you need urgent care, routine check-ups, or a place to fill your prescriptions, Health Plus has you covered.
                        <br/><br/>
                        <b>Book Appointments Hassle-Free & Set Reminders for Healthier Living</b><br/>
                        Say goodbye to long waiting times and phone calls. With Health Plus, you can book appointments with healthcare providers effortlessly & never miss an appointment. Our user-friendly interface ensures a seamless booking experience & allows you to set personalized reminders.
                    </p>
                </div>
            </div>
            <div class="item">
                <img src="img/bg/hp.jpg" alt="Slider Images"  class="slide-image"/>
                <div class="bs-slider-overlay"></div>
                
                <div class="slide-text slide_style_center">
                    <h1 data-animation="animated bounceInDown">Our <span class="color-defult">Commitment</span></h1>
                    <p data-animation="animated lightSpeedIn"><b>Accessibility:</b> We strive to make healthcare accessible to everyone. Our platform is designed to be user-friendly and inclusive, ensuring that you can easily navigate and find the services you need.
                        <br/><br/>
                        <b>Quality:</b> Your health is our priority. We partner with reputable healthcare providers to ensure that you receive high-quality services and care.
                        <br/><br/>
                        <b>Innovation:</b> We embrace innovation to continuously improve your experience. From advanced booking features to personalized reminders, we leverage technology to enhance your well-being.</p>
                </div>
            </div>
            <div class="item">
                <img src="img/bg/hp.jpg" alt="Slider Images"  class="slide-image"/>
                <div class="bs-slider-overlay"></div>
                
                <div class="slide-text slide_style_right">
                    <h1 data-animation="animated fadeInRight"><span class="color-defult">Join Us </span>on the Journey to Better Health</h1>
                    <p data-animation="animated fadeInLeft">Health Plus is more than just a platform; it's a community dedicated to fostering a culture of well-being. Join us on this journey towards better health and discover the convenience of managing your healthcare needs in one place.
                        <br>Thank you for choosing Health Plus. Here's to your health and happiness!</p>
                </div>
            </div>
        </div>
    </div>

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

    <!-- Testimonial start -->
    <section class="testimonial">
        <div class="container">
            <div class="section-title">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 text-center">
                        <h2>Our <span class="color-defult"> Clients</span> Say</h2>
                        <div class="line-border-center bg-defult"></div>
                    </div>
                </div>
            </div>
            <div class="section-content">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="testimonial-carousel-one">
                            <div class="item">
                                <div class="testimonial-item text-center">
                                    <div class="testimonial-author">
                                        <div class="author-img">
                                            <img class="img-responsive" src="img/testimonial/1.png" alt="" />
                                        </div>
                                        <h4>Pradyumna Deshpande</h4>
                                        <h6>Student</h6>
                                        <ul>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        </ul>
                                    </div>
                                    <p>Very helpful website. It helped me book an appointment in one of the best health clubs without any wait period. I can now be stress free from my student life.</p> 
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimonial-item text-center">
                                    <div class="testimonial-author">
                                        <div class="author-img">
                                            <img class="img-responsive" src="img/testimonial/2.png" alt="" />
                                        </div>
                                        <h4>Rik Ganguli</h4>
                                        <h6>Jobless</h6>
                                        <ul>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        </ul>
                                    </div>
                                    <p>Best clinics. I'm still jobless but now I'm cured.</p> 
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimonial-item text-center">
                                    <div class="testimonial-author">
                                        <div class="author-img">
                                            <img class="img-responsive" src="img/testimonial/3.png" alt="" />
                                        </div>
                                        <h4>Shekhar Kausal</h4>
                                        <h6>Serial Chiller</h6>
                                        <ul>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        </ul>
                                    </div>
                                    <p>Was feeling chilly due to being a serial chiller. Got a medicine in one the pharmacies listed. Now I'm not chilly anymore.</p> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonial end -->

    <!-- Footer Style start -->
    <footer class="bg-faded">
        <div class="container">
            <div class="section-content">
                <div class="row margin-top-30">
                    <div class="col-md-4">
                      <div class="footer-item footer-widget-one">
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

