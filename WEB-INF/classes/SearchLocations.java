import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/SearchLocations")
public class SearchLocations extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String types = request.getParameter("method");

            String[] method = types.split(",");
            int count = 0;

            boolean success = false;

            for(int i = 0; i < method.length; i++) {
                success = MySQLDataStoreUtilities.getServices(method[i], request, count);
                count = (Integer) request.getAttribute("count");
            }

            if(success) {
                RequestDispatcher rd = request.getRequestDispatcher("AllServices.jsp");
                rd.forward(request,response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("HomeUser.jsp");
                rd.forward(request,response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
