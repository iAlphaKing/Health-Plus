import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve user input
        String oldPass = request.getParameter("oldPassword");
        
        String newPass = request.getParameter("newPassword");

        String confirmPass = request.getParameter("confirmPassword");

        // Perform basic validation
        if (oldPass == null || newPass == null || confirmPass == null ||
            oldPass.isEmpty() || newPass.isEmpty() || confirmPass.isEmpty()) {
            response.sendRedirect("ChangePassword.jsp?error=All fields must be filled");
            return;
        }

        if (!newPass.equals(confirmPass)) {
            response.sendRedirect("ChangePassword.jsp?error=New passwords do not match");
            return;
        }

        String oldPassword = hashPassword(oldPass);
        String newPassword = hashPassword(newPass);

        // Call the changePassword method from MySQLDataStoreUtilities
        String changePasswordResult = MySQLDataStoreUtilities.changePassword(oldPassword, newPassword, request);

        response.setContentType("text/html");
        String htmlResponse = "<html><head><script>alert('" + changePasswordResult + "');</script></head><body></body></html>";

        // Redirect to appropriate page based on the result
        if (changePasswordResult.startsWith("Password changed successfully")) {
            response.getWriter().write(htmlResponse);
            request.getRequestDispatcher("HomeUser.jsp").forward(request, response);
            //response.sendRedirect("HomeUser.jsp?success=" + changePasswordResult);
        } else {
            response.getWriter().write(htmlResponse);
            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
            //response.sendRedirect("ChangePassword.jsp?error=" + changePasswordResult);
        }
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

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}