Instructions to run - 
    1) Start tomcat.
    2) Go to  https://console.cloud.google.com/home/dashboard and search for "Places API(New)".
    3) Click on the enable button
    4) Go to 'C:\apache-tomcat-9.0.80\webapps\Health_Plus\WEB-INF\classes\Login.java' and paste your API key at line number 79.
    5) The code is already compiled but can be compiled again by opening a terminal, navigating to 'C:\apache-tomcat-9.0.80\webapps\Health_Plus\WEB-INF\classes' and executing 'javac *.java'
    6) Open a new terminal and type "mongod".
    7) Now in your browser, open "http://localhost:8080/Health_Plus/"
    8) This should start the webapp and you should be able to execute all of the features.


1) Total lines of code - 5189

2) Features Implemented - 

    2.1 Reviews & MongoDB. Reviews are fetched using Google Places(New) API.

    2.2 Auto-Complete Search feature

    2.3 Google MAPS - Near ME search feature

    2.4 User Account/Profile/Transaction management & MySQL

    2.5 Fetching data using Google Places(New) API including reviews, ratings, websites links, and location.

    2.6 User password are stored using password hashing for additional security.

3) Assignments features not implemented - 

    * Trending not implemented because our website does not sell products.
    * Inventory statistics not implemented since our website does not sell any products.

4 ) Assignments features attempted but not functional - 

    * Attempted to implement a chatbot.



