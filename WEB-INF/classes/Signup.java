import java.io.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/Signup")
public class Signup extends HttpServlet 
{  
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    { 
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email=request.getParameter("email");
        String firstname=request.getParameter("firstname");
        String lastname=request.getParameter("lastname");
        String address=request.getParameter("address");
        String contact=request.getParameter("contact");
        String pwd=request.getParameter("password");
        String usertype=request.getParameter("usertype");

        String password = hashPassword(pwd);

        // System.out.println("Original password: " + pwd);
        // System.out.println("Hashed password: " + password);
        // System.out.println("Original password: " + email);
        // System.out.println("Hashed password: " + firstname);
        // System.out.println("Original password: " + lastname);
        // System.out.println("Hashed password: " + address);
        // System.out.println("Original password: " + contact);
        // System.out.println("Hashed password: " + usertype);

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/healthplus","root","root");
            PreparedStatement ps=con.prepareStatement(
               "insert into users (email, firstname, lastname, address, contact, password, usertype) values(?,?,?,?,?,?,?)");
            ps.setString(1,email);
            ps.setString(2,firstname);
            ps.setString(3,lastname);
            ps.setString(4,address);
            ps.setString(5,contact);
            ps.setString(6,password);
            ps.setString(7,usertype);
                    
            int i=ps.executeUpdate();
            if(i>0){
                RequestDispatcher rd = request.getRequestDispatcher("login.html");
                rd.forward(request,response);
            }
        }
        catch (Exception e2) 
        {
            System.out.println(e2);
        }

        out.close();
    }

    private String hashPassword(String pwd) {
        try {
            // Create MessageDigest instance for SHA-256
            MessageDigest md = MessageDigest.getInstance("SHA-256");

            // Add password bytes to digest
            md.update(pwd.getBytes());

            // Get the hash's bytes
            byte[] bytes = md.digest();

            // Convert byte array to a string
            return Base64.getEncoder().encodeToString(bytes);

        } catch (NoSuchAlgorithmException er) {
            // Handle exception
            er.printStackTrace(); // Or handle it in a better way based on your application requirements
            return null;
        }
    }
} 